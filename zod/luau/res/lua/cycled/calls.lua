print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{73}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{73}")
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
assert(type(0x1 < 0x2) == "\u{62}\u{6f}\u{6f}\u{6c}\u{65}\u{61}\u{6e}")
assert(type(true) == "\u{62}\u{6f}\u{6f}\u{6c}\u{65}\u{61}\u{6e}" and type(false) == "\u{62}\u{6f}\u{6f}\u{6c}\u{65}\u{61}\u{6e}")
assert(type(nil) == "\u{6e}\u{69}\u{6c}" and type(- 0x3) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}" and type("\u{78}") == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}" and type({}) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" and type(type) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
assert(type(assert) == type(print))
local function f
(x)
return a:x(x)
end
assert(type(f) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
assert(not pcall(type))
fact=false
do
local res = 0x1
local function fact
(n)
if n == 0x0 then
return res
else
return n * fact(n - 0x1)
end
end
assert(fact(0x5) == 0x78)
end
assert(fact == false)
fact=nil
local a = {["\u{69}"] = 0xa}
local self = 0x14
function a:x(x)
return x + self.i
end
function a.y(x)
return x + self
end
assert(a:x(0x1) + 0xa == a.y(0x1))
a.t={["\u{69}"] = - 0x64}
a["\u{74}"].x=function (self,a,b)
return self.i + a + b
end
assert(a.t:x(0x2,0x3) == - 0x5f)
do
local a = {["\u{78}"] = 0x0}
function a:add(x)
self.x,a.y=self.x + x,0x14
;
return self
end
assert(a:add(0xa):add(0x14):add(0x1e).x == 0x3c and a.y == 0x14)
end
local a = {["\u{62}"] = {["\u{63}"] = {}}}
function a.b.c.f1(x)
return x + 0x1
end
function a.b.c:f2(x,y)
self[x]=y
end
assert(a.b.c.f1(0x4) == 0x5)
a.b.c:f2("\u{6b}",0xc)
;
assert(a.b.c.k == 0xc)
print("\u{2b}")
t=nil
function f(a,b,c)
local d = "\u{61}"
;
t={a,b,c,d}
end
f(0x1,0x2)
assert(t[0x1] == 0x1 and t[0x2] == 0x2 and t[0x3] == nil and t[0x4] == "\u{61}")
f(0x1,0x2,0x3,0x4)
assert(t[0x1] == 0x1 and t[0x2] == 0x2 and t[0x3] == 0x3 and t[0x4] == "\u{61}")
t=nil
function fat(x)
if x <= 0x1 then
return 0x1
else
return x * load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{61}\u{74}\u{28}" .. x - 0x1 .. "\u{29}","")()
end
end
assert(load("\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{27}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{66}\u{61}\u{74}\u{28}\u{36}\u{29}\u{3d}\u{3d}\u{37}\u{32}\u{30}\u{29}\u{27}\u{20}\u{28}\u{29}\u{20}"))()
a=load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{61}\u{74}\u{28}\u{35}\u{29}\u{2c}\u{20}\u{33}")
local a,b = a()
assert(a == 0x78 and b == 0x3)
fat=nil
print("\u{2b}")
local function err_on_n
(n)
if n == 0x0 then
error()
;
exit(0x1)
;
else
err_on_n(n - 0x1)
;
exit(0x1)
;
end
end
do
local function dummy
(n)
if n > 0x0 then
assert(not pcall(err_on_n,n))
dummy(n - 0x1)
end
end
dummy(0xa)
end
_G.deep=nil
function deep(n)
if n > 0x0 then
deep(n - 0x1)
end
end
deep(0xa)
deep(0xb4)
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{61}\u{69}\u{6c}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{73}")
function deep(n)
if n > 0x0 then
return deep(n - 0x1)
else
return 0x65
end
end
assert(deep(0x7530) == 0x65)
a={}
function a:deep(n)
if n > 0x0 then
return self:deep(n - 0x1)
else
return 0x65
end
end
assert(a:deep(0x7530) == 0x65)
do
local function foo
(x, ...)
local a = {...}
;
return x,a[0x1],a[0x2]
end
local function foo1
(x)
return foo(0xa,x,x + 0x1)
end
local a,b,c = foo1(- 0x2)
assert(a == 0xa and b == - 0x2 and c == - 0x1)
local t = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{61}\u{6c}\u{6c}"] = foo})
local function foo2
(x)
return t(0xa,x)
end
a,b,c=foo2(0x64)
assert(a == t and b == 0xa and c == 0x64)
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
assert(X == nil and Y == nil and # A == 0x0)
a,b,c=foo1(0xa)
assert(X == 0xa and Y == nil and # A == 0x0)
a,b,c=foo1(0xa,0x14)
assert(X == 0xa and Y == 0x14 and # A == 0x0)
a,b,c=foo1(0xa,0x14,0x1e)
assert(X == 0xa and Y == 0x14 and # A == 0x1 and A[0x1] == 0x1e)
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
local n = 0x2710
local function foo
()
if n == 0x0 then
return 0x3ff
else
n=n - 0x1
;
return foo()
end
end
for i = 0x1, 0x64
do
foo=setmetatable({},{["\u{5f}\u{5f}\u{63}\u{61}\u{6c}\u{6c}"] = foo})
end
assert(coroutine.wrap(function ()
return foo()
end)() == 0x3ff)
end
print("\u{2b}")
do
local N = 0x14
local u = table.pack
for i = 0x1, N
do
u=setmetatable({i},{["\u{5f}\u{5f}\u{63}\u{61}\u{6c}\u{6c}"] = u})
end
local Res = u("\u{61}","\u{62}","\u{63}")
assert(Res.n == N + 0x3)
for i = 0x1, N
do
assert(Res[i][0x1] == i)
end
assert(Res[N + 0x1] == "\u{61}" and Res[N + 0x2] == "\u{62}" and Res[N + 0x3] == "\u{63}")
end
a=nil
(function (x)
a=x
end)(0x17)
assert(a == 0x17 and (function (x)
return x * 0x2
end)(0x14) == 0x28)
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
if n == 0x0 then
return 0x1
else
return n * f(n - 0x1)
end
end
end
local fat = Z(F)
assert(fat(0x0) == 0x1 and fat(0x4) == 0x18 and Z(F)(0x5) == 0x5 * Z(F)(0x4))
local function g
(z)
local function f
(a,b,c,d)
return function (x,y)
return a + b + c + d + a + x + y + z
end
end
return f(z,z + 0x1,z + 0x2,z + 0x3)
end
local f = g(0xa)
assert(f(0x9,0x10) == 0xa + 0xb + 0xc + 0xd + 0xa + 0x9 + 0x10 + 0xa)
print("\u{2b}")
local function unlpack
(t,i)
i=i or 0x1
if (i <= # t) then
return t[i],unlpack(t,i + 0x1)
end
end
local function equaltab
(t1,t2)
assert(# t1 == # t2)
for i = 0x1, # t1
do
assert(t1[i] == t2[i])
end
end
local pack = function (...)
return (table.pack(...))
end
local function f
()
return 0x1,0x2,0x1e,0x4
end
local function ret2
(a,b)
return a,b
end
local a,b,c,d = unlpack({0x1,0x2,0x3})
assert(a == 0x1 and b == 0x2 and c == 0x3 and d == nil)
a={0x1,0x2,0x3,0x4,false,0xa,"\u{61}\u{6c}\u{6f}",false,assert}
equaltab(pack(unlpack(a)),a)
equaltab(pack(unlpack(a),- 0x1),{0x1,- 0x1})
a,b,c,d=ret2(f()),ret2(f())
assert(a == 0x1 and b == 0x1 and c == 0x2 and d == nil)
a,b,c,d=unlpack(pack(ret2(f()),ret2(f())))
assert(a == 0x1 and b == 0x1 and c == 0x2 and d == nil)
a,b,c,d=unlpack(pack(ret2(f()),(ret2(f()))))
assert(a == 0x1 and b == 0x1 and c == nil and d == nil)
a=ret2({unlpack({0x1,0x2,0x3}),unlpack({0x3,0x2,0x1}),unlpack({"\u{61}","\u{62}"})})
assert(a[0x1] == 0x1 and a[0x2] == 0x3 and a[0x3] == "\u{61}" and a[0x4] == "\u{62}")
rawget({},"\u{78}",0x1)
rawset({},"\u{78}",0x1,0x2)
assert(math.sin(0x1,0x2) == math.sin(0x1))
table.sort({0xa,0x9,0x8,0x4,0x13,0x17,0x0,0x0},function (a,b)
return a < b
end,"\u{65}\u{78}\u{74}\u{72}\u{61}\u{20}\u{61}\u{72}\u{67}")
local x = "\u{2d}\u{2d}\u{20}\u{61}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{0}\u{0}\u{0}\u{a}\u{20}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{20}\u{2b}\u{20}\u{a}\u{32}\u{33}\u{3b}\u{20}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{27}\u{68}\u{69}\u{27}\u{20}\u{65}\u{6e}\u{64}\u{3b}\u{20}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{27}\u{0}\u{27}"
local function read1
(x)
local i = 0x0
return function ()
collectgarbage()
i=i + 0x1
return string.sub(x,i,i)
end
end
local function cannotload
(msg,a,b)
assert(not a and string.find(b,msg))
end
a=assert(load(read1(x),"\u{6d}\u{6f}\u{64}\u{6e}\u{61}\u{6d}\u{65}","\u{74}",_G))
assert(a() == "\u{0}" and _G.x == 0x21)
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
return table.remove(t,0x1)
end)
assert(f() == nil)
f=load(string.dump(function ()
return 0x1
end),nil,"\u{62}",{})
assert(type(f) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}" and f() == 0x1)
do
local f = string.dump(function ()
return "\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}"
end)
f=load(read1(f))
assert(f() == "\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}")
end
x=string.dump(load("\u{78}\u{20}\u{3d}\u{20}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}"))
a=assert(load(read1(x),nil,"\u{62}"))
assert(a() == 0x1 and _G.x == 0x1)
cannotload("\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{61}\u{20}\u{62}\u{69}\u{6e}\u{61}\u{72}\u{79}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}",load(read1(x),nil,"\u{74}"))
cannotload("\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{61}\u{20}\u{62}\u{69}\u{6e}\u{61}\u{72}\u{79}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}",load(x,nil,"\u{74}"))
_G.x=nil
assert(not pcall(string.dump,print))
cannotload("\u{75}\u{6e}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{73}\u{79}\u{6d}\u{62}\u{6f}\u{6c}",load(read1("\u{2a}\u{61}\u{20}\u{3d}\u{20}\u{31}\u{32}\u{33}")))
cannotload("\u{75}\u{6e}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{73}\u{79}\u{6d}\u{62}\u{6f}\u{6c}",load("\u{2a}\u{61}\u{20}\u{3d}\u{20}\u{31}\u{32}\u{33}"))
cannotload("\u{68}\u{68}\u{69}",load(function ()
error("\u{68}\u{68}\u{69}")
end))
assert(load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{5f}\u{45}\u{4e}\u{56}",nil,nil,0x7b)() == 0x7b)
local x
;
XX=0x7b
local function h
()
local y = x
return XX
end
local d = string.dump(h)
x=load(d,"","\u{62}")
assert(debug.getupvalue(x,0x2) == "\u{5f}\u{45}\u{4e}\u{56}")
debug.setupvalue(x,0x2,_G)
assert(x() == 0x7b)
assert(assert(load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{58}\u{58}\u{20}\u{2b}\u{20}\u{2e}\u{2e}\u{2e}",nil,nil,{["\u{58}\u{58}"] = 0xd}))(0x4) == 0x11)
XX=nil
x="\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{78}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{79}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{7a}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}\u{2b}\u{79}\u{2b}\u{7a}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}"
a=assert(load(read1(x),"\u{72}\u{65}\u{61}\u{64}","\u{74}"))
assert(a()(0x2)(0x3)(0xa) == 0xf)
x=string.dump(a)
a=assert(load(read1(x),"\u{72}\u{65}\u{61}\u{64}","\u{62}"))
assert(a()(0x2)(0x3)(0xa) == 0xf)
local a,b = 0x14,0x1e
x=load(string.dump(function (x)
if x == "\u{73}\u{65}\u{74}" then
a=0xa + b
;
b=b + 0x1
else
return a
end
end),"","\u{62}",nil)
assert(x() == nil)
assert(debug.setupvalue(x,0x1,"\u{68}\u{69}") == "\u{61}")
assert(x() == "\u{68}\u{69}")
assert(debug.setupvalue(x,0x2,0xd) == "\u{62}")
assert(not debug.setupvalue(x,0x3,0xa))
x("\u{73}\u{65}\u{74}")
assert(x() == 0x17)
x("\u{73}\u{65}\u{74}")
assert(x() == 0x18)
do
local nup = 0xc8
local prog = {"\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{31}"}
for i = 0x2, nup
do
prog[# prog + 0x1]="\u{2c}\u{20}\u{61}" .. i
end
prog[# prog + 0x1]="\u{20}\u{3d}\u{20}\u{31}"
for i = 0x2, nup
do
prog[# prog + 0x1]="\u{2c}\u{20}" .. i
end
local sum = 0x1
prog[# prog + 0x1]="\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{61}\u{31}"
for i = 0x2, nup
do
prog[# prog + 0x1]="\u{20}\u{2b}\u{20}\u{61}" .. i
;
sum=sum + i
end
prog[# prog + 0x1]="\u{20}\u{65}\u{6e}\u{64}"
prog=table.concat(prog)
local f = assert(load(prog))()
assert(f() == sum)
f=load(string.dump(f))
local a = 0xa
local h = function ()
return a
end
for i = 0x1, nup
do
debug.upvaluejoin(f,i,h,0x1)
end
assert(f() == 0xa * nup)
end
do
local t = {["\u{78}"] = 0x1}
function t:_012345678901234567890123456789012345678901234567890123456789()
return self.x
end
assert(t:_012345678901234567890123456789012345678901234567890123456789() == 0x1)
end
assert((function ()
return nil
end)(0x4) == nil)
assert((function ()
local a
;
return a
end)(0x4) == nil)
assert((function (a)
return a
end)() == nil)
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{62}\u{69}\u{6e}\u{61}\u{72}\u{79}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}\u{73}")
do
local header = string.pack("\u{63}\u{34}\u{42}\u{42}\u{63}\u{36}\u{42}\u{42}\u{42}","\u{1b}\u{4c}\u{75}\u{61}",0x54,0x0,"\u{19}\u{93}\u{d}\u{a}\u{1a}\u{a}",0x4,string.packsize("\u{6a}"),string.packsize("\u{6e}"))
local c = string.dump(function ()
local a = 0x1
;
local b = 0x3
;
local f = function ()
return a + b + _ENV.c
end
local s1 = "\u{61}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{61}\u{6e}\u{74}"
local s2 = "\u{61}\u{6e}\u{6f}\u{74}\u{68}\u{65}\u{72}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{61}\u{6e}\u{74}"
return a + b * 0x3
end)
assert(assert(load(c))() == 0xa)
assert(string.sub(c,0x1,# header) == header)
local ci,cn = string.unpack("\u{6a}\u{6e}",c,# header + 0x1)
assert(ci == 0x5678 and cn == 370.5)
for i = 0x1, # header
do
local s = string.sub(c,0x1,i - 0x1) .. string.char(string.byte(string.sub(c,i,i)) + 0x1) .. string.sub(c,i + 0x1,- 0x1)
assert(# s == # c)
assert(not load(s))
end
for i = 0x1, # c - 0x1
do
local st,msg = load(string.sub(c,0x1,i))
assert(not st and string.find(msg,"\u{74}\u{72}\u{75}\u{6e}\u{63}\u{61}\u{74}\u{65}\u{64}"))
end
end
print("\u{4f}\u{4b}")
return deep