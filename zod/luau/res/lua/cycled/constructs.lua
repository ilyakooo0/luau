;
;
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{79}\u{6e}\u{74}\u{61}\u{78}")
;
;
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local function checkload
(s,msg)
assert(string.find(select(2,load(s)),msg))
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
a=3
;
assert(a == 3)
end
;
;
if false then
a=3 // 0
;
a=0 % 0
end
assert(2 ^ 3 ^ 2 == 2 ^ (3 ^ 2))
;
assert(2 ^ 3 * 4 == (2 ^ 3) * 4)
;
assert(2.0 ^ - 2 == 1 / 4 and - 2 ^ - - 2 == - - - 4)
;
assert(not nil and 2 and not (2 > 3 or 3 < 2))
;
assert(- 3 - 1 - 5 == 0 + 0 - 9)
;
assert(- 2 ^ 2 == - 4 and (- 2) ^ 2 == 4 and 2 * 2 - 3 - 1 == 0)
;
assert(- 3 % 5 == 2 and - 3 + 5 == 2)
assert(2 * 1 + 3 / 3 == 3 and 1 + 2 .. 3 * 1 == "\u{33}\u{33}")
;
assert(not (2 + 1 > 3 * 1) and "\u{61}" .. "\u{62}" > "\u{61}")
;
assert(240 | 204 ~ 170 & 253 == 244)
assert(253 & 170 ~ 204 | 240 == 244)
assert(240 & 15 + 1 == 16)
assert(3 ^ 4 // 2 ^ 3 // 5 == 2)
assert(- 3 + 4 * 5 // 2 ^ 3 ^ 2 // 9 + 4 % 10 / 3 == (- 3) + (((4 * 5) // (2 ^ (3 ^ 2))) // 9) + ((4 % 10) / 3))
assert(not ((true or false) and nil))
assert(true or false and nil)
assert((((1 or false) and true) or false) == true)
assert((((nil and true) or false) and true) == false)
local a,b = 1,nil
;
assert(- (1 or 2) == - 1 and (1 and 2) + (- 1.25 or - 4) == 0.75)
;
local x = ((b or a) + 1 == 2 and (10 or a) + 1 == 11)
;
assert(x)
;
x=(((2 < 3) or 1) == true and (2 < 3 and 4) == 4)
;
assert(x)
;
local x,y = 1,2
;
assert((x > y) and x or y == 2)
;
x,y=2,1
;
assert((x > y) and x or y == 2)
;
assert(1234567890 == tonumber("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}") and 1234567890 + 1 == 1234567891)
do
local operand = {3,100,5.0,- 10,- 5.0,10000,- 10000}
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
assert(res == gab)
_ENV.XX=o2
code=string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{25}\u{73}\u{29}\u{20}\u{25}\u{73}\u{20}\u{58}\u{58}",o1,op)
res=assert(load(code))()
assert(res == gab)
code=string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{25}\u{73}\u{29}\u{20}\u{25}\u{73}\u{20}\u{25}\u{73}",o1,op,o2)
res=assert(load(code))()
assert(res == gab)
end
end
end
_ENV.XX=nil
end
repeat

until 1
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
x={["\u{61}"] = 1}
;
x={["\u{78}"] = 1}
;
x={["\u{47}"] = 1}
end
end
do
local code = {"\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{7b}"}
for i = 1, 257
do
code[# code + 1]=i .. "\u{2e}\u{31}\u{2c}"
end
code[# code + 1]="\u{7d}\u{3b}"
code=table.concat(code)
local function check
(ret,val)
local code = code .. ret
code=load(code)
assert(code() == val)
end
check("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{31}\u{20}\u{7e}\u{20}\u{28}\u{32}\u{20}\u{6f}\u{72}\u{20}\u{33}\u{29}\u{29}",1 ~ 2)
check("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{31}\u{20}\u{7c}\u{20}\u{28}\u{32}\u{20}\u{6f}\u{72}\u{20}\u{33}\u{29}\u{29}",1 | 2)
check("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{31}\u{20}\u{2b}\u{20}\u{28}\u{32}\u{20}\u{6f}\u{72}\u{20}\u{33}\u{29}\u{29}",1 + 2)
check("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{28}\u{31}\u{20}\u{3c}\u{3c}\u{20}\u{28}\u{32}\u{20}\u{6f}\u{72}\u{20}\u{33}\u{29}\u{29}",1 << 2)
end
local function f
(i)
if type(i) ~= "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}" then
return i,"\u{6a}\u{6f}\u{6a}\u{6f}"
end
;
if i > 0 then
return i,f(i - 1)
end
;
end
x={f(3),f(5),f(10)}
;
assert(x[1] == 3 and x[2] == 5 and x[3] == 10 and x[4] == 9 and x[12] == 1)
;
assert(x[nil] == nil)
x={f("\u{61}\u{6c}\u{6f}"),f("\u{78}\u{69}\u{78}\u{69}"),nil}
;
assert(x[1] == "\u{61}\u{6c}\u{6f}" and x[2] == "\u{78}\u{69}\u{78}\u{69}" and x[3] == nil)
;
x={f("\u{61}\u{6c}\u{6f}") .. "\u{78}\u{69}\u{78}\u{69}"}
;
assert(x[1] == "\u{61}\u{6c}\u{6f}\u{78}\u{69}\u{78}\u{69}")
x={f({})}
assert(x[2] == "\u{6a}\u{6f}\u{6a}\u{6f}" and type(x[1]) == "\u{74}\u{61}\u{62}\u{6c}\u{65}")
local f = function (i)
if i < 10 then
return "\u{61}"
elseif i < 20 then
return "\u{62}"
elseif i < 30 then
return "\u{63}"
end
;
end
assert(f(3) == "\u{61}" and f(12) == "\u{62}" and f(26) == "\u{63}" and f(100) == nil)
for i = 1, 1000
do
break
;
end
;
local n = 100
;
local i = 3
;
local t = {}
;
local a = nil
while not a do
a=0
;
for i = 1, n
do
for i = i, 1, - 1
do
a=a + 1
;
t[i]=1
;
end
;
end
;
end
assert(a == n * (n + 1) / 2 and i == 3)
;
assert(t[1] and t[n] and not t[0] and not t[n + 1])
function f(b)
local x = 1
;
repeat
local a
;
if b == 1 then
local b = 1
;
x=10
;
break
elseif b == 2 then
x=20
;
break
;
elseif b == 3 then
x=30
;
else
local a,b,c,d = math.sin(1)
;
x=x + 1
;
end
until x >= 12
;
return x
end
;
assert(f(1) == 10 and f(2) == 20 and f(3) == 30 and f(4) == 12)
local f = function (i)
if i < 10 then
return "\u{61}"
elseif i < 20 then
return "\u{62}"
elseif i < 30 then
return "\u{63}"
else
return 8
end
end
assert(f(3) == "\u{61}" and f(12) == "\u{62}" and f(26) == "\u{63}" and f(100) == 8)
local a,b = nil,23
x={f(100) * 2 + 3 or a,a or b + 2}
assert(x[1] == 19 and x[2] == 25)
x={["\u{66}"] = 2 + 3 or a,["\u{61}"] = b + 2}
assert(x.f == 5 and x.a == 25)
a={["\u{79}"] = 1}
x={a.y}
assert(x[1] == 1)
local function f
(i)
while 1 do
if i > 0 then
i=i - 1
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
while 1 do
if i > 0 then
i=i - 1
else
return 
end
end
end
f(10)
;
g(10)
;
do
function f()
return 1,2,3
end
local a,b,c = f()
;
assert(a == 1 and b == 2 and c == 3)
a,b,c=(f())
;
assert(a == 1 and b == nil and c == nil)
end
local a,b = 3 and f()
;
assert(a == 1 and b == nil)
function g()
f()
;
return 
end
;
assert(g() == nil)
function g()
return nil or f()
end
a,b=g()
assert(a == 1 and b == nil)
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
assert(a.a == 1 and a.b)
function g(a,b,c,d,e)
if not (a >= b or c or d and e or nil) then
return 0
else
return 1
end
;
end
local function h
(a,b,c,d,e)
while (a >= b or c or (d and e) or nil) do
return 1
end
;
return 0
end
;
assert(f(2,1) == true and g(2,1) == 1 and h(2,1) == 1)
assert(f(1,2,"\u{61}") == "\u{61}" and g(1,2,"\u{61}") == 1 and h(1,2,"\u{61}") == 1)
assert(f(1,2,"\u{61}") ~= nil,"")
assert(f(1,2,"\u{61}") == "\u{61}" and g(1,2,"\u{61}") == 1 and h(1,2,"\u{61}") == 1)
assert(f(1,2,nil,1,"\u{78}") == "\u{78}" and g(1,2,nil,1,"\u{78}") == 1 and h(1,2,nil,1,"\u{78}") == 1)
assert(f(1,2,nil,nil,"\u{78}") == nil and g(1,2,nil,nil,"\u{78}") == 0 and h(1,2,nil,nil,"\u{78}") == 0)
assert(f(1,2,nil,1,nil) == nil and g(1,2,nil,1,nil) == 0 and h(1,2,nil,1,nil) == 0)
assert(1 and 2 < 3 == true and 2 < 3 and "\u{61}" < "\u{62}" == true)
x=2 < 3 and not 3
;
assert(x == false)
x=2 < 1 or (2 > 1 and "\u{61}")
;
assert(x == "\u{61}")
do
local a
;
if nil then
a=1
;
else
a=2
;
end
;
assert(a == 2)
end
local function F
(a)
assert(debug.getinfo(1,"\u{6e}").name == "\u{46}")
return a,2,3
end
a,b=F(1) ~= nil
;
assert(a == true and b == nil)
;
a,b=F(nil) == nil
;
assert(a == true and b == nil)
_ENV.GLOB1=math.random(0,1)
local basiccases = {{"\u{6e}\u{69}\u{6c}",nil},{"\u{66}\u{61}\u{6c}\u{73}\u{65}",false},{"\u{74}\u{72}\u{75}\u{65}",true},{"\u{31}\u{30}",10},{"\u{28}\u{30}\u{3d}\u{3d}\u{5f}\u{45}\u{4e}\u{56}\u{2e}\u{47}\u{4c}\u{4f}\u{42}\u{31}\u{29}",0 == _ENV.GLOB1}}
local prog
if _ENV.GLOB1 == 0 then
basiccases[2][1]="\u{46}"
prog="\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{46}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{66}\u{61}\u{6c}\u{73}\u{65}\u{a}\u{20}\u{20}\u{20}\u{20}\u{69}\u{66}\u{20}\u{25}\u{73}\u{20}\u{74}\u{68}\u{65}\u{6e}\u{20}\u{49}\u{58}\u{20}\u{3d}\u{20}\u{74}\u{72}\u{75}\u{65}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{25}\u{73}\u{a}"
else
basiccases[4][1]="\u{6b}\u{31}\u{30}"
prog="\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{6b}\u{31}\u{30}\u{20}\u{3c}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{3e}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{a}\u{20}\u{20}\u{20}\u{20}\u{69}\u{66}\u{20}\u{25}\u{73}\u{20}\u{74}\u{68}\u{65}\u{6e}\u{20}\u{49}\u{58}\u{20}\u{3d}\u{20}\u{74}\u{72}\u{75}\u{65}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{25}\u{73}\u{a}\u{20}\u{20}"
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{68}\u{6f}\u{72}\u{74}\u{2d}\u{63}\u{69}\u{72}\u{63}\u{75}\u{69}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6d}\u{69}\u{7a}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{73}\u{20}\u{28}" .. _ENV.GLOB1 .. "\u{29}")
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
for i = 1, n - 1
do
for _,v1 in ipairs(cases[i])
do
for _,v2 in ipairs(cases[n - i])
do
for _,op in ipairs(binops)
do
local t = {"\u{28}" .. v1[1] .. op[1] .. v2[1] .. "\u{29}",op[2](v1[2],v2[2])}
res[# res + 1]=t
res[# res + 1]={"\u{6e}\u{6f}\u{74}" .. t[1],not t[2]}
end
end
end
end
return res
end
local level = _soft and 3 or 4
cases[1]=basiccases
for i = 2, level
do
cases[i]=createcases(i)
end
print("\u{2b}")
local i = 0
for n = 1, level
do
for _,v in pairs(cases[n])
do
local s = v[1]
local p = load(string.format(prog,s,s),"")
IX=false
assert(p() == v[2] and IX == not not v[2])
i=i + 1
if i % 60000 == 0 then
print("\u{2b}")
end
end
end
IX=nil
_G.GLOB1=nil
checkload("\u{66}\u{6f}\u{72}\u{20}\u{78}\u{20}\u{64}\u{6f}","\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}")
checkload("\u{78}\u{3a}\u{63}\u{61}\u{6c}\u{6c}","\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}")
print("\u{4f}\u{4b}")