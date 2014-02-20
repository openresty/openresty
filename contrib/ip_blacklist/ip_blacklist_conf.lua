--[[

¡ ¡ ¡ ALL GLORY TO GLORIA ! ! !
==============================

--]]



local _M = {
  version='0.13',
  redis_sock = 'unix:/tmp/redis.sock', -- redis.conf: unixsocketperm 777!!!
--~ or 
--~   redis_host    = "127.0.0.1",
--~   redis_port    = 6379,
  redis_timeout = 200,-- connection timeout for redis in ms. don't set this too high!
  redis_poolsize = 15, -- maximal size of the pool. Puts the current Redis connection immediately into the ngx_lua cosocket connection pool. 
  redis_keepalive = 0, -- ms. (0 - persistent) You can specify the max idle timeout (in ms) when the connection is in the pool and the maximal size of the pool every nginx worker process.
  prefix = "ip_blacklist", -- for Redis keys and for log strings
  key_delim = ':', -- for join Redis keys
  --[[
    There are four types of Redis keys:
      1. Counter: <prefix>:count:<time range>:<ip>:<uri>
      2. Locker: <prefix>:lock:<ip>:<uri>
      3. Saved content: <prefix>:content:<host>:<uri>
      4. Log of locking: <prefix>
  --]]
  time_range = 3, -- seconds of time line разбивает временную линию на отрезки секунд и использует для ключа
  req_limit = 20, -- max amount of requests on time_range столько раз может обратиться IP в текущем временном отрезке
  time_lock = 60, -- seconds for locking IP. If IP still make request then prolong lock time (expire Redis key) секунд держать в ловушке, если продолжает дергаться - пролонгировать expire этого ключа
  mode=nil,
--[[
    nil or <whatever>- full mode: monitoring, locking and getout content from the Redis or capture content once and self save to Redis for next one locked IP requests
    'count' - without lock IPs on blacklist, i.e. monitoring only. To see log of bad IPs on redis-cli: lrange <prefix> 0 -1
    'forbidden' - monitoring + 403 page for locked IP
    'nocapture' - disable self save content, i.e. monitoring + content from the Redis only. If content not found in Redis then 403
    Note: chunked content when ngx.location.capture() bad?
--]]
  ["debug"]=1,-- false disable ngx.INFO log to nginx.log (errors always enabled as ngx.ERR level)
  redis = require "resty.redis"
}
--------------------------------- END CONFIG -----------------------------------------------------------------

--=================== REDIS FUNCS =============================================
_M.redis_connect = function ()
  local redis = _M.redis:new()
  if not redis then
    _M.log_err("Failed new redis")
    ngx.exit(ngx.OK)
  end
  redis:set_timeout(_M.redis_timeout)
  local connected, err
  if _M.redis_sock then connected, err = redis:connect(_M.redis_sock)
  elseif _M.redis_host and _M.redis_port then connected, err = redis:connect(_M.redis_host, _M.redis_port)
  end
  if not connected then
    _M.log_err(string.format("could not connect to redis host=[%s:%s] sock=[%s] : %s", _M.redis_host, _M.redis_port, _M.redis_sock, err))
    ngx.exit(ngx.OK)
  end
  _M.log_info("success connect to redis")
  return redis
end
----------------------------------------------------------------------------------------------------------------------------
_M.redis_expire = function (redis, key, time)
  local result, err = redis:expire(key, time)
  if not result then
    _M.log_err(string.format("[redis:expire] failed for key=[%s]: %s", key, err))
    _M.redis_end(redis)
    ngx.exit(ngx.OK)
  end
end

-------------------------------------------------------------------------------------------------------------------------------
_M.redis_exists = function (redis, key)
  local key_ex, err = redis:exists(key)
  if err then
    _M.log_err(string.format("[redis:exists] failed for key=[%s]: %s", key, err))
    _M.redis_end(redis)
    ngx.exit(ngx.OK)
  end
