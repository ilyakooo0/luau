print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{73}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{73}")
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
assert(type(1 < 2) == "\u{62}\u{6f}\u{6f}\u{6c}\u{65}\u{61}\u{6e}")
assert(type(true) == "\u{62}\u{6f}\u{6f}\u{6c}\u{65}\u{61}\u{6e}" and type(false) == "\u{62}\u{6f}\u{6f}\u{6c}\u{65}\u{61}\u{6e}")
assert(type(nil) == "\u{6e}\u{69}\u{6c}" and type(- 3) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}" and type("\u{78}") == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}" and type({}) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" and type(type) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
assert(type(assert) == type(print))
local function f
(x)
return a:x(x)
end
assert(type(f) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
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
local a = {["\u{69}"] = 10}
local self = 20
function a:x(x)
return x + self.i
end
function a.y(x)
return x + self
end
assert(a:x(1) + 10 == a.y(1))
a.t={["\u{69}"] = - 100}
a["\u{74}"].x=function (self,a,b)
return self.i + a + b
end
assert(a.t:x(2,3) == - 95)
do
local a = {["\u{78}"] = 0}
function a:add(x)
self.x,a.y=self.x + x,20
;
return self
end
assert(a:add(10):add(20):add(30).x == 60 and a.y == 20)
end
local a = {["\u{62}"] = {["\u{63}"] = {}}}
function a.b.c.f1(x)
return x + 1
end
function a.b.c:f2(x,y)
self[x]=y
end
assert(a.b.c.f1(4) == 5)
a.b.c:f2("\u{6b}",12)
;
assert(a.b.c.k == 12)
print("\u{2b}")
t=nil
function f(a,b,c)
local d = "\u{61}"
;
t={a,b,c,d}
end
f(1,2)
assert(t[1] == 1 and t[2] == 2 and t[3] == nil and t[4] == "\u{61}")
f(1,2,3,4)
assert(t[1] == 1 and t[2] == 2 and t[3] == 3 and t[4] == "\u{61}")
t=nil
function fat(x)
if x <= 1 then
return 1
else
return x * load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{61}\u{74}\u{28}" .. x - 1 .. "\u{29}","")()
end
end
assert(load("\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{27}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{66}\u{61}\u{74}\u{28}\u{36}\u{29}\u{3d}\u{3d}\u{37}\u{32}\u{30}\u{29}\u{27}\u{20}\u{28}\u{29}\u{20}"))()
a=load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{61}\u{74}\u{28}\u{35}\u{29}\u{2c}\u{20}\u{33}")
local a,b = a()
assert(a == 120 and b == 3)
fat=nil
print("\u{2b}")
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
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{61}\u{69}\u{6c}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{73}")
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
local t = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{61}\u{6c}\u{6c}"] = foo})
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
assert(not err and string.find(msg,"\u{65}\u{72}\u{72}\u{6f}\u{72}"))
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
foo=setmetatable({},{["\u{5f}\u{5f}\u{63}\u{61}\u{6c}\u{6c}"] = foo})
end
assert(coroutine.wrap(function ()
return foo()
end)() == 1023)
end
print("\u{2b}")
do
local N = 20
local u = table.pack
for i = 1, N
do
u=setmetatable({i},{["\u{5f}\u{5f}\u{63}\u{61}\u{6c}\u{6c}"] = u})
end
local Res = u("\u{61}","\u{62}","\u{63}")
assert(Res.n == N + 3)
for i = 1, N
do
assert(Res[i][1] == i)
end
assert(Res[N + 1] == "\u{61}" and Res[N + 2] == "\u{62}" and Res[N + 3] == "\u{63}")
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
print("\u{2b}")
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
a={1,2,3,4,false,10,"\u{61}\u{6c}\u{6f}",false,assert}
equaltab(pack(unlpack(a)),a)
equaltab(pack(unlpack(a),- 1),{1,- 1})
a,b,c,d=ret2(f()),ret2(f())
assert(a == 1 and b == 1 and c == 2 and d == nil)
a,b,c,d=unlpack(pack(ret2(f()),ret2(f())))
assert(a == 1 and b == 1 and c == 2 and d == nil)
a,b,c,d=unlpack(pack(ret2(f()),(ret2(f()))))
assert(a == 1 and b == 1 and c == nil and d == nil)
a=ret2({unlpack({1,2,3}),unlpack({3,2,1}),unlpack({"\u{61}","\u{62}"})})
assert(a[1] == 1 and a[2] == 3 and a[3] == "\u{61}" and a[4] == "\u{62}")
rawget({},"\u{78}",1)
rawset({},"\u{78}",1,2)
assert(math.sin(1,2) == math.sin(1))
table.sort({10,9,8,4,19,23,0,0},function (a,b)
return a < b
end,"\u{65}\u{78}\u{74}\u{72}\u{61}\u{20}\u{61}\u{72}\u{67}")
local x = "\u{2d}\u{2d}\u{20}\u{61}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{0}\u{0}\u{0}\u{a}\u{20}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{20}\u{2b}\u{20}\u{a}\u{32}\u{33}\u{3b}\u{20}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{27}\u{68}\u{69}\u{27}\u{20}\u{65}\u{6e}\u{64}\u{3b}\u{20}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{27}\u{0}\u{27}"
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
a=assert(load(read1(x),"\u{6d}\u{6f}\u{64}\u{6e}\u{61}\u{6d}\u{65}","\u{74}",_G))
assert(a() == "\u{0}" and _G.x == 33)
assert(debug.getinfo(a).source == "\u{6d}\u{6f}\u{64}\u{6e}\u{61}\u{6d}\u{65}")
cannotload("\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{61}\u{20}\u{74}\u{65}\u{78}\u{74}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}",load(read1(x),"\u{6d}\u{6f}\u{64}\u{6e}\u{61}\u{6d}\u{65}","\u{62}",{}))
cannotload("\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{61}\u{20}\u{74}\u{65}\u{78}\u{74}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}",load(x,"\u{6d}\u{6f}\u{64}\u{6e}\u{61}\u{6d}\u{65}","\u{62}"))
a=assert(load(function ()
return nil
end))
a()
assert(not load(function ()
return true
end))
local t = {nil,"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}","\u{33}"}
f,msg=load(function ()
return table.remove(t,1)
end)
assert(f() == nil)
f=load(string.dump(function ()
return 1
end),nil,"\u{62}",{})
assert(type(f) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}" and f() == 1)
do
local f = string.dump(function ()
return "\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}"
end)
f=load(read1(f))
assert(f() == "\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}")
end
x=string.dump(load("\u{78}\u{20}\u{3d}\u{20}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}"))
a=assert(load(read1(x),nil,"\u{62}"))
assert(a() == 1 and _G.x == 1)
cannotload("\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{61}\u{20}\u{62}\u{69}\u{6e}\u{61}\u{72}\u{79}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}",load(read1(x),nil,"\u{74}"))
cannotload("\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{61}\u{20}\u{62}\u{69}\u{6e}\u{61}\u{72}\u{79}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}",load(x,nil,"\u{74}"))
_G.x=nil
assert(not pcall(string.dump,print))
cannotload("\u{75}\u{6e}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{73}\u{79}\u{6d}\u{62}\u{6f}\u{6c}",load(read1("\u{2a}\u{61}\u{20}\u{3d}\u{20}\u{31}\u{32}\u{33}")))
cannotload("\u{75}\u{6e}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{73}\u{79}\u{6d}\u{62}\u{6f}\u{6c}",load("\u{2a}\u{61}\u{20}\u{3d}\u{20}\u{31}\u{32}\u{33}"))
cannotload("\u{68}\u{68}\u{69}",load(function ()
error("\u{68}\u{68}\u{69}")
end))
assert(load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{5f}\u{45}\u{4e}\u{56}",nil,nil,123)() == 123)
local x
;
XX=123
local function h
()
local y = x
return XX
end
local d = string.dump(h)
x=load(d,"","\u{62}")
assert(debug.getupvalue(x,2) == "\u{5f}\u{45}\u{4e}\u{56}")
debug.setupvalue(x,2,_G)
assert(x() == 123)
assert(assert(load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{58}\u{58}\u{20}\u{2b}\u{20}\u{2e}\u{2e}\u{2e}",nil,nil,{["\u{58}\u{58}"] = 13}))(4) == 17)
XX=nil
x="\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{78}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{79}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{7a}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}\u{2b}\u{79}\u{2b}\u{7a}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}"
a=assert(load(read1(x),"\u{72}\u{65}\u{61}\u{64}","\u{74}"))
assert(a()(2)(3)(10) == 15)
x=string.dump(a)
a=assert(load(read1(x),"\u{72}\u{65}\u{61}\u{64}","\u{62}"))
assert(a()(2)(3)(10) == 15)
local a,b = 20,30
x=load(string.dump(function (x)
if x == "\u{73}\u{65}\u{74}" then
a=10 + b
;
b=b + 1
else
return a
end
end),"","\u{62}",nil)
assert(x() == nil)
assert(debug.setupvalue(x,1,"\u{68}\u{69}") == "\u{61}")
assert(x() == "\u{68}\u{69}")
assert(debug.setupvalue(x,2,13) == "\u{62}")
assert(not debug.setupvalue(x,3,10))
x("\u{73}\u{65}\u{74}")
assert(x() == 23)
x("\u{73}\u{65}\u{74}")
assert(x() == 24)
do
local nup = 200
local prog = {"\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{31}"}
for i = 2, nup
do
prog[# prog + 1]="\u{2c}\u{20}\u{61}" .. i
end
prog[# prog + 1]="\u{20}\u{3d}\u{20}\u{31}"
for i = 2, nup
do
prog[# prog + 1]="\u{2c}\u{20}" .. i
end
local sum = 1
prog[# prog + 1]="\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{61}\u{31}"
for i = 2, nup
do
prog[# prog + 1]="\u{20}\u{2b}\u{20}\u{61}" .. i
;
sum=sum + i
end
prog[# prog + 1]="\u{20}\u{65}\u{6e}\u{64}"
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
local t = {["\u{78}"] = 1}
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
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{62}\u{69}\u{6e}\u{61}\u{72}\u{79}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}\u{73}")
do
local header = string.pack("\u{63}\u{34}\u{42}\u{42}\u{63}\u{36}\u{42}\u{42}\u{42}","\u{1b}\u{4c}\u{75}\u{61}",84,0,"\u{19}\u{93}\u{d}\u{a}\u{1a}\u{a}",4,string.packsize("\u{6a}"),string.packsize("\u{6e}"))
local c = string.dump(function ()
local a = 1
;
local b = 3
;
local f = function ()
return a + b + _ENV.c
end
local s1 = "\u{61}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{61}\u{6e}\u{74}"
local s2 = "\u{61}\u{6e}\u{6f}\u{74}\u{68}\u{65}\u{72}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{61}\u{6e}\u{74}"
return a + b * 3
end)
assert(assert(load(c))() == 10)
assert(string.sub(c,1,# header) == header)
local ci,cn = string.unpack("\u{6a}\u{6e}",c,# header + 1)
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
assert(not st and string.find(msg,"\u{74}\u{72}\u{75}\u{6e}\u{63}\u{61}\u{74}\u{65}\u{64}"))
end
end
print("\u{4f}\u{4b}")
return deep