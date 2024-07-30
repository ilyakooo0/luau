local M = {}
local setmetatable,stderr,collectgarbage = setmetatable,io.stderr,collectgarbage
_ENV=nil
local active = false
local mt = {}
function mt.__gc(o)
stderr:write("\u{2e}")
if active then
setmetatable(o,mt)
end
end
function M.start()
if (not active) then
active=true
setmetatable({},mt)
end
end
function M.stop()
if active then
active=false
collectgarbage()
end
end
return M