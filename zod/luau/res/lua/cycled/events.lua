print("\116\101\115\116\105\110\103\32\109\101\116\97\116\97\98\108\101\115")
local debug = require("\100\101\98\117\103")
X=20
;
B=30
_ENV=setmetatable({},{["\95\95\105\110\100\101\120"] = _G})
collectgarbage()
X=X + 10
assert(X == 30 and _G.X == 20)
B=false
assert(B == false)
_ENV["\66"]=undef
assert(B == 30)
assert(getmetatable({}) == nil)
assert(getmetatable(4) == nil)
assert(getmetatable(nil) == nil)
a={["\110\97\109\101"] = "\78\65\77\69"}
;
setmetatable(a,{["\95\95\109\101\116\97\116\97\98\108\101"] = "\120\117\120\117",["\95\95\116\111\115\116\114\105\110\103"] = function (x)
return x.name
end})
assert(getmetatable(a) == "\120\117\120\117")
assert(tostring(a) == "\78\65\77\69")
assert(pcall(setmetatable,a,{}) == false)
a.name="\103\111\114\111\114\111\98\97"
assert(tostring(a) == "\103\111\114\111\114\111\98\97")
local a,t = {10,20,30,["\120"] = "\49\48",["\121"] = "\50\48"},{}
assert(setmetatable(a,t) == a)
assert(getmetatable(a) == t)
assert(setmetatable(a,nil) == a)
assert(getmetatable(a) == nil)
assert(setmetatable(a,t) == a)
function f(t,i,e)
assert(not e)
local p = rawget(t,"\112\97\114\101\110\116")
return (p and p[i] + 3),"\100\117\109\109\121\32\114\101\116\117\114\110"
end
t.__index=f
a.parent={["\122"] = 25,["\120"] = 12,[4] = 24}
assert(a[1] == 10 and a.z == 28 and a[4] == 27 and a.x == "\49\48")
collectgarbage()
a=setmetatable({},t)
function f(t,i,v)
rawset(t,i,v - 3)
end
setmetatable(t,t)
t.__newindex=f
a[1]=30
;
a.x="\49\48\49"
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
a=setmetatable({},{["\95\95\105\110\100\101\120"] = setmetatable({},{["\95\95\105\110\100\101\120"] = setmetatable({},{["\95\95\105\110\100\101\120"] = function (_,n)
return a[n - 3] + 4,"\108\105\120\111"
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
a["\97" .. i]=0
;
end
setmetatable(a,{["\95\95\110\101\119\105\110\100\101\120"] = function (t,k,v)
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
a["\97\49"]=0
;
assert(not foi)
foi=false
;
a["\97\49\49"]=0
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
local x,y = a(table.unpack({"\97",1}))
assert(x == a and y[1] == "\97" and y[2] == 1 and y[3] == undef)
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
t.__add=f("\97\100\100")
t.__sub=f("\115\117\98")
t.__mul=f("\109\117\108")
t.__div=f("\100\105\118")
t.__idiv=f("\105\100\105\118")
t.__mod=f("\109\111\100")
t.__unm=f("\117\110\109")
t.__pow=f("\112\111\119")
t.__len=f("\108\101\110")
t.__band=f("\98\97\110\100")
t.__bor=f("\98\111\114")
t.__bxor=f("\98\120\111\114")
t.__shl=f("\115\104\108")
t.__shr=f("\115\104\114")
t.__bnot=f("\98\110\111\116")
t.__lt=f("\108\116")
t.__le=f("\108\101")
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
checkcap({"\97\100\100",b,5})
assert(5.2 + b == 5.2)
;
checkcap({"\97\100\100",5.2,b})
assert(b + "\53" == b)
;
checkcap({"\97\100\100",b,"\53"})
assert(5 + b == 5)
;
checkcap({"\97\100\100",5,b})
assert("\53" + b == "\53")
;
checkcap({"\97\100\100","\53",b})
b=b - 3
;
assert(getmetatable(b) == t)
;
checkcap({"\115\117\98",b,3})
assert(5 - a == 5)
;
checkcap({"\115\117\98",5,a})
assert("\53" - a == "\53")
;
checkcap({"\115\117\98","\53",a})
assert(a * a == a)
;
checkcap({"\109\117\108",a,a})
assert(a / 0 == a)
;
checkcap({"\100\105\118",a,0})
assert(a / 0.0 == a)
;
checkcap({"\100\105\118",a,0.0})
assert(a % 2 == a)
;
checkcap({"\109\111\100",a,2})
assert(a // (1 / 0) == a)
;
checkcap({"\105\100\105\118",a,1 / 0})
;
(function ()
assert(a & "\104\105" == a)
end)()
;
checkcap({"\98\97\110\100",a,"\104\105"})
;
(function ()
assert(10 & a == 10)
end)()
;
checkcap({"\98\97\110\100",10,a})
;
(function ()
assert(a | 10 == a)
end)()
;
checkcap({"\98\111\114",a,10})
assert(a | "\104\105" == a)
;
checkcap({"\98\111\114",a,"\104\105"})
assert("\104\105" ~ a == "\104\105")
;
checkcap({"\98\120\111\114","\104\105",a})
;
(function ()
assert(10 ~ a == 10)
end)()
;
checkcap({"\98\120\111\114",10,a})
assert(- a == a)
;
checkcap({"\117\110\109",a,a})
assert(a ^ 4.0 == a)
;
checkcap({"\112\111\119",a,4.0})
assert(a ^ "\52" == a)
;
checkcap({"\112\111\119",a,"\52"})
assert(4 ^ a == 4)
;
checkcap({"\112\111\119",4,a})
assert("\52" ^ a == "\52")
;
checkcap({"\112\111\119","\52",a})
assert(# a == a)
;
checkcap({"\108\101\110",a,a})
assert(~ a == a)
;
checkcap({"\98\110\111\116",a,a})
assert(a << 3 == a)
;
checkcap({"\115\104\108",a,3})
assert(1.5 >> a == 1.5)
;
checkcap({"\115\104\114",1.5,a})
assert(5.0 > a)
;
checkcap({"\108\116",a,5.0})
assert(a >= 10)
;
checkcap({"\108\101",10,a})
assert(a <= - 10.0)
;
checkcap({"\108\101",a,- 10.0})
assert(a < - 10)
;
checkcap({"\108\116",a,- 10})
t=setmetatable({1,2,3},{["\95\95\108\101\110"] = function ()
return 10
end})
assert(# t == 10 and rawlen(t) == 3)
assert(rawlen("\97\98\99") == 3)
assert(not pcall(rawlen,io.stdin))
assert(not pcall(rawlen,34))
assert(not pcall(rawlen))
assert(rawlen(string.rep("\97",1000)) == 1000)
t={}
t.__lt=function (a,b,c)
collectgarbage()
assert(c == nil)
if type(a) == "\116\97\98\108\101" then
a=a.x
end
if type(b) == "\116\97\98\108\101" then
b=b.x
end
return a < b,"\100\117\109\109\121"
end
t.__le=function (a,b,c)
assert(c == nil)
if type(a) == "\116\97\98\108\101" then
a=a.x
end
if type(b) == "\116\97\98\108\101" then
b=b.x
end
return a <= b,"\100\117\109\109\121"
end
t.__eq=function (a,b,c)
assert(c == nil)
if type(a) == "\116\97\98\108\101" then
a=a.x
end
if type(b) == "\116\97\98\108\101" then
b=b.x
end
return a == b,"\100\117\109\109\121"
end
function Op(x)
return setmetatable({["\120"] = x},t)
end
local function test
(a,b,c)
assert(not (Op(1) < Op(1)) and (Op(1) < Op(2)) and not (Op(2) < Op(1)))
assert(not (1 < Op(1)) and (Op(1) < 2) and not (2 < Op(1)))
assert(not (Op("\97") < Op("\97")) and (Op("\97") < Op("\98")) and not (Op("\98") < Op("\97")))
assert(not ("\97" < Op("\97")) and (Op("\97") < "\98") and not (Op("\98") < Op("\97")))
assert((Op(1) <= Op(1)) and (Op(1) <= Op(2)) and not (Op(2) <= Op(1)))
assert((Op("\97") <= Op("\97")) and (Op("\97") <= Op("\98")) and not (Op("\98") <= Op("\97")))
assert(not (Op(1) > Op(1)) and not (Op(1) > Op(2)) and (Op(2) > Op(1)))
assert(not (Op("\97") > Op("\97")) and not (Op("\97") > Op("\98")) and (Op("\98") > Op("\97")))
assert((Op(1) >= Op(1)) and not (Op(1) >= Op(2)) and (Op(2) >= Op(1)))
assert((1 >= Op(1)) and not (1 >= Op(2)) and (Op(2) >= 1))
assert((Op("\97") >= Op("\97")) and not (Op("\97") >= Op("\98")) and (Op("\98") >= Op("\97")))
assert(("\97" >= Op("\97")) and not (Op("\97") >= "\98") and (Op("\98") >= Op("\97")))
assert(Op(1) == Op(1) and Op(1) ~= Op(2))
assert(Op("\97") == Op("\97") and Op("\97") ~= Op("\98"))
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
local mt = {["\95\95\101\113"] = true}
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
(Message or print)("\10\32\62\62\62\32\116\101\115\116\67\32\110\111\116\32\97\99\116\105\118\101\58\32\115\107\105\112\112\105\110\103\32\116\101\115\116\115\32\102\111\114\32\117\115\101\114\100\97\116\97\32\60\60\60\10")
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
debug.setmetatable(u1,{["\95\95\101\113"] = function (a,b)
return debug.getuservalue(a) == debug.getuservalue(b)
end})
debug.setmetatable(u2,{["\95\95\101\113"] = function (a,b)
return true
end})
assert(u1 == u3 and u3 == u1 and u1 ~= u2)
assert(u2 == u1 and u2 == u3 and u3 == u2)
assert(u2 ~= {})
assert(rawequal(u1,u1) and not rawequal(u1,u3))
local mirror = {}
debug.setmetatable(u3,{["\95\95\105\110\100\101\120"] = mirror,["\95\95\110\101\119\105\110\100\101\120"] = mirror})
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
if type(a) == "\116\97\98\108\101" then
a=a.val
end
if type(b) == "\116\97\98\108\101" then
b=b.val
end
if A then
return a .. b
else
return setmetatable({["\118\97\108"] = a .. b},t)
end
end
c={["\118\97\108"] = "\99"}
;
setmetatable(c,t)
d={["\118\97\108"] = "\100"}
;
setmetatable(d,t)
A=true
assert(c .. d == "\99\100")
assert(0 .. "\97" .. "\98" .. c .. d .. "\101" .. "\102" .. (5 + 3) .. "\103" == "\48\97\98\99\100\101\102\56\103")
A=false
assert((c .. d .. c .. d).val == "\99\100\99\100")
x=c .. d
assert(getmetatable(x) == t and x.val == "\99\100")
x=0 .. "\97" .. "\98" .. c .. d .. "\101" .. "\102" .. "\103"
assert(x.val == "\48\97\98\99\100\101\102\103")
c={}
local x
setmetatable(c,{["\95\95\99\111\110\99\97\116"] = function (a,b)
assert(type(a) == "\110\117\109\98\101\114" and b == c or type(b) == "\110\117\109\98\101\114" and a == c)
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
local tt = {["\95\95\99\97\108\108"] = function (t, ...)
i=i + 1
if t.f then
return t.f(...)
else
return {...}
end
end}
local a = setmetatable({},tt)
local b = setmetatable({["\102"] = a},tt)
local c = setmetatable({["\102"] = b},tt)
i=0
x=c(3,4,5)
assert(i == 3 and x[1] == 3 and x[3] == 5)
assert(_G.X == 20)
_G.X,_G.B=nil
print("\43")
local _g = _G
_ENV=setmetatable({},{["\95\95\105\110\100\101\120"] = function (_,k)
return _g[k]
end})
a={}
rawset(a,"\120",1,2,3)
assert(a.x == 1 and rawget(a,"\120",3) == 1)
print("\43")
mt={["\95\95\105\110\100\101\120"] = function (a,b)
return a + b
end,["\95\95\108\101\110"] = function (x)
return math.floor(x)
end}
debug.setmetatable(10,mt)
assert(getmetatable(- 2) == mt)
assert((10)[3] == 13)
assert((10)["\51"] == 13)
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
assert(T == parent and K == "\102\111\111" and V == 10)
print("\79\75")
return 12