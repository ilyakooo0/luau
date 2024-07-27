print("\116\101\115\116\105\110\103\32\108\111\99\97\108\32\118\97\114\105\97\98\108\101\115\32\97\110\100\32\101\110\118\105\114\111\110\109\101\110\116\115")
local debug = require("\100\101\98\117\103")
local tracegc = require("\116\114\97\99\101\103\99")
local function f
(x)
x=nil
;
return x
end
assert(f(10) == nil)
local function f
()
local x
;
return x
end
assert(f(10) == nil)
local function f
(x)
x=nil
;
local y
;
return x,y
end
assert(f(10) == nil and select(2,f(20)) == nil)
do
local i = 10
do
local i = 100
;
assert(i == 100)
end
do
local i = 1000
;
assert(i == 1000)
end
assert(i == 10)
if i ~= 10 then
local i = 20
else
local i = 30
assert(i == 30)
end
end
f=nil
local f
local x = 1
a=nil
load("\108\111\99\97\108\32\97\32\61\32\123\125")()
assert(a == nil)
function f(a)
local _1,_2,_3,_4,_5
local _6,_7,_8,_9,_10
local x = 3
local b = a
local c,d = a,b
if (d == b) then
local x = "\113"
x=b
assert(x == 2)
else
assert(nil)
end
assert(x == 3)
local f = 10
end
local b = 10
local a
;
repeat
local b
;
a,b=1,2
;
assert(a + 1 == b)
;
until a + b == 3
assert(x == 1)
f(2)
assert(type(f) == "\102\117\110\99\116\105\111\110")
local function getenv
(f)
local a,b = debug.getupvalue(f,1)
assert(a == "\95\69\78\86")
return b
end
assert(getenv(load("\97\61\51")) == _G)
local c = {}
;
local f = load("\97\32\61\32\51",nil,nil,c)
assert(getenv(f) == c)
assert(c.a == nil)
f()
assert(c.a == 3)
do
local i = 2
local p = 4
repeat
for j = - 3, 3
do
assert(load(string.format("\108\111\99\97\108\32\97\61\37\115\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\97\61\97\43\37\115\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\97\115\115\101\114\116\40\97\32\61\61\50\94\37\115\41",j,p - j,i),""))()
assert(load(string.format("\108\111\99\97\108\32\97\61\37\115\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\97\61\97\45\37\115\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\97\115\115\101\114\116\40\97\61\61\45\50\94\37\115\41",- j,p - j,i),""))()
assert(load(string.format("\108\111\99\97\108\32\97\44\98\61\48\44\37\115\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\97\61\98\45\37\115\59\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\97\115\115\101\114\116\40\97\61\61\45\50\94\37\115\41",- j,p - j,i),""))()
end
p=2 * p
;
i=i + 1
until p <= 0
end
print("\43")
if rawget(_G,"\84") then
collectgarbage("\115\116\111\112")
local a = {[{}] = 4,[3] = 0,["\97\108\111"] = 1,["\97\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48"] = 10}
local t = T.querytab(a)
for k,_ in pairs(a)
do
a[k]=undef
end
collectgarbage()
for i = 0, t - 1
do
local k = querytab(a,i)
assert(k == nil or type(k) == "\110\117\109\98\101\114" or k == "\97\108\111")
end
local a = {}
local function additems
()
a.x=true
;
a.y=true
;
a.z=true
a[1]=true
a[2]=true
end
for i = 1, math.huge
do
T.alloccount(i)
local st,msg = pcall(additems)
T.alloccount()
local count = 0
for k,v in pairs(a)
do
assert(a[k] == v)
count=count + 1
end
if st then
assert(count == 5)
;
break
end
end
end
assert(_ENV == _G)
do
local dummy
local _ENV = (function (...)
return ...
end)(_G,dummy)
do
local _ENV = {["\97\115\115\101\114\116"] = assert}
;
assert(true)
end
local mt = {["\95\71"] = _G}
local foo,x
A=false
do
local _ENV = mt
function foo(x)
A=x
do
local _ENV = _G
;
A=1000
end
return function (x)
return A .. x
end
end
end
assert(getenv(foo) == mt)
x=foo("\104\105")
;
assert(mt.A == "\104\105" and A == 1000)
assert(x("\42") == mt.A .. "\42")
do
local _ENV = {["\97\115\115\101\114\116"] = assert,["\65"] = 10}
;
do
local _ENV = {["\97\115\115\101\114\116"] = assert,["\65"] = 20}
;
assert(A == 20)
;
x=A
end
assert(A == 10 and x == 20)
end
assert(x == 20)
A=nil
do
local a <const>,b,c <const> = 10,20,30
b=a + c + b
assert(a == 10 and b == 60 and c == 30)
local function checkro
(name,code)
local st,msg = load(code)
local gab = string.format("\97\116\116\101\109\112\116\32\116\111\32\97\115\115\105\103\110\32\116\111\32\99\111\110\115\116\32\118\97\114\105\97\98\108\101\32\39\37\115\39",name)
assert(not st and string.find(msg,gab))
end
checkro("\121","\108\111\99\97\108\32\120\44\32\121\32\60\99\111\110\115\116\62\44\32\122\32\61\32\49\48\44\32\50\48\44\32\51\48\59\32\120\32\61\32\49\49\59\32\121\32\61\32\49\50")
checkro("\120","\108\111\99\97\108\32\120\32\60\99\111\110\115\116\62\44\32\121\44\32\122\32\60\99\111\110\115\116\62\32\61\32\49\48\44\32\50\48\44\32\51\48\59\32\120\32\61\32\49\49")
checkro("\122","\108\111\99\97\108\32\120\32\60\99\111\110\115\116\62\44\32\121\44\32\122\32\60\99\111\110\115\116\62\32\61\32\49\48\44\32\50\48\44\32\51\48\59\32\121\32\61\32\49\48\59\32\122\32\61\32\49\49")
checkro("\102\111\111","\108\111\99\97\108\32\102\111\111\32\60\99\111\110\115\116\62\32\61\32\49\48\59\32\102\117\110\99\116\105\111\110\32\102\111\111\40\41\32\101\110\100")
checkro("\102\111\111","\108\111\99\97\108\32\102\111\111\32\60\99\111\110\115\116\62\32\61\32\123\125\59\32\102\117\110\99\116\105\111\110\32\102\111\111\40\41\32\101\110\100")
checkro("\122","\32\32\32\32\108\111\99\97\108\32\97\44\32\122\32\60\99\111\110\115\116\62\44\32\98\32\61\32\49\48\59\10\32\32\32\32\102\117\110\99\116\105\111\110\32\102\111\111\40\41\32\97\32\61\32\50\48\59\32\122\32\61\32\51\50\59\32\101\110\100\10\32\32")
checkro("\118\97\114\49","\32\32\32\32\108\111\99\97\108\32\97\44\32\118\97\114\49\32\60\99\111\110\115\116\62\32\61\32\49\48\59\10\32\32\32\32\102\117\110\99\116\105\111\110\32\102\111\111\40\41\32\97\32\61\32\50\48\59\32\122\32\61\32\102\117\110\99\116\105\111\110\32\40\41\32\118\97\114\49\32\61\32\49\50\59\32\101\110\100\32\32\101\110\100\10\32\32")
end
print("\116\101\115\116\105\110\103\32\116\111\45\98\101\45\99\108\111\115\101\100\32\118\97\114\105\97\98\108\101\115")
local function stack
(n)
n=((n == 0) or stack(n - 1))
end
local function func2close
(f,x,y)
local obj = setmetatable({},{["\95\95\99\108\111\115\101"] = f})
if x then
return x,obj,y
else
return obj
end
end
do
local a = {}
do
local b <close> = false
local x <close> = setmetatable({"\120"},{["\95\95\99\108\111\115\101"] = function (self)
a[# a + 1]=self[1]
end})
local w,y <close>,z = func2close(function (self,err)
assert(err == nil)
;
a[# a + 1]="\121"
end,10,20)
local c <close> = nil
a[# a + 1]="\105\110"
assert(w == 10 and z == 20)
end
a[# a + 1]="\111\117\116"
assert(a[1] == "\105\110" and a[2] == "\121" and a[3] == "\120" and a[4] == "\111\117\116")
end
do
local X = false
local x,closescope = func2close(function (_,msg)
stack(10)
;
assert(msg == nil)
X=true
end,100)
assert(x == 100)
;
x=101
;
local function foo
(x)
local _ <close> = closescope
return x,X,23
end
local a,b,c = foo(1.5)
assert(a == 1.5 and b == false and c == 23 and X == true)
X=false
foo=function (x)
local _ <close> = func2close(function (_,msg)
assert(debug.getinfo(2).name == "\102\111\111")
assert(msg == nil)
end)
local _ <close> = closescope
local y = 15
return y
end
assert(foo() == 15 and X == true)
X=false
foo=function ()
local x <close> = closescope
return x
end
assert(foo() == closescope and X == true)
end
do
local flag = false
local x = setmetatable({},{["\95\95\99\108\111\115\101"] = function ()
assert(flag == false)
;
flag=true
end})
local y <const> = nil
local z <const> = nil
do
local a <close> = x
end
assert(flag)
end
do
local flag = false
local x = setmetatable({},{["\95\95\99\108\111\115\101"] = function ()
assert(flag == false)
;
flag=true
end})
local function a
()
return (function ()
return nil
end),nil,nil,x
end
local v <const> = 1
local w <const> = 1
local x <const> = 1
local y <const> = 1
local z <const> = 1
for k in a()
do
a=k
end
assert(flag)
end
do
local X,Y
local function foo
()
local _ <close> = func2close(function ()
Y=10
end)
assert(X == true and Y == nil)
return 1,2,3
end
local function bar
()
local _ <close> = func2close(function ()
X=false
end)
X=true
do
return foo()
end
end
local a,b,c,d = bar()
assert(a == 1 and b == 2 and c == 3 and X == false and Y == 10 and d == nil)
end
do
local closed = false
local function foo
()
return function ()
return true
end,0,0,func2close(function ()
closed=true
end)
end
local function tail
()
return closed
end
local function foo1
()
for k in foo()
do
return tail()
end
end
assert(foo1() == false)
assert(closed == true)
end
do
local closed = false
local o1 = setmetatable({},{["\95\95\99\108\111\115\101"] = function ()
closed=true
end})
local function test
()
for k,v in next,{},nil,o1
do
local function f
()
return k
end
break
end
assert(closed)
end
test()
end
do
print("\116\101\115\116\105\110\103\32\101\114\114\111\114\115\32\105\110\32\95\95\99\108\111\115\101")
local function foo
()
local x <close> = func2close(function (self,msg)
assert(string.find(msg,"\64\121"))
error("\64\120")
end)
local x1 <close> = func2close(function (self,msg)
assert(string.find(msg,"\64\121"))
end)
local gc <close> = func2close(function ()
collectgarbage()
end)
local y <close> = func2close(function (self,msg)
assert(string.find(msg,"\64\122"))
error("\64\121")
end)
local z <close> = func2close(function (self,msg)
assert(msg == nil)
error("\64\122")
end)
return 200
end
local stat,msg = pcall(foo,false)
assert(string.find(msg,"\64\120"))
local function foo
()
local x <close> = func2close(function (self,msg)
assert(debug.getinfo(2).name == "\112\99\97\108\108")
assert(string.find(msg,"\64\120\49"))
end)
local x1 <close> = func2close(function (self,msg)
assert(debug.getinfo(2).name == "\112\99\97\108\108")
assert(string.find(msg,"\64\121"))
error("\64\120\49")
end)
local gc <close> = func2close(function ()
collectgarbage()
end)
local y <close> = func2close(function (self,msg)
assert(debug.getinfo(2).name == "\112\99\97\108\108")
assert(string.find(msg,"\64\122"))
error("\64\121")
end)
local first = true
local z <close> = func2close(function (self,msg)
assert(debug.getinfo(2).name == "\112\99\97\108\108")
assert(first and msg == 4)
first=false
error("\64\122")
end)
error(4)
end
local stat,msg = pcall(foo,true)
assert(string.find(msg,"\64\120\49"))
local function foo
(...)
do
local x1 <close> = func2close(function (self,msg)
assert(string.find(msg,"\64\88"))
error("\64\89")
end)
local x123 <close> = func2close(function (_,msg)
assert(msg == nil)
error("\64\88")
end)
end
os.exit(false)
end
local st,msg = xpcall(foo,debug.traceback)
assert(string.match(msg,"\94\91\94\32\93\42\32\64\89"))
local function foo
(...)
local x123 <close> = func2close(function ()
error("\64\120\49\50\51")
end)
end
local st,msg = xpcall(foo,debug.traceback)
assert(string.match(msg,"\94\91\94\32\93\42\32\64\120\49\50\51"))
assert(string.find(msg,"\105\110\32\109\101\116\97\109\101\116\104\111\100\32\39\99\108\111\115\101\39"))
end
do
local function foo
()
local x <close> = {}
os.exit(false)
end
local stat,msg = pcall(foo)
assert(not stat and string.find(msg,"\118\97\114\105\97\98\108\101\32\39\120\39\32\103\111\116\32\97\32\110\111\110\37\45\99\108\111\115\97\98\108\101\32\118\97\108\117\101"))
local function foo
()
local xyz <close> = setmetatable({},{["\95\95\99\108\111\115\101"] = print})
getmetatable(xyz).__close=nil
end
local stat,msg = pcall(foo)
assert(not stat and string.find(msg,"\109\101\116\97\109\101\116\104\111\100\32\39\99\108\111\115\101\39"))
local function foo
()
local a1 <close> = func2close(function (_,msg)
assert(string.find(msg,"\110\117\109\98\101\114\32\118\97\108\117\101"))
error(12)
end)
local a2 <close> = setmetatable({},{["\95\95\99\108\111\115\101"] = print})
local a3 <close> = func2close(function (_,msg)
assert(msg == nil)
error(123)
end)
getmetatable(a2).__close=4
end
local stat,msg = pcall(foo)
assert(not stat and msg == 12)
end
do
local track = {}
local function foo
()
local x <close> = func2close(function ()
local xx <close> = func2close(function (_,msg)
assert(msg == nil)
track[# track + 1]="\120\120"
end)
track[# track + 1]="\120"
end)
track[# track + 1]="\102\111\111"
return 20,30,40
end
local a,b,c,d = foo()
assert(a == 20 and b == 30 and c == 40 and d == nil)
assert(track[1] == "\102\111\111" and track[2] == "\120" and track[3] == "\120\120")
local track = {}
local function foo
()
local x0 <close> = func2close(function (_,msg)
assert(msg == 202)
track[# track + 1]="\120\48"
end)
local x <close> = func2close(function ()
local xx <close> = func2close(function (_,msg)
assert(msg == 101)
track[# track + 1]="\120\120"
error(202)
end)
track[# track + 1]="\120"
error(101)
end)
track[# track + 1]="\102\111\111"
return 20,30,40
end
local st,msg = pcall(foo)
assert(not st and msg == 202)
assert(track[1] == "\102\111\111" and track[2] == "\120" and track[3] == "\120\120" and track[4] == "\120\48")
end
local function checktable
(t1,t2)
assert(# t1 == # t2)
for i = 1, # t1
do
assert(t1[i] == t2[i])
end
end
do
local function overflow
(n)
overflow(n + 1)
end
local function errorh
(m)
assert(string.find(m,"\115\116\97\99\107\32\111\118\101\114\102\108\111\119"))
local x <close> = func2close(function (o)
o[1]=10
end)
return x
end
local flag
local st,obj
local co = coroutine.wrap(function ()
local y <close> = func2close(function (obj,msg)
assert(msg == nil)
obj[1]=100
flag=obj
end)
tracegc.stop()
st,obj=xpcall(overflow,errorh,0)
tracegc.start()
end)
co()
assert(not st and obj[1] == 10 and flag[1] == 100)
end
if rawget(_G,"\84") then
do
collectgarbage()
;
collectgarbage()
;
collectgarbage()
local function loop
(n)
if n < 400 then
loop(n + 1)
end
end
local o = setmetatable({},{["\95\95\99\108\111\115\101"] = function ()
loop(0)
end})
local script = "\116\111\99\108\111\115\101\32\50\59\32\115\101\116\116\111\112\32\49\59\32\114\101\116\117\114\110\32\49"
assert(T.testC(script,o) == script)
end
local function foo
()
local y <close> = func2close(function ()
T.alloccount()
end)
local x <close> = setmetatable({},{["\95\95\99\108\111\115\101"] = function ()
T.alloccount(0)
;
local x = {}
end})
error(1000)
end
stack(5)
local _,msg = pcall(foo)
assert(msg == "\110\111\116\32\101\110\111\117\103\104\32\109\101\109\111\114\121")
local closemsg
local close = func2close(function (self,msg)
T.alloccount()
closemsg=msg
end)
local function enter
(count)
stack(10)
T.alloccount(count)
closemsg=nil
return close
end
local function test
()
local x <close> = enter(0)
local y = {}
end
local _,msg = pcall(test)
assert(msg == "\110\111\116\32\101\110\111\117\103\104\32\109\101\109\111\114\121" and closemsg == "\110\111\116\32\101\110\111\117\103\104\32\109\101\109\111\114\121")
local function test
()
local xxx <close> = func2close(function (self,msg)
assert(msg == "\110\111\116\32\101\110\111\117\103\104\32\109\101\109\111\114\121")
;
error(1000)
end)
local xx <close> = func2close(function (self,msg)
assert(msg == "\110\111\116\32\101\110\111\117\103\104\32\109\101\109\111\114\121")
;
end)
local x <close> = enter(0)
local y = {}
end
local _,msg = pcall(test)
assert(msg == 1000 and closemsg == "\110\111\116\32\101\110\111\117\103\104\32\109\101\109\111\114\121")
do
collectgarbage()
local s = string.rep("\97",10000)
local m = T.totalmem()
collectgarbage("\115\116\111\112")
s=string.upper(s)
assert(T.totalmem() - m <= 11000)
collectgarbage("\114\101\115\116\97\114\116")
end
do
local lim = 10000
local extra = 2000
local s = string.rep("\97",lim)
local a = {s,s}
collectgarbage()
;
collectgarbage()
local m = T.totalmem()
collectgarbage("\115\116\111\112")
T.totalmem(m + extra)
assert(not pcall(table.concat,a))
assert(T.totalmem() - m <= extra)
T.totalmem(m + lim + extra)
assert(not pcall(table.concat,a))
assert(T.totalmem() - m <= extra)
T.totalmem(m + 2 * lim + extra)
assert(not pcall(table.concat,a))
assert(T.totalmem() - m <= extra)
T.totalmem(m + 4 * lim + extra)
assert(# table.concat(a) == 2 * lim)
T.totalmem(0)
collectgarbage("\114\101\115\116\97\114\116")
print("\43")
end
do
local trace = {}
local function hook
(event)
trace[# trace + 1]=event .. "\32" .. (debug.getinfo(2).name or "\63")
end
local x = func2close(function (_,msg)
trace[# trace + 1]="\120"
end)
local y = func2close(function (_,msg)
trace[# trace + 1]="\121"
end)
debug.sethook(hook,"\114")
local t = {T.testC("\32\32\32\32\32\32\32\116\111\99\108\111\115\101\32\50\32\32\32\32\32\32\35\32\120\10\32\32\32\32\32\32\32\112\117\115\104\110\117\109\32\49\48\10\32\32\32\32\32\32\32\112\117\115\104\105\110\116\32\50\48\10\32\32\32\32\32\32\32\116\111\99\108\111\115\101\32\51\32\32\32\32\32\32\35\32\121\10\32\32\32\32\32\32\32\114\101\116\117\114\110\32\50\10\32\32\32\32",x,y)}
debug.sethook()
checktable(trace,{"\114\101\116\117\114\110\32\115\101\116\104\111\111\107","\121","\114\101\116\117\114\110\32\63","\120","\114\101\116\117\114\110\32\63","\114\101\116\117\114\110\32\116\101\115\116\67"})
checktable(t,{10,20})
end
end
do
local trace = {}
local function hook
(event)
trace[# trace + 1]=event .. "\32" .. debug.getinfo(2).name
end
local function foo
(...)
local x <close> = func2close(function (_,msg)
trace[# trace + 1]="\120"
end)
local y <close> = func2close(function (_,msg)
debug.sethook(hook,"\114")
end)
return ...
end
local t = {foo(10,20,30)}
debug.sethook()
checktable(t,{10,20,30})
checktable(trace,{"\114\101\116\117\114\110\32\115\101\116\104\111\111\107","\114\101\116\117\114\110\32\99\108\111\115\101","\120","\114\101\116\117\114\110\32\99\108\111\115\101","\114\101\116\117\114\110\32\102\111\111"})
end
print("\116\111\45\98\101\45\99\108\111\115\101\100\32\118\97\114\105\97\98\108\101\115\32\105\110\32\99\111\114\111\117\116\105\110\101\115")
do
local trace = {}
local co = coroutine.wrap(function ()
trace[# trace + 1]="\110\111\119\88"
local x <close> = func2close(function (_,msg)
assert(msg == nil)
trace[# trace + 1]="\120\49"
coroutine.yield("\120")
trace[# trace + 1]="\120\50"
end)
return pcall(function ()
do
local z <close> = func2close(function (_,msg)
assert(msg == nil)
trace[# trace + 1]="\122\49"
coroutine.yield("\122")
trace[# trace + 1]="\122\50"
end)
end
trace[# trace + 1]="\110\111\119\89"
local y <close> = func2close(function (_,msg)
assert(msg == nil)
trace[# trace + 1]="\121\49"
coroutine.yield("\121")
trace[# trace + 1]="\121\50"
end)
return 10,20,30
end)
end)
assert(co() == "\122")
assert(co() == "\121")
assert(co() == "\120")
checktable({co()},{true,10,20,30})
checktable(trace,{"\110\111\119\88","\122\49","\122\50","\110\111\119\89","\121\49","\121\50","\120\49","\120\50"})
end
do
local extrares
local function check
(body,extra, ...)
local t = table.pack(...)
local co = coroutine.wrap(body)
if extra then
extrares=co()
end
local res = table.pack(co())
assert(res.n == 2 and res[2] == nil)
local res2 = table.pack(co())
assert(res2.n == t.n)
for i = 1, # t
do
if t[i] == "\120" then
assert(res2[i] == res[1])
else
assert(res2[i] == t[i])
end
end
end
local function foo
()
local x <close> = func2close(coroutine.yield)
local extra <close> = func2close(function (self)
assert(self == extrares)
coroutine.yield(100)
end)
extrares=extra
return table.unpack({10,x,30})
end
check(foo,true,10,"\120",30)
assert(extrares == 100)
local function foo
()
local x <close> = func2close(coroutine.yield)
return 
end
check(foo,false)
local function foo
()
local x <close> = func2close(coroutine.yield)
local y,z = 20,30
return x
end
check(foo,false,"\120")
local function foo
()
local x <close> = func2close(coroutine.yield)
local extra <close> = func2close(coroutine.yield)
return table.unpack({},1,100)
end
check(foo,true,table.unpack({},1,100))
end
do
local co = coroutine.wrap(function ()
local function foo
(err)
local z <close> = func2close(function (_,msg)
assert(msg == nil or msg == err + 20)
coroutine.yield("\122")
return 100,200
end)
local y <close> = func2close(function (_,msg)
assert(msg == err or (msg == nil and err == 1))
coroutine.yield("\121")
if err then
error(err + 20)
end
end)
local x <close> = func2close(function (_,msg)
assert(msg == err or (msg == nil and err == 1))
coroutine.yield("\120")
return 100,200
end)
if err == 10 then
error(err)
else
return 10,20
end
end
coroutine.yield(pcall(foo,nil))
coroutine.yield(pcall(foo,1))
return pcall(foo,10)
end)
local a,b = co()
assert(a == "\120" and b == nil)
a,b=co()
assert(a == "\121" and b == nil)
a,b=co()
assert(a == "\122" and b == nil)
local a,b,c = co()
assert(a and b == 10 and c == 20)
local a,b = co()
assert(a == "\120" and b == nil)
a,b=co()
assert(a == "\121" and b == nil)
a,b=co()
assert(a == "\122" and b == nil)
local st,msg = co()
assert(not st and msg == 21)
local a,b = co()
assert(a == "\120" and b == nil)
a,b=co()
assert(a == "\121" and b == nil)
a,b=co()
assert(a == "\122" and b == nil)
local st,msg = co()
assert(not st and msg == 10 + 20)
end
do
local x = false
local y = false
local co = coroutine.wrap(function ()
local xv <close> = func2close(function ()
x=true
end)
do
local yv <close> = func2close(function ()
y=true
end)
coroutine.yield(100)
end
coroutine.yield(200)
error(23)
end)
local b = co()
assert(b == 100 and not x and not y)
b=co()
assert(b == 200 and not x and y)
local a,b = pcall(co)
assert(not a and b == 23 and x and y)
end
do
local x = 0
local co = coroutine.wrap(function ()
local xx <close> = func2close(function (_,msg)
x=x + 1
;
assert(string.find(msg,"\64\88\88\88"))
error("\64\89\89\89")
end)
local xv <close> = func2close(function ()
x=x + 1
;
error("\64\88\88\88")
end)
coroutine.yield(100)
error(200)
end)
assert(co() == 100)
;
assert(x == 0)
local st,msg = pcall(co)
;
assert(x == 2)
assert(not st and string.find(msg,"\64\89\89\89"))
local x = 0
local y = 0
co=coroutine.wrap(function ()
local xx <close> = func2close(function (_,err)
y=y + 1
;
assert(string.find(err,"\88\88\88"))
error("\89\89\89")
end)
local xv <close> = func2close(function ()
x=x + 1
;
error("\88\88\88")
end)
coroutine.yield(100)
return 200
end)
assert(co() == 100)
;
assert(x == 0)
local st,msg = pcall(co)
assert(x == 1 and y == 1)
assert(not st and string.find(msg,"\37\119\43\37\46\37\119\43\58\37\100\43\58\32\89\89\89"))
end
local co
co=coroutine.wrap(function ()
local x <close> = func2close(function ()
os.exit(false)
end)
co=nil
coroutine.yield()
end)
co()
assert(co == nil)
collectgarbage()
if rawget(_G,"\84") then
print("\116\111\45\98\101\45\99\108\111\115\101\100\32\118\97\114\105\97\98\108\101\115\32\120\32\99\111\114\111\117\116\105\110\101\115\32\105\110\32\67")
do
local token = 0
local count = 0
local f = T.makeCfunc("\32\32\32\32\32\32\116\111\99\108\111\115\101\32\49\10\32\32\32\32\32\32\116\111\99\108\111\115\101\32\50\10\32\32\32\32\32\32\114\101\116\117\114\110\32\46\10\32\32\32\32")
local obj = func2close(function (_,msg)
count=count + 1
token=coroutine.yield(count,token)
end)
local co = coroutine.wrap(f)
local ct,res = co(obj,obj,10,20,30,3)
assert(ct == 1 and res == 0)
ct,res=co(100)
assert(ct == 2 and res == 100)
res={co(200)}
assert(res[1] == 10 and res[2] == 20 and res[3] == 30 and res[4] == nil)
assert(token == 200)
end
do
local f = T.makeCfunc("\32\32\32\32\32\32\116\111\99\108\111\115\101\32\49\10\32\32\32\32\32\32\114\101\116\117\114\110\32\46\10\32\32\32\32")
local obj = func2close(function ()
local temp
local x <close> = func2close(function ()
coroutine.yield(temp)
return 1,2,3
end)
temp=coroutine.yield("\99\108\111\115\105\110\103\32\111\98\106")
return 1,2,3
end)
local co = coroutine.wrap(f)
local res = co(obj,10,30,1)
assert(res == "\99\108\111\115\105\110\103\32\111\98\106")
res=co("\99\108\111\115\105\110\103\32\120")
assert(res == "\99\108\111\115\105\110\103\32\120")
res={co()}
assert(res[1] == 30 and res[2] == nil)
end
do
local f = T.makeCfunc("\32\32\32\32\32\32\116\111\99\108\111\115\101\32\49\10\32\32\32\32\32\32\99\108\111\115\101\115\108\111\116\32\49\10\32\32\32\32")
local obj = func2close(coroutine.yield)
local co = coroutine.create(f)
local st,msg = coroutine.resume(co,obj)
assert(not st and string.find(msg,"\97\116\116\101\109\112\116\32\116\111\32\121\105\101\108\100\32\97\99\114\111\115\115"))
local f = T.makeCfunc("\32\32\32\32\32\32\116\111\99\108\111\115\101\32\49\10\32\32\32\32")
local st,msg = pcall(f,obj)
assert(not st and string.find(msg,"\97\116\116\101\109\112\116\32\116\111\32\121\105\101\108\100\32\102\114\111\109\32\111\117\116\115\105\100\101"))
end
end
do
local numopen = 0
local function open
(x)
numopen=numopen + 1
return function ()
x=x - 1
if x > 0 then
return x
end
end,nil,nil,func2close(function ()
numopen=numopen - 1
end)
end
local s = 0
for i in open(10)
do
s=s + i
end
assert(s == 45 and numopen == 0)
local s = 0
for i in open(10)
do
if i < 5 then
break
end
s=s + i
end
assert(s == 35 and numopen == 0)
local s = 0
for i in open(10)
do
for j in open(10)
do
if i + j < 5 then
goto endloop
end
s=s + i
end
end
::endloop::
assert(s == 375 and numopen == 0)
end
print("\79\75")
return 5,f
end