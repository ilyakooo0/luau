if _soft then
return "\97"
end
print("\116\101\115\116\105\110\103\32\108\97\114\103\101\32\116\97\98\108\101\115")
local debug = require("\100\101\98\117\103")
local lim = 2 ^ 18 + 1000
local prog = {"\108\111\99\97\108\32\121\32\61\32\123\48"}
for i = 1, lim
do
prog[# prog + 1]=i
end
prog[# prog + 1]="\125\10"
prog[# prog + 1]="\88\32\61\32\121\10"
prog[# prog + 1]=("\97\115\115\101\114\116\40\88\91\37\100\93\32\61\61\32\37\100\41"):format(lim - 1,lim - 2)
prog[# prog + 1]="\114\101\116\117\114\110\32\48"
prog=table.concat(prog,"\59")
local env = {["\115\116\114\105\110\103"] = string,["\97\115\115\101\114\116"] = assert}
local f = assert(load(prog,nil,nil,env))
f()
assert(env.X[lim] == lim - 1 and env.X[lim + 1] == lim)
for k in pairs(env)
do
env[k]=undef
end
setmetatable(env,{["\95\95\105\110\100\101\120"] = function (t,n)
coroutine.yield("\103")
;
return _G[n]
end,["\95\95\110\101\119\105\110\100\101\120"] = function (t,n,v)
coroutine.yield("\115")
;
_G[n]=v
end})
X=nil
local co = coroutine.wrap(f)
assert(co() == "\115")
assert(co() == "\103")
assert(co() == "\103")
assert(co() == 0)
assert(X[lim] == lim - 1 and X[lim + 1] == lim)
getmetatable(env).__index=function ()

end
getmetatable(env).__newindex=function ()

end
local e,m = pcall(f)
assert(not e and m:find("\103\108\111\98\97\108\32\39\88\39"))
getmetatable(env).__newindex=function ()
error("\104\105")
end
local e,m = xpcall(f,debug.traceback)
assert(not e and m:find("\39\110\101\119\105\110\100\101\120\39"))
f,X=nil
coroutine.yield("\98")
if 2 ^ 32 == 0 then
print("\116\101\115\116\105\110\103\32\115\116\114\105\110\103\32\108\101\110\103\116\104\32\111\118\101\114\102\108\111\119")
local repstrings = 192
local ssize = math.ceil(2.0 ^ 32 / repstrings) + 1
assert(repstrings * ssize > 2.0 ^ 32)
local longs = string.rep("",ssize)
local rep = assert(load("\108\111\99\97\108\32\97\32\61\32\46\46\46\59\32\114\101\116\117\114\110\32" .. string.rep("\97",repstrings,"\46\46")))
local a,b = pcall(rep,longs)
assert(not a and string.find(b,"\111\118\101\114\102\108\111\119"))
end
print("\79\75")
return "\97"