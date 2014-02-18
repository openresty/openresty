--[[
¡ ¡ ¡ ALL GLORY TO GLORIA ! ! !
--]]
local redis = ip_blacklist.redis:new()
if not redis then
  ngx.log(ngx.ERR, "ip_blacklist: Failed new redis")
  ngx.exit(ngx.OK)
end
--~ if ip_blacklist.debug then ngx.log(ngx.INFO, "ip_blacklist: success connect to redis") end
redis:set_timeout(ip_blacklist.redis_timeout)

local connected, err = redis:connect(ip_blacklist.redis_host, ip_blacklist.redis_port)
if not connected then
  ngx.log(ngx.ERR, string.format("ip_blacklist: could not connect to redis=[%s:%s]:", ip_blacklist.redis_host, ip_blacklist.redis_port), err)
  ngx.exit(ngx.OK)
end

redis_end = ip_blacklist.redis_end
--~ ключ счетчика = <временной интервал (- % колич секунд)>:<ip>:<uri>
local now = os.time()
local time_range = now % ip_blacklist.time_range
local key_count = ip_blacklist.join({ip_blacklist.prefix, 'count', now - time_range, ngx.var.remote_addr, ngx.var.uri})
-- ключ кэшированного документа <prefix:host:uri>
local key_doc = ip_blacklist.join({ip_blacklist.prefix, 'doc', ngx.var.host, ngx.var.uri})
-- ключ ловушки = <prefix:ip:uri>
local key_lock = ip_blacklist.join({ip_blacklist.prefix, 'lock', ngx.var.remote_addr, ngx.var.uri})
local key_lock_ex, err = redis:exists(key_lock)
if key_lock_ex == 1  then -- он уже в ловушке
  if ip_blacklist.debug then ngx.log(ngx.INFO, string.format("ip_blacklist: found key_lock=[%s]", key_lock)) end
  
  local result, err = redis:expire(key_lock, ip_blacklist.time_lock) -- продлить бан
  if not result then
    ngx.log(ngx.ERR, string.format("ip_blacklist: redis:expire failed for key=[%s]:", key_lock), err)
    redis_end(redis)
    ngx.exit(ngx.OK)
  end
  
  if ip_blacklist.mode == 'forbidden' then
    redis_end(redis)
    ngx.exit(ngx.HTTP_FORBIDDEN)
  end
  
  local doc_ex, err = redis:exists(key_doc)
  if err then
    ngx.log(ngx.ERR, string.format("ip_blacklist: redis:exists failed for key=[%s]:", key_doc), err)
    redis_end(redis)
    ngx.exit(ngx.OK)
  elseif doc_ex == 1 then --~ ага, отдача кэша
    local hash, err = redis:hmget(key_doc, "status", "content_type", "content_length", "body")
    if err then
      ngx.log(ngx.ERR, string.format("ip_blacklist: redis:hmget failed for key=[%s]:", key_doc), err)
      redis_end(redis)
      ngx.exit(ngx.OK)
    elseif not hash[1] then -- Нет статуса!
      redis:del(key_doc)
      redis_end(redis)
      ngx.exit(ngx.OK)
    end

    ngx.log(ngx.INFO, string.format("ip_blacklist: page from redis:hmget [%s]", key_doc))
  --~     for key,value in pairs(hash) do print(key,value) end
    ngx.status = hash[1] --"status"
    ngx.header.content_type = hash[2] -- "content_type"
    ngx.header.content_length = hash[3] or string.len(hash[4]) --"content_length"
    ngx.say(hash[4]) -- "body"
    redis_end(redis)
    ngx.exit(hash[1]) --"status"
  end
else -- счетчик+попадание в ловушку
  local count, err = redis:incr(key_count)
  if not count then
    ngx.log(ngx.ERR, string.format("ip_blacklist: [redis:incr] failed for key=[%s]:", key_count), err)
    redis_end(redis)
    ngx.exit(ngx.OK)
  end

  if count == 1 then
    local result, err = redis:expire(key_count, ip_blacklist.time_range - time_range + 1) -- 3-0	 3-1	 3-2
    if not result then
      ngx.log(ngx.ERR, string.format("ip_blacklist: [redis:expire] failed for key=[%s]:", key_count), err)
      redis_end(redis)
      ngx.exit(ngx.OK)
    end
  end


  if count < ip_blacklist.req_limit then
    if ip_blacklist.debug then ngx.log(ngx.INFO, string.format("ip_blacklist: allow key_count=[%s] count=[%s] ", key_count, count)) end
    redis_end(redis)
    ngx.exit(ngx.OK)
  end

  if ip_blacklist.debug then ngx.log(ngx.INFO, string.format("ip_blacklist: deny key_count=[%s] count=[%s] ", key_count, count)) end
  -- лог попаданий в ловушку
