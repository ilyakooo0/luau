print("\116\101\115\116\105\110\103\32\99\111\114\111\117\116\105\110\101\115")
local debug = require("\100\101\98\117\103")
local f
local main,ismain = coroutine.running()
assert(type(main) == "\116\104\114\101\97\100" and ismain)
assert(not coroutine.resume(main))
assert(not coroutine.isyieldable(main) and not coroutine.isyieldable())
assert(not pcall(coroutine.yield))
assert(not pcall(coroutine.resume,0))
assert(not pcall(coroutine.status,0))
local function eqtab
(t1,t2)
assert(# t1 == # t2)
for i = 1, # t1
do
local v = t1[i]
assert(t2[i] == v)
end
end
_G.x=nil
_G.f=nil
local function foo
(a, ...)
local x,y = coroutine.running()
assert(x == f and y == false)
assert(coroutine.resume(f) == false)
assert(coroutine.status(f) == "\114\117\110\110\105\110\103")
local arg = {...}
assert(coroutine.isyieldable(x))
for i = 1, # arg
do
_G.x={coroutine.yield(table.unpack(arg[i]))}
end
return table.unpack(a)
end
f=coroutine.create(foo)
assert(coroutine.isyieldable(f))
assert(type(f) == "\116\104\114\101\97\100" and coroutine.status(f) == "\115\117\115\112\101\110\100\101\100")
assert(string.find(tostring(f),"\116\104\114\101\97\100"))
local s,a,b,c,d
s,a,b,c,d=coroutine.resume(f,{1,2,3},{},{1},{"\97","\98","\99"})
assert(coroutine.isyieldable(f))
assert(s and a == nil and coroutine.status(f) == "\115\117\115\112\101\110\100\101\100")
s,a,b,c,d=coroutine.resume(f)
eqtab(_G.x,{})
assert(s and a == 1 and b == nil)
assert(coroutine.isyieldable(f))
s,a,b,c,d=coroutine.resume(f,1,2,3)
eqtab(_G.x,{1,2,3})
assert(s and a == "\97" and b == "\98" and c == "\99" and d == nil)
s,a,b,c,d=coroutine.resume(f,"\120\117\120\117")
eqtab(_G.x,{"\120\117\120\117"})
assert(s and a == 1 and b == 2 and c == 3 and d == nil)
assert(coroutine.status(f) == "\100\101\97\100")
s,a=coroutine.resume(f,"\120\117\120\117")
assert(not s and string.find(a,"\100\101\97\100") and coroutine.status(f) == "\100\101\97\100")
_G.f=nil
local function foo
(i)
return coroutine.yield(i)
end
local f = coroutine.wrap(function ()
for i = 1, 10
do
assert(foo(i) == _G.x)
end
return "\97"
end)
for i = 1, 10
do
_G.x=i
;
assert(f(i) == i)
end
_G.x="\120\117\120\117"
;
assert(f("\120\117\120\117") == "\97")
_G.x=nil
local function pf
(n,i)
coroutine.yield(n)
pf(n * i,i + 1)
end
f=coroutine.wrap(pf)
local s = 1
for i = 1, 10
do
assert(f(1,1) == s)
s=s * i
end
local function gen
(n)
return coroutine.wrap(function ()
for i = 2, n
do
coroutine.yield(i)
end
end)
end
local function filter
(p,g)
return coroutine.wrap(function ()
while 1 do
local n = g()
if n == nil then
return 
end
if math.fmod(n,p) ~= 0 then
coroutine.yield(n)
end
end
end)
end
local x = gen(80)
local a = {}
while 1 do
local n = x()
if n == nil then
break
end
table.insert(a,n)
x=filter(n,x)
end
assert(# a == 22 and a[# a] == 79)
x,a=nil
print("\116\111\45\98\101\45\99\108\111\115\101\100\32\118\97\114\105\97\98\108\101\115\32\105\110\32\99\111\114\111\117\116\105\110\101\115")
local function func2close
(f)
return setmetatable({},{["\95\95\99\108\111\115\101"] = f})
end
do
local co = coroutine.create(print)
assert(coroutine.resume(co,"\116\101\115\116\105\110\103\32\39\99\111\114\111\117\116\105\110\101\46\99\108\111\115\101\39"))
assert(coroutine.status(co) == "\100\101\97\100")
local st,msg = coroutine.close(co)
assert(st and msg == nil)
st,msg=coroutine.close(co)
assert(st and msg == nil)
local st,msg = pcall(coroutine.close,coroutine.running())
assert(not st and string.find(msg,"\114\117\110\110\105\110\103"))
local main = coroutine.running()
;
(coroutine.wrap(function ()
local st,msg = pcall(coroutine.close,main)
assert(not st and string.find(msg,"\110\111\114\109\97\108"))
end))()
do
local co
co=coroutine.create(function ()
local x <close> = func2close(function ()
coroutine.close(co)
end)
coroutine.yield(20)
end)
local st,msg = coroutine.resume(co)
assert(st and msg == 20)
st,msg=coroutine.close(co)
assert(not st and string.find(msg,"\114\117\110\110\105\110\103\32\99\111\114\111\117\116\105\110\101"))
end
local X
local co = coroutine.create(error)
local st,msg = coroutine.resume(co,100)
assert(not st and msg == 100)
st,msg=coroutine.close(co)
assert(not st and msg == 100)
st,msg=coroutine.close(co)
assert(st and msg == nil)
co=coroutine.create(function ()
local x <close> = func2close(function (self,err)
assert(err == nil)
;
X=false
end)
X=true
coroutine.yield()
end)
coroutine.resume(co)
assert(X)
assert(coroutine.close(co))
assert(not X and coroutine.status(co) == "\100\101\97\100")
local x = 0
co=coroutine.create(function ()
local y <close> = func2close(function (self,err)
assert(err == 111)
x=200
error(200)
end)
local x <close> = func2close(function (self,err)
assert(err == nil)
;
error(111)
end)
coroutine.yield()
end)
coroutine.resume(co)
assert(x == 0)
local st,msg = coroutine.close(co)
assert(st == false and coroutine.status(co) == "\100\101\97\100" and msg == 200)
assert(x == 200)
st,msg=coroutine.close(co)
assert(st and msg == nil)
end
do
local X = false
local Y = false
local function foo
()
local x <close> = func2close(function (self,err)
Y=debug.getinfo(2)
X=err
end)
error(43)
end
local co = coroutine.create(function ()
return pcall(foo)
end)
local st1,st2,err = coroutine.resume(co)
assert(st1 and not st2 and err == 43)
assert(X == 43 and Y.what == "\67")
local track = {}
local function h
(o)
local hv <close> = o
return 1
end
local function foo
()
local x <close> = func2close(function (_,msg)
track[# track + 1]=msg or false
error(20)
end)
local y <close> = func2close(function (_,msg)
track[# track + 1]=msg or false
return 1000
end)
local z <close> = func2close(function (_,msg)
track[# track + 1]=msg or false
error(10)
end)
coroutine.yield(1)
h(func2close(function (_,msg)
track[# track + 1]=msg or false
error(2)
end))
end
local co = coroutine.create(pcall)
local st,res = coroutine.resume(co,foo)
assert(st and res == 1)
local st,res1,res2 = coroutine.resume(co)
assert(coroutine.status(co) == "\100\101\97\100")
assert(st and not res1 and res2 == 20)
assert(track[1] == false and track[2] == 2 and track[3] == 10 and track[4] == 10)
end
local co = coroutine.wrap(function ()
assert(not pcall(table.sort,{1,2,3},coroutine.yield))
assert(coroutine.isyieldable())
coroutine.yield(20)
return 30
end)
assert(co() == 20)
assert(co() == 30)
local f = function (s,i)
return coroutine.yield(i)
end
local f1 = coroutine.wrap(function ()
return xpcall(pcall,function (...)
return ...
end,function ()
local s = 0
for i in f,nil,1
do
pcall(function ()
s=s + i
end)
end
error({s})
end)
end)
f1()
for i = 1, 10
do
assert(f1(i) == i)
end
local r1,r2,v = f1(nil)
assert(r1 and not r2 and v[1] == (10 + 1) * 10 / 2)
local function f
(a,b)
a=coroutine.yield(a)
;
error({a + b})
end
local function g
(x)
return x[1] * 2
end
co=coroutine.wrap(function ()
coroutine.yield(xpcall(f,g,10,20))
end)
assert(co() == 10)
local r,msg = co(100)
assert(not r and msg == 240)
do
local function f
(c)
assert(not coroutine.isyieldable())
return c .. c
end
local co = coroutine.wrap(function (c)
assert(coroutine.isyieldable())
local s = string.gsub("\97","\46",f)
return s
end)
assert(co() == "\97\97")
end
do
local X
local co = coroutine.create(function ()
coroutine.yield(10)
return 20
end)
local trace = {}
local function dotrace
(event)
trace[# trace + 1]=event
end
debug.sethook(co,dotrace,"\99\108\114")
repeat

until not coroutine.resume(co)
local correcttrace = {"\99\97\108\108","\108\105\110\101","\99\97\108\108","\114\101\116\117\114\110","\108\105\110\101","\114\101\116\117\114\110"}
assert(# trace == # correcttrace)
for k,v in pairs(trace)
do
assert(v == correcttrace[k])
end
end
function foo()
assert(debug.getinfo(1).currentline == debug.getinfo(foo).linedefined + 1)
assert(debug.getinfo(2).currentline == debug.getinfo(goo).linedefined)
coroutine.yield(3)
error(foo)
end
function goo()
foo()
end
x=coroutine.wrap(goo)
assert(x() == 3)
local a,b = pcall(x)
assert(not a and b == foo)
x=coroutine.create(goo)
a,b=coroutine.resume(x)
assert(a and b == 3)
a,b=coroutine.resume(x)
assert(not a and b == foo and coroutine.status(x) == "\100\101\97\100")
a,b=coroutine.resume(x)
assert(not a and string.find(b,"\100\101\97\100") and coroutine.status(x) == "\100\101\97\100")
goo=nil
local function all
(a,n,k)
if k == 0 then
coroutine.yield(a)
else
for i = 1, n
do
a[k]=i
all(a,n,k - 1)
end
end
end
local a = 0
for t in coroutine.wrap(function ()
all({},5,4)
end)
do
a=a + 1
end
assert(a == 5 ^ 4)
local C = {}
;
setmetatable(C,{["\95\95\109\111\100\101"] = "\107\118"})
local x = coroutine.wrap(function ()
local a = 10
local function f
()
a=a + 10
;
return a
end
while true do
a=a + 1
coroutine.yield(f)
end
end)
C[1]=x
;
local f = x()
assert(f() == 21 and x()() == 32 and x() == f)
x=nil
collectgarbage()
assert(C[1] == undef)
assert(f() == 43 and f() == 53)
local function co_func
(current_co)
assert(coroutine.running() == current_co)
assert(coroutine.resume(current_co) == false)
coroutine.yield(10,20)
assert(coroutine.resume(current_co) == false)
coroutine.yield(23)
return 10
end
local co = coroutine.create(co_func)
local a,b,c = coroutine.resume(co,co)
assert(a == true and b == 10 and c == 20)
a,b=coroutine.resume(co,co)
assert(a == true and b == 23)
a,b=coroutine.resume(co,co)
assert(a == true and b == 10)
assert(coroutine.resume(co,co) == false)
assert(coroutine.resume(co,co) == false)
do
local A = coroutine.running()
local B = coroutine.create(function ()
return coroutine.resume(A)
end)
local st,res = coroutine.resume(B)
assert(st == true and res == false)
local X = false
A=coroutine.wrap(function ()
local _ <close> = func2close(function ()
X=true
end)
return pcall(A,1)
end)
st,res=A()
assert(not st and string.find(res,"\110\111\110\37\45\115\117\115\112\101\110\100\101\100") and X == true)
end
do
local co
co=coroutine.wrap(function ()
local x <close> = func2close(function ()
return pcall(co)
end)
error(111)
end)
local st,errobj = pcall(co)
assert(not st and errobj == 111)
st,errobj=pcall(co)
assert(not st and string.find(errobj,"\100\101\97\100\32\99\111\114\111\117\116\105\110\101"))
end
local co1,co2
co1=coroutine.create(function ()
return co2()
end)
co2=coroutine.wrap(function ()
assert(coroutine.status(co1) == "\110\111\114\109\97\108")
assert(not coroutine.resume(co1))
coroutine.yield(3)
end)
a,b=coroutine.resume(co1)
assert(a and b == 3)
assert(coroutine.status(co1) == "\100\101\97\100")
a=function (a)
coroutine.wrap(a)(a)
end
assert(not pcall(a,a))
a=nil
local x = coroutine.create(function ()
local a = 10
_G.F=function ()
a=a + 1
;
return a
end
error("\120")
end)
assert(not coroutine.resume(x))
assert(not coroutine.resume(x,1,1,1,1,1,1,1))
assert(_G.F() == 11)
assert(_G.F() == 12)
_G.F=nil
if not T then
(Message or print)("\10\32\62\62\62\32\116\101\115\116\67\32\110\111\116\32\97\99\116\105\118\101\58\32\115\107\105\112\112\105\110\103\32\99\111\114\111\117\116\105\110\101\32\65\80\73\32\116\101\115\116\115\32\60\60\60\10")
else
print("\116\101\115\116\105\110\103\32\121\105\101\108\100\115\32\105\110\115\105\100\101\32\104\111\111\107\115")
local turn
local function fact
(t,x)
assert(turn == t)
if x == 0 then
return 1
else
return x * fact(t,x - 1)
end
end
local A,B = 0,0
local x = coroutine.create(function ()
T.sethook("\121\105\101\108\100\32\48","",2)
A=fact("\65",6)
end)
local y = coroutine.create(function ()
T.sethook("\121\105\101\108\100\32\48","",3)
B=fact("\66",7)
end)
while A == 0 or B == 0 do
if A == 0 then
turn="\65"
;
assert(T.resume(x))
end
if B == 0 then
turn="\66"
;
assert(T.resume(y))
end
debug.traceback(x)
debug.traceback(y)
end
assert(B // A == 7)
do
local done
local function test
(n)
done=false
return coroutine.wrap(function ()
local a = {}
for i = 1, n
do
a[i]=i
end
T.sethook("\112\117\115\104\105\110\116\32\49\48\59\32\121\105\101\108\100\32\48","",1)
local a1 = {table.unpack(a)}
assert(# a1 == n)
for i = 1, n
do
assert(a[i] == i)
end
done=true
end)
end
local co = test(0)
;
while not done do
co(30)
end
co=test(1)
;
while not done do
co(20,10)
end
co=test(3)
;
while not done do
co()
end
co=test(100)
;
while not done do
co()
end
end
local line = debug.getinfo(1,"\108").currentline + 2
local function foo
()
local x = 10
x=x + 10
_G.XX=x
end
local co = coroutine.wrap(function ()
T.sethook("\115\101\116\103\108\111\98\97\108\32\88\59\32\121\105\101\108\100\32\48","\108",0)
;
foo()
;
return 10
end)
_G.XX=nil
;
_G.X=nil
;
co()
;
assert(_G.X == line)
_G.X=nil
;
co()
;
assert(_G.X == line + 1)
_G.X=nil
;
co()
;
assert(_G.X == line + 2 and _G.XX == nil)
_G.X=nil
;
co()
;
assert(_G.X == line + 3 and _G.XX == 20)
assert(co() == 10)
_G.X=nil
co=coroutine.wrap(function ()
T.sethook("\121\105\101\108\100\32\48","",1)
;
foo()
;
return 10
end)
_G.XX=nil
;
local c = 0
repeat
c=c + 1
;
local a = co()
until a == 10
assert(_G.XX == 20 and c >= 5)
co=coroutine.wrap(function ()
T.sethook("\121\105\101\108\100\32\48","",2)
;
foo()
;
return 10
end)
_G.XX=nil
;
local c = 0
repeat
c=c + 1
;
local a = co()
until a == 10
assert(_G.XX == 20 and c >= 5)
_G.X=nil
;
_G.XX=nil
do
c=coroutine.create(function (a, ...)
T.sethook("\121\105\101\108\100\32\48","\108")
local b = a
return ...
end)
assert(coroutine.resume(c,1,2,3))
local n,v = debug.getlocal(c,0,1)
assert(n == "\97" and v == 1 and debug.getlocal(c,0,2) ~= "\98")
assert(debug.setlocal(c,0,1,10))
local t = debug.getinfo(c,0)
assert(t.currentline == t.linedefined + 2)
assert(not debug.getinfo(c,1))
assert(coroutine.resume(c))
local n,v = debug.getlocal(c,0,2)
assert(n == "\98" and v == 10)
v={coroutine.resume(c)}
assert(v[1] == true and v[2] == 2 and v[3] == 3 and v[4] == undef)
assert(not coroutine.resume(c))
end
do
local c = coroutine.create(function ()
T.testC("\121\105\101\108\100\32\49",10,20)
end)
local a,b = coroutine.resume(c)
assert(a and b == 20)
assert(debug.getinfo(c,0).linedefined == - 1)
a,b=debug.getlocal(c,0,2)
assert(b == 10)
end
print("\116\101\115\116\105\110\103\32\99\111\114\111\117\116\105\110\101\32\65\80\73")
assert(T.testC("\32\32\32\32\110\101\119\116\104\114\101\97\100\32\32\32\32\32\32\35\32\99\114\101\97\116\101\32\116\104\114\101\97\100\10\32\32\32\32\112\117\115\104\118\97\108\117\101\32\50\32\32\32\32\35\32\112\117\115\104\32\98\111\100\121\10\32\32\32\32\112\117\115\104\115\116\114\105\110\103\32\39\97\32\97\32\97\39\32\32\35\32\112\117\115\104\32\97\114\103\117\109\101\110\116\10\32\32\32\32\120\109\111\118\101\32\48\32\51\32\50\32\32\32\35\32\109\111\118\101\32\118\97\108\117\101\115\32\116\111\32\110\101\119\32\116\104\114\101\97\100\10\32\32\32\32\114\101\115\117\109\101\32\45\49\44\32\49\32\32\32\32\35\32\99\97\108\108\32\105\116\32\102\105\114\115\116\32\116\105\109\101\10\32\32\32\32\112\117\115\104\115\116\97\116\117\115\10\32\32\32\32\120\109\111\118\101\32\51\32\48\32\48\32\32\32\35\32\109\111\118\101\32\114\101\115\117\108\116\115\32\98\97\99\107\32\116\111\32\115\116\97\99\107\10\32\32\32\32\115\101\116\103\108\111\98\97\108\32\88\32\32\32\32\35\32\114\101\115\117\108\116\10\32\32\32\32\115\101\116\103\108\111\98\97\108\32\89\32\32\32\32\35\32\115\116\97\116\117\115\10\32\32\32\32\112\117\115\104\118\97\108\117\101\32\50\32\32\32\32\32\35\32\112\117\115\104\32\98\111\100\121\32\40\116\111\32\99\97\108\108\32\105\116\32\97\103\97\105\110\41\10\32\32\32\32\112\117\115\104\115\116\114\105\110\103\32\39\98\32\98\32\98\39\10\32\32\32\32\120\109\111\118\101\32\48\32\51\32\50\10\32\32\32\32\114\101\115\117\109\101\32\45\49\44\32\49\32\32\32\32\35\32\99\97\108\108\32\105\116\32\97\103\97\105\110\10\32\32\32\32\112\117\115\104\115\116\97\116\117\115\10\32\32\32\32\120\109\111\118\101\32\51\32\48\32\48\10\32\32\32\32\114\101\116\117\114\110\32\49\32\32\32\32\32\32\32\32\35\32\114\101\116\117\114\110\32\114\101\115\117\108\116\10\32\32",function (...)
return ...
end) == "\98\32\98\32\98")
assert(X == "\97\32\97\32\97" and Y == "\79\75")
X,Y=nil
C=coroutine.create(function ()
return T.testC("\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\112\117\115\104\110\117\109\32\49\48\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\112\117\115\104\110\117\109\32\50\48\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\114\101\115\117\109\101\32\45\51\32\50\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\112\117\115\104\115\116\97\116\117\115\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\103\101\116\116\111\112\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\114\101\116\117\114\110\32\51",C)
end)
local a,b,c,d = coroutine.resume(C)
assert(a == true and string.find(b,"\110\111\110\37\45\115\117\115\112\101\110\100\101\100") and c == "\69\82\82\82\85\78" and d == 4)
a,b,c,d=T.testC("\32\32\32\32\114\97\119\103\101\116\105\32\82\32\49\32\32\32\32\35\32\103\101\116\32\109\97\105\110\32\116\104\114\101\97\100\10\32\32\32\32\112\117\115\104\110\117\109\32\49\48\59\10\32\32\32\32\112\117\115\104\110\117\109\32\50\48\59\10\32\32\32\32\114\101\115\117\109\101\32\45\51\32\50\59\10\32\32\32\32\112\117\115\104\115\116\97\116\117\115\10\32\32\32\32\103\101\116\116\111\112\59\10\32\32\32\32\114\101\116\117\114\110\32\52")
assert(a == coroutine.running() and string.find(b,"\110\111\110\37\45\115\117\115\112\101\110\100\101\100") and c == "\69\82\82\82\85\78" and d == 4)
local state = T.newstate()
assert(T.testC(state,"\110\101\119\116\104\114\101\97\100\59\32\105\115\121\105\101\108\100\97\98\108\101\32\45\49\59\32\114\101\109\111\118\101\32\49\59\32\114\101\116\117\114\110\32\49"))
assert(not T.testC(state,"\114\97\119\103\101\116\105\32\82\32\49\59\32\105\115\121\105\101\108\100\97\98\108\101\32\45\49\59\32\114\101\109\111\118\101\32\49\59\32\114\101\116\117\114\110\32\49"))
T.testC(state,"\115\101\116\116\111\112\32\48")
T.loadlib(state)
assert(T.doremote(state,"\32\32\32\32\99\111\114\111\117\116\105\110\101\32\61\32\114\101\113\117\105\114\101\39\99\111\114\111\117\116\105\110\101\39\59\10\32\32\32\32\88\32\61\32\102\117\110\99\116\105\111\110\32\40\120\41\32\99\111\114\111\117\116\105\110\101\46\121\105\101\108\100\40\120\44\32\39\66\66\39\41\59\32\114\101\116\117\114\110\32\39\67\67\39\32\101\110\100\59\10\32\32\32\32\114\101\116\117\114\110\32\39\111\107\39"))
local t = table.pack(T.testC(state,"\32\32\32\32\114\97\119\103\101\116\105\32\82\32\49\32\32\32\32\32\35\32\103\101\116\32\109\97\105\110\32\116\104\114\101\97\100\10\32\32\32\32\112\117\115\104\115\116\114\105\110\103\32\39\88\88\39\10\32\32\32\32\103\101\116\103\108\111\98\97\108\32\88\32\32\32\32\35\32\103\101\116\32\102\117\110\99\116\105\111\110\32\102\111\114\32\98\111\100\121\10\32\32\32\32\112\117\115\104\115\116\114\105\110\103\32\65\65\32\32\32\32\32\32\35\32\97\114\103\10\32\32\32\32\114\101\115\117\109\101\32\49\32\49\32\32\32\32\32\32\35\32\39\114\101\115\117\109\101\39\32\115\104\97\100\111\119\115\32\112\114\101\118\105\111\117\115\32\115\116\97\99\107\33\10\32\32\32\32\103\101\116\116\111\112\10\32\32\32\32\115\101\116\103\108\111\98\97\108\32\84\32\32\32\32\35\32\116\111\112\10\32\32\32\32\115\101\116\103\108\111\98\97\108\32\66\32\32\32\32\35\32\115\101\99\111\110\100\32\121\105\101\108\100\101\100\32\118\97\108\117\101\10\32\32\32\32\115\101\116\103\108\111\98\97\108\32\65\32\32\32\32\35\32\102\105\115\116\32\121\105\101\108\100\101\100\32\118\97\108\117\101\10\32\32\32\32\114\97\119\103\101\116\105\32\82\32\49\32\32\32\32\32\35\32\103\101\116\32\109\97\105\110\32\116\104\114\101\97\100\10\32\32\32\32\112\117\115\104\110\117\109\32\53\32\32\32\32\32\32\32\35\32\97\114\103\32\40\110\111\105\115\101\41\10\32\32\32\32\114\101\115\117\109\101\32\49\32\49\32\32\32\32\32\32\35\32\97\102\116\101\114\32\99\111\114\111\117\116\105\110\101\32\101\110\100\115\44\32\112\114\101\118\105\111\117\115\32\115\116\97\99\107\32\105\115\32\98\97\99\107\10\32\32\32\32\112\117\115\104\115\116\97\116\117\115\10\32\32\32\32\114\101\116\117\114\110\32\42\10\32\32"))
assert(t.n == 4 and t[2] == "\88\88" and t[3] == "\67\67" and t[4] == "\79\75")
assert(T.doremote(state,"\114\101\116\117\114\110\32\84") == "\50")
assert(T.doremote(state,"\114\101\116\117\114\110\32\65") == "\65\65")
assert(T.doremote(state,"\114\101\116\117\114\110\32\66") == "\66\66")
T.closestate(state)
print("\43")
end
_G.TO_SURVIVE=coroutine.wrap(function ()
local a = 10
local x = function ()
a=a + 1
end
coroutine.yield()
end)
_G.TO_SURVIVE()
if not _soft then
local lim = 1000000
local t = {lim - 10,lim - 5,lim - 1,lim,lim + 1,lim + 5}
for i = 1, # t
do
local j = t[i]
local co = coroutine.create(function ()
return table.unpack({},1,j)
end)
local r,msg = coroutine.resume(co)
assert(j < lim or not r)
end
end
assert(coroutine.running() == main)
print("\43")
print("\116\101\115\116\105\110\103\32\121\105\101\108\100\115\32\105\110\115\105\100\101\32\109\101\116\97\109\101\116\104\111\100\115")
local function val
(x)
if type(x) == "\116\97\98\108\101" then
return x.x
else
return x
end
end
local mt = {["\95\95\101\113"] = function (a,b)
coroutine.yield(nil,"\101\113")
;
return val(a) == val(b)
end,["\95\95\108\116"] = function (a,b)
coroutine.yield(nil,"\108\116")
;
return val(a) < val(b)
end,["\95\95\108\101"] = function (a,b)
coroutine.yield(nil,"\108\101")
;
return a - b <= 0
end,["\95\95\97\100\100"] = function (a,b)
coroutine.yield(nil,"\97\100\100")
;
return val(a) + val(b)
end,["\95\95\115\117\98"] = function (a,b)
coroutine.yield(nil,"\115\117\98")
;
return val(a) - val(b)
end,["\95\95\109\117\108"] = function (a,b)
coroutine.yield(nil,"\109\117\108")
;
return val(a) * val(b)
end,["\95\95\100\105\118"] = function (a,b)
coroutine.yield(nil,"\100\105\118")
;
return val(a) / val(b)
end,["\95\95\105\100\105\118"] = function (a,b)
coroutine.yield(nil,"\105\100\105\118")
;
return val(a) // val(b)
end,["\95\95\112\111\119"] = function (a,b)
coroutine.yield(nil,"\112\111\119")
;
return val(a) ^ val(b)
end,["\95\95\109\111\100"] = function (a,b)
coroutine.yield(nil,"\109\111\100")
;
return val(a) % val(b)
end,["\95\95\117\110\109"] = function (a,b)
coroutine.yield(nil,"\117\110\109")
;
return - val(a)
end,["\95\95\98\110\111\116"] = function (a,b)
coroutine.yield(nil,"\98\110\111\116")
;
return ~ val(a)
end,["\95\95\115\104\108"] = function (a,b)
coroutine.yield(nil,"\115\104\108")
;
return val(a) << val(b)
end,["\95\95\115\104\114"] = function (a,b)
coroutine.yield(nil,"\115\104\114")
;
return val(a) >> val(b)
end,["\95\95\98\97\110\100"] = function (a,b)
coroutine.yield(nil,"\98\97\110\100")
return val(a) & val(b)
end,["\95\95\98\111\114"] = function (a,b)
coroutine.yield(nil,"\98\111\114")
;
return val(a) | val(b)
end,["\95\95\98\120\111\114"] = function (a,b)
coroutine.yield(nil,"\98\120\111\114")
;
return val(a) ~ val(b)
end,["\95\95\99\111\110\99\97\116"] = function (a,b)
coroutine.yield(nil,"\99\111\110\99\97\116")
;
return val(a) .. val(b)
end,["\95\95\105\110\100\101\120"] = function (t,k)
coroutine.yield(nil,"\105\100\120")
;
return t.k[k]
end,["\95\95\110\101\119\105\110\100\101\120"] = function (t,k,v)
coroutine.yield(nil,"\110\105\100\120")
;
t.k[k]=v
end}
local function new
(x)
return setmetatable({["\120"] = x,["\107"] = {}},mt)
end
local a = new(10)
local b = new(12)
local c = new("\104\101\108\108\111")
local function run
(f,t)
local i = 1
local c = coroutine.wrap(f)
while true do
local res,stat = c()
if res then
assert(t[i] == undef)
;
return res,t
end
assert(stat == t[i])
i=i + 1
end
end
assert(run(function ()
if (a >= b) then
return "\62\61"
else
return "\60"
end
end,{"\108\101","\115\117\98"}) == "\60")
assert(run(function ()
if (a <= b) then
return "\60\61"
else
return "\62"
end
end,{"\108\101","\115\117\98"}) == "\60\61")
assert(run(function ()
if (a == b) then
return "\61\61"
else
return "\126\61"
end
end,{"\101\113"}) == "\126\61")
assert(run(function ()
return a & b + a
end,{"\97\100\100","\98\97\110\100"}) == 2)
assert(run(function ()
return 1 + a
end,{"\97\100\100"}) == 11)
assert(run(function ()
return a - 25
end,{"\115\117\98"}) == - 15)
assert(run(function ()
return 2 * a
end,{"\109\117\108"}) == 20)
assert(run(function ()
return a ^ 2
end,{"\112\111\119"}) == 100)
assert(run(function ()
return a / 2
end,{"\100\105\118"}) == 5)
assert(run(function ()
return a % 6
end,{"\109\111\100"}) == 4)
assert(run(function ()
return a // 3
end,{"\105\100\105\118"}) == 3)
assert(run(function ()
return a + b
end,{"\97\100\100"}) == 22)
assert(run(function ()
return a - b
end,{"\115\117\98"}) == - 2)
assert(run(function ()
return a * b
end,{"\109\117\108"}) == 120)
assert(run(function ()
return a ^ b
end,{"\112\111\119"}) == 10 ^ 12)
assert(run(function ()
return a / b
end,{"\100\105\118"}) == 10 / 12)
assert(run(function ()
return a % b
end,{"\109\111\100"}) == 10)
assert(run(function ()
return a // b
end,{"\105\100\105\118"}) == 0)
local a1000 = new(1000)
assert(run(function ()
return a1000 + 1000
end,{"\97\100\100"}) == 2000)
assert(run(function ()
return a1000 - 25000
end,{"\115\117\98"}) == - 24000)
assert(run(function ()
return 2000 * a
end,{"\109\117\108"}) == 20000)
assert(run(function ()
return a1000 / 1000
end,{"\100\105\118"}) == 1)
assert(run(function ()
return a1000 % 600
end,{"\109\111\100"}) == 400)
assert(run(function ()
return a1000 // 500
end,{"\105\100\105\118"}) == 2)
assert(run(function ()
return a % b
end,{"\109\111\100"}) == 10)
assert(run(function ()
return ~ a & b
end,{"\98\110\111\116","\98\97\110\100"}) == ~ 10 & 12)
assert(run(function ()
return a | b
end,{"\98\111\114"}) == 10 | 12)
assert(run(function ()
return a ~ b
end,{"\98\120\111\114"}) == 10 ~ 12)
assert(run(function ()
return a << b
end,{"\115\104\108"}) == 10 << 12)
assert(run(function ()
return a >> b
end,{"\115\104\114"}) == 10 >> 12)
assert(run(function ()
return 10 & b
end,{"\98\97\110\100"}) == 10 & 12)
assert(run(function ()
return a | 2
end,{"\98\111\114"}) == 10 | 2)
assert(run(function ()
return a ~ 2
end,{"\98\120\111\114"}) == 10 ~ 2)
assert(run(function ()
return a >> 2
end,{"\115\104\114"}) == 10 >> 2)
assert(run(function ()
return 1 >> a
end,{"\115\104\114"}) == 1 >> 10)
assert(run(function ()
return a << 2
end,{"\115\104\108"}) == 10 << 2)
assert(run(function ()
return 1 << a
end,{"\115\104\108"}) == 1 << 10)
assert(run(function ()
return 2 ~ a
end,{"\98\120\111\114"}) == 2 ~ 10)
assert(run(function ()
return a .. b
end,{"\99\111\110\99\97\116"}) == "\49\48\49\50")
assert(run(function ()
return a .. b .. c .. a
end,{"\99\111\110\99\97\116","\99\111\110\99\97\116","\99\111\110\99\97\116"}) == "\49\48\49\50\104\101\108\108\111\49\48")
assert(run(function ()
return "\97" .. "\98" .. a .. "\99" .. c .. b .. "\120"
end,{"\99\111\110\99\97\116","\99\111\110\99\97\116","\99\111\110\99\97\116"}) == "\97\98\49\48\99\104\101\108\108\111\49\50\120")
do
local mt1 = {["\95\95\108\101"] = function (a,b)
coroutine.yield(10)
return (val(a) <= val(b))
end,["\95\95\108\116"] = function (a,b)
coroutine.yield(10)
return val(a) < val(b)
end}
local mt2 = {["\95\95\108\116"] = mt1.__lt,["\95\95\108\101"] = mt1.__le}
local function run
(f)
local co = coroutine.wrap(f)
local res
repeat
res=co()
until res ~= 10
return res
end
local function test
()
local a1 = setmetatable({["\120"] = 1},mt1)
local a2 = setmetatable({["\120"] = 2},mt2)
assert(a1 < a2)
assert(a1 <= a2)
assert(1 < a2)
assert(1 <= a2)
assert(2 > a1)
assert(2 >= a2)
return true
end
run(test)
end
assert(run(function ()
a.BB=print
return a.BB
end,{"\110\105\100\120","\105\100\120"}) == print)
do
local _ENV = _ENV
f=function ()
AAA=BBB + 1
;
return AAA
end
end
local g = new(10)
;
g.k.BBB=10
;
debug.setupvalue(f,1,g)
assert(run(f,{"\105\100\120","\110\105\100\120","\105\100\120"}) == 11)
assert(g.k.AAA == 11)
print("\43")
print("\116\101\115\116\105\110\103\32\121\105\101\108\100\115\32\105\110\115\105\100\101\32\39\102\111\114\39\32\105\116\101\114\97\116\111\114\115")
local f = function (s,i)
if i % 2 == 0 then
coroutine.yield(nil,"\102\111\114")
end
if i < s then
return i + 1
end
end
assert(run(function ()
local s = 0
for i in f,4,0
do
s=s + i
end
return s
end,{"\102\111\114","\102\111\114","\102\111\114"}) == 10)
if T == nil then
(Message or print)("\10\32\62\62\62\32\116\101\115\116\67\32\110\111\116\32\97\99\116\105\118\101\58\32\115\107\105\112\112\105\110\103\32\99\111\114\111\117\116\105\110\101\32\65\80\73\32\116\101\115\116\115\32\60\60\60\10")
print("\79\75")
;
return 
end
print("\116\101\115\116\105\110\103\32\99\111\114\111\117\116\105\110\101\32\65\80\73")
local function apico
(...)
local x = {...}
return coroutine.wrap(function ()
return T.testC(table.unpack(x))
end)
end
local a = {apico("\32\32\112\117\115\104\115\116\114\105\110\103\32\101\114\114\111\114\99\111\100\101\10\32\32\112\99\97\108\108\107\32\49\32\48\32\50\59\10\32\32\105\110\118\97\108\105\100\32\99\111\109\109\97\110\100\32\40\115\104\111\117\108\100\32\110\111\116\32\97\114\114\105\118\101\32\104\101\114\101\41\10","\114\101\116\117\114\110\32\42","\115\116\97\99\107\109\97\114\107",error)()}
assert(# a == 4 and a[3] == "\115\116\97\99\107\109\97\114\107" and a[4] == "\101\114\114\111\114\99\111\100\101" and _G.status == "\69\82\82\82\85\78" and _G.ctx == 2)
local co = apico("\112\117\115\104\118\97\108\117\101\32\50\59\32\112\117\115\104\110\117\109\32\49\48\59\32\112\99\97\108\108\107\32\49\32\50\32\51\59\32\105\110\118\97\108\105\100\32\99\111\109\109\97\110\100\59",coroutine.yield,"\103\101\116\103\108\111\98\97\108\32\115\116\97\116\117\115\59\32\103\101\116\103\108\111\98\97\108\32\99\116\120\59\32\112\117\115\104\118\97\108\117\101\32\50\59\32\112\117\115\104\115\116\114\105\110\103\32\97\59\32\112\99\97\108\108\107\32\49\32\48\32\52\59\32\105\110\118\97\108\105\100\32\99\111\109\109\97\110\100","\103\101\116\103\108\111\98\97\108\32\115\116\97\116\117\115\59\32\103\101\116\103\108\111\98\97\108\32\99\116\120\59\32\114\101\116\117\114\110\32\42")
assert(co() == 10)
assert(co(20,30) == "\97")
a={co()}
assert(# a == 10 and a[2] == coroutine.yield and a[5] == 20 and a[6] == 30 and a[7] == "\89\73\69\76\68" and a[8] == 3 and a[9] == "\89\73\69\76\68" and a[10] == 4)
assert(not pcall(co))
f=T.makeCfunc("\112\117\115\104\110\117\109\32\51\59\32\112\117\115\104\110\117\109\32\53\59\32\121\105\101\108\100\32\49\59")
co=coroutine.wrap(function ()
assert(f() == 23)
;
assert(f() == 23)
;
return 10
end)
assert(co(23,16) == 5)
assert(co(23,16) == 5)
assert(co(23,16) == 10)
f=T.makeCfunc("\32\32\32\32\32\32\32\32\112\117\115\104\110\117\109\32\49\48\50\10\9\121\105\101\108\100\107\9\49\32\85\50\10\9\99\97\110\110\111\116\32\98\101\32\104\101\114\101\33\10","\32\32\32\32\32\32\35\32\99\111\110\116\105\110\117\97\116\105\111\110\10\9\112\117\115\104\118\97\108\117\101\32\85\51\32\32\32\35\32\97\99\99\101\115\115\105\110\103\32\117\112\118\97\108\117\101\115\32\105\110\115\105\100\101\32\97\32\99\111\110\116\105\110\117\97\116\105\111\110\10\32\32\32\32\32\32\32\32\112\117\115\104\118\97\108\117\101\32\85\52\10\9\114\101\116\117\114\110\32\42\10",23,"\104\117\117")
x=coroutine.wrap(f)
assert(x() == 102)
eqtab({x()},{23,"\104\117\117"})
f=T.makeCfunc("\112\117\115\104\115\116\114\105\110\103\32\39\97\39\59\32\112\117\115\104\110\117\109\32\49\48\50\59\32\121\105\101\108\100\32\50\59\32")
a,b,c,d=T.testC("\110\101\119\116\104\114\101\97\100\59\32\112\117\115\104\118\97\108\117\101\32\50\59\32\120\109\111\118\101\32\48\32\51\32\49\59\32\114\101\115\117\109\101\32\51\32\48\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\112\117\115\104\115\116\97\116\117\115\59\32\120\109\111\118\101\32\51\32\48\32\48\59\32\32\114\101\115\117\109\101\32\51\32\48\59\32\112\117\115\104\115\116\97\116\117\115\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\114\101\116\117\114\110\32\52\59\32",f)
assert(a == "\89\73\69\76\68" and b == "\97" and c == 102 and d == "\79\75")
local count = 3
f=T.makeCfunc("\32\32\114\101\109\111\118\101\32\49\59\32\32\32\32\32\32\32\32\32\32\32\32\32\35\32\114\101\109\111\118\101\32\97\114\103\117\109\101\110\116\10\32\32\112\117\115\104\118\97\108\117\101\32\85\51\59\32\32\32\32\32\32\32\32\32\35\32\103\101\116\32\115\101\108\101\99\116\105\111\110\32\102\117\110\99\116\105\111\110\10\32\32\99\97\108\108\32\48\32\49\59\32\32\32\32\32\32\32\32\32\32\32\32\32\35\32\99\97\108\108\32\105\116\32\32\40\114\101\115\117\108\116\32\105\115\32\39\102\39\32\111\114\32\39\121\105\101\108\100\39\41\10\32\32\112\117\115\104\115\116\114\105\110\103\32\104\101\108\108\111\32\32\32\32\32\32\35\32\115\105\110\103\108\101\32\97\114\103\117\109\101\110\116\32\102\111\114\32\115\101\108\101\99\116\101\100\32\102\117\110\99\116\105\111\110\10\32\32\112\117\115\104\117\112\118\97\108\117\101\105\110\100\101\120\32\50\59\32\32\32\35\32\105\110\100\101\120\32\111\102\32\99\111\110\116\105\110\117\97\116\105\111\110\32\112\114\111\103\114\97\109\10\32\32\99\97\108\108\107\32\49\32\45\49\32\46\59\9\9\35\32\99\97\108\108\32\115\101\108\101\99\116\101\100\32\102\117\110\99\116\105\111\110\10\32\32\101\114\114\111\114\101\114\114\111\114\9\9\35\32\115\104\111\117\108\100\32\110\101\118\101\114\32\97\114\114\105\118\101\32\104\101\114\101\10","\32\32\35\32\99\111\110\116\105\110\117\97\116\105\111\110\32\112\114\111\103\114\97\109\10\32\32\112\117\115\104\110\117\109\32\51\52\9\35\32\114\101\116\117\114\110\32\118\97\108\117\101\10\32\32\114\101\116\117\114\110\32\42\32\32\32\32\32\35\32\114\101\116\117\114\110\32\97\108\108\32\114\101\115\117\108\116\115\10",function ()
count=count - 1
if count == 0 then
return coroutine.yield
else
return f
end
end)
co=coroutine.wrap(function ()
return f(nil)
end)
assert(co() == "\104\101\108\108\111")
a={co()}
assert(# a == 3 and a[1] == a[2] and a[2] == a[3] and a[3] == 34)
local y
co=coroutine.wrap(function (...)
return T.testC("\32\35\32\105\110\105\116\105\97\108\32\102\117\110\99\116\105\111\110\10\32\32\32\32\32\32\32\32\32\32\121\105\101\108\100\107\32\49\32\50\10\32\32\32\32\32\32\32\32\32\32\99\97\110\110\111\116\32\98\101\32\104\101\114\101\33\10\32\32\32\32\32\32\32","\32\32\35\32\49\115\116\32\99\111\110\116\105\110\117\97\116\105\111\110\10\32\32\32\32\32\32\32\32\32\121\105\101\108\100\107\32\48\32\51\32\10\32\32\32\32\32\32\32\32\32\99\97\110\110\111\116\32\98\101\32\104\101\114\101\33\10\32\32\32\32\32\32\32","\32\32\35\32\50\110\100\32\99\111\110\116\105\110\117\97\116\105\111\110\10\32\32\32\32\32\32\32\32\32\121\105\101\108\100\107\32\48\32\52\32\10\32\32\32\32\32\32\32\32\32\99\97\110\110\111\116\32\98\101\32\104\101\114\101\33\10\32\32\32\32\32\32\32","\32\32\35\32\51\116\104\32\99\111\110\116\105\110\117\97\116\105\111\110\10\32\32\32\32\32\32\32\32\32\32\112\117\115\104\118\97\108\117\101\32\54\32\32\32\35\32\102\117\110\99\116\105\111\110\32\119\104\105\99\104\32\105\115\32\108\97\115\116\32\97\114\103\46\32\116\111\32\39\116\101\115\116\67\39\32\104\101\114\101\10\32\32\32\32\32\32\32\32\32\32\112\117\115\104\110\117\109\32\49\48\59\32\112\117\115\104\110\117\109\32\50\48\59\10\32\32\32\32\32\32\32\32\32\32\112\99\97\108\108\32\50\32\48\32\48\32\32\32\35\32\99\97\108\108\32\115\104\111\117\108\100\32\116\104\114\111\119\32\97\110\32\101\114\114\111\114\32\97\110\100\32\114\101\116\117\114\110\32\116\111\32\110\101\120\116\32\108\105\110\101\10\32\32\32\32\32\32\32\32\32\32\112\111\112\32\49\9\9\35\32\114\101\109\111\118\101\32\101\114\114\111\114\32\109\101\115\115\97\103\101\10\32\32\32\32\32\32\32\32\32\32\112\117\115\104\118\97\108\117\101\32\54\10\32\32\32\32\32\32\32\32\32\32\103\101\116\103\108\111\98\97\108\32\115\116\97\116\117\115\59\32\103\101\116\103\108\111\98\97\108\32\99\116\120\10\32\32\32\32\32\32\32\32\32\32\112\99\97\108\108\107\32\50\32\50\32\53\32\32\35\32\99\97\108\108\32\115\104\111\117\108\100\32\116\104\114\111\119\32\97\110\32\101\114\114\111\114\32\97\110\100\32\106\117\109\112\32\116\111\32\99\111\110\116\105\110\117\97\116\105\111\110\10\32\32\32\32\32\32\32\32\32\32\99\97\110\110\111\116\32\98\101\32\104\101\114\101\33\10\32\32\32\32\32\32\32","\32\32\35\32\52\116\104\32\40\97\110\100\32\108\97\115\116\41\32\99\111\110\116\105\110\117\97\116\105\111\110\10\32\32\32\32\32\32\32\32\32\114\101\116\117\114\110\32\42\10\32\32\32\32\32\32\32",function (a,b)
x=a
;
y=b
;
error("\101\114\114\109\115\103")
end,...)
end)
local a = {co(3,4,6)}
assert(a[1] == 6 and a[2] == undef)
a={co()}
;
assert(a[1] == undef and _G.status == "\89\73\69\76\68" and _G.ctx == 2)
a={co()}
;
assert(a[1] == undef and _G.status == "\89\73\69\76\68" and _G.ctx == 3)
a={co(7,8)}
;
assert(type(a[1]) == "\115\116\114\105\110\103" and type(a[2]) == "\115\116\114\105\110\103" and type(a[3]) == "\115\116\114\105\110\103" and type(a[4]) == "\115\116\114\105\110\103" and type(a[5]) == "\115\116\114\105\110\103" and type(a[6]) == "\102\117\110\99\116\105\111\110")
assert(a[7] == 3 and a[8] == 4)
assert(a[9] == 7 and a[10] == 8)
assert(a[11]:find("\101\114\114\109\115\103") and # a == 11)
assert(x == "\89\73\69\76\68" and y == 4)
assert(not pcall(co))
_G.ctx=nil
_G.status=nil
local co = coroutine.wrap(function ()
local a = {pcall(pcall,pcall,pcall,pcall,pcall,pcall,pcall,error,"\104\105")}
return pcall(assert,table.unpack(a))
end)
local a = {co()}
assert(a[10] == "\104\105")
print("\79\75")