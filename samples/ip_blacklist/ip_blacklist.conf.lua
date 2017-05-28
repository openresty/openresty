--[[

¡ ¡ ¡ ALL GLORY TO GLORIA ! ! !

--]]

ip_blacklist = {-- global config
  redis_host    = "127.0.0.1",
  redis_port    = 6379,
-- connection timeout for redis in ms. don't set this too high!
  redis_timeout = 200,
  
  mode='count000', -- count - только посчет (без занесения в черный список и подзапроса на кэш контента) | forbidden - не смотреть в редис, банить 403 как авито | nocapture - при бане отдавать только кэш
  prefix = "ip_blacklist", -- для ключей редиса
  -- отдельные записи счетчиков по временным интервалам, IP и URI (без параматеров)
  time_range = 3, -- разбивает временную линию на отрезки секунд и использует для ключа
  req_limit = 20, -- столько раз может обратиться IP в текущем временном отрезке
  -- отдельная запись для удержания в ловушке см. ниже функцию key_lock
  time_lock = 60, -- секунд держать в ловушке, если продолжает дергаться - пролонгировать expire этого ключа
  -- просмотр лога ловушки lrange ip_blacklist 0 -1
  ["debug"]=1,
  redis = require "resty.redis",
--=================== FUNC =============================================
  join = function (list)
    local t = {}
    for _,v in pairs(list) do
      t[#t+1] = tostring(v)
    end
    return table.concat(t,":")
  end,

---------------------------------------------------------------------------------------------------------------------------
  redis_end = function (redis) 
--[[
syntax: ok, err = red:set_keepalive(max_idle_timeout, pool_size)
Puts the current Redis connection immediately into the ngx_lua cosocket connection pool.
You can specify the max idle timeout (in ms) when the connection is in the pool and the maximal size of the pool every nginx worker process.
In case of success, returns 1. In case of errors, returns nil with a string describing the error.
Only call this method in the place you would have called the close method instead. Calling this method will immediately turn the current redis object into the closed state. Any subsequent operations other than connect() on the current objet will return the closed error.
]]

--~ redis:set_keepalive(10000, 2)
  local ok, err = redis:set_keepalive(10000, 20)
  if not ok then
      ngx.log(ngx.ERR, string.format("ip_blacklist: failed to set  set_keepalive: [%s]", err))
--~       return
  end
end
-- end configuration
}

--~ ngx.log(ngx.INFO, "ip_blacklist: success configure table [ip_blacklist]") --..ip_blacklist