-- посмотреть lrange ip_blacklist 0 -1
  local result, err = redis:rpush(ip_blacklist.prefix, key_count)
  if err then ngx.log(ngx.ERR, string.format("ip_blacklist: [redis:rpush] failed for key=[%s] and value[%s]:", ip_blacklist.prefix, key_count), err) end
  if ip_blacklist.debug then ngx.log(ngx.INFO, string.format("ip_blacklist: logging on lock-list=[%s] for key_count=[%s] ", ip_blacklist.prefix, key_count)) end

  if ip_blacklist.mode == 'count' then
    if ip_blacklist.debug then ngx.log(ngx.INFO, string.format("ip_blacklist: mode count exit for key_count=[%s] count=[%s] ", key_count, count)) end
    redis_end(redis)
    ngx.exit(ngx.OK)
  end
  
  local result, err = redis:incr(key_lock) -- ловушка
  if not result then
      ngx.log(ngx.ERR, string.format("ip_blacklist: [redis:incr] failed for key=[%s]:", key_lock), err)
      redis_end(redis)
      ngx.exit(ngx.OK)
  end
  local result, err = redis:expire(key_lock, ip_blacklist.time_lock) -- срок в ловушке
  if not result then
    ngx.log(ngx.ERR, string.format("ip_blacklist: redis:expire failed for key=[%s]:", key_lock), err)
    redis_end(redis)
    ngx.exit(ngx.OK)
  end
end


if ip_blacklist.mode == 'nocapture' then
  if ip_blacklist.debug then ngx.log(ngx.INFO, string.format("ip_blacklist: mode nocapture exit for key_lock=[%s] ", key_lock)) end
  redis_end(redis)
  ngx.exit(ngx.OK)
end


local doc_ex, err = redis:exists(key_doc)
if err then
  ngx.log(ngx.ERR, string.format("ip_blacklist: redis:exists failed for key=[%s]:", key_doc), err)
  redis_end(redis)
  ngx.exit(ngx.OK)
elseif doc_ex == 1 then --~ ага, уже есть в кэше
  if ip_blacklist.debug then ngx.log(ngx.INFO, string.format("ip_blacklist: already stored key_doc=[%s]", key_doc)) end
  redis_end(redis)
  ngx.exit(ngx.OK)
end

--~ if ip_blacklist.mode == 'nocache' then ip_blacklist.deny_resp() end
--[[
Кэшируем страницу для следующих заходов
Плохо забирает страницу, не полностью
--]]
--You should always read the request body (by either calling ngx.req.read_body or configuring lua_need_request_body on) before initiating a subrequest.
ngx.req.read_body()

if ip_blacklist.debug then ngx.log(ngx.INFO, "ip_blacklist: location.capture=", ngx.var.uri) end
local cap = ngx.location.capture(ngx.var.uri)
if cap.status >= 500 then
  redis_end(redis)
  ngx.exit(cap.status)
end

--~ for k, v in pairs(cap.header) do print(k,'=', v) end
if not (cap.status == ngx.HTTP_OK and cap.header['Content-Type'] and (string.match(cap.header['Content-Type'], 'text') or string.match(cap.header['Content-Type'], 'json'))) then
  redis:decr(key_count)
  ngx.log(ngx.INFO, string.format("ip_blacklist: skip cache non HTTP_OK [%s]; non text content type [%s]", cap.status, cap.header['Content-Type']))
  ngx.status = cap.status
  for k, v in pairs(cap.header) do ngx.header[k] = v end
  ngx.say(cap.body)
  redis_end(redis)
  ngx.exit(cap.status)
--~   ngx.exit(ngx.OK)
end

local body = string.gsub(cap.body, "<body>", "<body><h1 style='color:red;'>Внимание! Вы находитесь в зоне выполнения регламентного обновления сайта. Пожалуйста, обновите страницу позже. Спасибо.</h1>")
-- сохранить в кэше
local result, err = redis:hmset(
  key_doc,
  "status", cap.status,
  "content_type", cap.header['Content-Type'],
  "content_length", cap.header['Content-Length'] or string.len(body),
  "body", body
) -- "content_length", cap.header['Content-Length']
if not result then
  ngx.log(ngx.ERR, string.format("ip_blacklist: [redis:hmset] failed for key=[%s]", key_doc), err)
else 
  ngx.log(ngx.INFO, string.format("ip_blacklist: stored in redis:hmset [%s] for next requests", key_doc))
end
redis_end(redis)
ngx.exit(ngx.OK)

--[[
!!! Отдача кэша в ip_blacklist.from_redis() в следующем заходе ! ! !

ngx.status = cap.status -- ngx.HTTP_OK -- 
ngx.header.content_type = cap.header['Content-Type'];
ngx.header.content_length = string.len(body);
--~ cap.header -- holds all the response headers of the subrequest and it is a normal Lua table.
ngx.say(body)
--~ ngx.log(ngx.INFO, "Deny: body", cap.body)
--~ return ngx.exit(ngx.HTTP_OK)
redis_end(redis)
ngx.exit(cap.status)
--]]



