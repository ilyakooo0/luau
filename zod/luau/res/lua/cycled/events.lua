print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{73}")
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
X=20
;
B=30
_ENV=setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = _G})
collectgarbage()
X=X + 10
assert(X == 30 and _G.X == 20)
B=false
assert(B == false)
_ENV["\u{42}"]=undef
assert(B == 30)
assert(getmetatable({}) == nil)
assert(getmetatable(4) == nil)
assert(getmetatable(nil) == nil)
a={["\u{6e}\u{61}\u{6d}\u{65}"] = "\u{4e}\u{41}\u{4d}\u{45}"}
;
setmetatable(a,{["\u{5f}\u{5f}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}"] = "\u{78}\u{75}\u{78}\u{75}",["\u{5f}\u{5f}\u{74}\u{6f}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"] = function (x)
return x.name
end})
assert(getmetatable(a) == "\u{78}\u{75}\u{78}\u{75}")
assert(tostring(a) == "\u{4e}\u{41}\u{4d}\u{45}")
assert(pcall(setmetatable,a,{}) == false)
a.name="\u{67}\u{6f}\u{72}\u{6f}\u{72}\u{6f}\u{62}\u{61}"
assert(tostring(a) == "\u{67}\u{6f}\u{72}\u{6f}\u{72}\u{6f}\u{62}\u{61}")
local a,t = {10,20,30,["\u{78}"] = "\u{31}\u{30}",["\u{79}"] = "\u{32}\u{30}"},{}
assert(setmetatable(a,t) == a)
assert(getmetatable(a) == t)
assert(setmetatable(a,nil) == a)
assert(getmetatable(a) == nil)
assert(setmetatable(a,t) == a)
function f(t,i,e)
assert(not e)
local p = rawget(t,"\u{70}\u{61}\u{72}\u{65}\u{6e}\u{74}")
return (p and p[i] + 3),"\u{64}\u{75}\u{6d}\u{6d}\u{79}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}"
end
t.__index=f
a.parent={["\u{7a}"] = 25,["\u{78}"] = 12,[4] = 24}
assert(a[1] == 10 and a.z == 28 and a[4] == 27 and a.x == "\u{31}\u{30}")
collectgarbage()
a=setmetatable({},t)
function f(t,i,v)
rawset(t,i,v - 3)
end
setmetatable(t,t)
t.__newindex=f
a[1]=30
;
a.x="\u{31}\u{30}\u{31}"
;
a[5]=200
assert(a[1] == 27 and a.x == 98 and a[5] == 197)
do
local mt = {}
mt.__newindex=mt
local t = setmetatable({},mt)
t[1]=10
assert(mt[1] == 10)
end
local c = {}
a=setmetatable({},t)
t.__newindex=c
t.__index=c
a[1]=10
;
a[2]=20
;
a[3]=90
;
for i = 4, 20
do
a[i]=i * 10
end
assert(a[1] == 10 and a[2] == 20 and a[3] == 90)
for i = 4, 20
do
assert(a[i] == i * 10)
end
assert(next(a) == nil)
do
local a
;
a=setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (_,n)
return a[n - 3] + 4,"\u{6c}\u{69}\u{78}\u{6f}"
end})})})
a[0]=20
for i = 0, 10
do
assert(a[i * 3] == 20 + i * 4)
end
end
do
local foi
local a = {}
for i = 1, 10
do
a[i]=0
;
a["\u{61}" .. i]=0
;
end
setmetatable(a,{["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,k,v)
foi=true
;
rawset(t,k,v)
end})
foi=false
;
a[1]=0
;
assert(not foi)
foi=false
;
a["\u{61}\u{31}"]=0
;
assert(not foi)
foi=false
;
a["\u{61}\u{31}\u{31}"]=0
;
assert(foi)
foi=false
;
a[11]=0
;
assert(foi)
foi=false
;
a[1]=undef
;
assert(not foi)
a[1]=undef
foi=false
;
a[1]=nil
;
assert(foi)
end
setmetatable(t,nil)
function f(t, ...)
return t,{...}
end
t.__call=f
do
local x,y = a(table.unpack({"\u{61}",1}))
assert(x == a and y[1] == "\u{61}" and y[2] == 1 and y[3] == undef)
x,y=a()
assert(x == a and y[1] == undef)
end
local b = setmetatable({},t)
setmetatable(b,t)
function f(op)
return function (...)
cap={[0] = op,...}
;
return (...)
end
end
t.__add=f("\u{61}\u{64}\u{64}")
t.__sub=f("\u{73}\u{75}\u{62}")
t.__mul=f("\u{6d}\u{75}\u{6c}")
t.__div=f("\u{64}\u{69}\u{76}")
t.__idiv=f("\u{69}\u{64}\u{69}\u{76}")
t.__mod=f("\u{6d}\u{6f}\u{64}")
t.__unm=f("\u{75}\u{6e}\u{6d}")
t.__pow=f("\u{70}\u{6f}\u{77}")
t.__len=f("\u{6c}\u{65}\u{6e}")
t.__band=f("\u{62}\u{61}\u{6e}\u{64}")
t.__bor=f("\u{62}\u{6f}\u{72}")
t.__bxor=f("\u{62}\u{78}\u{6f}\u{72}")
t.__shl=f("\u{73}\u{68}\u{6c}")
t.__shr=f("\u{73}\u{68}\u{72}")
t.__bnot=f("\u{62}\u{6e}\u{6f}\u{74}")
t.__lt=f("\u{6c}\u{74}")
t.__le=f("\u{6c}\u{65}")
local function checkcap
(t)
assert(# cap + 1 == # t)
for i = 1, # t
do
assert(cap[i - 1] == t[i])
assert(math.type(cap[i - 1]) == math.type(t[i]))
end
end
assert(b + 5 == b)
;
checkcap({"\u{61}\u{64}\u{64}",b,5})
assert(5.2 + b == 5.2)
;
checkcap({"\u{61}\u{64}\u{64}",5.2,b})
assert(b + "\u{35}" == b)
;
checkcap({"\u{61}\u{64}\u{64}",b,"\u{35}"})
assert(5 + b == 5)
;
checkcap({"\u{61}\u{64}\u{64}",5,b})
assert("\u{35}" + b == "\u{35}")
;
checkcap({"\u{61}\u{64}\u{64}","\u{35}",b})
b=b - 3
;
assert(getmetatable(b) == t)
;
checkcap({"\u{73}\u{75}\u{62}",b,3})
assert(5 - a == 5)
;
checkcap({"\u{73}\u{75}\u{62}",5,a})
assert("\u{35}" - a == "\u{35}")
;
checkcap({"\u{73}\u{75}\u{62}","\u{35}",a})
assert(a * a == a)
;
checkcap({"\u{6d}\u{75}\u{6c}",a,a})
assert(a / 0 == a)
;
checkcap({"\u{64}\u{69}\u{76}",a,0})
assert(a / 0.0 == a)
;
checkcap({"\u{64}\u{69}\u{76}",a,0.0})
assert(a % 2 == a)
;
checkcap({"\u{6d}\u{6f}\u{64}",a,2})
assert(a // (1 / 0) == a)
;
checkcap({"\u{69}\u{64}\u{69}\u{76}",a,1 / 0})
;
(function ()
assert(a & "\u{68}\u{69}" == a)
end)()
;
checkcap({"\u{62}\u{61}\u{6e}\u{64}",a,"\u{68}\u{69}"})
;
(function ()
assert(10 & a == 10)
end)()
;
checkcap({"\u{62}\u{61}\u{6e}\u{64}",10,a})
;
(function ()
assert(a | 10 == a)
end)()
;
checkcap({"\u{62}\u{6f}\u{72}",a,10})
assert(a | "\u{68}\u{69}" == a)
;
checkcap({"\u{62}\u{6f}\u{72}",a,"\u{68}\u{69}"})
assert("\u{68}\u{69}" ~ a == "\u{68}\u{69}")
;
checkcap({"\u{62}\u{78}\u{6f}\u{72}","\u{68}\u{69}",a})
;
(function ()
assert(10 ~ a == 10)
end)()
;
checkcap({"\u{62}\u{78}\u{6f}\u{72}",10,a})
assert(- a == a)
;
checkcap({"\u{75}\u{6e}\u{6d}",a,a})
assert(a ^ 4.0 == a)
;
checkcap({"\u{70}\u{6f}\u{77}",a,4.0})
assert(a ^ "\u{34}" == a)
;
checkcap({"\u{70}\u{6f}\u{77}",a,"\u{34}"})
assert(4 ^ a == 4)
;
checkcap({"\u{70}\u{6f}\u{77}",4,a})
assert("\u{34}" ^ a == "\u{34}")
;
checkcap({"\u{70}\u{6f}\u{77}","\u{34}",a})
assert(# a == a)
;
checkcap({"\u{6c}\u{65}\u{6e}",a,a})
assert(~ a == a)
;
checkcap({"\u{62}\u{6e}\u{6f}\u{74}",a,a})
assert(a << 3 == a)
;
checkcap({"\u{73}\u{68}\u{6c}",a,3})
assert(1.5 >> a == 1.5)
;
checkcap({"\u{73}\u{68}\u{72}",1.5,a})
assert(5.0 > a)
;
checkcap({"\u{6c}\u{74}",a,5.0})
assert(a >= 10)
;
checkcap({"\u{6c}\u{65}",10,a})
assert(a <= - 10.0)
;
checkcap({"\u{6c}\u{65}",a,- 10.0})
assert(a < - 10)
;
checkcap({"\u{6c}\u{74}",a,- 10})
t=setmetatable({1,2,3},{["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function ()
return 10
end})
assert(# t == 10 and rawlen(t) == 3)
assert(rawlen("\u{61}\u{62}\u{63}") == 3)
assert(not pcall(rawlen,io.stdin))
assert(not pcall(rawlen,34))
assert(not pcall(rawlen))
assert(rawlen(string.rep("\u{61}",1000)) == 1000)
t={}
t.__lt=function (a,b,c)
collectgarbage()
assert(c == nil)
if type(a) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" then
a=a.x
end
if type(b) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" then
b=b.x
end
return a < b,"\u{64}\u{75}\u{6d}\u{6d}\u{79}"
end
t.__le=function (a,b,c)
assert(c == nil)
if type(a) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" then
a=a.x
end
if type(b) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" then
b=b.x
end
return a <= b,"\u{64}\u{75}\u{6d}\u{6d}\u{79}"
end
t.__eq=function (a,b,c)
assert(c == nil)
if type(a) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" then
a=a.x
end
if type(b) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" then
b=b.x
end
return a == b,"\u{64}\u{75}\u{6d}\u{6d}\u{79}"
end
function Op(x)
return setmetatable({["\u{78}"] = x},t)
end
local function test
(a,b,c)
assert(not (Op(1) < Op(1)) and (Op(1) < Op(2)) and not (Op(2) < Op(1)))
assert(not (1 < Op(1)) and (Op(1) < 2) and not (2 < Op(1)))
assert(not (Op("\u{61}") < Op("\u{61}")) and (Op("\u{61}") < Op("\u{62}")) and not (Op("\u{62}") < Op("\u{61}")))
assert(not ("\u{61}" < Op("\u{61}")) and (Op("\u{61}") < "\u{62}") and not (Op("\u{62}") < Op("\u{61}")))
assert((Op(1) <= Op(1)) and (Op(1) <= Op(2)) and not (Op(2) <= Op(1)))
assert((Op("\u{61}") <= Op("\u{61}")) and (Op("\u{61}") <= Op("\u{62}")) and not (Op("\u{62}") <= Op("\u{61}")))
assert(not (Op(1) > Op(1)) and not (Op(1) > Op(2)) and (Op(2) > Op(1)))
assert(not (Op("\u{61}") > Op("\u{61}")) and not (Op("\u{61}") > Op("\u{62}")) and (Op("\u{62}") > Op("\u{61}")))
assert((Op(1) >= Op(1)) and not (Op(1) >= Op(2)) and (Op(2) >= Op(1)))
assert((1 >= Op(1)) and not (1 >= Op(2)) and (Op(2) >= 1))
assert((Op("\u{61}") >= Op("\u{61}")) and not (Op("\u{61}") >= Op("\u{62}")) and (Op("\u{62}") >= Op("\u{61}")))
assert(("\u{61}" >= Op("\u{61}")) and not (Op("\u{61}") >= "\u{62}") and (Op("\u{62}") >= Op("\u{61}")))
assert(Op(1) == Op(1) and Op(1) ~= Op(2))
assert(Op("\u{61}") == Op("\u{61}") and Op("\u{61}") ~= Op("\u{62}"))
assert(a == a and a ~= b)
assert(Op(3) == c)
end
test(Op(1),Op(2),Op(3))
local function rawSet
(x)
local y = {}
for _,k in pairs(x)
do
y[k]=1
end
return y
end
local function Set
(x)
return setmetatable(rawSet(x),t)
end
t.__lt=function (a,b)
for k in pairs(a)
do
if not b[k] then
return false
end
b[k]=undef
end
return next(b) ~= nil
end
t.__le=function (a,b)
for k in pairs(a)
do
if not b[k] then
return false
end
end
return true
end
assert(Set({1,2,3}) < Set({1,2,3,4}))
assert(not (Set({1,2,3,4}) < Set({1,2,3,4})))
assert((Set({1,2,3,4}) <= Set({1,2,3,4})))
assert((Set({1,2,3,4}) >= Set({1,2,3,4})))
assert(not (Set({1,3}) <= Set({3,5})))
assert(not (Set({1,3}) <= Set({3,5})))
assert(not (Set({1,3}) >= Set({3,5})))
t.__eq=function (a,b)
for k in pairs(a)
do
if not b[k] then
return false
end
b[k]=undef
end
return next(b) == nil
end
local s = Set({1,3,5})
assert(s == Set({3,5,1}))
assert(not rawequal(s,Set({3,5,1})))
assert(rawequal(s,s))
assert(Set({1,3,5,1}) == rawSet({3,5,1}))
assert(rawSet({1,3,5,1}) == Set({3,5,1}))
assert(Set({1,3,5}) ~= Set({3,5,1,6}))
t[Set({1,3,5})]=1
assert(t[Set({1,3,5})] == undef)
do
local mt = {["\u{5f}\u{5f}\u{65}\u{71}"] = true}
local a = setmetatable({10},mt)
local b = setmetatable({10},mt)
mt.__eq=nil
assert(a ~= b)
mt.__eq=function (x,y)
return x[1] == y[1]
end
assert(a == b)
end
if not T then
(Message or print)("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{3a}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{20}\u{66}\u{6f}\u{72}\u{20}\u{75}\u{73}\u{65}\u{72}\u{64}\u{61}\u{74}\u{61}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
else
local u1 = T.newuserdata(0,1)
local u2 = T.newuserdata(0,1)
local u3 = T.newuserdata(0,1)
assert(u1 ~= u2 and u1 ~= u3)
debug.setuservalue(u1,1)
;
debug.setuservalue(u2,2)
;
debug.setuservalue(u3,1)
;
debug.setmetatable(u1,{["\u{5f}\u{5f}\u{65}\u{71}"] = function (a,b)
return debug.getuservalue(a) == debug.getuservalue(b)
end})
debug.setmetatable(u2,{["\u{5f}\u{5f}\u{65}\u{71}"] = function (a,b)
return true
end})
assert(u1 == u3 and u3 == u1 and u1 ~= u2)
assert(u2 == u1 and u2 == u3 and u3 == u2)
assert(u2 ~= {})
assert(rawequal(u1,u1) and not rawequal(u1,u3))
local mirror = {}
debug.setmetatable(u3,{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = mirror,["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = mirror})
for i = 1, 10
do
u3[i]=i
end
for i = 1, 10
do
assert(u3[i] == i)
end
end
t.__concat=function (a,b,c)
assert(c == nil)
if type(a) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" then
a=a.val
end
if type(b) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" then
b=b.val
end
if A then
return a .. b
else
return setmetatable({["\u{76}\u{61}\u{6c}"] = a .. b},t)
end
end
c={["\u{76}\u{61}\u{6c}"] = "\u{63}"}
;
setmetatable(c,t)
d={["\u{76}\u{61}\u{6c}"] = "\u{64}"}
;
setmetatable(d,t)
A=true
assert(c .. d == "\u{63}\u{64}")
assert(0 .. "\u{61}" .. "\u{62}" .. c .. d .. "\u{65}" .. "\u{66}" .. (5 + 3) .. "\u{67}" == "\u{30}\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}\u{38}\u{67}")
A=false
assert((c .. d .. c .. d).val == "\u{63}\u{64}\u{63}\u{64}")
x=c .. d
assert(getmetatable(x) == t and x.val == "\u{63}\u{64}")
x=0 .. "\u{61}" .. "\u{62}" .. c .. d .. "\u{65}" .. "\u{66}" .. "\u{67}"
assert(x.val == "\u{30}\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}\u{67}")
c={}
local x
setmetatable(c,{["\u{5f}\u{5f}\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}"] = function (a,b)
assert(type(a) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}" and b == c or type(b) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}" and a == c)
return c
end})
assert(c .. 5 == c and 5 .. c == c)
assert(4 .. c .. 5 == c and 4 .. 5 .. 6 .. 7 .. c == c)
local t1,t2,c,d
t1={}
;
c={}
;
setmetatable(c,t1)
d={}
t1.__eq=function ()
return true
end
t1.__lt=function ()
return true
end
t1.__le=function ()
return false
end
setmetatable(d,t1)
assert(c == d and c < d and not (d <= c))
t2={}
t2.__eq=t1.__eq
t2.__lt=t1.__lt
setmetatable(d,t2)
assert(c == d and c < d and not (d <= c))
local i
local tt = {["\u{5f}\u{5f}\u{63}\u{61}\u{6c}\u{6c}"] = function (t, ...)
i=i + 1
if t.f then
return t.f(...)
else
return {...}
end
end}
local a = setmetatable({},tt)
local b = setmetatable({["\u{66}"] = a},tt)
local c = setmetatable({["\u{66}"] = b},tt)
i=0
x=c(3,4,5)
assert(i == 3 and x[1] == 3 and x[3] == 5)
assert(_G.X == 20)
_G.X,_G.B=nil
print("\u{2b}")
local _g = _G
_ENV=setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (_,k)
return _g[k]
end})
a={}
rawset(a,"\u{78}",1,2,3)
assert(a.x == 1 and rawget(a,"\u{78}",3) == 1)
print("\u{2b}")
mt={["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (a,b)
return a + b
end,["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function (x)
return math.floor(x)
end}
debug.setmetatable(10,mt)
assert(getmetatable(- 2) == mt)
assert((10)[3] == 13)
assert((10)["\u{33}"] == 13)
assert(# 3.45 == 3)
debug.setmetatable(23,nil)
assert(getmetatable(- 2) == nil)
debug.setmetatable(true,mt)
assert(getmetatable(false) == mt)
mt.__index=function (a,b)
return a or b
end
assert((true)[false] == true)
assert((false)[false] == false)
debug.setmetatable(false,nil)
assert(getmetatable(true) == nil)
debug.setmetatable(nil,mt)
assert(getmetatable(nil) == mt)
mt.__add=function (a,b)
return (a or 1) + (b or 2)
end
assert(10 + nil == 12)
assert(nil + 23 == 24)
assert(nil + nil == 3)
debug.setmetatable(nil,nil)
assert(getmetatable(nil) == nil)
debug.setmetatable(nil,{})
a={}
;
setmetatable(a,a)
;
a.__index=a
;
a.__newindex=a
assert(not pcall(function (a,b)
return a[b]
end,a,10))
assert(not pcall(function (a,b,c)
a[b]=c
end,a,10,true))
T,K,V=nil
grandparent={}
grandparent.__newindex=function (t,k,v)
T=t
;
K=k
;
V=v
end
parent={}
parent.__newindex=parent
setmetatable(parent,grandparent)
child=setmetatable({},parent)
child.foo=10
assert(T == parent and K == "\u{66}\u{6f}\u{6f}" and V == 10)
print("\u{4f}\u{4b}")
return 12