local tracegc = require("\u{74}\u{72}\u{61}\u{63}\u{65}\u{67}\u{63}")
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}\u{20}\u{64}\u{65}\u{74}\u{65}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert((not (s and string.find(err,msg))))
end
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}\u{20}\u{69}\u{6e}\u{20}\u{6d}\u{65}\u{73}\u{73}\u{61}\u{67}\u{65}\u{20}\u{68}\u{61}\u{6e}\u{64}\u{6c}\u{69}\u{6e}\u{67}")
local count = 0x0
local function loop
(x,y,z)
count=(count + 0x1)
return (0x1 + loop(x,y,z))
end
tracegc.stop()
local res,msg = xpcall(loop,loop)
tracegc.start()
assert((msg == "\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{69}\u{6e}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{68}\u{61}\u{6e}\u{64}\u{6c}\u{69}\u{6e}\u{67}"))
print("\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{20}\u{63}\u{6f}\u{75}\u{6e}\u{74}\u{3a}\u{20}",count)
end
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{72}\u{65}\u{63}\u{75}\u{72}\u{73}\u{69}\u{6f}\u{6e}\u{20}\u{69}\u{6e}\u{73}\u{69}\u{64}\u{65}\u{20}\u{70}\u{61}\u{74}\u{74}\u{65}\u{72}\u{6e}\u{20}\u{6d}\u{61}\u{74}\u{63}\u{68}\u{69}\u{6e}\u{67}")
local function f
(size)
local s = string.rep("\u{61}",size)
local p = string.rep("\u{2e}\u{3f}",size)
return string.match(s,p)
end
local m = f(0x50)
assert((# (m == 0x50)))
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{63}\u{6f}\u{6d}\u{70}\u{6c}\u{65}\u{78}",f,0x7d0)
end
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{2d}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}\u{20}\u{69}\u{6e}\u{20}\u{72}\u{65}\u{63}\u{75}\u{72}\u{73}\u{69}\u{76}\u{65}\u{20}\u{27}\u{67}\u{73}\u{75}\u{62}\u{27}")
local count = 0x0
local function foo
()
count=(count + 0x1)
string.gsub("\u{61}","\u{2e}",foo)
end
checkerror("\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",foo)
print("\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{20}\u{63}\u{6f}\u{75}\u{6e}\u{74}\u{3a}\u{20}",count)
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{2d}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}\u{20}\u{69}\u{6e}\u{20}\u{72}\u{65}\u{63}\u{75}\u{72}\u{73}\u{69}\u{76}\u{65}\u{20}\u{27}\u{67}\u{73}\u{75}\u{62}\u{27}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{73}")
local count = 0x0
local t = setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = foo})
foo=function ()
count=(count + 0x1)
string.gsub("\u{61}","\u{2e}",t)
end
checkerror("\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",foo)
print("\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{20}\u{63}\u{6f}\u{75}\u{6e}\u{74}\u{3a}\u{20}",count)
end
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{73}\u{20}\u{69}\u{6e}\u{73}\u{69}\u{64}\u{65}\u{20}\u{64}\u{65}\u{65}\u{70}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{73}")
local count = 0x0
local lim = 0x3e8
local function stack
(n)
if (n > 0x0) then
return (stack((n - 0x1)) + 0x1)
else
coroutine.wrap(function ()
count=(count + 0x1)
stack(lim)
end)()
end
end
local st,msg = xpcall(stack,function ()
return "\u{6f}\u{6b}"
end,lim)
assert((not (st and (msg == "\u{6f}\u{6b}"))))
print("\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{20}\u{63}\u{6f}\u{75}\u{6e}\u{74}\u{3a}\u{20}",count)
end
do
local count = 0x0
print("\u{63}\u{68}\u{61}\u{69}\u{6e}\u{20}\u{6f}\u{66}\u{20}\u{27}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{2e}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{27}")
local coro = false
for i = 0x1, 0x3e8
do
local previous = coro
coro=coroutine.create(function ()
local cc <close> = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
count=(count + 0x1)
if previous then
assert(coroutine.close(previous))
end
end})
coroutine.yield()
end)
assert(coroutine.resume(coro))
end
local st,msg = coroutine.close(coro)
assert((not (st and string.find(msg,"\u{43}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}"))))
print("\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{20}\u{63}\u{6f}\u{75}\u{6e}\u{74}\u{3a}\u{20}",count)
end
do
print("\u{6e}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{66}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{69}\u{6e}\u{67}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{65}\u{64}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{73}")
local count = 0x0
local function body
()
coroutine.yield()
local f = coroutine.wrap(body)
f()
;
count=(count + 0x1)
f()
end
local f = coroutine.wrap(body)
f()
assert((not pcall(f)))
print("\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{20}\u{63}\u{6f}\u{75}\u{6e}\u{74}\u{3a}\u{20}",count)
end
do
print("\u{6e}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{73}\u{20}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}\u{20}\u{61}\u{66}\u{74}\u{65}\u{72}\u{20}\u{72}\u{65}\u{63}\u{6f}\u{76}\u{65}\u{72}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{73}")
local count = 0x0
local function foo
()
count=(count + 0x1)
pcall(0x1)
coroutine.wrap(foo)()
end
checkerror("\u{43}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",foo)
print("\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{20}\u{63}\u{6f}\u{75}\u{6e}\u{74}\u{3a}\u{20}",count)
end
if T then
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{72}\u{65}\u{63}\u{6f}\u{76}\u{65}\u{72}\u{79}")
local N = 0x0
local LIM = (- 0x1)
local stack1
local dummy
local function err
(msg)
assert(string.find(msg,"\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}"))
local _,stacknow = T.stacklevel()
assert((stacknow == (stack1 + 0xc8)))
end
local function f
()
dummy,stack1=T.stacklevel()
if (N == LIM) then
xpcall(f,err)
local _,stacknow = T.stacklevel()
assert((stacknow == stack1))
return 
end
N=(N + 0x1)
f()
end
local topB,sizeB
local topA,sizeA
topB,sizeB=T.stacklevel()
tracegc.stop()
xpcall(f,err)
tracegc.start()
topA,sizeA=T.stacklevel()
assert(((topA == topB) and (sizeA < (sizeB * 0x2))))
print(string.format("\u{6d}\u{61}\u{78}\u{69}\u{6d}\u{75}\u{6d}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{73}\u{69}\u{7a}\u{65}\u{3a}\u{20}\u{25}\u{64}",stack1))
LIM=N
N=0x0
tracegc.stop()
f()
tracegc.start()
print("\u{2b}")
end
print("\u{4f}\u{4b}")