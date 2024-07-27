local tracegc = require("\116\114\97\99\101\103\99")
print("\116\101\115\116\105\110\103\32\115\116\97\99\107\32\111\118\101\114\102\108\111\119\32\100\101\116\101\99\116\105\111\110")
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
do
print("\116\101\115\116\105\110\103\32\115\116\97\99\107\32\111\118\101\114\102\108\111\119\32\105\110\32\109\101\115\115\97\103\101\32\104\97\110\100\108\105\110\103")
local count = 0
local function loop
(x,y,z)
count=count + 1
return 1 + loop(x,y,z)
end
tracegc.stop()
local res,msg = xpcall(loop,loop)
tracegc.start()
assert(msg == "\101\114\114\111\114\32\105\110\32\101\114\114\111\114\32\104\97\110\100\108\105\110\103")
print("\102\105\110\97\108\32\99\111\117\110\116\58\32",count)
end
do
print("\116\101\115\116\105\110\103\32\114\101\99\117\114\115\105\111\110\32\105\110\115\105\100\101\32\112\97\116\116\101\114\110\32\109\97\116\99\104\105\110\103")
local function f
(size)
local s = string.rep("\97",size)
local p = string.rep("\46\63",size)
return string.match(s,p)
end
local m = f(80)
assert(# m == 80)
checkerror("\116\111\111\32\99\111\109\112\108\101\120",f,2000)
end
do
print("\116\101\115\116\105\110\103\32\115\116\97\99\107\45\111\118\101\114\102\108\111\119\32\105\110\32\114\101\99\117\114\115\105\118\101\32\39\103\115\117\98\39")
local count = 0
local function foo
()
count=count + 1
string.gsub("\97","\46",foo)
end
checkerror("\115\116\97\99\107\32\111\118\101\114\102\108\111\119",foo)
print("\102\105\110\97\108\32\99\111\117\110\116\58\32",count)
print("\116\101\115\116\105\110\103\32\115\116\97\99\107\45\111\118\101\114\102\108\111\119\32\105\110\32\114\101\99\117\114\115\105\118\101\32\39\103\115\117\98\39\32\119\105\116\104\32\109\101\116\97\116\97\98\108\101\115")
local count = 0
local t = setmetatable({},{["\95\95\105\110\100\101\120"] = foo})
foo=function ()
count=count + 1
string.gsub("\97","\46",t)
end
checkerror("\115\116\97\99\107\32\111\118\101\114\102\108\111\119",foo)
print("\102\105\110\97\108\32\99\111\117\110\116\58\32",count)
end
do
print("\116\101\115\116\105\110\103\32\108\105\109\105\116\115\32\105\110\32\99\111\114\111\117\116\105\110\101\115\32\105\110\115\105\100\101\32\100\101\101\112\32\99\97\108\108\115")
local count = 0
local lim = 1000
local function stack
(n)
if n > 0 then
return stack(n - 1) + 1
else
coroutine.wrap(function ()
count=count + 1
stack(lim)
end)()
end
end
local st,msg = xpcall(stack,function ()
return "\111\107"
end,lim)
assert(not st and msg == "\111\107")
print("\102\105\110\97\108\32\99\111\117\110\116\58\32",count)
end
do
local count = 0
print("\99\104\97\105\110\32\111\102\32\39\99\111\114\111\117\116\105\110\101\46\99\108\111\115\101\39")
local coro = false
for i = 1, 1000
do
local previous = coro
coro=coroutine.create(function ()
local cc <close> = setmetatable({},{["\95\95\99\108\111\115\101"] = function ()
count=count + 1
if previous then
assert(coroutine.close(previous))
end
end})
coroutine.yield()
end)
assert(coroutine.resume(coro))
end
local st,msg = coroutine.close(coro)
assert(not st and string.find(msg,"\67\32\115\116\97\99\107\32\111\118\101\114\102\108\111\119"))
print("\102\105\110\97\108\32\99\111\117\110\116\58\32",count)
end
do
print("\110\101\115\116\105\110\103\32\111\102\32\114\101\115\117\109\105\110\103\32\121\105\101\108\100\101\100\32\99\111\114\111\117\116\105\110\101\115")
local count = 0
local function body
()
coroutine.yield()
local f = coroutine.wrap(body)
f()
;
count=count + 1
f()
end
local f = coroutine.wrap(body)
f()
assert(not pcall(f))
print("\102\105\110\97\108\32\99\111\117\110\116\58\32",count)
end
do
print("\110\101\115\116\105\110\103\32\99\111\114\111\117\116\105\110\101\115\32\114\117\110\110\105\110\103\32\97\102\116\101\114\32\114\101\99\111\118\101\114\97\98\108\101\32\101\114\114\111\114\115")
local count = 0
local function foo
()
count=count + 1
pcall(1)
coroutine.wrap(foo)()
end
checkerror("\67\32\115\116\97\99\107\32\111\118\101\114\102\108\111\119",foo)
print("\102\105\110\97\108\32\99\111\117\110\116\58\32",count)
end
if T then
print("\116\101\115\116\105\110\103\32\115\116\97\99\107\32\114\101\99\111\118\101\114\121")
local N = 0
local LIM = - 1
local stack1
local dummy
local function err
(msg)
assert(string.find(msg,"\115\116\97\99\107\32\111\118\101\114\102\108\111\119"))
local _,stacknow = T.stacklevel()
assert(stacknow == stack1 + 200)
end
local function f
()
dummy,stack1=T.stacklevel()
if N == LIM then
xpcall(f,err)
local _,stacknow = T.stacklevel()
assert(stacknow == stack1)
return 
end
N=N + 1
f()
end
local topB,sizeB
local topA,sizeA
topB,sizeB=T.stacklevel()
tracegc.stop()
xpcall(f,err)
tracegc.start()
topA,sizeA=T.stacklevel()
assert(topA == topB and sizeA < sizeB * 2)
print(string.format("\109\97\120\105\109\117\109\32\115\116\97\99\107\32\115\105\122\101\58\32\37\100",stack1))
LIM=N
N=0
tracegc.stop()
f()
tracegc.start()
print("\43")
end
print("\79\75")