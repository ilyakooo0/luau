collectgarbage()
local function errmsg
(code,m)
local st,msg = load(code)
assert(not st and string.find(msg,m))
end
errmsg("\u{20}\u{67}\u{6f}\u{74}\u{6f}\u{20}\u{6c}\u{31}\u{3b}\u{20}\u{64}\u{6f}\u{20}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}\u{65}\u{6e}\u{64}\u{20}","\u{6c}\u{61}\u{62}\u{65}\u{6c}\u{20}\u{27}\u{6c}\u{31}\u{27}")
errmsg("\u{20}\u{64}\u{6f}\u{20}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}\u{65}\u{6e}\u{64}\u{20}\u{67}\u{6f}\u{74}\u{6f}\u{20}\u{6c}\u{31}\u{3b}\u{20}","\u{6c}\u{61}\u{62}\u{65}\u{6c}\u{20}\u{27}\u{6c}\u{31}\u{27}")
errmsg("\u{20}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}","\u{6c}\u{61}\u{62}\u{65}\u{6c}\u{20}\u{27}\u{6c}\u{31}\u{27}")
errmsg("\u{20}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}\u{64}\u{6f}\u{20}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}\u{65}\u{6e}\u{64}","\u{6c}\u{61}\u{62}\u{65}\u{6c}\u{20}\u{27}\u{6c}\u{31}\u{27}")
errmsg("\u{20}\u{67}\u{6f}\u{74}\u{6f}\u{20}\u{6c}\u{31}\u{3b}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{61}\u{20}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}\u{3a}\u{3a}\u{6c}\u{32}\u{3a}\u{3a}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{33}\u{29}\u{20}","\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{27}\u{61}\u{61}\u{27}")
errmsg("\u{64}\u{6f}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{62}\u{62}\u{2c}\u{20}\u{63}\u{63}\u{3b}\u{20}\u{67}\u{6f}\u{74}\u{6f}\u{20}\u{6c}\u{31}\u{3b}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{61}\u{a}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{33}\u{29}\u{a}","\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{27}\u{61}\u{61}\u{27}")
errmsg("\u{20}\u{64}\u{6f}\u{20}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}\u{65}\u{6e}\u{64}\u{20}\u{67}\u{6f}\u{74}\u{6f}\u{20}\u{6c}\u{31}\u{20}","\u{6c}\u{61}\u{62}\u{65}\u{6c}\u{20}\u{27}\u{6c}\u{31}\u{27}")
errmsg("\u{20}\u{67}\u{6f}\u{74}\u{6f}\u{20}\u{6c}\u{31}\u{20}\u{64}\u{6f}\u{20}\u{3a}\u{3a}\u{6c}\u{31}\u{3a}\u{3a}\u{20}\u{65}\u{6e}\u{64}\u{20}","\u{6c}\u{61}\u{62}\u{65}\u{6c}\u{20}\u{27}\u{6c}\u{31}\u{27}")
errmsg("\u{20}\u{20}\u{72}\u{65}\u{70}\u{65}\u{61}\u{74}\u{a}\u{20}\u{20}\u{20}\u{20}\u{69}\u{66}\u{20}\u{78}\u{20}\u{74}\u{68}\u{65}\u{6e}\u{20}\u{67}\u{6f}\u{74}\u{6f}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{75}\u{78}\u{75}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{3a}\u{3a}\u{63}\u{6f}\u{6e}\u{74}\u{3a}\u{3a}\u{a}\u{20}\u{20}\u{75}\u{6e}\u{74}\u{69}\u{6c}\u{20}\u{78}\u{75}\u{78}\u{75}\u{20}\u{3c}\u{20}\u{78}\u{a}","\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{27}\u{78}\u{75}\u{78}\u{75}\u{27}")
local x
do
local y = 12
goto l1
::l2::
x=x + 1
;
goto l3
::l1::
x=y
;
goto l2
end
::l3::
::l3_1::
assert(x == 13)
do
local prog = "\u{20}\u{20}\u{64}\u{6f}\u{a}\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{20}\u{67}\u{6f}\u{74}\u{6f}\u{20}\u{6c}\u{25}\u{73}\u{61}\u{3b}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{61}\u{20}\u{2b}\u{20}\u{31}\u{a}\u{20}\u{20}\u{20}\u{3a}\u{3a}\u{6c}\u{25}\u{73}\u{61}\u{3a}\u{3a}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{61}\u{20}\u{2b}\u{20}\u{31}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{67}\u{6f}\u{74}\u{6f}\u{20}\u{6c}\u{25}\u{73}\u{62}\u{3b}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{61}\u{20}\u{2b}\u{20}\u{32}\u{a}\u{20}\u{20}\u{20}\u{3a}\u{3a}\u{6c}\u{25}\u{73}\u{62}\u{3a}\u{3a}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{61}\u{20}\u{2b}\u{20}\u{32}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{61}\u{a}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}"
local label = string.rep("\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",40)
prog=string.format(prog,label,label,label,label)
assert(assert(load(prog))() == 31)
end
do
goto l1
local a = 23
x=a
::l1::
;
end
while true do
goto l4
goto l1
goto l1
local x = 45
::l1::
;
;
;
end
::l4::
assert(x == 13)
if print then
goto l1
error("\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}")
goto l2
local x
::l1::
;
::l2::
;
;
else

