print("\116\101\115\116\105\110\103\32\103\101\110\101\114\97\116\105\111\110\97\108\32\103\97\114\98\97\103\101\32\99\111\108\108\101\99\116\105\111\110")
local debug = require("\100\101\98\117\103")
assert(collectgarbage("\105\115\114\117\110\110\105\110\103"))
collectgarbage()
local oldmode = collectgarbage("\103\101\110\101\114\97\116\105\111\110\97\108")
do
local U = {}
collectgarbage()
assert(not T or T.gcage(U) == "\111\108\100")
U[1]={["\120"] = {234}}
assert(not T or (T.gcage(U) == "\116\111\117\99\104\101\100\49" and T.gcage(U[1]) == "\110\101\119"))
collectgarbage("\115\116\101\112",0)
assert(not T or (T.gcage(U) == "\116\111\117\99\104\101\100\50" and T.gcage(U[1]) == "\115\117\114\118\105\118\97\108"))
collectgarbage("\115\116\101\112",0)
assert(not T or (T.gcage(U) == "\111\108\100" and T.gcage(U[1]) == "\111\108\100\49"))
assert(U[1].x[1] == 234)
end
do
local function foo
()

end
local old = {10}
collectgarbage()
assert(not T or T.gcage(old) == "\111\108\100")
setmetatable(old,{})
assert(not T or T.gcage(getmetatable(old)) == "\111\108\100\48")
collectgarbage("\115\116\101\112",0)
assert(not T or T.gcage(getmetatable(old)) == "\111\108\100\49")
setmetatable(getmetatable(old),{["\95\95\103\99"] = foo})
collectgarbage("\115\116\101\112",0)
end
do
local A = {}
A[1]=false
local function gcf
(obj)
A[1]=obj
assert(not T or T.gcage(obj) == "\111\108\100\49")
obj=nil
collectgarbage("\115\116\101\112",0)
print(getmetatable(A[1]).x)
end
collectgarbage()
local obj = {}
collectgarbage("\115\116\101\112",0)
assert(not T or T.gcage(obj) == "\115\117\114\118\105\118\97\108")
setmetatable(obj,{["\95\95\103\99"] = gcf,["\120"] = "\43"})
assert(not T or T.gcage(getmetatable(obj)) == "\110\101\119")
obj=nil
collectgarbage("\115\116\101\112",0)
end
do
local old = {10}
collectgarbage()
local co = coroutine.create(function ()
local x = nil
local f = function ()
return x[1]
end
x=coroutine.yield(f)
coroutine.yield()
end)
local _,f = coroutine.resume(co)
collectgarbage("\115\116\101\112",0)
old[1]={"\104\101\108\108\111"}
coroutine.resume(co,{123})
co=nil
collectgarbage("\115\116\101\112",0)
assert(f() == 123 and old[1][1] == "\104\101\108\108\111")
collectgarbage("\115\116\101\112",0)
assert(f() == 123 and old[1][1] == "\104\101\108\108\111")
end
do
local t = setmetatable({},{["\95\95\109\111\100\101"] = "\107\118"})
collectgarbage()
assert(not T or T.gcage(t) == "\111\108\100")
t[1]={10}
assert(not T or (T.gcage(t) == "\116\111\117\99\104\101\100\49" and T.gccolor(t) == "\103\114\97\121"))
collectgarbage("\115\116\101\112",0)
assert(not T or (T.gcage(t) == "\116\111\117\99\104\101\100\50" and T.gccolor(t) == "\98\108\97\99\107"))
collectgarbage("\115\116\101\112",0)
assert(not T or T.gcage(t) == "\111\108\100")
t[1]={10}
collectgarbage("\115\116\101\112",0)
assert(t[1] == nil)
end
if T == nil then
(Message or print)("\10\32\62\62\62\32\116\101\115\116\67\32\110\111\116\32\97\99\116\105\118\101\58\32\115\107\105\112\112\105\110\103\32\115\111\109\101\32\103\101\110\101\114\97\116\105\111\110\97\108\32\116\101\115\116\115\32\60\60\60\10")
print("\79\75")
return 
end
do
local U = T.newuserdata(0,1)
collectgarbage()
assert(T.gcage(U) == "\111\108\100")
debug.setuservalue(U,{["\120"] = {234}})
assert(T.gcage(U) == "\116\111\117\99\104\101\100\49" and T.gcage(debug.getuservalue(U)) == "\110\101\119")
collectgarbage("\115\116\101\112",0)
assert(T.gcage(U) == "\116\111\117\99\104\101\100\50" and T.gcage(debug.getuservalue(U)) == "\115\117\114\118\105\118\97\108")
collectgarbage("\115\116\101\112",0)
assert(T.gcage(U) == "\111\108\100" and T.gcage(debug.getuservalue(U)) == "\111\108\100\49")
assert(debug.getuservalue(U).x[1] == 234)
end
assert(collectgarbage("\105\115\114\117\110\110\105\110\103"))
assert(collectgarbage("\105\115\114\117\110\110\105\110\103"))
collectgarbage(oldmode)
print("\79\75")