--~   _M.log_info(string.format("key=[%s] exists", key))
  return key_ex == 1
end

------------------------------------------------------------------------------------------------------------------------------
_M.redis_incr = function (redis, key)
  local count, err = redis:incr(key)
  if err then
    _M.log_err(string.format("[redis:incr] failed for key=[%s]: %s", key, err))
    _M.redis_end(redis)
    ngx.exit(ngx.OK)
  end
  return count
end

-----------------------------------------------------------------------------------------------------------------------------
_M.redis_end = function (redis) 
--[[
syntax: ok, err = red:set_keepalive(max_idle_timeout, pool_size)
Puts the current Redis connection immediately into the ngx_lua cosocket connection pool.
You can specify the max idle timeout (in ms) when the connection is in the pool and the maximal size of the pool every nginx worker process.
In case of success, returns 1. In case of errors, returns nil with a string describing the error.
Only call this method in the place you would have called the close method instead. Calling this method will immediately turn the current redis object into the closed state. Any subsequent operations other than connect() on the current objet will return the closed error.
]]
  local ok, err = redis:set_keepalive(_M.redis_keepalive, _M.redis_poolsize)
  if not ok then _M.log_err(string.format("failed to set  set_keepalive: %s", err)) end
end

--======================= OTHER FUNCS =====================================
_M.keys = function ()
  -- counter <prefix>:count:<time range>:<ip>:<uri>
  local now = os.time()
  local time_range = now % _M.time_range
  local key_count = _M.join(_M.prefix, 'count', now - time_range, ngx.var.remote_addr, ngx.var.uri)
  -- content <prefix>:content:<host>:<uri>
  local key_content = _M.join(_M.prefix, 'content', ngx.var.host, ngx.var.uri)
  --locker <prefix>:lock:<ip>:<uri>
  local key_lock = _M.join(_M.prefix, 'lock', ngx.var.remote_addr, ngx.var.uri)
  return key_count, key_lock, key_content, time_range

end

--------------------------------------------------------------------------------------------------------------------
_M.log_info = function (msg)
--~   if _M.debug then ngx.log(ngx.INFO, (string.format("%s: %s", _M.prefix, msg))) end
  if _M.debug then ngx.log(ngx.INFO, msg) end
end
_M.log = _M.log_info
--------------------------------------------------------------------------------------------------------------------
_M.log_err = function (msg)
--~   ngx.log(ngx.ERR, (string.format("%s: %s", _M.prefix, msg)))
  ngx.log(ngx.ERR, msg)
end
--------------------------------------------------------------------------------------------------------------------
_M.join = function (...) -- a,b,c
  local t = {}
--~     for _,v in pairs(list) do
--~   for i = 1, arg.n do -- bad
--~     t[#t+1] = tostring(arg[i]) -- v
  for i=1, select("#",...) do
    t[#t+1] = (select(i,...))
  end
  return table.concat(t,_M.key_delim)
end
---------------------------------------------------------------------------------------------------------------------

return _M


--~ package.path = '/usr/local/openresty/lualib/?.lua;/usr/local/openresty/lualib/?/init.lua;' .. package.path -- .. ';'
--~ package.cpath = '/usr/local/openresty/lualib/?.so;' .. package.cpath --??
--[[
    ngx.status = ngx.HTTP_OK
    ngx.header.content_type = 'text/html; charset=UTF-8'
    local body =
<!DOCTYPE html>
<html>
  <head>
    <meta charset=utf-8>
    <title>(Это title)</title>
  </head>
  <body>
    <header>
      <hgroup>
         <h1>Заголовок "h1" из hgroup</h1>
      </hgroup>
    </header>
    <nav>
      <menu>
        <li><a href="link1.html">Первая ссылка из блока "nav"</a></li>
      </menu>
    </nav>
  </body>
</html>

    ngx.header.content_length = string.len(body)
    ngx.say(body)
    return ngx.exit(ngx.HTTP_OK)
end
--]]

