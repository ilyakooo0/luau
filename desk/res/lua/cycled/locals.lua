print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{73}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{65}\u{6e}\u{76}\u{69}\u{72}\u{6f}\u{6e}\u{6d}\u{65}\u{6e}\u{74}\u{73}")
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local tracegc = require("\u{74}\u{72}\u{61}\u{63}\u{65}\u{67}\u{63}")
local function f
(x)
x=nil
;
return x
end
assert((f(0xa) == nil))
local function f
()
local x
;
return x
end
assert((f(0xa) == nil))
local function f
(x)
x=nil
;
local y
;
return x,y
end
assert(((f(0xa) == nil) and (select(0x2,f(0x14)) == nil)))
do
local i = 0xa
do
local i = 0x64
;
assert((i == 0x64))
end
do
local i = 0x3e8
;
assert((i == 0x3e8))
end
assert((i == 0xa))
if (i ~= 0xa) then
local i = 0x14
else
local i = 0x1e
assert((i == 0x1e))
end
end
f=nil
local f
local x = 0x1
a=nil
load("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{7b}\u{7d}")()
assert((a == nil))
function f(a)
local _1,_2,_3,_4,_5
local _6,_7,_8,_9,_10
local x = 0x3
local b = a
local c,d = a,b
if ((d == b)) then
local x = "\u{71}"
x=b
assert((x == 0x2))
else
assert(nil)
end
assert((x == 0x3))
local f = 0xa
end
local b = 0xa
local a
;
repeat
local b
;
a,b=0x1,0x2
;
assert(((a + 0x1) == b))
;
until ((a + b) == 0x3)
assert((x == 0x1))
f(0x2)
assert((type(f) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}"))
local function getenv
(f)
local a,b = debug.getupvalue(f,0x1)
assert((a == "\u{5f}\u{45}\u{4e}\u{56}"))
return b
end
assert((getenv(load("\u{61}\u{3d}\u{33}")) == _G))
local c = {}
;
local f = load("\u{61}\u{20}\u{3d}\u{20}\u{33}",nil,nil,c)
assert((getenv(f) == c))
assert((c.a == nil))
f()
assert((c.a == 0x3))
do
local i = 0x2
local p = 0x4
repeat
for j = - 0x3, 0x3
do
assert(load(string.format("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{3d}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{3d}\u{61}\u{2b}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{20}\u{3d}\u{3d}\u{32}\u{5e}\u{25}\u{73}\u{29}",j,(p - j),i),""))()
assert(load(string.format("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{3d}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{3d}\u{61}\u{2d}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{3d}\u{3d}\u{2d}\u{32}\u{5e}\u{25}\u{73}\u{29}",- j,(p - j),i),""))()
assert(load(string.format("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{2c}\u{62}\u{3d}\u{30}\u{2c}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{3d}\u{62}\u{2d}\u{25}\u{73}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{3d}\u{3d}\u{2d}\u{32}\u{5e}\u{25}\u{73}\u{29}",- j,(p - j),i),""))()
end
p=(0x2 * p)
;
i=(i + 0x1)
until (p <= 0x0)
end
print("\u{2b}")
if rawget(_G,"\u{54}") then
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
local a = {[{}] = 0x4,[0x3] = 0x0,["\u{61}\u{6c}\u{6f}"] = 0x1,["\u{61}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}"] = 0xa}
local t = T.querytab(a)
for k,_ in pairs(a)
do
a[k]=undef
end
collectgarbage()
for i = 0x0, (t - 0x1)
do
local k = querytab(a,i)
assert((((k == nil) or (type(k) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}")) or (k == "\u{61}\u{6c}\u{6f}")))
end
local a = {}
local function additems
()
a.x=true
;
a.y=true
;
a.z=true
a[0x1]=true
a[0x2]=true
end
for i = 0x1, math.huge
do
T.alloccount(i)
local st,msg = pcall(additems)
T.alloccount()
local count = 0x0
for k,v in pairs(a)
do
assert((a[k] == v))
count=(count + 0x1)
end
if st then
assert((count == 0x5))
;
break
end
end
end
assert((_ENV == _G))
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
A=0x3e8
end
return function (x)
return (A .. x)
end
end
end
assert((getenv(foo) == mt))
x=foo("\u{68}\u{69}")
;
assert(((mt.A == "\u{68}\u{69}") and (A == 0x3e8)))
assert((x("\u{2a}") == (mt.A .. "\u{2a}")))
do
local _ENV = {["\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}"] = assert,["\u{41}"] = 0xa}
;
do
local _ENV = {["\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}"] = assert,["\u{41}"] = 0x14}
;
assert((A == 0x14))
;
x=A
end
assert(((A == 0xa) and (x == 0x14)))
end
assert((x == 0x14))
A=nil
do
local a <const>,b,c <const> = 0xa,0x14,0x1e
b=((a + c) + b)
assert((((a == 0xa) and (b == 0x3c)) and (c == 0x1e)))
local function checkro
(name,code)
local st,msg = load(code)
local gab = string.format("\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{61}\u{73}\u{73}\u{69}\u{67}\u{6e}\u{20}\u{74}\u{6f}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{27}\u{25}\u{73}\u{27}",name)
assert(not (st and string.find(msg,gab)))
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
n=((((n == 0x0)) or stack((n - 0x1))))
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
a[# (a + 0x1)]=self[0x1]
end})
local w,y <close>,z = func2close(function (self,err)
assert((err == nil))
;
a[# (a + 0x1)]="\u{79}"
end,0xa,0x14)
local c <close> = nil
a[# (a + 0x1)]="\u{69}\u{6e}"
assert(((w == 0xa) and (z == 0x14)))
end
a[# (a + 0x1)]="\u{6f}\u{75}\u{74}"
assert(((((a[0x1] == "\u{69}\u{6e}") and (a[0x2] == "\u{79}")) and (a[0x3] == "\u{78}")) and (a[0x4] == "\u{6f}\u{75}\u{74}")))
end
do
local X = false
local x,closescope = func2close(function (_,msg)
stack(0xa)
;
assert((msg == nil))
X=true
end,0x64)
assert((x == 0x64))
;
x=0x65
;
local function foo
(x)
local _ <close> = closescope
return x,X,0x17
end
local a,b,c = foo(1.5)
assert(((((a == 1.5) and (b == false)) and (c == 0x17)) and (X == true)))
X=false
foo=function (x)
local _ <close> = func2close(function (_,msg)
assert((debug.getinfo(0x2).name == "\u{66}\u{6f}\u{6f}"))
assert((msg == nil))
end)
local _ <close> = closescope
local y = 0xf
return y
end
assert(((foo() == 0xf) and (X == true)))
X=false
foo=function ()
local x <close> = closescope
return x
end
assert(((foo() == closescope) and (X == true)))
end
do
local flag = false
local x = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
assert((flag == false))
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
assert((flag == false))
;
flag=true
end})
local function a
()
return (function ()
return nil
end),nil,nil,x
end
local v <const> = 0x1
local w <const> = 0x1
local x <const> = 0x1
local y <const> = 0x1
local z <const> = 0x1
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
Y=0xa
end)
assert(((X == true) and (Y == nil)))
return 0x1,0x2,0x3
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
assert(((((((a == 0x1) and (b == 0x2)) and (c == 0x3)) and (X == false)) and (Y == 0xa)) and (d == nil)))
end
do
local closed = false
local function foo
()
return function ()
return true
end,0x0,0x0,func2close(function ()
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
assert((foo1() == false))
assert((closed == true))
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
assert((msg == nil))
error("\u{40}\u{7a}")
end)
return 0xc8
end
local stat,msg = pcall(foo,false)
assert(string.find(msg,"\u{40}\u{78}"))
local function foo
()
local x <close> = func2close(function (self,msg)
assert((debug.getinfo(0x2).name == "\u{70}\u{63}\u{61}\u{6c}\u{6c}"))
assert(string.find(msg,"\u{40}\u{78}\u{31}"))
end)
local x1 <close> = func2close(function (self,msg)
assert((debug.getinfo(0x2).name == "\u{70}\u{63}\u{61}\u{6c}\u{6c}"))
assert(string.find(msg,"\u{40}\u{79}"))
error("\u{40}\u{78}\u{31}")
end)
local gc <close> = func2close(function ()
collectgarbage()
end)
local y <close> = func2close(function (self,msg)
assert((debug.getinfo(0x2).name == "\u{70}\u{63}\u{61}\u{6c}\u{6c}"))
assert(string.find(msg,"\u{40}\u{7a}"))
error("\u{40}\u{79}")
end)
local first = true
local z <close> = func2close(function (self,msg)
assert((debug.getinfo(0x2).name == "\u{70}\u{63}\u{61}\u{6c}\u{6c}"))
assert((first and (msg == 0x4)))
first=false
error("\u{40}\u{7a}")
end)
error(0x4)
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
assert((msg == nil))
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
assert(not (stat and string.find(msg,"\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{27}\u{78}\u{27}\u{20}\u{67}\u{6f}\u{74}\u{20}\u{61}\u{20}\u{6e}\u{6f}\u{6e}\u{25}\u{2d}\u{63}\u{6c}\u{6f}\u{73}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}")))
local function foo
()
local xyz <close> = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = print})
getmetatable(xyz).__close=nil
end
local stat,msg = pcall(foo)
assert(not (stat and string.find(msg,"\u{6d}\u{65}\u{74}\u{61}\u{6d}\u{65}\u{74}\u{68}\u{6f}\u{64}\u{20}\u{27}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{27}")))
local function foo
()
local a1 <close> = func2close(function (_,msg)
assert(string.find(msg,"\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}"))
error(0xc)
end)
local a2 <close> = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = print})
local a3 <close> = func2close(function (_,msg)
assert((msg == nil))
error(0x7b)
end)
getmetatable(a2).__close=0x4
end
local stat,msg = pcall(foo)
assert(not (stat and (msg == 0xc)))
end
do
local track = {}
local function foo
()
local x <close> = func2close(function ()
local xx <close> = func2close(function (_,msg)
assert((msg == nil))
track[# (track + 0x1)]="\u{78}\u{78}"
end)
track[# (track + 0x1)]="\u{78}"
end)
track[# (track + 0x1)]="\u{66}\u{6f}\u{6f}"
return 0x14,0x1e,0x28
end
local a,b,c,d = foo()
assert(((((a == 0x14) and (b == 0x1e)) and (c == 0x28)) and (d == nil)))
assert((((track[0x1] == "\u{66}\u{6f}\u{6f}") and (track[0x2] == "\u{78}")) and (track[0x3] == "\u{78}\u{78}")))
local track = {}
local function foo
()
local x0 <close> = func2close(function (_,msg)
assert((msg == 0xca))
track[# (track + 0x1)]="\u{78}\u{30}"
end)
local x <close> = func2close(function ()
local xx <close> = func2close(function (_,msg)
assert((msg == 0x65))
track[# (track + 0x1)]="\u{78}\u{78}"
error(0xca)
end)
track[# (track + 0x1)]="\u{78}"
error(0x65)
end)
track[# (track + 0x1)]="\u{66}\u{6f}\u{6f}"
return 0x14,0x1e,0x28
end
local st,msg = pcall(foo)
assert(not (st and (msg == 0xca)))
assert(((((track[0x1] == "\u{66}\u{6f}\u{6f}") and (track[0x2] == "\u{78}")) and (track[0x3] == "\u{78}\u{78}")) and (track[0x4] == "\u{78}\u{30}")))
end
local function checktable
(t1,t2)
assert(# (t1 == # t2))
for i = 0x1, # t1
do
assert((t1[i] == t2[i]))
end
end
do
local function overflow
(n)
overflow((n + 0x1))
end
local function errorh
(m)
assert(string.find(m,"\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}"))
local x <close> = func2close(function (o)
o[0x1]=0xa
end)
return x
end
local flag
local st,obj
local co = coroutine.wrap(function ()
local y <close> = func2close(function (obj,msg)
assert((msg == nil))
obj[0x1]=0x64
flag=obj
end)
tracegc.stop()
st,obj=xpcall(overflow,errorh,0x0)
tracegc.start()
end)
co()
assert(not ((st and (obj[0x1] == 0xa)) and (flag[0x1] == 0x64)))
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
if (n < 0x190) then
loop((n + 0x1))
end
end
local o = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
loop(0x0)
end})
local script = "\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{32}\u{3b}\u{20}\u{73}\u{65}\u{74}\u{74}\u{6f}\u{70}\u{20}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}"
assert((T.testC(script,o) == script))
end
local function foo
()
local y <close> = func2close(function ()
T.alloccount()
end)
local x <close> = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
T.alloccount(0x0)
;
local x = {}
end})
error(0x3e8)
end
stack(0x5)
local _,msg = pcall(foo)
assert((msg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}"))
local closemsg
local close = func2close(function (self,msg)
T.alloccount()
closemsg=msg
end)
local function enter
(count)
stack(0xa)
T.alloccount(count)
closemsg=nil
return close
end
local function test
()
local x <close> = enter(0x0)
local y = {}
end
local _,msg = pcall(test)
assert(((msg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}") and (closemsg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}")))
local function test
()
local xxx <close> = func2close(function (self,msg)
assert((msg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}"))
;
error(0x3e8)
end)
local xx <close> = func2close(function (self,msg)
assert((msg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}"))
;
end)
local x <close> = enter(0x0)
local y = {}
end
local _,msg = pcall(test)
assert(((msg == 0x3e8) and (closemsg == "\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}")))
do
collectgarbage()
local s = string.rep("\u{61}",0x2710)
local m = T.totalmem()
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
s=string.upper(s)
assert(((T.totalmem() - m) <= 0x2af8))
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
end
do
local lim = 0x2710
local extra = 0x7d0
local s = string.rep("\u{61}",lim)
local a = {s,s}
collectgarbage()
;
collectgarbage()
local m = T.totalmem()
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
T.totalmem((m + extra))
assert(not pcall(table.concat,a))
assert(((T.totalmem() - m) <= extra))
T.totalmem(((m + lim) + extra))
assert(not pcall(table.concat,a))
assert(((T.totalmem() - m) <= extra))
T.totalmem(((m + (0x2 * lim)) + extra))
assert(not pcall(table.concat,a))
assert(((T.totalmem() - m) <= extra))
T.totalmem(((m + (0x4 * lim)) + extra))
assert(# (table.concat(a) == (0x2 * lim)))
T.totalmem(0x0)
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
print("\u{2b}")
end
do
local trace = {}
local function hook
(event)
trace[# (trace + 0x1)]=(event .. ("\u{20}" .. ((debug.getinfo(0x2).name or "\u{3f}"))))
end
local x = func2close(function (_,msg)
trace[# (trace + 0x1)]="\u{78}"
end)
local y = func2close(function (_,msg)
trace[# (trace + 0x1)]="\u{79}"
end)
debug.sethook(hook,"\u{72}")
local t = {T.testC("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{32}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{78}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{6e}\u{75}\u{6d}\u{20}\u{31}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{75}\u{73}\u{68}\u{69}\u{6e}\u{74}\u{20}\u{32}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{33}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{23}\u{20}\u{79}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{32}\u{a}\u{20}\u{20}\u{20}\u{20}",x,y)}
debug.sethook()
checktable(trace,{"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{73}\u{65}\u{74}\u{68}\u{6f}\u{6f}\u{6b}","\u{79}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{3f}","\u{78}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{3f}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}"})
checktable(t,{0xa,0x14})
end
end
do
local trace = {}
local function hook
(event)
trace[# (trace + 0x1)]=(event .. ("\u{20}" .. debug.getinfo(0x2).name))
end
local function foo
(...)
local x <close> = func2close(function (_,msg)
trace[# (trace + 0x1)]="\u{78}"
end)
local y <close> = func2close(function (_,msg)
debug.sethook(hook,"\u{72}")
end)
return ...
end
local t = {foo(0xa,0x14,0x1e)}
debug.sethook()
checktable(t,{0xa,0x14,0x1e})
checktable(trace,{"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{73}\u{65}\u{74}\u{68}\u{6f}\u{6f}\u{6b}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}","\u{78}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{6f}\u{6f}"})
end
print("\u{74}\u{6f}\u{2d}\u{62}\u{65}\u{2d}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{73}")
do
local trace = {}
local co = coroutine.wrap(function ()
trace[# (trace + 0x1)]="\u{6e}\u{6f}\u{77}\u{58}"
local x <close> = func2close(function (_,msg)
assert((msg == nil))
trace[# (trace + 0x1)]="\u{78}\u{31}"
coroutine.yield("\u{78}")
trace[# (trace + 0x1)]="\u{78}\u{32}"
end)
return pcall(function ()
do
local z <close> = func2close(function (_,msg)
assert((msg == nil))
trace[# (trace + 0x1)]="\u{7a}\u{31}"
coroutine.yield("\u{7a}")
trace[# (trace + 0x1)]="\u{7a}\u{32}"
end)
end
trace[# (trace + 0x1)]="\u{6e}\u{6f}\u{77}\u{59}"
local y <close> = func2close(function (_,msg)
assert((msg == nil))
trace[# (trace + 0x1)]="\u{79}\u{31}"
coroutine.yield("\u{79}")
trace[# (trace + 0x1)]="\u{79}\u{32}"
end)
return 0xa,0x14,0x1e
end)
end)
assert((co() == "\u{7a}"))
assert((co() == "\u{79}"))
assert((co() == "\u{78}"))
checktable({co()},{true,0xa,0x14,0x1e})
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
assert(((res.n == 0x2) and (res[0x2] == nil)))
local res2 = table.pack(co())
assert((res2.n == t.n))
for i = 0x1, # t
do
if (t[i] == "\u{78}") then
assert((res2[i] == res[0x1]))
else
assert((res2[i] == t[i]))
end
end
end
local function foo
()
local x <close> = func2close(coroutine.yield)
local extra <close> = func2close(function (self)
assert((self == extrares))
coroutine.yield(0x64)
end)
extrares=extra
return table.unpack({0xa,x,0x1e})
end
check(foo,true,0xa,"\u{78}",0x1e)
assert((extrares == 0x64))
local function foo
()
local x <close> = func2close(coroutine.yield)
return 
end
check(foo,false)
local function foo
()
local x <close> = func2close(coroutine.yield)
local y,z = 0x14,0x1e
return x
end
check(foo,false,"\u{78}")
local function foo
()
local x <close> = func2close(coroutine.yield)
local extra <close> = func2close(coroutine.yield)
return table.unpack({},0x1,0x64)
end
check(foo,true,table.unpack({},0x1,0x64))
end
do
local co = coroutine.wrap(function ()
local function foo
(err)
local z <close> = func2close(function (_,msg)
assert(((msg == nil) or (msg == (err + 0x14))))
coroutine.yield("\u{7a}")
return 0x64,0xc8
end)
local y <close> = func2close(function (_,msg)
assert(((msg == err) or (((msg == nil) and (err == 0x1)))))
coroutine.yield("\u{79}")
if err then
error((err + 0x14))
end
end)
local x <close> = func2close(function (_,msg)
assert(((msg == err) or (((msg == nil) and (err == 0x1)))))
coroutine.yield("\u{78}")
return 0x64,0xc8
end)
if (err == 0xa) then
error(err)
else
return 0xa,0x14
end
end
coroutine.yield(pcall(foo,nil))
coroutine.yield(pcall(foo,0x1))
return pcall(foo,0xa)
end)
local a,b = co()
assert(((a == "\u{78}") and (b == nil)))
a,b=co()
assert(((a == "\u{79}") and (b == nil)))
a,b=co()
assert(((a == "\u{7a}") and (b == nil)))
local a,b,c = co()
assert(((a and (b == 0xa)) and (c == 0x14)))
local a,b = co()
assert(((a == "\u{78}") and (b == nil)))
a,b=co()
assert(((a == "\u{79}") and (b == nil)))
a,b=co()
assert(((a == "\u{7a}") and (b == nil)))
local st,msg = co()
assert(not (st and (msg == 0x15)))
local a,b = co()
assert(((a == "\u{78}") and (b == nil)))
a,b=co()
assert(((a == "\u{79}") and (b == nil)))
a,b=co()
assert(((a == "\u{7a}") and (b == nil)))
local st,msg = co()
assert(not (st and (msg == (0xa + 0x14))))
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
coroutine.yield(0x64)
end
coroutine.yield(0xc8)
error(0x17)
end)
local b = co()
assert(((b == 0x64) and not (x and not y)))
b=co()
assert(((b == 0xc8) and not (x and y)))
local a,b = pcall(co)
assert(not (((a and (b == 0x17)) and x) and y))
end
do
local x = 0x0
local co = coroutine.wrap(function ()
local xx <close> = func2close(function (_,msg)
x=(x + 0x1)
;
assert(string.find(msg,"\u{40}\u{58}\u{58}\u{58}"))
error("\u{40}\u{59}\u{59}\u{59}")
end)
local xv <close> = func2close(function ()
x=(x + 0x1)
;
error("\u{40}\u{58}\u{58}\u{58}")
end)
coroutine.yield(0x64)
error(0xc8)
end)
assert((co() == 0x64))
;
assert((x == 0x0))
local st,msg = pcall(co)
;
assert((x == 0x2))
assert(not (st and string.find(msg,"\u{40}\u{59}\u{59}\u{59}")))
local x = 0x0
local y = 0x0
co=coroutine.wrap(function ()
local xx <close> = func2close(function (_,err)
y=(y + 0x1)
;
assert(string.find(err,"\u{58}\u{58}\u{58}"))
error("\u{59}\u{59}\u{59}")
end)
local xv <close> = func2close(function ()
x=(x + 0x1)
;
error("\u{58}\u{58}\u{58}")
end)
coroutine.yield(0x64)
return 0xc8
end)
assert((co() == 0x64))
;
assert((x == 0x0))
local st,msg = pcall(co)
assert(((x == 0x1) and (y == 0x1)))
assert(not (st and string.find(msg,"\u{25}\u{77}\u{2b}\u{25}\u{2e}\u{25}\u{77}\u{2b}\u{3a}\u{25}\u{64}\u{2b}\u{3a}\u{20}\u{59}\u{59}\u{59}")))
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
assert((co == nil))
collectgarbage()
if rawget(_G,"\u{54}") then
print("\u{74}\u{6f}\u{2d}\u{62}\u{65}\u{2d}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{73}\u{20}\u{78}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{43}")
do
local token = 0x0
local count = 0x0
local f = T.makeCfunc("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{32}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2e}\u{a}\u{20}\u{20}\u{20}\u{20}")
local obj = func2close(function (_,msg)
count=(count + 0x1)
token=coroutine.yield(count,token)
end)
local co = coroutine.wrap(f)
local ct,res = co(obj,obj,0xa,0x14,0x1e,0x3)
assert(((ct == 0x1) and (res == 0x0)))
ct,res=co(0x64)
assert(((ct == 0x2) and (res == 0x64)))
res={co(0xc8)}
assert(((((res[0x1] == 0xa) and (res[0x2] == 0x14)) and (res[0x3] == 0x1e)) and (res[0x4] == nil)))
assert((token == 0xc8))
end
do
local f = T.makeCfunc("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2e}\u{a}\u{20}\u{20}\u{20}\u{20}")
local obj = func2close(function ()
local temp
local x <close> = func2close(function ()
coroutine.yield(temp)
return 0x1,0x2,0x3
end)
temp=coroutine.yield("\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{62}\u{6a}")
return 0x1,0x2,0x3
end)
local co = coroutine.wrap(f)
local res = co(obj,0xa,0x1e,0x1)
assert((res == "\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{62}\u{6a}"))
res=co("\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{78}")
assert((res == "\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{78}"))
res={co()}
assert(((res[0x1] == 0x1e) and (res[0x2] == nil)))
end
do
local f = T.makeCfunc("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{73}\u{6c}\u{6f}\u{74}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}")
local obj = func2close(coroutine.yield)
local co = coroutine.create(f)
local st,msg = coroutine.resume(co,obj)
assert(not (st and string.find(msg,"\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{61}\u{63}\u{72}\u{6f}\u{73}\u{73}")))
local f = T.makeCfunc("\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{6f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}")
local st,msg = pcall(f,obj)
assert(not (st and string.find(msg,"\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{66}\u{72}\u{6f}\u{6d}\u{20}\u{6f}\u{75}\u{74}\u{73}\u{69}\u{64}\u{65}")))
end
end
do
local numopen = 0x0
local function open
(x)
numopen=(numopen + 0x1)
return function ()
x=(x - 0x1)
if (x > 0x0) then
return x
end
end,nil,nil,func2close(function ()
numopen=(numopen - 0x1)
end)
end
local s = 0x0
for i in open(0xa)
do
s=(s + i)
end
assert(((s == 0x2d) and (numopen == 0x0)))
local s = 0x0
for i in open(0xa)
do
if (i < 0x5) then
break
end
s=(s + i)
end
assert(((s == 0x23) and (numopen == 0x0)))
local s = 0x0
for i in open(0xa)
do
for j in open(0xa)
do
if ((i + j) < 0x5) then
goto endloop
end
s=(s + i)
end
end
::endloop::
assert(((s == 0x177) and (numopen == 0x0)))
end
print("\u{4f}\u{4b}")
return 0x5,f
end