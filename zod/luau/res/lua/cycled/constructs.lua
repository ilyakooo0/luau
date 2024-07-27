;
;
print("\116\101\115\116\105\110\103\32\115\121\110\116\97\120")
;
;
local debug = require("\100\101\98\117\103")
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
assert(2 * 1 + 3 / 3 == 3 and 1 + 2 .. 3 * 1 == "\51\51")
;
assert(not (2 + 1 > 3 * 1) and "\97" .. "\98" > "\97")
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
assert(1234567890 == tonumber("\49\50\51\52\53\54\55\56\57\48") and 1234567890 + 1 == 1234567891)
do
local operand = {3,100,5.0,- 10,- 5.0,10000,- 10000}
local operator = {"\43","\45","\42","\47","\47\47","\37","\94","\38","\124","\94","\60\60","\62\62","\61\61","\126\61","\60","\62","\60\61","\62\61"}
for _,op in ipairs(operator)
do
local f = assert(load(string.format("\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\120\44\121\41\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\114\101\116\117\114\110\32\120\32\37\115\32\121\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\101\110\100",op)))()
;
for _,o1 in ipairs(operand)
do
for _,o2 in ipairs(operand)
do
local gab = f(o1,o2)
_ENV.XX=o1
local code = string.format("\114\101\116\117\114\110\32\88\88\32\37\115\32\37\115",op,o2)
local res = assert(load(code))()
assert(res == gab)
_ENV.XX=o2
code=string.format("\114\101\116\117\114\110\32\40\37\115\41\32\37\115\32\88\88",o1,op)
res=assert(load(code))()
assert(res == gab)
code=string.format("\114\101\116\117\114\110\32\40\37\115\41\32\37\115\32\37\115",o1,op,o2)
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
x={["\97"] = 1}
;
x={["\120"] = 1}
;
x={["\71"] = 1}
end
end
do
local code = {"\108\111\99\97\108\32\120\32\61\32\123"}
for i = 1, 257
do
code[# code + 1]=i .. "\46\49\44"
end
code[# code + 1]="\125\59"
code=table.concat(code)
local function check
(ret,val)
local code = code .. ret
code=load(code)
assert(code() == val)
end
check("\114\101\116\117\114\110\32\40\49\32\126\32\40\50\32\111\114\32\51\41\41",1 ~ 2)
check("\114\101\116\117\114\110\32\40\49\32\124\32\40\50\32\111\114\32\51\41\41",1 | 2)
check("\114\101\116\117\114\110\32\40\49\32\43\32\40\50\32\111\114\32\51\41\41",1 + 2)
check("\114\101\116\117\114\110\32\40\49\32\60\60\32\40\50\32\111\114\32\51\41\41",1 << 2)
end
local function f
(i)
if type(i) ~= "\110\117\109\98\101\114" then
return i,"\106\111\106\111"
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
x={f("\97\108\111"),f("\120\105\120\105"),nil}
;
assert(x[1] == "\97\108\111" and x[2] == "\120\105\120\105" and x[3] == nil)
;
x={f("\97\108\111") .. "\120\105\120\105"}
;
assert(x[1] == "\97\108\111\120\105\120\105")
x={f({})}
assert(x[2] == "\106\111\106\111" and type(x[1]) == "\116\97\98\108\101")
local f = function (i)
if i < 10 then
return "\97"
elseif i < 20 then
return "\98"
elseif i < 30 then
return "\99"
end
;
end
assert(f(3) == "\97" and f(12) == "\98" and f(26) == "\99" and f(100) == nil)
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
return "\97"
elseif i < 20 then
return "\98"
elseif i < 30 then
return "\99"
else
return 8
end
end
assert(f(3) == "\97" and f(12) == "\98" and f(26) == "\99" and f(100) == 8)
local a,b = nil,23
x={f(100) * 2 + 3 or a,a or b + 2}
assert(x[1] == 19 and x[2] == 25)
x={["\102"] = 2 + 3 or a,["\97"] = b + 2}
assert(x.f == 5 and x.a == 25)
a={["\121"] = 1}
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
print("\43")
;
do
local prog <const> = "\108\111\99\97\108\32\120\32\60\88\88\88\62\32\61\32\49\48"
checkload(prog,"\117\110\107\110\111\119\110\32\97\116\116\114\105\98\117\116\101\32\39\88\88\88\39")
checkload("\108\111\99\97\108\32\120\120\120\32\60\99\111\110\115\116\62\32\61\32\50\48\59\32\120\120\120\32\61\32\49\48","\58\49\58\32\97\116\116\101\109\112\116\32\116\111\32\97\115\115\105\103\110\32\116\111\32\99\111\110\115\116\32\118\97\114\105\97\98\108\101\32\39\120\120\120\39")
checkload("\32\32\32\32\108\111\99\97\108\32\120\120\59\10\32\32\32\32\108\111\99\97\108\32\120\120\120\32\60\99\111\110\115\116\62\32\61\32\50\48\59\10\32\32\32\32\108\111\99\97\108\32\121\121\121\59\10\32\32\32\32\108\111\99\97\108\32\102\117\110\99\116\105\111\110\32\102\111\111\32\40\41\10\32\32\32\32\32\32\108\111\99\97\108\32\97\98\99\32\61\32\120\120\32\43\32\121\121\121\32\43\32\120\120\120\59\10\32\32\32\32\32\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\41\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\41\32\120\120\120\32\61\32\121\121\121\32\101\110\100\32\101\110\100\10\32\32\32\32\101\110\100\10\32\32","\58\54\58\32\97\116\116\101\109\112\116\32\116\111\32\97\115\115\105\103\110\32\116\111\32\99\111\110\115\116\32\118\97\114\105\97\98\108\101\32\39\120\120\120\39")
checkload("\32\32\32\32\108\111\99\97\108\32\120\32\60\99\108\111\115\101\62\32\61\32\110\105\108\10\32\32\32\32\120\32\61\32\105\111\46\111\112\101\110\40\41\10\32\32","\58\50\58\32\97\116\116\101\109\112\116\32\116\111\32\97\115\115\105\103\110\32\116\111\32\99\111\110\115\116\32\118\97\114\105\97\98\108\101\32\39\120\39")
end
f="\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\32\97\32\44\32\98\32\44\32\99\32\44\32\100\32\44\32\101\32\41\10\32\32\108\111\99\97\108\32\120\32\61\32\97\32\62\61\32\98\32\111\114\32\99\32\111\114\32\40\32\100\32\97\110\100\32\101\32\41\32\111\114\32\110\105\108\10\32\32\114\101\116\117\114\110\32\120\10\101\110\100\32\44\32\123\32\97\32\61\32\49\32\44\32\98\32\61\32\50\32\62\61\32\49\32\44\32\125\32\111\114\32\123\32\49\32\125\59\10"
f=string.gsub(f,"\37\115\43","\10")
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
assert(f(1,2,"\97") == "\97" and g(1,2,"\97") == 1 and h(1,2,"\97") == 1)
assert(f(1,2,"\97") ~= nil,"")
assert(f(1,2,"\97") == "\97" and g(1,2,"\97") == 1 and h(1,2,"\97") == 1)
assert(f(1,2,nil,1,"\120") == "\120" and g(1,2,nil,1,"\120") == 1 and h(1,2,nil,1,"\120") == 1)
assert(f(1,2,nil,nil,"\120") == nil and g(1,2,nil,nil,"\120") == 0 and h(1,2,nil,nil,"\120") == 0)
assert(f(1,2,nil,1,nil) == nil and g(1,2,nil,1,nil) == 0 and h(1,2,nil,1,nil) == 0)
assert(1 and 2 < 3 == true and 2 < 3 and "\97" < "\98" == true)
x=2 < 3 and not 3
;
assert(x == false)
x=2 < 1 or (2 > 1 and "\97")
;
assert(x == "\97")
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
assert(debug.getinfo(1,"\110").name == "\70")
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
local basiccases = {{"\110\105\108",nil},{"\102\97\108\115\101",false},{"\116\114\117\101",true},{"\49\48",10},{"\40\48\61\61\95\69\78\86\46\71\76\79\66\49\41",0 == _ENV.GLOB1}}
local prog
if _ENV.GLOB1 == 0 then
basiccases[2][1]="\70"
prog="\32\32\32\32\108\111\99\97\108\32\70\32\60\99\111\110\115\116\62\32\61\32\102\97\108\115\101\10\32\32\32\32\105\102\32\37\115\32\116\104\101\110\32\73\88\32\61\32\116\114\117\101\32\101\110\100\10\32\32\32\32\114\101\116\117\114\110\32\37\115\10"
else
basiccases[4][1]="\107\49\48"
prog="\32\32\32\32\108\111\99\97\108\32\107\49\48\32\60\99\111\110\115\116\62\32\61\32\49\48\10\32\32\32\32\105\102\32\37\115\32\116\104\101\110\32\73\88\32\61\32\116\114\117\101\32\101\110\100\10\32\32\32\32\114\101\116\117\114\110\32\37\115\10\32\32"
end
print("\116\101\115\116\105\110\103\32\115\104\111\114\116\45\99\105\114\99\117\105\116\32\111\112\116\105\109\105\122\97\116\105\111\110\115\32\40" .. _ENV.GLOB1 .. "\41")
local binops <const> = {{"\32\97\110\100\32",function (a,b)
if not a then
return a
else
return b
end
end},{"\32\111\114\32",function (a,b)
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
local t = {"\40" .. v1[1] .. op[1] .. v2[1] .. "\41",op[2](v1[2],v2[2])}
res[# res + 1]=t
res[# res + 1]={"\110\111\116" .. t[1],not t[2]}
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
print("\43")
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
print("\43")
end
end
end
IX=nil
_G.GLOB1=nil
checkload("\102\111\114\32\120\32\100\111","\101\120\112\101\99\116\101\100")
checkload("\120\58\99\97\108\108","\101\120\112\101\99\116\101\100")
print("\79\75")