print("\116\101\115\116\105\110\103\32\99\108\111\115\117\114\101\115")
local A,B = 0,{["\103"] = 10}
local function f
(x)
local a = {}
for i = 1, 1000
do
local y = 0
do
a[i]=function ()
B.g=B.g + 1
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
setmetatable(x,{["\95\95\109\111\100\101"] = "\107\118"})
while x[1] do
local a = A .. A .. A .. A
A=A + 1
end
assert(a[1]() == 20 + A)
assert(a[1]() == 30 + A)
assert(a[2]() == 10 + A)
collectgarbage()
assert(a[2]() == 20 + A)
assert(a[2]() == 30 + A)
assert(a[3]() == 20 + A)
assert(a[8]() == 10 + A)
assert(getmetatable(x).__mode == "\107\118")
assert(B.g == 19)
a={}
for i = 1, 5
do
a[i]=function (x)
return i + a + _ENV
end
end
assert(a[3] ~= a[4] and a[4] ~= a[5])
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
for i = 1, 10
do
a[i]={["\115\101\116"] = function (x)
i=x
end,["\103\101\116"] = function ()
return i
end}
if i == 3 then
break
end
end
assert(a[4] == undef)
a[1].set(10)
assert(a[2].get() == 2)
a[2].set("\97")
assert(a[3].get() == 3)
assert(a[2].get() == "\97")
a={}
local t = {"\97","\98"}
for i = 1, # t
do
local k = t[i]
a[i]={["\115\101\116"] = function (x,y)
i=x
;
k=y
end,["\103\101\116"] = function ()
return i,k
end}
if i == 2 then
break
end
end
a[1].set(10,20)
local r,s = a[2].get()
assert(r == 2 and s == "\98")
r,s=a[1].get()
assert(r == 10 and s == 20)
a[2].set("\97","\98")
r,s=a[2].get()
assert(r == "\97" and s == "\98")
local f
for i = 1, 3
do
f=function ()
return i
end
break
end
assert(f() == 1)
for k = 1, # t
do
local v = t[k]
f=function ()
return k,v
end
break
end
assert(({f()})[1] == 1)
assert(({f()})[2] == "\97")
local b
function f(x)
local first = 1
while 1 do
if x == 3 and not first then
return 
end
local a = "\120\117\120\117"
b=function (op,y)
if op == "\115\101\116" then
a=x + y
else
return a
end
end
if x == 1 then
do
break
end
elseif x == 2 then
return 
else
if x ~= 3 then
error()
end
end
first=nil
end
end
for i = 1, 3
do
f(i)
assert(b("\103\101\116") == "\120\117\120\117")
b("\115\101\116",10)
;
assert(b("\103\101\116") == 10 + i)
b=nil
end
pcall(f,4)
;
assert(b("\103\101\116") == "\120\117\120\117")
b("\115\101\116",10)
;
assert(b("\103\101\116") == 14)
local y,w
function f(x)
return function (y)
return function (z)
return w + x + y + z
end
end
end
y=f(10)
w=1.345
assert(y(20)(30) == 60 + w)
do
local X,Y
local a = math.sin(0)
while a do
local b = 10
X=function ()
return b
end
if a then
break
end
end
do
local b = 20
Y=function ()
return b
end
end
assert(X() == 10 and Y() == 20)
end
local a = {}
local i = 1
repeat
local x = i
a[i]=function ()
i=x + 1
;
return x
end
until i > 10 or a[i]() ~= x
assert(i == 11 and a[1]() == 1 and a[3]() == 3 and i == 4)
a={}
for i = 1, 10
do
if i % 3 == 0 then
local y = 0
a[i]=function (x)
local t = y
;
y=x
;
return t
end
elseif i % 3 == 1 then
goto L1
error("\110\111\116\32\104\101\114\101")
::L1::
local y = 1
a[i]=function (x)
local t = y
;
y=x
;
return t
end
elseif i % 3 == 2 then
local t
goto l4
::l4a::
a[i]=t
;
goto l4b
error("\115\104\111\117\108\100\32\110\101\118\101\114\32\98\101\32\104\101\114\101\33")
::l4::
local y = 2
t=function (x)
local t = y
;
y=x
;
return t
end
goto l4a
error("\115\104\111\117\108\100\32\110\101\118\101\114\32\98\101\32\104\101\114\101\33")
::l4b::
end
end
for i = 1, 10
do
assert(a[i](i * 10) == i % 3 and a[i]() == i * 10)
end
print("\43")
local function t
()
local function c
(a,b)
assert(a == "\116\101\115\116" and b == "\79\75")
end
local function v
(f, ...)
c("\116\101\115\116",f() ~= 1 and "\70\65\73\76\69\68" or "\79\75")
end
local x = 1
return v(function ()
return x
end)
end
t()
local debug = require("\100\101\98\117\103")
local foo1,foo2,foo3
do
local a,b,c = 3,5,7
foo1=function ()
return a + b
end
;
foo2=function ()
return b + a
end
;
do
local a = 10
foo3=function ()
return a + b
end
;
end
end
assert(debug.upvalueid(foo1,1))
assert(debug.upvalueid(foo1,2))
assert(not debug.upvalueid(foo1,3))
assert(debug.upvalueid(foo1,1) == debug.upvalueid(foo2,2))
assert(debug.upvalueid(foo1,2) == debug.upvalueid(foo2,1))
assert(debug.upvalueid(foo3,1))
assert(debug.upvalueid(foo1,1) ~= debug.upvalueid(foo3,1))
assert(debug.upvalueid(foo1,2) == debug.upvalueid(foo3,2))
assert(debug.upvalueid(string.gmatch("\120","\120"),1) ~= nil)
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
print("\79\75")