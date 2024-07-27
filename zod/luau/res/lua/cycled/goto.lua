collectgarbage()
local function errmsg
(code,m)
local st,msg = load(code)
assert(not st and string.find(msg,m))
end
errmsg("\32\103\111\116\111\32\108\49\59\32\100\111\32\58\58\108\49\58\58\32\101\110\100\32","\108\97\98\101\108\32\39\108\49\39")
errmsg("\32\100\111\32\58\58\108\49\58\58\32\101\110\100\32\103\111\116\111\32\108\49\59\32","\108\97\98\101\108\32\39\108\49\39")
errmsg("\32\58\58\108\49\58\58\32\58\58\108\49\58\58\32","\108\97\98\101\108\32\39\108\49\39")
errmsg("\32\58\58\108\49\58\58\32\100\111\32\58\58\108\49\58\58\32\101\110\100","\108\97\98\101\108\32\39\108\49\39")
errmsg("\32\103\111\116\111\32\108\49\59\32\108\111\99\97\108\32\97\97\32\58\58\108\49\58\58\32\58\58\108\50\58\58\32\112\114\105\110\116\40\51\41\32","\108\111\99\97\108\32\39\97\97\39")
errmsg("\100\111\32\108\111\99\97\108\32\98\98\44\32\99\99\59\32\103\111\116\111\32\108\49\59\32\101\110\100\10\108\111\99\97\108\32\97\97\10\58\58\108\49\58\58\32\112\114\105\110\116\40\51\41\10","\108\111\99\97\108\32\39\97\97\39")
errmsg("\32\100\111\32\58\58\108\49\58\58\32\101\110\100\32\103\111\116\111\32\108\49\32","\108\97\98\101\108\32\39\108\49\39")
errmsg("\32\103\111\116\111\32\108\49\32\100\111\32\58\58\108\49\58\58\32\101\110\100\32","\108\97\98\101\108\32\39\108\49\39")
errmsg("\32\32\114\101\112\101\97\116\10\32\32\32\32\105\102\32\120\32\116\104\101\110\32\103\111\116\111\32\99\111\110\116\32\101\110\100\10\32\32\32\32\108\111\99\97\108\32\120\117\120\117\32\61\32\49\48\10\32\32\32\32\58\58\99\111\110\116\58\58\10\32\32\117\110\116\105\108\32\120\117\120\117\32\60\32\120\10","\108\111\99\97\108\32\39\120\117\120\117\39")
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
local prog = "\32\32\100\111\10\32\32\32\32\108\111\99\97\108\32\97\32\61\32\49\10\32\32\32\32\103\111\116\111\32\108\37\115\97\59\32\97\32\61\32\97\32\43\32\49\10\32\32\32\58\58\108\37\115\97\58\58\32\97\32\61\32\97\32\43\32\49\48\10\32\32\32\32\103\111\116\111\32\108\37\115\98\59\32\97\32\61\32\97\32\43\32\50\10\32\32\32\58\58\108\37\115\98\58\58\32\97\32\61\32\97\32\43\32\50\48\10\32\32\32\32\114\101\116\117\114\110\32\97\10\32\32\101\110\100\10\32\32"
local label = string.rep("\48\49\50\51\52\53\54\55\56\57",40)
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
error("\115\104\111\117\108\100\32\110\111\116\32\98\101\32\104\101\114\101")
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
local debug = require("\100\101\98\117\103")
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
error("\115\104\111\117\108\100\32\110\101\118\101\114\32\98\101\32\104\101\114\101\33")
elseif a == 2 then
goto l2
elseif a == 3 then
goto l3
elseif a == 4 then
goto l1
error("\115\104\111\117\108\100\32\110\101\118\101\114\32\98\101\32\104\101\114\101\33")
::l1::
a=a + 1
else
goto l4
::l4a::
a=a * 2
;
goto l4b
error("\115\104\111\117\108\100\32\110\101\118\101\114\32\98\101\32\104\101\114\101\33")
::l4::
goto l4a
error("\115\104\111\117\108\100\32\110\101\118\101\114\32\98\101\32\104\101\114\101\33")
::l4b::
end
do
return a
end
::l2::
do
return "\50"
end
::l3::
do
return "\51"
end
::l1::
return "\49"
end
assert(testG(1) == "\49")
assert(testG(2) == "\50")
assert(testG(3) == "\51")
assert(testG(4) == 5)
assert(testG(5) == 10)
do
local X
goto L1
::L2::
goto L3
::L1::
do
local a <close> = setmetatable({},{["\95\95\99\108\111\115\101"] = function ()
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
print("\79\75")