end
local function foo
()
local a = {}
goto l3
::l1::
a[# a + 1]=1
;
goto l2
;
::l2::
a[# a + 1]=2
;
goto l5
;
::l3::
::l3a::
a[# a + 1]=3
;
goto l1
;
::l4::
a[# a + 1]=4
;
goto l6
;
::l5::
a[# a + 1]=5
;
goto l4
;
::l6::
assert(a[1] == 3 and a[2] == 1 and a[3] == 2 and a[4] == 5 and a[5] == 4)
if not a[6] then
a[6]=true
;
goto l3a
end
end
::l6::
foo()
do
local x
::L1::
local y
assert(y == nil)
y=true
if x == nil then
x=1
goto L1
else
x=x + 1
end
assert(x == 2 and y == true)
end
do
local first = true
local a = false
if true then
goto LBL
::loop::
a=true
::LBL::
if first then
first=false
goto loop
end
end
assert(a)
end
do
goto escape
::a::
goto a
::b::
goto c
::c::
goto b
end
::escape::
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local function foo
()
local t = {}
do
local i = 1
local a,b,c,d
t[1]=function ()
return a,b,c,d
end
::l1::
local b
do
local c
t[# t + 1]=function ()
return a,b,c,d
end
if i > 2 then
goto l2
end
do
local d
t[# t + 1]=function ()
return a,b,c,d
end
i=i + 1
local a
goto l1
end
end
end
::l2::
return t
end
local a = foo()
assert(# a == 6)
for i = 2, 6
do
assert(debug.upvalueid(a[1],1) == debug.upvalueid(a[i],1))
end
for i = 2, 6
do
assert(debug.upvalueid(a[1],2) ~= debug.upvalueid(a[i],2))
assert(debug.upvalueid(a[1],3) ~= debug.upvalueid(a[i],3))
end
for i = 3, 5, 2
do
assert(debug.upvalueid(a[i],2) == debug.upvalueid(a[i - 1],2))
assert(debug.upvalueid(a[i],3) == debug.upvalueid(a[i - 1],3))
assert(debug.upvalueid(a[i],2) ~= debug.upvalueid(a[i + 1],2))
assert(debug.upvalueid(a[i],3) ~= debug.upvalueid(a[i + 1],3))
end
for i = 2, 6, 2
do
assert(debug.upvalueid(a[1],4) == debug.upvalueid(a[i],4))
end
for i = 3, 5, 2
do
for j = 1, 6
do
assert((debug.upvalueid(a[i],4) == debug.upvalueid(a[j],4)) == (i == j))
end
end
local function testG
(a)
if a == 1 then
goto l1
error("\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{65}\u{76}\u{65}\u{72}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}")
elseif a == 2 then
goto l2
elseif a == 3 then
goto l3
elseif a == 4 then
goto l1
error("\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{65}\u{76}\u{65}\u{72}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}")
::l1::
a=a + 1
else
goto l4
::l4a::
a=a * 2
;
goto l4b
error("\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{65}\u{76}\u{65}\u{72}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}")
::l4::
goto l4a
error("\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{65}\u{76}\u{65}\u{72}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}\u{21}")
::l4b::
end
do
return a
end
::l2::
do
return "\u{32}"
end
::l3::
do
return "\u{33}"
end
::l1::
return "\u{31}"
end
assert(testG(1) == "\u{31}")
assert(testG(2) == "\u{32}")
assert(testG(3) == "\u{33}")
assert(testG(4) == 5)
assert(testG(5) == 10)
do
local X
goto L1
::L2::
goto L3
::L1::
do
local a <close> = setmetatable({},{["\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}"] = function ()
X=true
end})
assert(X == nil)
if a then
goto L2
end
end
::L3::
assert(X == true)
end
print("\u{4f}\u{4b}")