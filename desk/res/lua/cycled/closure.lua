print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{75}\u{72}\u{65}\u{73}")
local A,B = 0x0,{["\u{67}"] = 0xa}
local function f
(x)
local a = {}
for i = 0x1, 0x3e8
do
local y = 0x0
do
a[i]=function ()
B.g=B.g + 0x1
;
y=y + x
;
return y + A
end
end
end
local dummy = function ()
return a[A]
end
collectgarbage()
A=0x1
;
assert(dummy() == a[0x1])
;
A=0x0
;
assert(a[0x1]() == x)
assert(a[0x3]() == x)
collectgarbage()
assert(B.g == 0xc)
return a
end
local a = f(0xa)
local x = {[0x1] = {}}
setmetatable(x,{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}\u{76}"})
while x[0x1] do
local a = A .. A .. A .. A
A=A + 0x1
end
assert(a[0x1]() == 0x14 + A)
assert(a[0x1]() == 0x1e + A)
assert(a[0x2]() == 0xa + A)
collectgarbage()
assert(a[0x2]() == 0x14 + A)
assert(a[0x2]() == 0x1e + A)
assert(a[0x3]() == 0x14 + A)
assert(a[0x8]() == 0xa + A)
assert(getmetatable(x).__mode == "\u{6b}\u{76}")
assert(B.g == 0x13)
a={}
for i = 0x1, 0x5
do
a[i]=function (x)
return i + a + _ENV
end
end
assert(a[0x3] ~= a[0x4] and a[0x4] ~= a[0x5])
do
local a = function (x)
return math.sin(_ENV[x])
end
local function f
()
return a
end
assert(f() == f())
end
a={}
for i = 0x1, 0xa
do
a[i]={["\u{73}\u{65}\u{74}"] = function (x)
i=x
end,["\u{67}\u{65}\u{74}"] = function ()
return i
end}
if i == 0x3 then
break
end
end
assert(a[0x4] == undef)
a[0x1].set(0xa)
assert(a[0x2].get() == 0x2)
a[0x2].set("\u{61}")
assert(a[0x3].get() == 0x3)
assert(a[0x2].get() == "\u{61}")
a={}
local t = {"\u{61}","\u{62}"}
for i = 0x1, # t
do
local k = t[i]
a[i]={["\u{73}\u{65}\u{74}"] = function (x,y)
i=x
;
k=y
end,["\u{67}\u{65}\u{74}"] = function ()
return i,k
end}
if i == 0x2 then
break
end
end
a[0x1].set(0xa,0x14)
local r,s = a[0x2].get()
assert(r == 0x2 and s == "\u{62}")
r,s=a[0x1].get()
assert(r == 0xa and s == 0x14)
a[0x2].set("\u{61}","\u{62}")
r,s=a[0x2].get()
assert(r == "\u{61}" and s == "\u{62}")
local f
for i = 0x1, 0x3
do
f=function ()
return i
end
break
end
assert(f() == 0x1)
for k = 0x1, # t
do
local v = t[k]
f=function ()
return k,v
end
break
end
assert(({f()})[0x1] == 0x1)
assert(({f()})[0x2] == "\u{61}")
local b
function f(x)
local first = 0x1
while 0x1 do
if x == 0x3 and not first then
return 
end
local a = "\u{78}\u{75}\u{78}\u{75}"
b=function (op,y)
if op == "\u{73}\u{65}\u{74}" then
a=x + y
else
return a
end
end
if x == 0x1 then
do
break
end
elseif x == 0x2 then
return 
else
if x ~= 0x3 then
error()
end
end
first=nil
end
end
for i = 0x1, 0x3
do
f(i)
assert(b("\u{67}\u{65}\u{74}") == "\u{78}\u{75}\u{78}\u{75}")
b("\u{73}\u{65}\u{74}",0xa)
;
assert(b("\u{67}\u{65}\u{74}") == 0xa + i)
b=nil
end
pcall(f,0x4)
;
assert(b("\u{67}\u{65}\u{74}") == "\u{78}\u{75}\u{78}\u{75}")
b("\u{73}\u{65}\u{74}",0xa)
;
assert(b("\u{67}\u{65}\u{74}") == 0xe)
local y,w
function f(x)
return function (y)
return function (z)
return w + x + y + z
end
end
end
y=f(0xa)
w=1.345
assert(y(0x14)(0x1e) == 0x3c + w)
do
local X,Y
local a = math.sin(0x0)
while a do
local b = 0xa
X=function ()
return b
end
if a then
break
end
end
do
local b = 0x14
Y=function ()
return b
end
end
assert(X() == 0xa and Y() == 0x14)
end
local a = {}
local i = 0x1
repeat
local x = i
a[i]=function ()
i=x + 0x1
;
return x
end
until i > 0xa or a[i]() ~= x
assert(i == 0xb and a[0x1]() == 0x1 and a[0x3]() == 0x3 and i == 0x4)
a={}
for i = 0x1, 0xa
do
if i % 0x3 == 0x0 then
local y = 0x0
a[i]=function (x)
local t = y
;
y=x
;
return t
end
elseif i % 0x3 == 0x1 then
goto L1
error("\u{6e}\u{6f}\u{74}\u{20}\u{68}\u{65}\u{72}\u{65}")
::L1::
local y = 0x1
a[i]=function (x)
local t = y
;
y=x
;
return t
end
elseif i % 0x3 == 0x2 then
local t
goto l4
::l4a::
a[i]=t
;
goto l4b
error("\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{65}\u{76}\u{65}\u{72}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}")
::l4::
local y = 0x2
t=function (x)
local t = y
;
y=x
;
return t
end
goto l4a
error("\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{65}\u{76}\u{65}\u{72}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}")
::l4b::
end
end
for i = 0x1, 0xa
do
assert(a[i](i * 0xa) == i % 0x3 and a[i]() == i * 0xa)
end
print("\u{2b}")
local function t
()
local function c
(a,b)
assert(a == "\u{74}\u{65}\u{73}\u{74}" and b == "\u{4f}\u{4b}")
end
local function v
(f, ...)
c("\u{74}\u{65}\u{73}\u{74}",f() ~= 0x1 and "\u{46}\u{41}\u{49}\u{4c}\u{45}\u{44}" or "\u{4f}\u{4b}")
end
local x = 0x1
return v(function ()
return x
end)
end
t()
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local foo1,foo2,foo3
do
local a,b,c = 0x3,0x5,0x7
foo1=function ()
return a + b
end
;
foo2=function ()
return b + a
end
;
do
local a = 0xa
foo3=function ()
return a + b
end
;
end
end
assert(debug.upvalueid(foo1,0x1))
assert(debug.upvalueid(foo1,0x2))
assert(not debug.upvalueid(foo1,0x3))
assert(debug.upvalueid(foo1,0x1) == debug.upvalueid(foo2,0x2))
assert(debug.upvalueid(foo1,0x2) == debug.upvalueid(foo2,0x1))
assert(debug.upvalueid(foo3,0x1))
assert(debug.upvalueid(foo1,0x1) ~= debug.upvalueid(foo3,0x1))
assert(debug.upvalueid(foo1,0x2) == debug.upvalueid(foo3,0x2))
assert(debug.upvalueid(string.gmatch("\u{78}","\u{78}"),0x1) ~= nil)
assert(foo1() == 0x3 + 0x5 and foo2() == 0x5 + 0x3)
debug.upvaluejoin(foo1,0x2,foo2,0x2)
assert(foo1() == 0x3 + 0x3 and foo2() == 0x5 + 0x3)
assert(foo3() == 0xa + 0x5)
debug.upvaluejoin(foo3,0x2,foo2,0x1)
assert(foo3() == 0xa + 0x5)
debug.upvaluejoin(foo3,0x2,foo2,0x2)
assert(foo3() == 0xa + 0x3)
assert(not pcall(debug.upvaluejoin,foo1,0x3,foo2,0x1))
assert(not pcall(debug.upvaluejoin,foo1,0x1,foo2,0x3))
assert(not pcall(debug.upvaluejoin,foo1,0x0,foo2,0x1))
assert(not pcall(debug.upvaluejoin,print,0x1,foo2,0x1))
assert(not pcall(debug.upvaluejoin,{},0x1,foo2,0x1))
assert(not pcall(debug.upvaluejoin,foo1,0x1,print,0x1))
print("\u{4f}\u{4b}")