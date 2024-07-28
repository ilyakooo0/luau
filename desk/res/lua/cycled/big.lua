if _soft then
return "\u{61}"
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{61}\u{72}\u{67}\u{65}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{73}")
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local lim = 0x2 ^ 0x12 + 0x3e8
local prog = {"\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{79}\u{20}\u{3d}\u{20}\u{7b}\u{30}"}
for i = 0x1, lim
do
prog[# prog + 0x1]=i
end
prog[# prog + 0x1]="\u{7d}\u{a}"
prog[# prog + 0x1]="\u{58}\u{20}\u{3d}\u{20}\u{79}\u{a}"
prog[# prog + 0x1]=("\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{58}\u{5b}\u{25}\u{64}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{25}\u{64}\u{29}"):format(lim - 0x1,lim - 0x2)
prog[# prog + 0x1]="\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{30}"
prog=table.concat(prog,"\u{3b}")
local env = {["\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"] = string,["\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}"] = assert}
local f = assert(load(prog,nil,nil,env))
f()
assert(env.X[lim] == lim - 0x1 and env.X[lim + 0x1] == lim)
for k in pairs(env)
do
env[k]=undef
end
setmetatable(env,{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,n)
coroutine.yield("\u{67}")
;
return _G[n]
end,["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,n,v)
coroutine.yield("\u{73}")
;
_G[n]=v
end})
X=nil
local co = coroutine.wrap(f)
assert(co() == "\u{73}")
assert(co() == "\u{67}")
assert(co() == "\u{67}")
assert(co() == 0x0)
assert(X[lim] == lim - 0x1 and X[lim + 0x1] == lim)
getmetatable(env).__index=function ()

end
getmetatable(env).__newindex=function ()

end
local e,m = pcall(f)
assert(not e and m:find("\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{27}\u{58}\u{27}"))
getmetatable(env).__newindex=function ()
error("\u{68}\u{69}")
end
local e,m = xpcall(f,debug.traceback)
assert(not e and m:find("\u{27}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}\u{27}"))
f,X=nil
coroutine.yield("\u{62}")
if 0x2 ^ 0x20 == 0x0 then
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{65}\u{6e}\u{67}\u{74}\u{68}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}")
local repstrings = 0xc0
local ssize = math.ceil(2.0 ^ 0x20 / repstrings) + 0x1
assert(repstrings * ssize > 2.0 ^ 0x20)
local longs = string.rep("\u{0}",ssize)
local rep = assert(load("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{2e}\u{2e}\u{2e}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}" .. string.rep("\u{61}",repstrings,"\u{2e}\u{2e}")))
local a,b = pcall(rep,longs)
assert(not a and string.find(b,"\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}"))
end
print("\u{4f}\u{4b}")
return "\u{61}"