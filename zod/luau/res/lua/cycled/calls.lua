print("\116\101\115\116\105\110\103\32\102\117\110\99\116\105\111\110\115\32\97\110\100\32\99\97\108\108\115")
local debug = require("\100\101\98\117\103")
assert(type(1 < 2) == "\98\111\111\108\101\97\110")
assert(type(true) == "\98\111\111\108\101\97\110" and type(false) == "\98\111\111\108\101\97\110")
assert(type(nil) == "\110\105\108" and type(- 3) == "\110\117\109\98\101\114" and type("\120") == "\115\116\114\105\110\103" and type({}) == "\116\97\98\108\101" and type(type) == "\102\117\110\99\116\105\111\110")
assert(type(assert) == type(print))
local function f
(x)
return a:x(x)
end
assert(type(f) == "\102\117\110\99\116\105\111\110")
assert(not pcall(type))
fact=false
do
local res = 1
local function fact
(n)
if n == 0 then
return res
else
return n * fact(n - 1)
end
end
assert(fact(5) == 120)
end
assert(fact == false)
fact=nil
local a = {["\105"] = 10}
local self = 20
function a:x(x)
return x + self.i
end
function a.y(x)
return x + self
end
assert(a:x(1) + 10 == a.y(1))
a.t={["\105"] = - 100}
a["\116"].x=function (self,a,b)
return self.i + a + b
end
assert(a.t:x(2,3) == - 95)
do
local a = {["\120"] = 0}
function a:add(x)
self.x,a.y=self.x + x,20
;
return self
end
assert(a:add(10):add(20):add(30).x == 60 and a.y == 20)
end
local a = {["\98"] = {["\99"] = {}}}
function a.b.c.f1(x)
return x + 1
end
function a.b.c:f2(x,y)
self[x]=y
end
assert(a.b.c.f1(4) == 5)
a.b.c:f2("\107",12)
;
assert(a.b.c.k == 12)
print("\43")
t=nil
function f(a,b,c)
local d = "\97"
;
t={a,b,c,d}
end
f(1,2)
assert(t[1] == 1 and t[2] == 2 and t[3] == nil and t[4] == "\97")
f(1,2,3,4)
assert(t[1] == 1 and t[2] == 2 and t[3] == 3 and t[4] == "\97")
t=nil
function fat(x)
if x <= 1 then
return 1
else
return x * load("\114\101\116\117\114\110\32\102\97\116\40" .. x - 1 .. "\41","")()
end
end
assert(load("\108\111\97\100\32\39\97\115\115\101\114\116\40\102\97\116\40\54\41\61\61\55\50\48\41\39\32\40\41\32"))()
a=load("\114\101\116\117\114\110\32\102\97\116\40\53\41\44\32\51")
local a,b = a()
assert(a == 120 and b == 3)
fat=nil
print("\43")
local function err_on_n
(n)
if n == 0 then
error()
;
exit(1)
;
else
err_on_n(n - 1)
;
exit(1)
;
end
end
do
local function dummy
(n)
if n > 0 then
assert(not pcall(err_on_n,n))
dummy(n - 1)
end
end
dummy(10)
end
_G.deep=nil
function deep(n)
if n > 0 then
deep(n - 1)
end
end
deep(10)
deep(180)
print("\116\101\115\116\105\110\103\32\116\97\105\108\32\99\97\108\108\115")
function deep(n)
if n > 0 then
return deep(n - 1)
else
return 101
end
end
assert(deep(30000) == 101)
a={}
function a:deep(n)
if n > 0 then
return self:deep(n - 1)
else
return 101
end
end
assert(a:deep(30000) == 101)
do
local function foo
(x, ...)
local a = {...}
;
return x,a[1],a[2]
end
local function foo1
(x)
return foo(10,x,x + 1)
end
local a,b,c = foo1(- 2)
assert(a == 10 and b == - 2 and c == - 1)
local t = setmetatable({},{["\95\95\99\97\108\108"] = foo})
local function foo2
(x)
return t(10,x)
end
a,b,c=foo2(100)
assert(a == t and b == 10 and c == 100)
a,b=(function ()
return foo()
end)()
assert(a == nil and b == nil)
local X,Y,A
local function foo
(x,y, ...)
X=x
;
Y=y
;
A={...}
end
local function foo1
(...)
return foo(...)
end
local a,b,c = foo1()
assert(X == nil and Y == nil and # A == 0)
a,b,c=foo1(10)
assert(X == 10 and Y == nil and # A == 0)
a,b,c=foo1(10,20)
assert(X == 10 and Y == 20 and # A == 0)
a,b,c=foo1(10,20,30)
assert(X == 10 and Y == 20 and # A == 1 and A[1] == 30)
end
do
local function loop
()
assert(pcall(loop))
end
local err,msg = xpcall(loop,loop)
assert(not err and string.find(msg,"\101\114\114\111\114"))
end
do
local n = 10000
local function foo
()
if n == 0 then
return 1023
else
n=n - 1
;
return foo()
end
end
for i = 1, 100
do
foo=setmetatable({},{["\95\95\99\97\108\108"] = foo})
end
assert(coroutine.wrap(function ()
return foo()
end)() == 1023)
end
print("\43")
do
local N = 20
local u = table.pack
for i = 1, N
do
u=setmetatable({i},{["\95\95\99\97\108\108"] = u})
end
local Res = u("\97","\98","\99")
assert(Res.n == N + 3)
for i = 1, N
do
assert(Res[i][1] == i)
end
assert(Res[N + 1] == "\97" and Res[N + 2] == "\98" and Res[N + 3] == "\99")
end
a=nil
(function (x)
a=x
end)(23)
assert(a == 23 and (function (x)
return x * 2
end)(20) == 40)
local Z = function (le)
local function a
(f)
return le(function (x)
return f(f)(x)
end)
end
return a(a)
end
local F = function (f)
return function (n)
if n == 0 then
return 1
else
return n * f(n - 1)
end
end
end
local fat = Z(F)
assert(fat(0) == 1 and fat(4) == 24 and Z(F)(5) == 5 * Z(F)(4))
local function g
(z)
local function f
(a,b,c,d)
return function (x,y)
return a + b + c + d + a + x + y + z
end
end
return f(z,z + 1,z + 2,z + 3)
end
local f = g(10)
assert(f(9,16) == 10 + 11 + 12 + 13 + 10 + 9 + 16 + 10)
print("\43")
local function unlpack
(t,i)
i=i or 1
if (i <= # t) then
return t[i],unlpack(t,i + 1)
end
end
local function equaltab
(t1,t2)
assert(# t1 == # t2)
for i = 1, # t1
do
assert(t1[i] == t2[i])
end
end
local pack = function (...)
return (table.pack(...))
end
local function f
()
return 1,2,30,4
end
local function ret2
(a,b)
return a,b
end
local a,b,c,d = unlpack({1,2,3})
assert(a == 1 and b == 2 and c == 3 and d == nil)
a={1,2,3,4,false,10,"\97\108\111",false,assert}
equaltab(pack(unlpack(a)),a)
equaltab(pack(unlpack(a),- 1),{1,- 1})
a,b,c,d=ret2(f()),ret2(f())
assert(a == 1 and b == 1 and c == 2 and d == nil)
a,b,c,d=unlpack(pack(ret2(f()),ret2(f())))
assert(a == 1 and b == 1 and c == 2 and d == nil)
a,b,c,d=unlpack(pack(ret2(f()),(ret2(f()))))
assert(a == 1 and b == 1 and c == nil and d == nil)
a=ret2({unlpack({1,2,3}),unlpack({3,2,1}),unlpack({"\97","\98"})})
assert(a[1] == 1 and a[2] == 3 and a[3] == "\97" and a[4] == "\98")
rawget({},"\120",1)
rawset({},"\120",1,2)
assert(math.sin(1,2) == math.sin(1))
table.sort({10,9,8,4,19,23,0,0},function (a,b)
return a < b
end,"\101\120\116\114\97\32\97\114\103")
local x = "\45\45\32\97\32\99\111\109\109\101\110\116\10\32\32\120\32\61\32\49\48\32\43\32\10\50\51\59\32\10\32\32\32\32\32\108\111\99\97\108\32\97\32\61\32\102\117\110\99\116\105\111\110\32\40\41\32\120\32\61\32\39\104\105\39\32\101\110\100\59\32\10\32\32\32\32\32\114\101\116\117\114\110\32\39\39"
local function read1
(x)
local i = 0
return function ()
collectgarbage()
i=i + 1
return string.sub(x,i,i)
end
end
local function cannotload
(msg,a,b)
assert(not a and string.find(b,msg))
end
a=assert(load(read1(x),"\109\111\100\110\97\109\101","\116",_G))
assert(a() == "" and _G.x == 33)
assert(debug.getinfo(a).source == "\109\111\100\110\97\109\101")
cannotload("\97\116\116\101\109\112\116\32\116\111\32\108\111\97\100\32\97\32\116\101\120\116\32\99\104\117\110\107",load(read1(x),"\109\111\100\110\97\109\101","\98",{}))
cannotload("\97\116\116\101\109\112\116\32\116\111\32\108\111\97\100\32\97\32\116\101\120\116\32\99\104\117\110\107",load(x,"\109\111\100\110\97\109\101","\98"))
a=assert(load(function ()
return nil
end))
a()
assert(not load(function ()
return true
end))
local t = {nil,"\114\101\116\117\114\110\32","\51"}
f,msg=load(function ()
return table.remove(t,1)
end)
assert(f() == nil)
f=load(string.dump(function ()
return 1
end),nil,"\98",{})
assert(type(f) == "\102\117\110\99\116\105\111\110" and f() == 1)
do
local f = string.dump(function ()
return "\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57"
end)
f=load(read1(f))
assert(f() == "\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57")
end
x=string.dump(load("\120\32\61\32\49\59\32\114\101\116\117\114\110\32\120"))
a=assert(load(read1(x),nil,"\98"))
assert(a() == 1 and _G.x == 1)
cannotload("\97\116\116\101\109\112\116\32\116\111\32\108\111\97\100\32\97\32\98\105\110\97\114\121\32\99\104\117\110\107",load(read1(x),nil,"\116"))
cannotload("\97\116\116\101\109\112\116\32\116\111\32\108\111\97\100\32\97\32\98\105\110\97\114\121\32\99\104\117\110\107",load(x,nil,"\116"))
_G.x=nil
assert(not pcall(string.dump,print))
cannotload("\117\110\101\120\112\101\99\116\101\100\32\115\121\109\98\111\108",load(read1("\42\97\32\61\32\49\50\51")))
cannotload("\117\110\101\120\112\101\99\116\101\100\32\115\121\109\98\111\108",load("\42\97\32\61\32\49\50\51"))
cannotload("\104\104\105",load(function ()
error("\104\104\105")
end))
assert(load("\114\101\116\117\114\110\32\95\69\78\86",nil,nil,123)() == 123)
local x
;
XX=123
local function h
()
local y = x
return XX
end
local d = string.dump(h)
x=load(d,"","\98")
assert(debug.getupvalue(x,2) == "\95\69\78\86")
debug.setupvalue(x,2,_G)
assert(x() == 123)
assert(assert(load("\114\101\116\117\114\110\32\88\88\32\43\32\46\46\46",nil,nil,{["\88\88"] = 13}))(4) == 17)
XX=nil
x="\32\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\120\41\10\32\32\32\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\121\41\10\32\32\32\32\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\122\41\10\32\32\32\32\32\32\32\114\101\116\117\114\110\32\120\43\121\43\122\10\32\32\32\32\32\101\110\100\10\32\32\32\101\110\100\10\32\32\101\110\100\10"
a=assert(load(read1(x),"\114\101\97\100","\116"))
assert(a()(2)(3)(10) == 15)
x=string.dump(a)
a=assert(load(read1(x),"\114\101\97\100","\98"))
assert(a()(2)(3)(10) == 15)
local a,b = 20,30
x=load(string.dump(function (x)
if x == "\115\101\116" then
a=10 + b
;
b=b + 1
else
return a
end
end),"","\98",nil)
assert(x() == nil)
assert(debug.setupvalue(x,1,"\104\105") == "\97")
assert(x() == "\104\105")
assert(debug.setupvalue(x,2,13) == "\98")
assert(not debug.setupvalue(x,3,10))
x("\115\101\116")
assert(x() == 23)
x("\115\101\116")
assert(x() == 24)
do
local nup = 200
local prog = {"\108\111\99\97\108\32\97\49"}
for i = 2, nup
do
prog[# prog + 1]="\44\32\97" .. i
end
prog[# prog + 1]="\32\61\32\49"
for i = 2, nup
do
prog[# prog + 1]="\44\32" .. i
end
local sum = 1
prog[# prog + 1]="\59\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\41\32\114\101\116\117\114\110\32\97\49"
for i = 2, nup
do
prog[# prog + 1]="\32\43\32\97" .. i
;
sum=sum + i
end
prog[# prog + 1]="\32\101\110\100"
prog=table.concat(prog)
local f = assert(load(prog))()
assert(f() == sum)
f=load(string.dump(f))
local a = 10
local h = function ()
return a
end
for i = 1, nup
do
debug.upvaluejoin(f,i,h,1)
end
assert(f() == 10 * nup)
end
do
local t = {["\120"] = 1}
function t:_012345678901234567890123456789012345678901234567890123456789()
return self.x
end
assert(t:_012345678901234567890123456789012345678901234567890123456789() == 1)
end
assert((function ()
return nil
end)(4) == nil)
assert((function ()
local a
;
return a
end)(4) == nil)
assert((function (a)
return a
end)() == nil)
print("\116\101\115\116\105\110\103\32\98\105\110\97\114\121\32\99\104\117\110\107\115")
do
local header = string.pack("\99\52\66\66\99\54\66\66\66","\27\76\117\97",84,0,"\25\147\13\10\26\10",4,string.packsize("\106"),string.packsize("\110"))
local c = string.dump(function ()
local a = 1
;
local b = 3
;
local f = function ()
return a + b + _ENV.c
end
local s1 = "\97\32\99\111\110\115\116\97\110\116"
local s2 = "\97\110\111\116\104\101\114\32\99\111\110\115\116\97\110\116"
return a + b * 3
end)
assert(assert(load(c))() == 10)
assert(string.sub(c,1,# header) == header)
local ci,cn = string.unpack("\106\110",c,# header + 1)
assert(ci == 22136 and cn == 370.5)
for i = 1, # header
do
local s = string.sub(c,1,i - 1) .. string.char(string.byte(string.sub(c,i,i)) + 1) .. string.sub(c,i + 1,- 1)
assert(# s == # c)
assert(not load(s))
end
for i = 1, # c - 1
do
local st,msg = load(string.sub(c,1,i))
assert(not st and string.find(msg,"\116\114\117\110\99\97\116\101\100"))
end
end
print("\79\75")
return deep