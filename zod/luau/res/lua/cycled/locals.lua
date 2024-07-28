print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{73}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{65}\u{6e}\u{76}\u{69}\u{72}\u{6f}\u{6e}\u{6d}\u{65}\u{6e}\u{74}\u{73}")
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local tracegc = require("\u{74}\u{72}\u{61}\u{63}\u{65}\u{67}\u{63}")
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
load("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{7b}\u{7d}")()
assert(a == nil)
function f(a)
local _1,_2,_3,_4,_5
local _6,_7,_8,_9,_10
local x = 3
local b = a
local c,d = a,b
if (d == b) then
local x = "\u{71}"
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
assert(type(f) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
local function getenv
(f)
local a,b = debug.getupvalue(f,1)
assert(a == "\u{5f}\u{45}\u{4e}\u{56}")
return b
end
assert(getenv(load("\u{61}\u{3d}\u{33}")) == _G)
local c = {}
;
local f = load("\u{61}\u{20}\u{3d}\u{20}\u{33}",nil,nil,c)
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
assert(load(string.format("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{3d}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{3d}\u{61}\u{2b}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{20}\u{3d}\u{3d}\u{32}\u{5e}\u{25}\u{73}\u{29}",j,p - j,i),""))()
assert(load(string.format("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{3d}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{3d}\u{61}\u{2d}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{3d}\u{3d}\u{2d}\u{32}\u{5e}\u{25}\u{73}\u{29}",- j,p - j,i),""))()
assert(load(string.format("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{2c}\u{62}\u{3d}\u{30}\u{2c}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{3d}\u{62}\u{2d}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{3d}\u{3d}\u{2d}\u{32}\u{5e}\u{25}\u{73}\u{29}",- j,p - j,i),""))()
end
p=2 * p
;
i=i + 1
until p <= 0
end
print("\u{2b}")
if rawget(_G,"\u{54}") then
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
local a = {[{}] = 4,[3] = 0,["\u{61}\u{6c}\u{6f}"] = 1,["\u{61}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}"] = 10}
local t = T.querytab(a)
for k,_ in pairs(a)
do
a[k]=undef
end
collectgarbage()
for i = 0, t - 1
do
local k = querytab(a,i)
assert(k == nil or type(k) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}" or k == "\u{61}\u{6c}\u{6f}")
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
local _ENV = {["\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}"] = assert}
;
assert(true)
end
local mt = {["\u{5f}\u{47}"] = _G}
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
x=foo("\u{68}\u{69}")
;
assert(mt.A == "\u{68}\u{69}" and A == 1000)
assert(x("\u{2a}") == mt.A .. "\u{2a}")
do
local _ENV = {["\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}"] = assert,["\u{41}"] = 10}
;
do
local _ENV = {["\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}"] = assert,["\u{41}"] = 20}
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
local gab = string.format("\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{61}\u{73}\u{73}\u{69}\u{67}\u{6e}\u{20}\u{74}\u{6f}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{27}\u{25}\u{73}\u{27}",name)
assert(not st and string.find(msg,gab))
end
checkro("\u{79}","\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{2c}\u{20}\u{79}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{2c}\u{20}\u{7a}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{2c}\u{20}\u{32}\u{30}\u{2c}\u{20}\u{33}\u{30}\u{3b}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{31}\u{31}\u{3b}\u{20}\u{79}\u{20}\u{3d}\u{20}\u{31}\u{32}")
checkro("\u{78}","\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{2c}\u{20}\u{79}\u{2c}\u{20}\u{7a}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{2c}\u{20}\u{32}\u{30}\u{2c}\u{20}\u{33}\u{30}\u{3b}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{31}\u{31}")
checkro("\u{7a}","\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{2c}\u{20}\u{79}\u{2c}\u{20}\u{7a}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{2c}\u{20}\u{32}\u{30}\u{2c}\u{20}\u{33}\u{30}\u{3b}\u{20}\u{79}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{3b}\u{20}\u{7a}\u{20}\u{3d}\u{20}\u{31}\u{31}")
checkro("\u{66}\u{6f}\u{6f}","\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{66}\u{6f}\u{6f}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{3b}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{6f}\u{6f}\u{28}\u{29}\u{20}\u{65}\u{6e}\u{64}")
checkro("\u{66}\u{6f}\u{6f}","\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{66}\u{6f}\u{6f}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{7b}\u{7d}\u{3b}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{6f}\u{6f}\u{28}\u{29}\u{20}\u{65}\u{6e}\u{64}")
checkro("\u{7a}","\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{2c}\u{20}\u{7a}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{2c}\u{20}\u{62}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{6f}\u{6f}\u{28}\u{29}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{32}\u{30}\u{3b}\u{20}\u{7a}\u{20}\u{3d}\u{20}\u{33}\u{32}\u{3b}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}")
checkro("\u{76}\u{61}\u{72}\u{31}","\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{2c}\u{20}\u{76}\u{61}\u{72}\u{31}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{6f}\u{6f}\u{28}\u{29}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{32}\u{30}\u{3b}\u{20}\u{7a}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{76}\u{61}\u{72}\u{31}\u{20}\u{3d}\u{20}\u{31}\u{32}\u{3b}\u{20}\u{65}\u{6e}\u{64}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}")
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{6f}\u{2d}\u{62}\u{65}\u{2d}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{73}")
local function stack
(n)
n=((n == 0) or stack(n - 1))
end
local function func2close
(f,x,y)
local obj = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = f})
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
local x <close> = setmetatable({"\u{78}"},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function (self)
a[# a + 1]=self[1]
end})
local w,y <close>,z = func2close(function (self,err)
assert(err == nil)
;
a[# a + 1]="\u{79}"
end,10,20)
local c <close> = nil
a[# a + 1]="\u{69}\u{6e}"
assert(w == 10 and z == 20)
end
a[# a + 1]="\u{6f}\u{75}\u{74}"
assert(a[1] == "\u{69}\u{6e}" and a[2] == "\u{79}" and a[3] == "\u{78}" and a[4] == "\u{6f}\u{75}\u{74}")
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
assert(debug.getinfo(2).name == "\u{66}\u{6f}\u{6f}")
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
local x = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
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
local x = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
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
local o1 = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
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
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}")
local function foo
()
local x <close> = func2close(function (self,msg)
assert(string.find(msg,"\u{40}\u{79}"))
error("\u{40}\u{78}")
end)
local x1 <close> = func2close(function (self,msg)
assert(string.find(msg,"\u{40}\u{79}"))
end)
local gc <close> = func2close(function ()
collectgarbage()
end)
local y <close> = func2close(function (self,msg)
assert(string.find(msg,"\u{40}\u{7a}"))
error("\u{40}\u{79}")
end)
local z <close> = func2close(function (self,msg)
assert(msg == nil)
error("\u{40}\u{7a}")
end)
return 200
end
local stat,msg = pcall(foo,false)
assert(string.find(msg,"\u{40}\u{78}"))
local function foo
()
local x <close> = func2close(function (self,msg)
assert(debug.getinfo(2).name == "\u{70}\u{63}\u{61}\u{6c}\u{6c}")
assert(string.find(msg,"\u{40}\u{78}\u{31}"))
end)
local x1 <close> = func2close(function (self,msg)
assert(debug.getinfo(2).name == "\u{70}\u{63}\u{61}\u{6c}\u{6c}")
assert(string.find(msg,"\u{40}\u{79}"))
error("\u{40}\u{78}\u{31}")
end)
local gc <close> = func2close(function ()
collectgarbage()
end)
local y <close> = func2close(function (self,msg)
assert(debug.getinfo(2).name == "\u{70}\u{63}\u{61}\u{6c}\u{6c}")
assert(string.find(msg,"\u{40}\u{7a}"))
error("\u{40}\u{79}")
end)
local first = true
local z <close> = func2close(function (self,msg)
assert(debug.getinfo(2).name == "\u{70}\u{63}\u{61}\u{6c}\u{6c}")
assert(first and msg == 4)
first=false
error("\u{40}\u{7a}")
end)
error(4)
end
local stat,msg = pcall(foo,true)
assert(string.find(msg,"\u{40}\u{78}\u{31}"))
local function foo
(...)
do
local x1 <close> = func2close(function (self,msg)
assert(string.find(msg,"\u{40}\u{58}"))
error("\u{40}\u{59}")
end)
local x123 <close> = func2close(function (_,msg)
assert(msg == nil)
error("\u{40}\u{58}")
end)
end
os.exit(false)
end
local st,msg = xpcall(foo,debug.traceback)
assert(string.match(msg,"\u{5e}\u{5b}\u{5e}\u{20}\u{5d}\u{2a}\u{20}\u{40}\u{59}"))
local function foo
(...)
local x123 <close> = func2close(function ()
error("\u{40}\u{78}\u{31}\u{32}\u{33}")
end)
end
local st,msg = xpcall(foo,debug.traceback)
assert(string.match(msg,"\u{5e}\u{5b}\u{5e}\u{20}\u{5d}\u{2a}\u{20}\u{40}\u{78}\u{31}\u{32}\u{33}"))
assert(string.find(msg,"\u{69}\u{6e}\u{20}\u{6d}\u{65}\u{74}\u{61}\u{6d}\u{65}\u{74}\u{68}\u{6f}\u{64}\u{20}\u{27}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{27}"))
end
do
local function foo
()
local x <close> = {}
os.exit(false)
end
local stat,msg = pcall(foo)
assert(not stat and string.find(msg,"\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{27}\u{78}\u{27}\u{20}\u{67}\u{6f}\u{74}\u{20}\u{61}\u{20}\u{6e}\u{6f}\u{6e}\u{25}\u{2d}\u{63}\u{6c}\u{6f}\u{73}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}"))
local function foo
()
local xyz <close> = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = print})
getmetatable(xyz).__close=nil
end
local stat,msg = pcall(foo)
assert(not stat and string.find(msg,"\u{6d}\u{65}\u{74}\u{61}\u{6d}\u{65}\u{74}\u{68}\u{6f}\u{64}\u{20}\u{27}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{27}"))
local function foo
()
local a1 <close> = func2close(function (_,msg)
assert(string.find(msg,"\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}"))
error(12)
end)
local a2 <close> = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = print})
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
track[# track + 1]="\u{78}\u{78}"
end)
track[# track + 1]="\u{78}"
end)
track[# track + 1]="\u{66}\u{6f}\u{6f}"
return 20,30,40
end
local a,b,c,d = foo()
assert(a == 20 and b == 30 and c == 40 and d == nil)
assert(track[1] == "\u{66}\u{6f}\u{6f}" and track[2] == "\u{78}" and track[3] == "\u{78}\u{78}")
local track = {}
local function foo
()
local x0 <close> = func2close(function (_,msg)
assert(msg == 202)
track[# track + 1]="\u{78}\u{30}"
end)
local x <close> = func2close(function ()
local xx <close> = func2close(function (_,msg)
assert(msg == 101)
track[# track + 1]="\u{78}\u{78}"
error(202)
end)
track[# track + 1]="\u{78}"
error(101)
end)
track[# track + 1]="\u{66}\u{6f}\u{6f}"
return 20,30,40
end
local st,msg = pcall(foo)
assert(not st and msg == 202)
assert(track[1] == "\u{66}\u{6f}\u{6f}" and track[2] == "\u{78}" and track[3] == "\u{78}\u{78}" and track[4] == "\u{78}\u{30}")
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
assert(string.find(m,"\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}"))
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
if rawget(_G,"\u{54}") then
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
local o = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
loop(0)
end})
local script = "\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{32}\u{3b}\u{20}\u{73}\u{65}\u{74}\u{74}\u{6f}\u{70}\u{20}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}"
assert(T.testC(script,o) == script)
end
local function foo
()
local y <close> = func2close(function ()
T.alloccount()
end)
local x <close> = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
T.alloccount(0)
;
local x = {}
end})
error(1000)
end
stack(5)
local _,msg = pcall(foo)
assert(msg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}")
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
assert(msg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}" and closemsg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}")
local function test
()
local xxx <close> = func2close(function (self,msg)
assert(msg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}")
;
error(1000)
end)
local xx <close> = func2close(function (self,msg)
assert(msg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}")
;
end)
local x <close> = enter(0)
local y = {}
end
local _,msg = pcall(test)
assert(msg == 1000 and closemsg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}")
do
collectgarbage()
local s = string.rep("\u{61}",10000)
local m = T.totalmem()
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
s=string.upper(s)
assert(T.totalmem() - m <= 11000)
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
end
do
local lim = 10000
local extra = 2000
local s = string.rep("\u{61}",lim)
local a = {s,s}
collectgarbage()
;
collectgarbage()
local m = T.totalmem()
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
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
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
print("\u{2b}")
end
do
local trace = {}
local function hook
(event)
trace[# trace + 1]=event .. "\u{20}" .. (debug.getinfo(2).name or "\u{3f}")
end
local x = func2close(function (_,msg)
trace[# trace + 1]="\u{78}"
end)
local y = func2close(function (_,msg)
trace[# trace + 1]="\u{79}"
end)
debug.sethook(hook,"\u{72}")
local t = {T.testC("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{32}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{78}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{31}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{69}\u{6e}\u{74}\u{20}\u{32}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{33}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{79}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{32}\u{a}\u{20}\u{20}\u{20}\u{20}",x,y)}
debug.sethook()
checktable(trace,{"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{73}\u{65}\u{74}\u{68}\u{6f}\u{6f}\u{6b}","\u{79}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{3f}","\u{78}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{3f}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}"})
checktable(t,{10,20})
end
end
do
local trace = {}
local function hook
(event)
trace[# trace + 1]=event .. "\u{20}" .. debug.getinfo(2).name
end
local function foo
(...)
local x <close> = func2close(function (_,msg)
trace[# trace + 1]="\u{78}"
end)
local y <close> = func2close(function (_,msg)
debug.sethook(hook,"\u{72}")
end)
return ...
end
local t = {foo(10,20,30)}
debug.sethook()
checktable(t,{10,20,30})
checktable(trace,{"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{73}\u{65}\u{74}\u{68}\u{6f}\u{6f}\u{6b}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}","\u{78}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{6f}\u{6f}"})
end
print("\u{74}\u{6f}\u{2d}\u{62}\u{65}\u{2d}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{73}")
do
local trace = {}
local co = coroutine.wrap(function ()
trace[# trace + 1]="\u{6e}\u{6f}\u{77}\u{58}"
local x <close> = func2close(function (_,msg)
assert(msg == nil)
trace[# trace + 1]="\u{78}\u{31}"
coroutine.yield("\u{78}")
trace[# trace + 1]="\u{78}\u{32}"
end)
return pcall(function ()
do
local z <close> = func2close(function (_,msg)
assert(msg == nil)
trace[# trace + 1]="\u{7a}\u{31}"
coroutine.yield("\u{7a}")
trace[# trace + 1]="\u{7a}\u{32}"
end)
end
trace[# trace + 1]="\u{6e}\u{6f}\u{77}\u{59}"
local y <close> = func2close(function (_,msg)
assert(msg == nil)
trace[# trace + 1]="\u{79}\u{31}"
coroutine.yield("\u{79}")
trace[# trace + 1]="\u{79}\u{32}"
end)
return 10,20,30
end)
end)
assert(co() == "\u{7a}")
assert(co() == "\u{79}")
assert(co() == "\u{78}")
checktable({co()},{true,10,20,30})
checktable(trace,{"\u{6e}\u{6f}\u{77}\u{58}","\u{7a}\u{31}","\u{7a}\u{32}","\u{6e}\u{6f}\u{77}\u{59}","\u{79}\u{31}","\u{79}\u{32}","\u{78}\u{31}","\u{78}\u{32}"})
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
if t[i] == "\u{78}" then
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
check(foo,true,10,"\u{78}",30)
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
check(foo,false,"\u{78}")
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
coroutine.yield("\u{7a}")
return 100,200
end)
local y <close> = func2close(function (_,msg)
assert(msg == err or (msg == nil and err == 1))
coroutine.yield("\u{79}")
if err then
error(err + 20)
end
end)
local x <close> = func2close(function (_,msg)
assert(msg == err or (msg == nil and err == 1))
coroutine.yield("\u{78}")
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
assert(a == "\u{78}" and b == nil)
a,b=co()
assert(a == "\u{79}" and b == nil)
a,b=co()
assert(a == "\u{7a}" and b == nil)
local a,b,c = co()
assert(a and b == 10 and c == 20)
local a,b = co()
assert(a == "\u{78}" and b == nil)
a,b=co()
assert(a == "\u{79}" and b == nil)
a,b=co()
assert(a == "\u{7a}" and b == nil)
local st,msg = co()
assert(not st and msg == 21)
local a,b = co()
assert(a == "\u{78}" and b == nil)
a,b=co()
assert(a == "\u{79}" and b == nil)
a,b=co()
assert(a == "\u{7a}" and b == nil)
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
assert(string.find(msg,"\u{40}\u{58}\u{58}\u{58}"))
error("\u{40}\u{59}\u{59}\u{59}")
end)
local xv <close> = func2close(function ()
x=x + 1
;
error("\u{40}\u{58}\u{58}\u{58}")
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
assert(not st and string.find(msg,"\u{40}\u{59}\u{59}\u{59}"))
local x = 0
local y = 0
co=coroutine.wrap(function ()
local xx <close> = func2close(function (_,err)
y=y + 1
;
assert(string.find(err,"\u{58}\u{58}\u{58}"))
error("\u{59}\u{59}\u{59}")
end)
local xv <close> = func2close(function ()
x=x + 1
;
error("\u{58}\u{58}\u{58}")
end)
coroutine.yield(100)
return 200
end)
assert(co() == 100)
;
assert(x == 0)
local st,msg = pcall(co)
assert(x == 1 and y == 1)
assert(not st and string.find(msg,"\u{25}\u{77}\u{2b}\u{25}\u{2e}\u{25}\u{77}\u{2b}\u{3a}\u{25}\u{64}\u{2b}\u{3a}\u{20}\u{59}\u{59}\u{59}"))
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
if rawget(_G,"\u{54}") then
print("\u{74}\u{6f}\u{2d}\u{62}\u{65}\u{2d}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{73}\u{20}\u{78}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{43}")
do
local token = 0
local count = 0
local f = T.makeCfunc("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{32}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2e}\u{a}\u{20}\u{20}\u{20}\u{20}")
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
local f = T.makeCfunc("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2e}\u{a}\u{20}\u{20}\u{20}\u{20}")
local obj = func2close(function ()
local temp
local x <close> = func2close(function ()
coroutine.yield(temp)
return 1,2,3
end)
temp=coroutine.yield("\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{62}\u{6a}")
return 1,2,3
end)
local co = coroutine.wrap(f)
local res = co(obj,10,30,1)
assert(res == "\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{62}\u{6a}")
res=co("\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{78}")
assert(res == "\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{78}")
res={co()}
assert(res[1] == 30 and res[2] == nil)
end
do
local f = T.makeCfunc("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{73}\u{6c}\u{6f}\u{74}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}")
local obj = func2close(coroutine.yield)
local co = coroutine.create(f)
local st,msg = coroutine.resume(co,obj)
assert(not st and string.find(msg,"\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{61}\u{63}\u{72}\u{6f}\u{73}\u{73}"))
local f = T.makeCfunc("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}")
local st,msg = pcall(f,obj)
assert(not st and string.find(msg,"\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{66}\u{72}\u{6f}\u{6d}\u{20}\u{6f}\u{75}\u{74}\u{73}\u{69}\u{64}\u{65}"))
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
print("\u{4f}\u{4b}")
return 5,f
end