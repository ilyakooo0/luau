print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{73}")
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local f
local main,ismain = coroutine.running()
assert(((type(main) == "\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}") and ismain))
assert(not coroutine.resume(main))
assert(not (coroutine.isyieldable(main) and not coroutine.isyieldable()))
assert(not pcall(coroutine.yield))
assert(not pcall(coroutine.resume,0x0))
assert(not pcall(coroutine.status,0x0))
local function eqtab
(t1,t2)
assert(# (t1 == # t2))
for i = 0x1, # t1
do
local v = t1[i]
assert((t2[i] == v))
end
end
_G.x=nil
_G.f=nil
local function foo
(a, ...)
local x,y = coroutine.running()
assert(((x == f) and (y == false)))
assert((coroutine.resume(f) == false))
assert((coroutine.status(f) == "\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}"))
local arg = {...}
assert(coroutine.isyieldable(x))
for i = 0x1, # arg
do
_G.x={coroutine.yield(table.unpack(arg[i]))}
end
return table.unpack(a)
end
f=coroutine.create(foo)
assert(coroutine.isyieldable(f))
assert(((type(f) == "\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}") and (coroutine.status(f) == "\u{73}\u{75}\u{73}\u{70}\u{65}\u{6e}\u{64}\u{65}\u{64}")))
assert(string.find(tostring(f),"\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}"))
local s,a,b,c,d
s,a,b,c,d=coroutine.resume(f,{0x1,0x2,0x3},{},{0x1},{"\u{61}","\u{62}","\u{63}"})
assert(coroutine.isyieldable(f))
assert(((s and (a == nil)) and (coroutine.status(f) == "\u{73}\u{75}\u{73}\u{70}\u{65}\u{6e}\u{64}\u{65}\u{64}")))
s,a,b,c,d=coroutine.resume(f)
eqtab(_G.x,{})
assert(((s and (a == 0x1)) and (b == nil)))
assert(coroutine.isyieldable(f))
s,a,b,c,d=coroutine.resume(f,0x1,0x2,0x3)
eqtab(_G.x,{0x1,0x2,0x3})
assert(((((s and (a == "\u{61}")) and (b == "\u{62}")) and (c == "\u{63}")) and (d == nil)))
s,a,b,c,d=coroutine.resume(f,"\u{78}\u{75}\u{78}\u{75}")
eqtab(_G.x,{"\u{78}\u{75}\u{78}\u{75}"})
assert(((((s and (a == 0x1)) and (b == 0x2)) and (c == 0x3)) and (d == nil)))
assert((coroutine.status(f) == "\u{64}\u{65}\u{61}\u{64}"))
s,a=coroutine.resume(f,"\u{78}\u{75}\u{78}\u{75}")
assert(not ((s and string.find(a,"\u{64}\u{65}\u{61}\u{64}")) and (coroutine.status(f) == "\u{64}\u{65}\u{61}\u{64}")))
_G.f=nil
local function foo
(i)
return coroutine.yield(i)
end
local f = coroutine.wrap(function ()
for i = 0x1, 0xa
do
assert((foo(i) == _G.x))
end
return "\u{61}"
end)
for i = 0x1, 0xa
do
_G.x=i
;
assert((f(i) == i))
end
_G.x="\u{78}\u{75}\u{78}\u{75}"
;
assert((f("\u{78}\u{75}\u{78}\u{75}") == "\u{61}"))
_G.x=nil
local function pf
(n,i)
coroutine.yield(n)
pf((n * i),(i + 0x1))
end
f=coroutine.wrap(pf)
local s = 0x1
for i = 0x1, 0xa
do
assert((f(0x1,0x1) == s))
s=(s * i)
end
local function gen
(n)
return coroutine.wrap(function ()
for i = 0x2, n
do
coroutine.yield(i)
end
end)
end
local function filter
(p,g)
return coroutine.wrap(function ()
while 0x1 do
local n = g()
if (n == nil) then
return 
end
if (math.fmod(n,p) ~= 0x0) then
coroutine.yield(n)
end
end
end)
end
local x = gen(0x50)
local a = {}
while 0x1 do
local n = x()
if (n == nil) then
break
end
table.insert(a,n)
x=filter(n,x)
end
assert(# ((a == 0x16) and (a[# a] == 0x4f)))
x,a=nil
print("\u{74}\u{6f}\u{2d}\u{62}\u{65}\u{2d}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{73}")
local function func2close
(f)
return setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = f})
end
do
local co = coroutine.create(print)
assert(coroutine.resume(co,"\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{2e}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{27}"))
assert((coroutine.status(co) == "\u{64}\u{65}\u{61}\u{64}"))
local st,msg = coroutine.close(co)
assert((st and (msg == nil)))
st,msg=coroutine.close(co)
assert((st and (msg == nil)))
local st,msg = pcall(coroutine.close,coroutine.running())
assert(not (st and string.find(msg,"\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}")))
local main = coroutine.running()
;
(coroutine.wrap(function ()
local st,msg = pcall(coroutine.close,main)
assert(not (st and string.find(msg,"\u{6e}\u{6f}\u{72}\u{6d}\u{61}\u{6c}")))
end))()
do
local co
co=coroutine.create(function ()
local x <close> = func2close(function ()
coroutine.close(co)
end)
coroutine.yield(0x14)
end)
local st,msg = coroutine.resume(co)
assert((st and (msg == 0x14)))
st,msg=coroutine.close(co)
assert(not (st and string.find(msg,"\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}")))
end
local X
local co = coroutine.create(error)
local st,msg = coroutine.resume(co,0x64)
assert(not (st and (msg == 0x64)))
st,msg=coroutine.close(co)
assert(not (st and (msg == 0x64)))
st,msg=coroutine.close(co)
assert((st and (msg == nil)))
co=coroutine.create(function ()
local x <close> = func2close(function (self,err)
assert((err == nil))
;
X=false
end)
X=true
coroutine.yield()
end)
coroutine.resume(co)
assert(X)
assert(coroutine.close(co))
assert(not (X and (coroutine.status(co) == "\u{64}\u{65}\u{61}\u{64}")))
local x = 0x0
co=coroutine.create(function ()
local y <close> = func2close(function (self,err)
assert((err == 0x6f))
x=0xc8
error(0xc8)
end)
local x <close> = func2close(function (self,err)
assert((err == nil))
;
error(0x6f)
end)
coroutine.yield()
end)
coroutine.resume(co)
assert((x == 0x0))
local st,msg = coroutine.close(co)
assert((((st == false) and (coroutine.status(co) == "\u{64}\u{65}\u{61}\u{64}")) and (msg == 0xc8)))
assert((x == 0xc8))
st,msg=coroutine.close(co)
assert((st and (msg == nil)))
end
do
local X = false
local Y = false
local function foo
()
local x <close> = func2close(function (self,err)
Y=debug.getinfo(0x2)
X=err
end)
error(0x2b)
end
local co = coroutine.create(function ()
return pcall(foo)
end)
local st1,st2,err = coroutine.resume(co)
assert((st1 and not (st2 and (err == 0x2b))))
assert(((X == 0x2b) and (Y.what == "\u{43}")))
local track = {}
local function h
(o)
local hv <close> = o
return 0x1
end
local function foo
()
local x <close> = func2close(function (_,msg)
track[# (track + 0x1)]=(msg or false)
error(0x14)
end)
local y <close> = func2close(function (_,msg)
track[# (track + 0x1)]=(msg or false)
return 0x3e8
end)
local z <close> = func2close(function (_,msg)
track[# (track + 0x1)]=(msg or false)
error(0xa)
end)
coroutine.yield(0x1)
h(func2close(function (_,msg)
track[# (track + 0x1)]=(msg or false)
error(0x2)
end))
end
local co = coroutine.create(pcall)
local st,res = coroutine.resume(co,foo)
assert((st and (res == 0x1)))
local st,res1,res2 = coroutine.resume(co)
assert((coroutine.status(co) == "\u{64}\u{65}\u{61}\u{64}"))
assert((st and not (res1 and (res2 == 0x14))))
assert(((((track[0x1] == false) and (track[0x2] == 0x2)) and (track[0x3] == 0xa)) and (track[0x4] == 0xa)))
end
local co = coroutine.wrap(function ()
assert(not pcall(table.sort,{0x1,0x2,0x3},coroutine.yield))
assert(coroutine.isyieldable())
coroutine.yield(0x14)
return 0x1e
end)
assert((co() == 0x14))
assert((co() == 0x1e))
local f = function (s,i)
return coroutine.yield(i)
end
local f1 = coroutine.wrap(function ()
return xpcall(pcall,function (...)
return ...
end,function ()
local s = 0x0
for i in f,nil,0x1
do
pcall(function ()
s=(s + i)
end)
end
error({s})
end)
end)
f1()
for i = 0x1, 0xa
do
assert((f1(i) == i))
end
local r1,r2,v = f1(nil)
assert((r1 and not (r2 and (v[0x1] == ((((0xa + 0x1)) * 0xa) / 0x2)))))
local function f
(a,b)
a=coroutine.yield(a)
;
error({(a + b)})
end
local function g
(x)
return (x[0x1] * 0x2)
end
co=coroutine.wrap(function ()
coroutine.yield(xpcall(f,g,0xa,0x14))
end)
assert((co() == 0xa))
local r,msg = co(0x64)
assert(not (r and (msg == 0xf0)))
do
local function f
(c)
assert(not coroutine.isyieldable())
return (c .. c)
end
local co = coroutine.wrap(function (c)
assert(coroutine.isyieldable())
local s = string.gsub("\u{61}","\u{2e}",f)
return s
end)
assert((co() == "\u{61}\u{61}"))
end
do
local X
local co = coroutine.create(function ()
coroutine.yield(0xa)
return 0x14
end)
local trace = {}
local function dotrace
(event)
trace[# (trace + 0x1)]=event
end
debug.sethook(co,dotrace,"\u{63}\u{6c}\u{72}")
repeat

until not coroutine.resume(co)
local correcttrace = {"\u{63}\u{61}\u{6c}\u{6c}","\u{6c}\u{69}\u{6e}\u{65}","\u{63}\u{61}\u{6c}\u{6c}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}","\u{6c}\u{69}\u{6e}\u{65}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}"}
assert(# (trace == # correcttrace))
for k,v in pairs(trace)
do
assert((v == correcttrace[k]))
end
end
function foo()
assert((debug.getinfo(0x1).currentline == (debug.getinfo(foo).linedefined + 0x1)))
assert((debug.getinfo(0x2).currentline == debug.getinfo(goo).linedefined))
coroutine.yield(0x3)
error(foo)
end
function goo()
foo()
end
x=coroutine.wrap(goo)
assert((x() == 0x3))
local a,b = pcall(x)
assert(not (a and (b == foo)))
x=coroutine.create(goo)
a,b=coroutine.resume(x)
assert((a and (b == 0x3)))
a,b=coroutine.resume(x)
assert(not ((a and (b == foo)) and (coroutine.status(x) == "\u{64}\u{65}\u{61}\u{64}")))
a,b=coroutine.resume(x)
assert(not ((a and string.find(b,"\u{64}\u{65}\u{61}\u{64}")) and (coroutine.status(x) == "\u{64}\u{65}\u{61}\u{64}")))
goo=nil
local function all
(a,n,k)
if (k == 0x0) then
coroutine.yield(a)
else
for i = 0x1, n
do
a[k]=i
all(a,n,(k - 0x1))
end
end
end
local a = 0x0
for t in coroutine.wrap(function ()
all({},0x5,0x4)
end)
do
a=(a + 0x1)
end
assert((a == (0x5 ^ 0x4)))
local C = {}
;
setmetatable(C,{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}\u{76}"})
local x = coroutine.wrap(function ()
local a = 0xa
local function f
()
a=(a + 0xa)
;
return a
end
while true do
a=(a + 0x1)
coroutine.yield(f)
end
end)
C[0x1]=x
;
local f = x()
assert((((f() == 0x15) and (x()() == 0x20)) and (x() == f)))
x=nil
collectgarbage()
assert((C[0x1] == undef))
assert(((f() == 0x2b) and (f() == 0x35)))
local function co_func
(current_co)
assert((coroutine.running() == current_co))
assert((coroutine.resume(current_co) == false))
coroutine.yield(0xa,0x14)
assert((coroutine.resume(current_co) == false))
coroutine.yield(0x17)
return 0xa
end
local co = coroutine.create(co_func)
local a,b,c = coroutine.resume(co,co)
assert((((a == true) and (b == 0xa)) and (c == 0x14)))
a,b=coroutine.resume(co,co)
assert(((a == true) and (b == 0x17)))
a,b=coroutine.resume(co,co)
assert(((a == true) and (b == 0xa)))
assert((coroutine.resume(co,co) == false))
assert((coroutine.resume(co,co) == false))
do
local A = coroutine.running()
local B = coroutine.create(function ()
return coroutine.resume(A)
end)
local st,res = coroutine.resume(B)
assert(((st == true) and (res == false)))
local X = false
A=coroutine.wrap(function ()
local _ <close> = func2close(function ()
X=true
end)
return pcall(A,0x1)
end)
st,res=A()
assert(not ((st and string.find(res,"\u{6e}\u{6f}\u{6e}\u{25}\u{2d}\u{73}\u{75}\u{73}\u{70}\u{65}\u{6e}\u{64}\u{65}\u{64}")) and (X == true)))
end
do
local co
co=coroutine.wrap(function ()
local x <close> = func2close(function ()
return pcall(co)
end)
error(0x6f)
end)
local st,errobj = pcall(co)
assert(not (st and (errobj == 0x6f)))
st,errobj=pcall(co)
assert(not (st and string.find(errobj,"\u{64}\u{65}\u{61}\u{64}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}")))
end
local co1,co2
co1=coroutine.create(function ()
return co2()
end)
co2=coroutine.wrap(function ()
assert((coroutine.status(co1) == "\u{6e}\u{6f}\u{72}\u{6d}\u{61}\u{6c}"))
assert(not coroutine.resume(co1))
coroutine.yield(0x3)
end)
a,b=coroutine.resume(co1)
assert((a and (b == 0x3)))
assert((coroutine.status(co1) == "\u{64}\u{65}\u{61}\u{64}"))
a=function (a)
coroutine.wrap(a)(a)
end
assert(not pcall(a,a))
a=nil
local x = coroutine.create(function ()
local a = 0xa
_G.F=function ()
a=(a + 0x1)
;
return a
end
error("\u{78}")
end)
assert(not coroutine.resume(x))
assert(not coroutine.resume(x,0x1,0x1,0x1,0x1,0x1,0x1,0x1))
assert((_G.F() == 0xb))
assert((_G.F() == 0xc))
_G.F=nil
if not T then
((Message or print))("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{3a}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{20}\u{41}\u{50}\u{49}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
else
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{73}\u{20}\u{69}\u{6e}\u{73}\u{69}\u{64}\u{65}\u{20}\u{68}\u{6f}\u{6f}\u{6b}\u{73}")
local turn
local function fact
(t,x)
assert((turn == t))
if (x == 0x0) then
return 0x1
else
return (x * fact(t,(x - 0x1)))
end
end
local A,B = 0x0,0x0
local x = coroutine.create(function ()
T.sethook("\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{30}","",0x2)
A=fact("\u{41}",0x6)
end)
local y = coroutine.create(function ()
T.sethook("\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{30}","",0x3)
B=fact("\u{42}",0x7)
end)
while ((A == 0x0) or (B == 0x0)) do
if (A == 0x0) then
turn="\u{41}"
;
assert(T.resume(x))
end
if (B == 0x0) then
turn="\u{42}"
;
assert(T.resume(y))
end
debug.traceback(x)
debug.traceback(y)
end
assert(((B // A) == 0x7))
do
local done
local function test
(n)
done=false
return coroutine.wrap(function ()
local a = {}
for i = 0x1, n
do
a[i]=i
end
T.sethook("\u{70}\u{75}\u{73}\u{68}\u{69}\u{6e}\u{74}\u{20}\u{31}\u{30}\u{3b}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{30}","",0x1)
local a1 = {table.unpack(a)}
assert(# (a1 == n))
for i = 0x1, n
do
assert((a[i] == i))
end
done=true
end)
end
local co = test(0x0)
;
while not done do
co(0x1e)
end
co=test(0x1)
;
while not done do
co(0x14,0xa)
end
co=test(0x3)
;
while not done do
co()
end
co=test(0x64)
;
while not done do
co()
end
end
local line = (debug.getinfo(0x1,"\u{6c}").currentline + 0x2)
local function foo
()
local x = 0xa
x=(x + 0xa)
_G.XX=x
end
local co = coroutine.wrap(function ()
T.sethook("\u{73}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{58}\u{3b}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{30}","\u{6c}",0x0)
;
foo()
;
return 0xa
end)
_G.XX=nil
;
_G.X=nil
;
co()
;
assert((_G.X == line))
_G.X=nil
;
co()
;
assert((_G.X == (line + 0x1)))
_G.X=nil
;
co()
;
assert(((_G.X == (line + 0x2)) and (_G.XX == nil)))
_G.X=nil
;
co()
;
assert(((_G.X == (line + 0x3)) and (_G.XX == 0x14)))
assert((co() == 0xa))
_G.X=nil
co=coroutine.wrap(function ()
T.sethook("\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{30}","",0x1)
;
foo()
;
return 0xa
end)
_G.XX=nil
;
local c = 0x0
repeat
c=(c + 0x1)
;
local a = co()
until (a == 0xa)
assert(((_G.XX == 0x14) and (c >= 0x5)))
co=coroutine.wrap(function ()
T.sethook("\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{30}","",0x2)
;
foo()
;
return 0xa
end)
_G.XX=nil
;
local c = 0x0
repeat
c=(c + 0x1)
;
local a = co()
until (a == 0xa)
assert(((_G.XX == 0x14) and (c >= 0x5)))
_G.X=nil
;
_G.XX=nil
do
c=coroutine.create(function (a, ...)
T.sethook("\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{30}","\u{6c}")
local b = a
return ...
end)
assert(coroutine.resume(c,0x1,0x2,0x3))
local n,v = debug.getlocal(c,0x0,0x1)
assert((((n == "\u{61}") and (v == 0x1)) and (debug.getlocal(c,0x0,0x2) ~= "\u{62}")))
assert(debug.setlocal(c,0x0,0x1,0xa))
local t = debug.getinfo(c,0x0)
assert((t.currentline == (t.linedefined + 0x2)))
assert(not debug.getinfo(c,0x1))
assert(coroutine.resume(c))
local n,v = debug.getlocal(c,0x0,0x2)
assert(((n == "\u{62}") and (v == 0xa)))
v={coroutine.resume(c)}
assert(((((v[0x1] == true) and (v[0x2] == 0x2)) and (v[0x3] == 0x3)) and (v[0x4] == undef)))
assert(not coroutine.resume(c))
end
do
local c = coroutine.create(function ()
T.testC("\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{31}",0xa,0x14)
end)
local a,b = coroutine.resume(c)
assert((a and (b == 0x14)))
assert((debug.getinfo(c,0x0).linedefined == - 0x1))
a,b=debug.getlocal(c,0x0,0x2)
assert((b == 0xa))
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{20}\u{41}\u{50}\u{49}")
assert((T.testC("\u{20}\u{20}\u{20}\u{20}\u{6e}\u{65}\u{77}\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{63}\u{72}\u{65}\u{61}\u{74}\u{65}\u{20}\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{32}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{70}\u{75}\u{73}\u{68}\u{20}\u{62}\u{6f}\u{64}\u{79}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{61}\u{20}\u{61}\u{20}\u{61}\u{27}\u{20}\u{20}\u{23}\u{20}\u{70}\u{75}\u{73}\u{68}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}\u{a}\u{20}\u{20}\u{20}\u{20}\u{78}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{30}\u{20}\u{33}\u{20}\u{32}\u{20}\u{20}\u{20}\u{23}\u{20}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{73}\u{20}\u{74}\u{6f}\u{20}\u{6e}\u{65}\u{77}\u{20}\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{65}\u{20}\u{2d}\u{31}\u{2c}\u{20}\u{31}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{69}\u{74}\u{20}\u{66}\u{69}\u{72}\u{73}\u{74}\u{20}\u{74}\u{69}\u{6d}\u{65}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{a}\u{20}\u{20}\u{20}\u{20}\u{78}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{33}\u{20}\u{30}\u{20}\u{30}\u{20}\u{20}\u{20}\u{23}\u{20}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}\u{20}\u{62}\u{61}\u{63}\u{6b}\u{20}\u{74}\u{6f}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{73}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{58}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{a}\u{20}\u{20}\u{20}\u{20}\u{73}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{59}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{32}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{70}\u{75}\u{73}\u{68}\u{20}\u{62}\u{6f}\u{64}\u{79}\u{20}\u{28}\u{74}\u{6f}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{69}\u{74}\u{20}\u{61}\u{67}\u{61}\u{69}\u{6e}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{62}\u{20}\u{62}\u{20}\u{62}\u{27}\u{a}\u{20}\u{20}\u{20}\u{20}\u{78}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{30}\u{20}\u{33}\u{20}\u{32}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{65}\u{20}\u{2d}\u{31}\u{2c}\u{20}\u{31}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{69}\u{74}\u{20}\u{61}\u{67}\u{61}\u{69}\u{6e}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{a}\u{20}\u{20}\u{20}\u{20}\u{78}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{33}\u{20}\u{30}\u{20}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{a}\u{20}\u{20}",function (...)
return ...
end) == "\u{62}\u{20}\u{62}\u{20}\u{62}"))
assert(((X == "\u{61}\u{20}\u{61}\u{20}\u{61}") and (Y == "\u{4f}\u{4b}")))
X,Y=nil
C=coroutine.create(function ()
return T.testC("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{31}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{32}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{65}\u{20}\u{2d}\u{33}\u{20}\u{32}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{67}\u{65}\u{74}\u{74}\u{6f}\u{70}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{33}",C)
end)
local a,b,c,d = coroutine.resume(C)
assert(((((a == true) and string.find(b,"\u{6e}\u{6f}\u{6e}\u{25}\u{2d}\u{73}\u{75}\u{73}\u{70}\u{65}\u{6e}\u{64}\u{65}\u{64}")) and (c == "\u{45}\u{52}\u{52}\u{52}\u{55}\u{4e}")) and (d == 0x4)))
a,b,c,d=T.testC("\u{20}\u{20}\u{20}\u{20}\u{72}\u{61}\u{77}\u{67}\u{65}\u{74}\u{69}\u{20}\u{52}\u{20}\u{31}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{67}\u{65}\u{74}\u{20}\u{6d}\u{61}\u{69}\u{6e}\u{20}\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{31}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{32}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{65}\u{20}\u{2d}\u{33}\u{20}\u{32}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{a}\u{20}\u{20}\u{20}\u{20}\u{67}\u{65}\u{74}\u{74}\u{6f}\u{70}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{34}")
assert(((((a == coroutine.running()) and string.find(b,"\u{6e}\u{6f}\u{6e}\u{25}\u{2d}\u{73}\u{75}\u{73}\u{70}\u{65}\u{6e}\u{64}\u{65}\u{64}")) and (c == "\u{45}\u{52}\u{52}\u{52}\u{55}\u{4e}")) and (d == 0x4)))
local state = T.newstate()
assert(T.testC(state,"\u{6e}\u{65}\u{77}\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}\u{3b}\u{20}\u{69}\u{73}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{2d}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}"))
assert(not T.testC(state,"\u{72}\u{61}\u{77}\u{67}\u{65}\u{74}\u{69}\u{20}\u{52}\u{20}\u{31}\u{3b}\u{20}\u{69}\u{73}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{2d}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}"))
T.testC(state,"\u{73}\u{65}\u{74}\u{74}\u{6f}\u{70}\u{20}\u{30}")
T.loadlib(state)
assert(T.doremote(state,"\u{20}\u{20}\u{20}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{20}\u{3d}\u{20}\u{72}\u{65}\u{71}\u{75}\u{69}\u{72}\u{65}\u{27}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{27}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{58}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{78}\u{29}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{2e}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{28}\u{78}\u{2c}\u{20}\u{27}\u{42}\u{42}\u{27}\u{29}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{27}\u{43}\u{43}\u{27}\u{20}\u{65}\u{6e}\u{64}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{27}\u{6f}\u{6b}\u{27}"))
local t = table.pack(T.testC(state,"\u{20}\u{20}\u{20}\u{20}\u{72}\u{61}\u{77}\u{67}\u{65}\u{74}\u{69}\u{20}\u{52}\u{20}\u{31}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{67}\u{65}\u{74}\u{20}\u{6d}\u{61}\u{69}\u{6e}\u{20}\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{58}\u{58}\u{27}\u{a}\u{20}\u{20}\u{20}\u{20}\u{67}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{58}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{67}\u{65}\u{74}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{6f}\u{72}\u{20}\u{62}\u{6f}\u{64}\u{79}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{41}\u{41}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{61}\u{72}\u{67}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{65}\u{20}\u{31}\u{20}\u{31}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{27}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{65}\u{27}\u{20}\u{73}\u{68}\u{61}\u{64}\u{6f}\u{77}\u{73}\u{20}\u{70}\u{72}\u{65}\u{76}\u{69}\u{6f}\u{75}\u{73}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{21}\u{a}\u{20}\u{20}\u{20}\u{20}\u{67}\u{65}\u{74}\u{74}\u{6f}\u{70}\u{a}\u{20}\u{20}\u{20}\u{20}\u{73}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{54}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{74}\u{6f}\u{70}\u{a}\u{20}\u{20}\u{20}\u{20}\u{73}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{42}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{65}\u{64}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{a}\u{20}\u{20}\u{20}\u{20}\u{73}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{41}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{66}\u{69}\u{73}\u{74}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{65}\u{64}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{61}\u{77}\u{67}\u{65}\u{74}\u{69}\u{20}\u{52}\u{20}\u{31}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{67}\u{65}\u{74}\u{20}\u{6d}\u{61}\u{69}\u{6e}\u{20}\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{35}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{61}\u{72}\u{67}\u{20}\u{28}\u{6e}\u{6f}\u{69}\u{73}\u{65}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{65}\u{20}\u{31}\u{20}\u{31}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{61}\u{66}\u{74}\u{65}\u{72}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{20}\u{65}\u{6e}\u{64}\u{73}\u{2c}\u{20}\u{70}\u{72}\u{65}\u{76}\u{69}\u{6f}\u{75}\u{73}\u{20}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{69}\u{73}\u{20}\u{62}\u{61}\u{63}\u{6b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2a}\u{a}\u{20}\u{20}"))
assert(((((t.n == 0x4) and (t[0x2] == "\u{58}\u{58}")) and (t[0x3] == "\u{43}\u{43}")) and (t[0x4] == "\u{4f}\u{4b}")))
assert((T.doremote(state,"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{54}") == "\u{32}"))
assert((T.doremote(state,"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{41}") == "\u{41}\u{41}"))
assert((T.doremote(state,"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{42}") == "\u{42}\u{42}"))
T.closestate(state)
print("\u{2b}")
end
_G.TO_SURVIVE=coroutine.wrap(function ()
local a = 0xa
local x = function ()
a=(a + 0x1)
end
coroutine.yield()
end)
_G.TO_SURVIVE()
if not _soft then
local lim = 0xf4240
local t = {(lim - 0xa),(lim - 0x5),(lim - 0x1),lim,(lim + 0x1),(lim + 0x5)}
for i = 0x1, # t
do
local j = t[i]
local co = coroutine.create(function ()
return table.unpack({},0x1,j)
end)
local r,msg = coroutine.resume(co)
assert(((j < lim) or not r))
end
end
assert((coroutine.running() == main))
print("\u{2b}")
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{73}\u{20}\u{69}\u{6e}\u{73}\u{69}\u{64}\u{65}\u{20}\u{6d}\u{65}\u{74}\u{61}\u{6d}\u{65}\u{74}\u{68}\u{6f}\u{64}\u{73}")
local function val
(x)
if (type(x) == "\u{74}\u{61}\u{62}\u{6c}\u{65}") then
return x.x
else
return x
end
end
local mt = {["\u{5f}\u{5f}\u{65}\u{71}"] = function (a,b)
coroutine.yield(nil,"\u{65}\u{71}")
;
return (val(a) == val(b))
end,["\u{5f}\u{5f}\u{6c}\u{74}"] = function (a,b)
coroutine.yield(nil,"\u{6c}\u{74}")
;
return (val(a) < val(b))
end,["\u{5f}\u{5f}\u{6c}\u{65}"] = function (a,b)
coroutine.yield(nil,"\u{6c}\u{65}")
;
return ((a - b) <= 0x0)
end,["\u{5f}\u{5f}\u{61}\u{64}\u{64}"] = function (a,b)
coroutine.yield(nil,"\u{61}\u{64}\u{64}")
;
return (val(a) + val(b))
end,["\u{5f}\u{5f}\u{73}\u{75}\u{62}"] = function (a,b)
coroutine.yield(nil,"\u{73}\u{75}\u{62}")
;
return (val(a) - val(b))
end,["\u{5f}\u{5f}\u{6d}\u{75}\u{6c}"] = function (a,b)
coroutine.yield(nil,"\u{6d}\u{75}\u{6c}")
;
return (val(a) * val(b))
end,["\u{5f}\u{5f}\u{64}\u{69}\u{76}"] = function (a,b)
coroutine.yield(nil,"\u{64}\u{69}\u{76}")
;
return (val(a) / val(b))
end,["\u{5f}\u{5f}\u{69}\u{64}\u{69}\u{76}"] = function (a,b)
coroutine.yield(nil,"\u{69}\u{64}\u{69}\u{76}")
;
return (val(a) // val(b))
end,["\u{5f}\u{5f}\u{70}\u{6f}\u{77}"] = function (a,b)
coroutine.yield(nil,"\u{70}\u{6f}\u{77}")
;
return (val(a) ^ val(b))
end,["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}"] = function (a,b)
coroutine.yield(nil,"\u{6d}\u{6f}\u{64}")
;
return (val(a) % val(b))
end,["\u{5f}\u{5f}\u{75}\u{6e}\u{6d}"] = function (a,b)
coroutine.yield(nil,"\u{75}\u{6e}\u{6d}")
;
return - val(a)
end,["\u{5f}\u{5f}\u{62}\u{6e}\u{6f}\u{74}"] = function (a,b)
coroutine.yield(nil,"\u{62}\u{6e}\u{6f}\u{74}")
;
return ~ val(a)
end,["\u{5f}\u{5f}\u{73}\u{68}\u{6c}"] = function (a,b)
coroutine.yield(nil,"\u{73}\u{68}\u{6c}")
;
return (val(a) << val(b))
end,["\u{5f}\u{5f}\u{73}\u{68}\u{72}"] = function (a,b)
coroutine.yield(nil,"\u{73}\u{68}\u{72}")
;
return (val(a) >> val(b))
end,["\u{5f}\u{5f}\u{62}\u{61}\u{6e}\u{64}"] = function (a,b)
coroutine.yield(nil,"\u{62}\u{61}\u{6e}\u{64}")
return (val(a) & val(b))
end,["\u{5f}\u{5f}\u{62}\u{6f}\u{72}"] = function (a,b)
coroutine.yield(nil,"\u{62}\u{6f}\u{72}")
;
return (val(a) | val(b))
end,["\u{5f}\u{5f}\u{62}\u{78}\u{6f}\u{72}"] = function (a,b)
coroutine.yield(nil,"\u{62}\u{78}\u{6f}\u{72}")
;
return (val(a) ~ val(b))
end,["\u{5f}\u{5f}\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}"] = function (a,b)
coroutine.yield(nil,"\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}")
;
return (val(a) .. val(b))
end,["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,k)
coroutine.yield(nil,"\u{69}\u{64}\u{78}")
;
return t.k[k]
end,["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,k,v)
coroutine.yield(nil,"\u{6e}\u{69}\u{64}\u{78}")
;
t.k[k]=v
end}
local function new
(x)
return setmetatable({["\u{78}"] = x,["\u{6b}"] = {}},mt)
end
local a = new(0xa)
local b = new(0xc)
local c = new("\u{68}\u{65}\u{6c}\u{6c}\u{6f}")
local function run
(f,t)
local i = 0x1
local c = coroutine.wrap(f)
while true do
local res,stat = c()
if res then
assert((t[i] == undef))
;
return res,t
end
assert((stat == t[i]))
i=(i + 0x1)
end
end
assert((run(function ()
if ((a >= b)) then
return "\u{3e}\u{3d}"
else
return "\u{3c}"
end
end,{"\u{6c}\u{65}","\u{73}\u{75}\u{62}"}) == "\u{3c}"))
assert((run(function ()
if ((a <= b)) then
return "\u{3c}\u{3d}"
else
return "\u{3e}"
end
end,{"\u{6c}\u{65}","\u{73}\u{75}\u{62}"}) == "\u{3c}\u{3d}"))
assert((run(function ()
if ((a == b)) then
return "\u{3d}\u{3d}"
else
return "\u{7e}\u{3d}"
end
end,{"\u{65}\u{71}"}) == "\u{7e}\u{3d}"))
assert((run(function ()
return (a & (b + a))
end,{"\u{61}\u{64}\u{64}","\u{62}\u{61}\u{6e}\u{64}"}) == 0x2))
assert((run(function ()
return (0x1 + a)
end,{"\u{61}\u{64}\u{64}"}) == 0xb))
assert((run(function ()
return (a - 0x19)
end,{"\u{73}\u{75}\u{62}"}) == - 0xf))
assert((run(function ()
return (0x2 * a)
end,{"\u{6d}\u{75}\u{6c}"}) == 0x14))
assert((run(function ()
return (a ^ 0x2)
end,{"\u{70}\u{6f}\u{77}"}) == 0x64))
assert((run(function ()
return (a / 0x2)
end,{"\u{64}\u{69}\u{76}"}) == 0x5))
assert((run(function ()
return (a % 0x6)
end,{"\u{6d}\u{6f}\u{64}"}) == 0x4))
assert((run(function ()
return (a // 0x3)
end,{"\u{69}\u{64}\u{69}\u{76}"}) == 0x3))
assert((run(function ()
return (a + b)
end,{"\u{61}\u{64}\u{64}"}) == 0x16))
assert((run(function ()
return (a - b)
end,{"\u{73}\u{75}\u{62}"}) == - 0x2))
assert((run(function ()
return (a * b)
end,{"\u{6d}\u{75}\u{6c}"}) == 0x78))
assert((run(function ()
return (a ^ b)
end,{"\u{70}\u{6f}\u{77}"}) == (0xa ^ 0xc)))
assert((run(function ()
return (a / b)
end,{"\u{64}\u{69}\u{76}"}) == (0xa / 0xc)))
assert((run(function ()
return (a % b)
end,{"\u{6d}\u{6f}\u{64}"}) == 0xa))
assert((run(function ()
return (a // b)
end,{"\u{69}\u{64}\u{69}\u{76}"}) == 0x0))
local a1000 = new(0x3e8)
assert((run(function ()
return (a1000 + 0x3e8)
end,{"\u{61}\u{64}\u{64}"}) == 0x7d0))
assert((run(function ()
return (a1000 - 0x61a8)
end,{"\u{73}\u{75}\u{62}"}) == - 0x5dc0))
assert((run(function ()
return (0x7d0 * a)
end,{"\u{6d}\u{75}\u{6c}"}) == 0x4e20))
assert((run(function ()
return (a1000 / 0x3e8)
end,{"\u{64}\u{69}\u{76}"}) == 0x1))
assert((run(function ()
return (a1000 % 0x258)
end,{"\u{6d}\u{6f}\u{64}"}) == 0x190))
assert((run(function ()
return (a1000 // 0x1f4)
end,{"\u{69}\u{64}\u{69}\u{76}"}) == 0x2))
assert((run(function ()
return (a % b)
end,{"\u{6d}\u{6f}\u{64}"}) == 0xa))
assert((run(function ()
return ~ (a & b)
end,{"\u{62}\u{6e}\u{6f}\u{74}","\u{62}\u{61}\u{6e}\u{64}"}) == ~ (0xa & 0xc)))
assert((run(function ()
return (a | b)
end,{"\u{62}\u{6f}\u{72}"}) == (0xa | 0xc)))
assert((run(function ()
return (a ~ b)
end,{"\u{62}\u{78}\u{6f}\u{72}"}) == (0xa ~ 0xc)))
assert((run(function ()
return (a << b)
end,{"\u{73}\u{68}\u{6c}"}) == (0xa << 0xc)))
assert((run(function ()
return (a >> b)
end,{"\u{73}\u{68}\u{72}"}) == (0xa >> 0xc)))
assert((run(function ()
return (0xa & b)
end,{"\u{62}\u{61}\u{6e}\u{64}"}) == (0xa & 0xc)))
assert((run(function ()
return (a | 0x2)
end,{"\u{62}\u{6f}\u{72}"}) == (0xa | 0x2)))
assert((run(function ()
return (a ~ 0x2)
end,{"\u{62}\u{78}\u{6f}\u{72}"}) == (0xa ~ 0x2)))
assert((run(function ()
return (a >> 0x2)
end,{"\u{73}\u{68}\u{72}"}) == (0xa >> 0x2)))
assert((run(function ()
return (0x1 >> a)
end,{"\u{73}\u{68}\u{72}"}) == (0x1 >> 0xa)))
assert((run(function ()
return (a << 0x2)
end,{"\u{73}\u{68}\u{6c}"}) == (0xa << 0x2)))
assert((run(function ()
return (0x1 << a)
end,{"\u{73}\u{68}\u{6c}"}) == (0x1 << 0xa)))
assert((run(function ()
return (0x2 ~ a)
end,{"\u{62}\u{78}\u{6f}\u{72}"}) == (0x2 ~ 0xa)))
assert((run(function ()
return (a .. b)
end,{"\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}"}) == "\u{31}\u{30}\u{31}\u{32}"))
assert((run(function ()
return (a .. (b .. (c .. a)))
end,{"\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}","\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}","\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}"}) == "\u{31}\u{30}\u{31}\u{32}\u{68}\u{65}\u{6c}\u{6c}\u{6f}\u{31}\u{30}"))
assert((run(function ()
return ("\u{61}" .. ("\u{62}" .. (a .. ("\u{63}" .. (c .. (b .. "\u{78}"))))))
end,{"\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}","\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}","\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}"}) == "\u{61}\u{62}\u{31}\u{30}\u{63}\u{68}\u{65}\u{6c}\u{6c}\u{6f}\u{31}\u{32}\u{78}"))
do
local mt1 = {["\u{5f}\u{5f}\u{6c}\u{65}"] = function (a,b)
coroutine.yield(0xa)
return ((val(a) <= val(b)))
end,["\u{5f}\u{5f}\u{6c}\u{74}"] = function (a,b)
coroutine.yield(0xa)
return (val(a) < val(b))
end}
local mt2 = {["\u{5f}\u{5f}\u{6c}\u{74}"] = mt1.__lt,["\u{5f}\u{5f}\u{6c}\u{65}"] = mt1.__le}
local function run
(f)
local co = coroutine.wrap(f)
local res
repeat
res=co()
until (res ~= 0xa)
return res
end
local function test
()
local a1 = setmetatable({["\u{78}"] = 0x1},mt1)
local a2 = setmetatable({["\u{78}"] = 0x2},mt2)
assert((a1 < a2))
assert((a1 <= a2))
assert((0x1 < a2))
assert((0x1 <= a2))
assert((0x2 > a1))
assert((0x2 >= a2))
return true
end
run(test)
end
assert((run(function ()
a.BB=print
return a.BB
end,{"\u{6e}\u{69}\u{64}\u{78}","\u{69}\u{64}\u{78}"}) == print))
do
local _ENV = _ENV
f=function ()
AAA=(BBB + 0x1)
;
return AAA
end
end
local g = new(0xa)
;
g.k.BBB=0xa
;
debug.setupvalue(f,0x1,g)
assert((run(f,{"\u{69}\u{64}\u{78}","\u{6e}\u{69}\u{64}\u{78}","\u{69}\u{64}\u{78}"}) == 0xb))
assert((g.k.AAA == 0xb))
print("\u{2b}")
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{73}\u{20}\u{69}\u{6e}\u{73}\u{69}\u{64}\u{65}\u{20}\u{27}\u{66}\u{6f}\u{72}\u{27}\u{20}\u{69}\u{74}\u{65}\u{72}\u{61}\u{74}\u{6f}\u{72}\u{73}")
local f = function (s,i)
if ((i % 0x2) == 0x0) then
coroutine.yield(nil,"\u{66}\u{6f}\u{72}")
end
if (i < s) then
return (i + 0x1)
end
end
assert((run(function ()
local s = 0x0
for i in f,0x4,0x0
do
s=(s + i)
end
return s
end,{"\u{66}\u{6f}\u{72}","\u{66}\u{6f}\u{72}","\u{66}\u{6f}\u{72}"}) == 0xa))
if (T == nil) then
((Message or print))("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{3a}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{20}\u{41}\u{50}\u{49}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
print("\u{4f}\u{4b}")
;
return 
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{20}\u{41}\u{50}\u{49}")
local function apico
(...)
local x = {...}
return coroutine.wrap(function ()
return T.testC(table.unpack(x))
end)
end
local a = {apico("\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{63}\u{6f}\u{64}\u{65}\u{a}\u{20}\u{20}\u{70}\u{63}\u{61}\u{6c}\u{6c}\u{6b}\u{20}\u{31}\u{20}\u{30}\u{20}\u{32}\u{3b}\u{a}\u{20}\u{20}\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{61}\u{6e}\u{64}\u{20}\u{28}\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{72}\u{72}\u{69}\u{76}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{29}\u{a}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2a}","\u{73}\u{74}\u{61}\u{63}\u{6b}\u{6d}\u{61}\u{72}\u{6b}",error)()}
assert(# (((((a == 0x4) and (a[0x3] == "\u{73}\u{74}\u{61}\u{63}\u{6b}\u{6d}\u{61}\u{72}\u{6b}")) and (a[0x4] == "\u{65}\u{72}\u{72}\u{6f}\u{72}\u{63}\u{6f}\u{64}\u{65}")) and (_G.status == "\u{45}\u{52}\u{52}\u{52}\u{55}\u{4e}")) and (_G.ctx == 0x2)))
local co = apico("\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{32}\u{3b}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{31}\u{30}\u{3b}\u{20}\u{70}\u{63}\u{61}\u{6c}\u{6c}\u{6b}\u{20}\u{31}\u{20}\u{32}\u{20}\u{33}\u{3b}\u{20}\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{61}\u{6e}\u{64}\u{3b}",coroutine.yield,"\u{67}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{3b}\u{20}\u{67}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{63}\u{74}\u{78}\u{3b}\u{20}\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{32}\u{3b}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{61}\u{3b}\u{20}\u{70}\u{63}\u{61}\u{6c}\u{6c}\u{6b}\u{20}\u{31}\u{20}\u{30}\u{20}\u{34}\u{3b}\u{20}\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{61}\u{6e}\u{64}","\u{67}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{3b}\u{20}\u{67}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{63}\u{74}\u{78}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2a}")
assert((co() == 0xa))
assert((co(0x14,0x1e) == "\u{61}"))
a={co()}
assert(# ((((((((a == 0xa) and (a[0x2] == coroutine.yield)) and (a[0x5] == 0x14)) and (a[0x6] == 0x1e)) and (a[0x7] == "\u{59}\u{49}\u{45}\u{4c}\u{44}")) and (a[0x8] == 0x3)) and (a[0x9] == "\u{59}\u{49}\u{45}\u{4c}\u{44}")) and (a[0xa] == 0x4)))
assert(not pcall(co))
f=T.makeCfunc("\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{33}\u{3b}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{35}\u{3b}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{31}\u{3b}")
co=coroutine.wrap(function ()
assert((f() == 0x17))
;
assert((f() == 0x17))
;
return 0xa
end)
assert((co(0x17,0x10) == 0x5))
assert((co(0x17,0x10) == 0x5))
assert((co(0x17,0x10) == 0xa))
f=T.makeCfunc("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{31}\u{30}\u{32}\u{a}\u{9}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{6b}\u{9}\u{31}\u{20}\u{55}\u{32}\u{a}\u{9}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}\u{a}","\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{9}\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{55}\u{33}\u{20}\u{20}\u{20}\u{23}\u{20}\u{61}\u{63}\u{63}\u{65}\u{73}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{75}\u{70}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{73}\u{20}\u{69}\u{6e}\u{73}\u{69}\u{64}\u{65}\u{20}\u{61}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{55}\u{34}\u{a}\u{9}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2a}\u{a}",0x17,"\u{68}\u{75}\u{75}")
x=coroutine.wrap(f)
assert((x() == 0x66))
eqtab({x()},{0x17,"\u{68}\u{75}\u{75}"})
f=T.makeCfunc("\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{61}\u{27}\u{3b}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{31}\u{30}\u{32}\u{3b}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{32}\u{3b}\u{20}")
a,b,c,d=T.testC("\u{6e}\u{65}\u{77}\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}\u{3b}\u{20}\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{32}\u{3b}\u{20}\u{78}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{30}\u{20}\u{33}\u{20}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{65}\u{20}\u{33}\u{20}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{3b}\u{20}\u{78}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{33}\u{20}\u{30}\u{20}\u{30}\u{3b}\u{20}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6d}\u{65}\u{20}\u{33}\u{20}\u{30}\u{3b}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{34}\u{3b}\u{20}",f)
assert(((((a == "\u{59}\u{49}\u{45}\u{4c}\u{44}") and (b == "\u{61}")) and (c == 0x66)) and (d == "\u{4f}\u{4b}")))
local count = 0x3
f=T.makeCfunc("\u{20}\u{20}\u{72}\u{65}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{31}\u{3b}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{72}\u{65}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}\u{a}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{55}\u{33}\u{3b}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{67}\u{65}\u{74}\u{20}\u{73}\u{65}\u{6c}\u{65}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{30}\u{20}\u{31}\u{3b}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{69}\u{74}\u{20}\u{20}\u{28}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{20}\u{69}\u{73}\u{20}\u{27}\u{66}\u{27}\u{20}\u{6f}\u{72}\u{20}\u{27}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{27}\u{29}\u{a}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{68}\u{65}\u{6c}\u{6c}\u{6f}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{73}\u{69}\u{6e}\u{67}\u{6c}\u{65}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}\u{20}\u{66}\u{6f}\u{72}\u{20}\u{73}\u{65}\u{6c}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{75}\u{70}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{69}\u{6e}\u{64}\u{65}\u{78}\u{20}\u{32}\u{3b}\u{20}\u{20}\u{20}\u{23}\u{20}\u{69}\u{6e}\u{64}\u{65}\u{78}\u{20}\u{6f}\u{66}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{70}\u{72}\u{6f}\u{67}\u{72}\u{61}\u{6d}\u{a}\u{20}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{6b}\u{20}\u{31}\u{20}\u{2d}\u{31}\u{20}\u{2e}\u{3b}\u{9}\u{9}\u{23}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{73}\u{65}\u{6c}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{9}\u{9}\u{23}\u{20}\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{65}\u{76}\u{65}\u{72}\u{20}\u{61}\u{72}\u{72}\u{69}\u{76}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{a}","\u{20}\u{20}\u{23}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{70}\u{72}\u{6f}\u{67}\u{72}\u{61}\u{6d}\u{a}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{33}\u{34}\u{9}\u{23}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{a}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{61}\u{6c}\u{6c}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}\u{a}",function ()
count=(count - 0x1)
if (count == 0x0) then
return coroutine.yield
else
return f
end
end)
co=coroutine.wrap(function ()
return f(nil)
end)
assert((co() == "\u{68}\u{65}\u{6c}\u{6c}\u{6f}"))
a={co()}
assert(# ((((a == 0x3) and (a[0x1] == a[0x2])) and (a[0x2] == a[0x3])) and (a[0x3] == 0x22)))
local y
co=coroutine.wrap(function (...)
return T.testC("\u{20}\u{23}\u{20}\u{69}\u{6e}\u{69}\u{74}\u{69}\u{61}\u{6c}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{6b}\u{20}\u{31}\u{20}\u{32}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}","\u{20}\u{20}\u{23}\u{20}\u{31}\u{73}\u{74}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{6b}\u{20}\u{30}\u{20}\u{33}\u{20}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}","\u{20}\u{20}\u{23}\u{20}\u{32}\u{6e}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{6b}\u{20}\u{30}\u{20}\u{34}\u{20}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}","\u{20}\u{20}\u{23}\u{20}\u{33}\u{74}\u{68}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{36}\u{20}\u{20}\u{20}\u{23}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{77}\u{68}\u{69}\u{63}\u{68}\u{20}\u{69}\u{73}\u{20}\u{6c}\u{61}\u{73}\u{74}\u{20}\u{61}\u{72}\u{67}\u{2e}\u{20}\u{74}\u{6f}\u{20}\u{27}\u{74}\u{65}\u{73}\u{74}\u{43}\u{27}\u{20}\u{68}\u{65}\u{72}\u{65}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{31}\u{30}\u{3b}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{32}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{32}\u{20}\u{30}\u{20}\u{30}\u{20}\u{20}\u{20}\u{23}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{74}\u{68}\u{72}\u{6f}\u{77}\u{20}\u{61}\u{6e}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{74}\u{6f}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{6f}\u{70}\u{20}\u{31}\u{9}\u{9}\u{23}\u{20}\u{72}\u{65}\u{6d}\u{6f}\u{76}\u{65}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{6d}\u{65}\u{73}\u{73}\u{61}\u{67}\u{65}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{36}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{67}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{73}\u{74}\u{61}\u{74}\u{75}\u{73}\u{3b}\u{20}\u{67}\u{65}\u{74}\u{67}\u{6c}\u{6f}\u{62}\u{61}\u{6c}\u{20}\u{63}\u{74}\u{78}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{63}\u{61}\u{6c}\u{6c}\u{6b}\u{20}\u{32}\u{20}\u{32}\u{20}\u{35}\u{20}\u{20}\u{23}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{74}\u{68}\u{72}\u{6f}\u{77}\u{20}\u{61}\u{6e}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{6a}\u{75}\u{6d}\u{70}\u{20}\u{74}\u{6f}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}","\u{20}\u{20}\u{23}\u{20}\u{34}\u{74}\u{68}\u{20}\u{28}\u{61}\u{6e}\u{64}\u{20}\u{6c}\u{61}\u{73}\u{74}\u{29}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2a}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}",function (a,b)
x=a
;
y=b
;
error("\u{65}\u{72}\u{72}\u{6d}\u{73}\u{67}")
end,...)
end)
local a = {co(0x3,0x4,0x6)}
assert(((a[0x1] == 0x6) and (a[0x2] == undef)))
a={co()}
;
assert((((a[0x1] == undef) and (_G.status == "\u{59}\u{49}\u{45}\u{4c}\u{44}")) and (_G.ctx == 0x2)))
a={co()}
;
assert((((a[0x1] == undef) and (_G.status == "\u{59}\u{49}\u{45}\u{4c}\u{44}")) and (_G.ctx == 0x3)))
a={co(0x7,0x8)}
;
assert(((((((type(a[0x1]) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}") and (type(a[0x2]) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (type(a[0x3]) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (type(a[0x4]) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (type(a[0x5]) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (type(a[0x6]) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}")))
assert(((a[0x7] == 0x3) and (a[0x8] == 0x4)))
assert(((a[0x9] == 0x7) and (a[0xa] == 0x8)))
assert((a[0xb]:find("\u{65}\u{72}\u{72}\u{6d}\u{73}\u{67}") and # (a == 0xb)))
assert(((x == "\u{59}\u{49}\u{45}\u{4c}\u{44}") and (y == 0x4)))
assert(not pcall(co))
_G.ctx=nil
_G.status=nil
local co = coroutine.wrap(function ()
local a = {pcall(pcall,pcall,pcall,pcall,pcall,pcall,pcall,error,"\u{68}\u{69}")}
return pcall(assert,table.unpack(a))
end)
local a = {co()}
assert((a[0xa] == "\u{68}\u{69}"))
print("\u{4f}\u{4b}")