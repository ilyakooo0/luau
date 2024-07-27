print("testing closures")
local A,B = 0,{["g"] = 10}
local function f
(x)
local a = {}
for i = 1, 1e3
do
local y = 0
a[i]=()
B.g=B.g + 1
;
y=y + x
;
return y + A
end
end
local dummy = ()
return a[A]
end
collectgarbage()
A=1
;
assert(dummy() == a[1])
;
A=0
;
assert(a[1]() == x)
assert(a[3]() == x)
collectgarbage()
assert(B.g == 12)
return a
end
local a = f(10)
local x = {[1] = {}}
setmetatable(x,{["__mode"] = "kv"})
while x[1] do
local a = A .. A .. A .. A
A=A + 1
assert(a[1]() == 20 + A)
assert(a[1]() == 30 + A)
assert(a[2]() == 10 + A)
collectgarbage()
assert(a[2]() == 20 + A)
assert(a[2]() == 30 + A)
assert(a[3]() == 20 + A)
assert(a[8]() == 10 + A)
assert(getmetatable(x).__mode == "kv")
assert(B.g == 19)
a={}
for i = 1, 5
do
a[i]=(x)
return i + a + _ENV
end
end
assert(a[3] ~= a[4] and a[4] ~= a[5])
local a = (x)
return math.sin(_ENV[x])
end
local function f
()
return a
end
assert(f() == f())
a={}
for i = 1, 10
do
a[i]={["set"] = (x)
i=x
end,["get"] = ()
return i
end}
if i == 3 then
break
end
end
assert(a[4] == undef)
a[1].set(10)
assert(a[2].get() == 2)
a[2].set("a")
assert(a[3].get() == 3)
assert(a[2].get() == "a")
a={}
local t = {"a","b"}
for i = 1, # t
do
local k = t[i]
a[i]={["set"] = (x,y)
i=x
;
k=y
end,["get"] = ()
return i,k
end}
if i == 2 then
break
end
end
a[1].set(10,20)
local r,s = a[2].get()
assert(r == 2 and s == "b")
r,s=a[1].get()
assert(r == 10 and s == 20)
a[2].set("a","b")
r,s=a[2].get()
assert(r == "a" and s == "b")
local f = 
for i = 1, 3
do
f=()
return i
end
break
end
assert(f() == 1)
for k = 1, # t
do
local v = t[k]
f=()
return k,v
end
break
end
assert(({f()})[1] == 1)
assert(({f()})[2] == "a")
local b = 
function f(x)
local first = 1
while 1 do
if x == 3 and not first then
return 
end
local a = "xuxu"
b=(op,y)
if op == "set" then
a=x + y
else
return a
end
end
if x == 1 then
break
elseifx == 2 then
return 
else
if x ~= 3 then
error()
end
end
first=nil
end
for i = 1, 3
do
f(i)
assert(b("get") == "xuxu")
b("set",10)
;
assert(b("get") == 10 + i)
b=nil
end
pcall(f,4)
;
assert(b("get") == "xuxu")
b("set",10)
;
assert(b("get") == 14)
local y,w = 
function f(x)
return (y)
return (z)
return w + x + y + z
end
end
end
y=f(10)
w=1.345
assert(y(20)(30) == 60 + w)
local X,Y = 
local a = math.sin(0)
while a do
local b = 10
X=()
return b
end
if a then
break
end
local b = 20
Y=()
return b
end
assert(X() == 10 and Y() == 20)
local a = {}
local i = 1
repeat
local x = i
a[i]=()
i=x + 1
;
return x
enduntil i > 10 or a[i]() ~= x
assert(i == 11 and a[1]() == 1 and a[3]() == 3 and i == 4)
a={}
for i = 1, 10
do
if i % 3 == 0 then
local y = 0
a[i]=(x)
local t = y
;
y=x
;
return t
end
elseifi % 3 == 1 then
goto L1
error("not here")
::L1::
local y = 1
a[i]=(x)
local t = y
;
y=x
;
return t
end
elseifi % 3 == 2 then
local t = 
goto l4
::l4a::
a[i]=t
;
goto l4b
error("should never be here!")
::l4::
local y = 2
t=(x)
local t = y
;
y=x
;
return t
end
goto l4a
error("should never be here!")
::l4b::
end
end
for i = 1, 10
do
assert(a[i](i * 10) == i % 3 and a[i]() == i * 10)
end
print("+")
local function t
()
local function c
(a,b)
assert(a == "test" and b == "OK")
end
local function v
(f, ...)
c("test",f() ~= 1 and "FAILED" or "OK")
end
local x = 1
return v(()
return x
end)
end
t()
local debug = require("debug")
local foo1,foo2,foo3 = 
local a,b,c = 3,5,7
foo1=()
return a + b
end
;
foo2=()
return b + a
end
;
local a = 10
foo3=()
return a + b
end
;
assert(debug.upvalueid(foo1,1))
assert(debug.upvalueid(foo1,2))
assert(not debug.upvalueid(foo1,3))
assert(debug.upvalueid(foo1,1) == debug.upvalueid(foo2,2))
assert(debug.upvalueid(foo1,2) == debug.upvalueid(foo2,1))
assert(debug.upvalueid(foo3,1))
assert(debug.upvalueid(foo1,1) ~= debug.upvalueid(foo3,1))
assert(debug.upvalueid(foo1,2) == debug.upvalueid(foo3,2))
assert(debug.upvalueid(string.gmatch("x","x"),1) ~= nil)
assert(foo1() == 3 + 5 and foo2() == 5 + 3)
debug.upvaluejoin(foo1,2,foo2,2)
assert(foo1() == 3 + 3 and foo2() == 5 + 3)
assert(foo3() == 10 + 5)
debug.upvaluejoin(foo3,2,foo2,1)
assert(foo3() == 10 + 5)
debug.upvaluejoin(foo3,2,foo2,2)
assert(foo3() == 10 + 3)
assert(not pcall(debug.upvaluejoin,foo1,3,foo2,1))
assert(not pcall(debug.upvaluejoin,foo1,1,foo2,3))
assert(not pcall(debug.upvaluejoin,foo1,0,foo2,1))
assert(not pcall(debug.upvaluejoin,print,1,foo2,1))
assert(not pcall(debug.upvaluejoin,{},1,foo2,1))
assert(not pcall(debug.upvaluejoin,foo1,1,print,1))
print("OK")