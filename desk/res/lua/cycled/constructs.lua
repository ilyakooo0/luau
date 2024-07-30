;
;
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{79}\u{6e}\u{74}\u{61}\u{78}")
;
;
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local function checkload
(s,msg)
assert(string.find(select(0x2,load(s)),msg))
end
local a
do
;
;
;
end
;
do
;
a=0x3
;
assert((a == 0x3))
end
;
;
if false then
a=(0x3 // 0x0)
;
a=(0x0 % 0x0)
end
assert((((0x2 ^ 0x3) ^ 0x2) == (0x2 ^ (0x3 ^ 0x2))))
;
assert((((0x2 ^ 0x3) * 0x4) == ((0x2 ^ 0x3) * 0x4)))
;
assert((2.0 ^ - ((0x2 == (0x1 / 0x4)) and - (0x2 ^ - - (0x2 == - - - 0x4)))))
;
assert(not ((nil and 0x2) and not ((0x2 > 0x3) or (0x3 < 0x2))))
;
assert(- (((0x3 - 0x1) - 0x5) == ((0x0 + 0x0) - 0x9)))
;
assert(- ((0x2 ^ 0x2) == - ((0x4 and (((- 0x2) ^ 0x2) == 0x4)) and ((((0x2 * 0x2) - 0x3) - 0x1) == 0x0))))
;
assert(- (((0x3 % 0x5) == 0x2) and - ((0x3 + 0x5) == 0x2)))
assert(((((0x2 * 0x1) + (0x3 / 0x3)) == 0x3) and (((0x1 + 0x2) .. (0x3 * 0x1)) == "\u{33}\u{33}")))
;
assert(not (((0x2 + 0x1) > (0x3 * 0x1)) and (("\u{61}" .. "\u{62}") > "\u{61}")))
;
assert(((0xf0 | (0xcc ~ (0xaa & 0xfd))) == 0xf4))
assert(((((0xfd & 0xaa) ~ 0xcc) | 0xf0) == 0xf4))
assert(((0xf0 & (0xf + 0x1)) == 0x10))
assert(((((0x3 ^ 0x4) // (0x2 ^ 0x3)) // 0x5) == 0x2))
assert(- (((0x3 + (((0x4 * 0x5) // ((0x2 ^ 0x3) ^ 0x2)) // 0x9)) + ((0x4 % 0xa) / 0x3)) == (((- 0x3) + (((0x4 * 0x5) // (0x2 ^ (0x3 ^ 0x2))) // 0x9)) + ((0x4 % 0xa) / 0x3))))
assert(not ((true or false) and nil))
assert((true or (false and nil)))
assert(((((0x1 or false) and true) or false) == true))
assert(((((nil and true) or false) and true) == false))
local a,b = 0x1,nil
;
assert(- ((0x1 or 0x2) == - (0x1 and (((0x1 and 0x2) + (- (1.25 or - 0x4))) == 0.75))))
;
local x = ((((b or a) + 0x1) == 0x2) and (((0xa or a) + 0x1) == 0xb))
;
assert(x)
;
x=((((0x2 < 0x3) or 0x1) == true) and (((0x2 < 0x3) and 0x4) == 0x4))
;
assert(x)
;
local x,y = 0x1,0x2
;
assert((((x > y) and x) or (y == 0x2)))
;
x,y=0x2,0x1
;
assert((((x > y) and x) or (y == 0x2)))
;
assert(((0x499602d2 == tonumber("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}")) and ((0x499602d2 + 0x1) == 0x499602d3)))
do
local operand = {0x3,0x64,5.0,- 0xa,- 5.0,0x2710,- 0x2710}
local operator = {"\u{2b}","\u{2d}","\u{2a}","\u{2f}","\u{2f}\u{2f}","\u{25}","\u{5e}","\u{26}","\u{7c}","\u{5e}","\u{3c}\u{3c}","\u{3e}\u{3e}","\u{3d}\u{3d}","\u{7e}\u{3d}","\u{3c}","\u{3e}","\u{3c}\u{3d}","\u{3e}\u{3d}"}
for _,op in ipairs(operator)
do
local f = assert(load(string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{78}\u{2c}\u{79}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}\u{20}\u{25}\u{73}\u{20}\u{79}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}",op)))()
;
for _,o1 in ipairs(operand)
do
for _,o2 in ipairs(operand)
do
local gab = f(o1,o2)
_ENV.XX=o1
local code = string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{58}\u{58}\u{20}\u{25}\u{73}\u{20}\u{25}\u{73}",op,o2)
local res = assert(load(code))()
assert((res == gab))
_ENV.XX=o2
code=string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{25}\u{73}\u{29}\u{20}\u{25}\u{73}\u{20}\u{58}\u{58}",o1,op)
res=assert(load(code))()
assert((res == gab))
code=string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{25}\u{73}\u{29}\u{20}\u{25}\u{73}\u{20}\u{25}\u{73}",o1,op,o2)
res=assert(load(code))()
assert((res == gab))
end
end
end
_ENV.XX=nil
end
repeat

until 0x1
;
repeat

until true
;
while false do

end
;
while nil do

end
;
do
local a
;
local function f
(x)
x={["\u{61}"] = 0x1}
;
x={["\u{78}"] = 0x1}
;
x={["\u{47}"] = 0x1}
end
end
do
local code = {"\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{7b}"}
for i = 0x1, 0x101
do
code[# (code + 0x1)]=(i .. "\u{2e}\u{31}\u{2c}")
end
code[# (code + 0x1)]="\u{7d}\u{3b}"
code=table.concat(code)
local function check
(ret,val)
local code = (code .. ret)
code=load(code)
assert((code() == val))
end
check("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{31}\u{20}\u{7e}\u{20}\u{28}\u{32}\u{20}\u{6f}\u{72}\u{20}\u{33}\u{29}\u{29}",(0x1 ~ 0x2))
check("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{31}\u{20}\u{7c}\u{20}\u{28}\u{32}\u{20}\u{6f}\u{72}\u{20}\u{33}\u{29}\u{29}",(0x1 | 0x2))
check("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{31}\u{20}\u{2b}\u{20}\u{28}\u{32}\u{20}\u{6f}\u{72}\u{20}\u{33}\u{29}\u{29}",(0x1 + 0x2))
check("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{31}\u{20}\u{3c}\u{3c}\u{20}\u{28}\u{32}\u{20}\u{6f}\u{72}\u{20}\u{33}\u{29}\u{29}",(0x1 << 0x2))
end
local function f
(i)
if (type(i) ~= "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}") then
return i,"\u{6a}\u{6f}\u{6a}\u{6f}"
end
;
if (i > 0x0) then
return i,f((i - 0x1))
end
;
end
x={f(0x3),f(0x5),f(0xa)}
;
assert((((((x[0x1] == 0x3) and (x[0x2] == 0x5)) and (x[0x3] == 0xa)) and (x[0x4] == 0x9)) and (x[0xc] == 0x1)))
;
assert((x[nil] == nil))
x={f("\u{61}\u{6c}\u{6f}"),f("\u{78}\u{69}\u{78}\u{69}"),nil}
;
assert((((x[0x1] == "\u{61}\u{6c}\u{6f}") and (x[0x2] == "\u{78}\u{69}\u{78}\u{69}")) and (x[0x3] == nil)))
;
x={(f("\u{61}\u{6c}\u{6f}") .. "\u{78}\u{69}\u{78}\u{69}")}
;
assert((x[0x1] == "\u{61}\u{6c}\u{6f}\u{78}\u{69}\u{78}\u{69}"))
x={f({})}
assert(((x[0x2] == "\u{6a}\u{6f}\u{6a}\u{6f}") and (type(x[0x1]) == "\u{74}\u{61}\u{62}\u{6c}\u{65}")))
local f = function (i)
if (i < 0xa) then
return "\u{61}"
elseif (i < 0x14) then
return "\u{62}"
elseif (i < 0x1e) then
return "\u{63}"
end
;
end
assert(((((f(0x3) == "\u{61}") and (f(0xc) == "\u{62}")) and (f(0x1a) == "\u{63}")) and (f(0x64) == nil)))
for i = 0x1, 0x3e8
do
break
;
end
;
local n = 0x64
;
local i = 0x3
;
local t = {}
;
local a = nil
while not a do
a=0x0
;
for i = 0x1, n
do
for i = i, 0x1, - 0x1
do
a=(a + 0x1)
;
t[i]=0x1
;
end
;
end
;
end
assert(((a == ((n * (n + 0x1)) / 0x2)) and (i == 0x3)))
;
assert(((t[0x1] and t[n]) and not (t[0x0] and not t[(n + 0x1)])))
function f(b)
local x = 0x1
;
repeat
local a
;
if (b == 0x1) then
local b = 0x1
;
x=0xa
;
break
elseif (b == 0x2) then
x=0x14
;
break
;
elseif (b == 0x3) then
x=0x1e
;
else
local a,b,c,d = math.sin(0x1)
;
x=(x + 0x1)
;
end
until (x >= 0xc)
;
return x
end
;
assert(((((f(0x1) == 0xa) and (f(0x2) == 0x14)) and (f(0x3) == 0x1e)) and (f(0x4) == 0xc)))
local f = function (i)
if (i < 0xa) then
return "\u{61}"
elseif (i < 0x14) then
return "\u{62}"
elseif (i < 0x1e) then
return "\u{63}"
else
return 0x8
end
end
assert(((((f(0x3) == "\u{61}") and (f(0xc) == "\u{62}")) and (f(0x1a) == "\u{63}")) and (f(0x64) == 0x8)))
local a,b = nil,0x17
x={(((f(0x64) * 0x2) + 0x3) or a),(a or (b + 0x2))}
assert(((x[0x1] == 0x13) and (x[0x2] == 0x19)))
x={["\u{66}"] = ((0x2 + 0x3) or a),["\u{61}"] = (b + 0x2)}
assert(((x.f == 0x5) and (x.a == 0x19)))
a={["\u{79}"] = 0x1}
x={a.y}
assert((x[0x1] == 0x1))
local function f
(i)
while 0x1 do
if (i > 0x0) then
i=(i - 0x1)
;
else
return 
end
;
end
;
end
;
local function g
(i)
while 0x1 do
if (i > 0x0) then
i=(i - 0x1)
else
return 
end
end
end
f(0xa)
;
g(0xa)
;
do
function f()
return 0x1,0x2,0x3
end
local a,b,c = f()
;
assert((((a == 0x1) and (b == 0x2)) and (c == 0x3)))
a,b,c=(f())
;
assert((((a == 0x1) and (b == nil)) and (c == nil)))
end
local a,b = (0x3 and f())
;
assert(((a == 0x1) and (b == nil)))
function g()
f()
;
return 
end
;
assert((g() == nil))
function g()
return (nil or f())
end
a,b=g()
assert(((a == 0x1) and (b == nil)))
print("\u{2b}")
;
do
local prog <const> = "\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3c}\u{58}\u{58}\u{58}\u{3e}\u{20}\u{3d}\u{20}\u{31}\u{30}"
checkload(prog,"\u{75}\u{6e}\u{6b}\u{6e}\u{6f}\u{77}\u{6e}\u{20}\u{61}\u{74}\u{74}\u{72}\u{69}\u{62}\u{75}\u{74}\u{65}\u{20}\u{27}\u{58}\u{58}\u{58}\u{27}")
checkload("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{78}\u{78}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{32}\u{30}\u{3b}\u{20}\u{78}\u{78}\u{78}\u{20}\u{3d}\u{20}\u{31}\u{30}","\u{3a}\u{31}\u{3a}\u{20}\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{61}\u{73}\u{73}\u{69}\u{67}\u{6e}\u{20}\u{74}\u{6f}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{27}\u{78}\u{78}\u{78}\u{27}")
checkload("\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{78}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{78}\u{78}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{32}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{79}\u{79}\u{79}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{6f}\u{6f}\u{20}\u{28}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{62}\u{63}\u{20}\u{3d}\u{20}\u{78}\u{78}\u{20}\u{2b}\u{20}\u{79}\u{79}\u{79}\u{20}\u{2b}\u{20}\u{78}\u{78}\u{78}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{78}\u{78}\u{78}\u{20}\u{3d}\u{20}\u{79}\u{79}\u{79}\u{20}\u{65}\u{6e}\u{64}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}","\u{3a}\u{36}\u{3a}\u{20}\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{61}\u{73}\u{73}\u{69}\u{67}\u{6e}\u{20}\u{74}\u{6f}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{27}\u{78}\u{78}\u{78}\u{27}")
checkload("\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3c}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{3e}\u{20}\u{3d}\u{20}\u{6e}\u{69}\u{6c}\u{a}\u{20}\u{20}\u{20}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{69}\u{6f}\u{2e}\u{6f}\u{70}\u{65}\u{6e}\u{28}\u{29}\u{a}\u{20}\u{20}","\u{3a}\u{32}\u{3a}\u{20}\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{61}\u{73}\u{73}\u{69}\u{67}\u{6e}\u{20}\u{74}\u{6f}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{27}\u{78}\u{27}")
end
f="\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{20}\u{61}\u{20}\u{2c}\u{20}\u{62}\u{20}\u{2c}\u{20}\u{63}\u{20}\u{2c}\u{20}\u{64}\u{20}\u{2c}\u{20}\u{65}\u{20}\u{29}\u{a}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{61}\u{20}\u{3e}\u{3d}\u{20}\u{62}\u{20}\u{6f}\u{72}\u{20}\u{63}\u{20}\u{6f}\u{72}\u{20}\u{28}\u{20}\u{64}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{65}\u{20}\u{29}\u{20}\u{6f}\u{72}\u{20}\u{6e}\u{69}\u{6c}\u{a}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}\u{a}\u{65}\u{6e}\u{64}\u{20}\u{2c}\u{20}\u{7b}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{31}\u{20}\u{2c}\u{20}\u{62}\u{20}\u{3d}\u{20}\u{32}\u{20}\u{3e}\u{3d}\u{20}\u{31}\u{20}\u{2c}\u{20}\u{7d}\u{20}\u{6f}\u{72}\u{20}\u{7b}\u{20}\u{31}\u{20}\u{7d}\u{3b}\u{a}"
f=string.gsub(f,"\u{25}\u{73}\u{2b}","\u{a}")
;
f,a=load(f)()
;
assert(((a.a == 0x1) and a.b))
function g(a,b,c,d,e)
if not ((((a >= b) or c) or (d and e)) or nil) then
return 0x0
else
return 0x1
end
;
end
local function h
(a,b,c,d,e)
while ((((a >= b) or c) or (d and e)) or nil) do
return 0x1
end
;
return 0x0
end
;
assert((((f(0x2,0x1) == true) and (g(0x2,0x1) == 0x1)) and (h(0x2,0x1) == 0x1)))
assert((((f(0x1,0x2,"\u{61}") == "\u{61}") and (g(0x1,0x2,"\u{61}") == 0x1)) and (h(0x1,0x2,"\u{61}") == 0x1)))
assert((f(0x1,0x2,"\u{61}") ~= nil),"")
assert((((f(0x1,0x2,"\u{61}") == "\u{61}") and (g(0x1,0x2,"\u{61}") == 0x1)) and (h(0x1,0x2,"\u{61}") == 0x1)))
assert((((f(0x1,0x2,nil,0x1,"\u{78}") == "\u{78}") and (g(0x1,0x2,nil,0x1,"\u{78}") == 0x1)) and (h(0x1,0x2,nil,0x1,"\u{78}") == 0x1)))
assert((((f(0x1,0x2,nil,nil,"\u{78}") == nil) and (g(0x1,0x2,nil,nil,"\u{78}") == 0x0)) and (h(0x1,0x2,nil,nil,"\u{78}") == 0x0)))
assert((((f(0x1,0x2,nil,0x1,nil) == nil) and (g(0x1,0x2,nil,0x1,nil) == 0x0)) and (h(0x1,0x2,nil,0x1,nil) == 0x0)))
assert((((0x1 and ((0x2 < 0x3) == true)) and (0x2 < 0x3)) and (("\u{61}" < "\u{62}") == true)))
x=((0x2 < 0x3) and not 0x3)
;
assert((x == false))
x=((0x2 < 0x1) or ((0x2 > 0x1) and "\u{61}"))
;
assert((x == "\u{61}"))
do
local a
;
if nil then
a=0x1
;
else
a=0x2
;
end
;
assert((a == 0x2))
end
local function F
(a)
assert((debug.getinfo(0x1,"\u{6e}").name == "\u{46}"))
return a,0x2,0x3
end
a,b=(F(0x1) ~= nil)
;
assert(((a == true) and (b == nil)))
;
a,b=(F(nil) == nil)
;
assert(((a == true) and (b == nil)))
_ENV.GLOB1=math.random(0x0,0x1)
local basiccases = {{"\u{6e}\u{69}\u{6c}",nil},{"\u{66}\u{61}\u{6c}\u{73}\u{65}",false},{"\u{74}\u{72}\u{75}\u{65}",true},{"\u{31}\u{30}",0xa},{"\u{28}\u{30}\u{3d}\u{3d}\u{5f}\u{45}\u{4e}\u{56}\u{2e}\u{47}\u{4c}\u{4f}\u{42}\u{31}\u{29}",(0x0 == _ENV.GLOB1)}}
local prog
if (_ENV.GLOB1 == 0x0) then
basiccases[0x2][0x1]="\u{46}"
prog="\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{46}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{66}\u{61}\u{6c}\u{73}\u{65}\u{a}\u{20}\u{20}\u{20}\u{20}\u{69}\u{66}\u{20}\u{25}\u{73}\u{20}\u{74}\u{68}\u{65}\u{6e}\u{20}\u{49}\u{58}\u{20}\u{3d}\u{20}\u{74}\u{72}\u{75}\u{65}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{25}\u{73}\u{a}"
else
basiccases[0x4][0x1]="\u{6b}\u{31}\u{30}"
prog="\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{6b}\u{31}\u{30}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{69}\u{66}\u{20}\u{25}\u{73}\u{20}\u{74}\u{68}\u{65}\u{6e}\u{20}\u{49}\u{58}\u{20}\u{3d}\u{20}\u{74}\u{72}\u{75}\u{65}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{25}\u{73}\u{a}\u{20}\u{20}"
end
print(("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{68}\u{6f}\u{72}\u{74}\u{2d}\u{63}\u{69}\u{72}\u{63}\u{75}\u{69}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6d}\u{69}\u{7a}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{73}\u{20}\u{28}" .. (_ENV.GLOB1 .. "\u{29}")))
local binops <const> = {{"\u{20}\u{61}\u{6e}\u{64}\u{20}",function (a,b)
if not a then
return a
else
return b
end
end},{"\u{20}\u{6f}\u{72}\u{20}",function (a,b)
if a then
return a
else
return b
end
end}}
local cases <const> = {}
local function createcases
(n)
local res = {}
for i = 0x1, (n - 0x1)
do
for _,v1 in ipairs(cases[i])
do
for _,v2 in ipairs(cases[(n - i)])
do
for _,op in ipairs(binops)
do
local t = {("\u{28}" .. (v1[0x1] .. (op[0x1] .. (v2[0x1] .. "\u{29}")))),op[0x2](v1[0x2],v2[0x2])}
res[# (res + 0x1)]=t
res[# (res + 0x1)]={("\u{6e}\u{6f}\u{74}" .. t[0x1]),not t[0x2]}
end
end
end
end
return res
end
local level = ((_soft and 0x3) or 0x4)
cases[0x1]=basiccases
for i = 0x2, level
do
cases[i]=createcases(i)
end
print("\u{2b}")
local i = 0x0
for n = 0x1, level
do
for _,v in pairs(cases[n])
do
local s = v[0x1]
local p = load(string.format(prog,s,s),"")
IX=false
assert(((p() == v[0x2]) and (IX == not not v[0x2])))
i=(i + 0x1)
if ((i % 0xea60) == 0x0) then
print("\u{2b}")
end
end
end
IX=nil
_G.GLOB1=nil
checkload("\u{66}\u{6f}\u{72}\u{20}\u{78}\u{20}\u{64}\u{6f}","\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}")
checkload("\u{78}\u{3a}\u{63}\u{61}\u{6c}\u{6c}","\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}")
print("\u{4f}\u{4b}")