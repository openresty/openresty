--[[
¡ ¡ ¡ ALL GLORY TO GLORIA ! ! !
===========================
Settings on ip_tables_conf.lua
--]]
local _M = require "ip_blacklist_conf"
local log_info = _M.log_info
local log_err = _M.log_err
local redis = _M.redis_connect()
local redis_exists = _M.redis_exists
local redis_expire = _M.redis_expire
local redis_incr = _M.redis_incr
local redis_end = _M.redis_end
local key_count, key_lock, key_doc, time_range = _M.keys()


if redis_exists(redis, key_lock) then -- is IP locked?
  redis_expire(redis, key_lock, _M.time_lock) -- prolong the lock!
  
  if _M.mode == 'forbidden' then
    redis_end(redis)
    ngx.exit(ngx.HTTP_FORBIDDEN)
  end
  
  if redis_exists(redis, key_doc) then --~ found content ?
    local hash, err = redis:hmget(key_doc, "status", "content_type", "content_length", "body")
    if err then
      log_err(string.format("redis:hmget failed for key=[%s]: %s", key_doc, err))
      redis_end(redis)
      ngx.exit(ngx.OK)
    elseif not hash[1] then -- not status
      redis:del(key_doc)
      redis_end(redis)
      ngx.exit(ngx.OK)
    end

    log_info(string.format("locked request content from redis:[hmget '%s']", key_doc))
  --~     for key,value in pairs(hash) do print(key,value) end
    ngx.status = hash[1] --"status"
    ngx.header.content_type = hash[2] -- "content_type"
    ngx.header.content_length = hash[3] or string.len(hash[4]) --"content_length"
    ngx.say(hash[4]) -- "body"
    redis_end(redis)
    ngx.exit(hash[1]) --"status"
  else
    log_info(string.format("locked request content not found redis:[]hmget '%s']", key_doc))
    redis_end(redis)
    ngx.exit(ngx.HTTP_FORBIDDEN)
  end
else -- counter
  local count = redis_incr(redis, key_count)

  if count == 1 then
    redis_expire(redis, key_count, _M.time_range - time_range + 1)
  end


  if count < _M.req_limit then
    log_info(string.format("allow request for key_count=[%s] count=[%s] ", key_count, count))
    redis_end(redis)
    ngx.exit(ngx.OK)
  end

  log_info(string.format("locked request for key_count=[%s] count=[%s] ", key_count, count))
-- redis-cli lrange <_M.prefix> 0 -1
  if _M.log_lock then
    local _, err = redis:rpush(_M.prefix, key_count)
    if err then log_err(string.format("[redis:rpush] failed for key=[%s] and value[%s]: %s", _M.prefix, key_count, err)) end
    log_info(string.format("logging the lock for key_count=[%s] ", key_count))
  end

  if _M.mode == 'count' then
    log_info(string.format("mode count exit for key_count=[%s] count=[%s] ", key_count, count))
    redis_end(redis)
    ngx.exit(ngx.OK)
  end
  
  redis_incr(redis, key_lock) -- add IP to lock
  redis_expire(redis, key_lock, _M.time_lock) -- for locking time
end


if _M.mode == 'nocapture' then
  log_info(string.format("mode nocapture exit for key_lock=[%s] ", key_lock))
  redis_end(redis)
  ngx.exit(ngx.OK)
end



if redis_exists(redis, key_doc) then -- doc in Redis already 
  log_info(string.format("content already exists in [redis:hgetall '%s']", key_doc))
  redis_end(redis)
  ngx.exit(ngx.OK)
end

--[[
Prepare store content for next locked requests
The problem:
location.capture and chunked content from Apache
--]]

ngx.req.read_body() --You should always read the request body (by either calling ngx.req.read_body or configuring lua_need_request_body on) before initiating a subrequest.

log_info("location.capture=" .. ngx.var.uri)
local cap = ngx.location.capture(ngx.var.uri)
if cap.status >= 500 then
  log_info("bad location.capture 50X " .. ngx.var.uri)
  redis_end(redis)
  ngx.exit(cap.status)
end

--~ for k, v in pairs(cap.header) do print(k,'=', v) end
if not (cap.status == ngx.HTTP_OK and cap.header['Content-Type'] and (string.match(cap.header['Content-Type'], 'text') or string.match(cap.header['Content-Type'], 'json'))) then
  log_info(string.format("skip cache non HTTP_OK [%s]; non text content type [%s]", cap.status, cap.header['Content-Type']))
  ngx.status = cap.status
  for k, v in pairs(cap.header) do ngx.header[k] = v end
  ngx.say(cap.body)
  redis_end(redis)
  ngx.exit(cap.status)
end

--~ local body = string.gsub(cap.body, "<body>", "<body><h1 style='color:red;'>Внимание! Вы находитесь в зоне выполнения регламентного обновления сайта. Пожалуйста, обновите страницу позже. Спасибо.</h1>")
local body = string.gsub(cap.body, "<body>", "<body><h1 style='color:red;'>WARN! Your request is locked!</h1>")
local _, err = redis:hmset(
  key_doc,
  "status", cap.status,
  "content_type", cap.header['Content-Type'],
  "content_length", cap.header['Content-Length'] or string.len(body),
  "body", body
) -- "content_length", cap.header['Content-Length']
if err then
  log_err(string.format("[redis:hmset] failed for key=[%s]: %s", key_doc, err))
else 
  log_info(string.format("content [%s%s] stored in redis:[hmset '%s'] for next locked requests", ngx.var.host, ngx.var.uri, key_doc))
end
redis_end(redis)
ngx.exit(ngx.OK)
