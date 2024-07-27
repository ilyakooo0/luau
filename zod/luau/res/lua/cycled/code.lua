if T == nil then
(Message or print)("\10\32\62\62\62\32\116\101\115\116\67\32\110\111\116\32\97\99\116\105\118\101\58\32\115\107\105\112\112\105\110\103\32\111\112\99\111\100\101\32\116\101\115\116\115\32\60\60\60\10")
return 
end
print("\116\101\115\116\105\110\103\32\99\111\100\101\32\103\101\110\101\114\97\116\105\111\110\32\97\110\100\32\111\112\116\105\109\105\122\97\116\105\111\110\115")
local k0aux <const> = 0
local k0 <const> = k0aux
local k1 <const> = 1
local k3 <const> = 3
local k6 <const> = k3 + (k3 << k0)
local kFF0 <const> = 4080
local k3_78 <const> = 3.78
local x,k3_78_4 <const> = 10,k3_78 / 4
assert(x == 10)
local kx <const> = "\120"
local kTrue <const> = true
local kFalse <const> = false
local kNil <const> = nil
do
local function f
(a)
for k,v,w in a
do

end
end
end
local function checkKlist
(func,list)
local k = T.listk(func)
assert(# k == # list)
for i = 1, # k
do
assert(k[i] == list[i] and math.type(k[i]) == math.type(list[i]))
end
end
local function foo
()
local a
a=k3
;
a=0
;
a=0.0
;
a=- 7 + 7
a=k3_78 / 4
;
a=k3_78_4
a=- k3_78 / 4
;
a=k3_78 / 4
;
a=- 3.78 / 4
a=- 3.79 / 4
;
a=0.0
;
a=- 0
;
a=k3
;
a=3.0
;
a=3
;
a=3.0
end
checkKlist(foo,{3.78 / 4,- 3.78 / 4,- 3.79 / 4})
foo=function (f,a)
f(100 * 1000)
f(100.0 * 1000)
f(- 100 * 1000)
f(- 100 * 1e3)
f(100000)
f(1e5)
f(- 100000)
f(- 1e5)
end
checkKlist(foo,{100000,1e5,- 100000,- 1e5})
foo=function (t,a)
t[a]=1
;
t[a]=1.0
t[a]=1
;
t[a]=1.0
t[a]=2
;
t[a]=2.0
t[a]=0
;
t[a]=0.0
t[a]=1
;
t[a]=1.0
t[a]=2
;
t[a]=2.0
t[a]=0
;
t[a]=0.0
end
checkKlist(foo,{1,1.0,2,2.0,0,0.0})
local function check
(f, ...)
local arg = {...}
local c = T.listcode(f)
for i = 1, # arg
do
local opcode = string.match(c[i],"\37\117\37\119\43")
assert(arg[i] == opcode)
end
assert(c[# arg + 2] == undef)
end
local function checkR
(f,p,r, ...)
local r1 = f(p)
assert(r == r1 and math.type(r) == math.type(r1))
check(f,...)
end
local function checkequal
(a,b)
a=T.listcode(a)
b=T.listcode(b)
assert(# a == # b)
for i = 1, # a
do
a[i]=string.gsub(a[i],"\37\98\40\41","")
b[i]=string.gsub(b[i],"\37\98\40\41","")
assert(a[i] == b[i])
end
end
check(function ()
(function ()

end)({f()})
end,"\67\76\79\83\85\82\69","\78\69\87\84\65\66\76\69","\69\88\84\82\65\65\82\71","\71\69\84\84\65\66\85\80","\67\65\76\76","\83\69\84\76\73\83\84","\67\65\76\76","\82\69\84\85\82\78\48")
check(function (x)
(function ()
return x
end)({f()})
end,"\67\76\79\83\85\82\69","\78\69\87\84\65\66\76\69","\69\88\84\82\65\65\82\71","\71\69\84\84\65\66\85\80","\67\65\76\76","\83\69\84\76\73\83\84","\67\65\76\76","\82\69\84\85\82\78")
check(function ()
local kNil <const> = nil
local a,b,c
local d
;
local e
;
local f,g,h
;
d=nil
;
d=nil
;
b=nil
;
a=kNil
;
c=nil
;
end,"\76\79\65\68\78\73\76","\82\69\84\85\82\78\48")
check(function ()
local a,b,c,d = 1,1,1,1
d=nil
;
c=nil
;
b=nil
;
a=nil
end,"\76\79\65\68\73","\76\79\65\68\73","\76\79\65\68\73","\76\79\65\68\73","\76\79\65\68\78\73\76","\82\69\84\85\82\78\48")
do
local a,b,c,d = 1,1,1,1
d=nil
;
c=nil
;
b=nil
;
a=nil
assert(a == nil and b == nil and c == nil and d == nil)
end
check(function (a,b,c)
return a
end,"\82\69\84\85\82\78\49")
check(function ()
while kTrue do
local a = - 1
end
end,"\76\79\65\68\73","\74\77\80","\82\69\84\85\82\78\48")
check(function ()
while 1 do
local a = - 1
end
end,"\76\79\65\68\73","\74\77\80","\82\69\84\85\82\78\48")
check(function ()
repeat
local x = 1
until true
end,"\76\79\65\68\73","\82\69\84\85\82\78\48")
check(function (a,b,c,d)
return a .. b .. c .. d
end,"\77\79\86\69","\77\79\86\69","\77\79\86\69","\77\79\86\69","\67\79\78\67\65\84","\82\69\84\85\82\78\49")
check(function ()
return not not nil
end,"\76\79\65\68\70\65\76\83\69","\82\69\84\85\82\78\49")
check(function ()
return not not kFalse
end,"\76\79\65\68\70\65\76\83\69","\82\69\84\85\82\78\49")
check(function ()
return not not true
end,"\76\79\65\68\84\82\85\69","\82\69\84\85\82\78\49")
check(function ()
return not not k3
end,"\76\79\65\68\84\82\85\69","\82\69\84\85\82\78\49")
check(function ()
local a,b,c,d
a=b * a
c.x,a[b]=- ((a + d / b - a[b]) ^ a.x),b
end,"\76\79\65\68\78\73\76","\77\85\76","\77\77\66\73\78","\68\73\86","\77\77\66\73\78","\65\68\68","\77\77\66\73\78","\71\69\84\84\65\66\76\69","\83\85\66","\77\77\66\73\78","\71\69\84\70\73\69\76\68","\80\79\87","\77\77\66\73\78","\85\78\77","\83\69\84\84\65\66\76\69","\83\69\84\70\73\69\76\68","\82\69\84\85\82\78\48")
check(function ()
local a,b
local c = kNil
a[kx]=3.2
a.x=b
a[b]="\120"
end,"\76\79\65\68\78\73\76","\83\69\84\70\73\69\76\68","\83\69\84\70\73\69\76\68","\83\69\84\84\65\66\76\69","\82\69\84\85\82\78\48")
check(function (a)
local k255 <const> = 255
a[1]=a[100]
a[k255]=a[256]
a[256]=5
end,"\71\69\84\73","\83\69\84\73","\76\79\65\68\73","\71\69\84\84\65\66\76\69","\83\69\84\73","\76\79\65\68\73","\83\69\84\84\65\66\76\69","\82\69\84\85\82\78\48")
check(function ()
local a,b
a=a - a
b=a / a
b=5 - 4
end,"\76\79\65\68\78\73\76","\83\85\66","\77\77\66\73\78","\68\73\86","\77\77\66\73\78","\76\79\65\68\73","\82\69\84\85\82\78\48")
check(function ()
local a,b
a[kTrue]=false
end,"\76\79\65\68\78\73\76","\76\79\65\68\84\82\85\69","\83\69\84\84\65\66\76\69","\82\69\84\85\82\78\48")
checkR(function (a)
if a == 1 then
return 2
end
end,1,2,"\69\81\73","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if - 4.0 == a then
return 2
end
end,- 4,2,"\69\81\73","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if a == "\104\105" then
return 2
end
end,10,nil,"\69\81\75","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if a == 10000 then
return 2
end
end,1,nil,"\69\81\75","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if - 10000 == a then
return 2
end
end,- 10000,2,"\69\81\75","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if - 10 <= a then
return 2
end
end,- 10,2,"\71\69\73","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if 128.0 > a then
return 2
end
end,129,nil,"\76\84\73","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if - 127.0 < a then
return 2
end
end,- 127,nil,"\71\84\73","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if 10 < a then
return 2
end
end,11,2,"\71\84\73","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if 129 < a then
return 2
end
end,130,2,"\76\79\65\68\73","\76\84","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if a >= 23.0 then
return 2
end
end,25,2,"\71\69\73","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if a >= 23.1 then
return 2
end
end,0,nil,"\76\79\65\68\75","\76\69","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
checkR(function (a)
if a > 2300.0 then
return 2
end
end,0,nil,"\76\79\65\68\70","\76\84","\74\77\80","\76\79\65\68\73","\82\69\84\85\82\78\49")
local function checkK
(func,val)
check(func,"\76\79\65\68\75","\82\69\84\85\82\78\49")
checkKlist(func,{val})
assert(func() == val)
end
local function checkI
(func,val)
check(func,"\76\79\65\68\73","\82\69\84\85\82\78\49")
checkKlist(func,{})
assert(func() == val)
end
local function checkF
(func,val)
check(func,"\76\79\65\68\70","\82\69\84\85\82\78\49")
checkKlist(func,{})
assert(func() == val)
end
checkF(function ()
return 0.0
end,0.0)
checkI(function ()
return k0
end,0)
checkI(function ()
return - k0 // 1
end,0)
checkK(function ()
return 3 ^ - 1
end,1 / 3)
checkK(function ()
return (1 + 1) ^ (50 + 50)
end,2 ^ 100)
checkK(function ()
return (- 2) ^ (31 - 2)
end,- 536870912 + 0.0)
checkF(function ()
return (- k3 ^ 0 + 5) // 3.0
end,1.0)
checkI(function ()
return - k3 % 5
end,2)
checkF(function ()
return - ((2.0 ^ 8 + - (- 1)) % 8) / 2 * 4 - 3
end,- 5.0)
checkF(function ()
return - ((2 ^ 8 + - (- 1)) % 8) // 2 * 4 - 3
end,- 7.0)
checkI(function ()
return 240.0 | 204.0 ~ 170 & 253
end,244)
checkI(function ()
return ~ (~ kFF0 | kFF0)
end,0)
checkI(function ()
return ~ ~ - 1024.0
end,- 1024)
checkI(function ()
return ((100 << k6) << - 4) >> 2
end,100)
local a = 17
;
local sbx = ((1 << a) - 1) >> 1
local border <const> = 65535
checkI(function ()
return border
end,sbx)
checkI(function ()
return - border
end,- sbx)
checkI(function ()
return border + 1
end,sbx + 1)
checkK(function ()
return border + 2
end,sbx + 2)
checkK(function ()
return - (border + 1)
end,- (sbx + 1))
local border <const> = 65535.0
checkF(function ()
return border
end,sbx + 0.0)
checkF(function ()
return - border
end,- sbx + 0.0)
checkF(function ()
return border + 1
end,(sbx + 1.0))
checkK(function ()
return border + 2
end,(sbx + 2.0))
checkK(function ()
return - (border + 1)
end,- (sbx + 1.0))
checkR(function (x)
return x + k1
end,10,11,"\65\68\68\73","\77\77\66\73\78\73","\82\69\84\85\82\78\49")
checkR(function (x)
return x - 127
end,10,- 117,"\65\68\68\73","\77\77\66\73\78\73","\82\69\84\85\82\78\49")
checkR(function (x)
return 128 + x
end,0.0,128.0,"\65\68\68\73","\77\77\66\73\78\73","\82\69\84\85\82\78\49")
checkR(function (x)
return x * - 127
end,- 1.0,127.0,"\77\85\76\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return 20 * x
end,2,40,"\77\85\76\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x ^ - 2
end,2,0.25,"\80\79\87\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x / 40
end,40,1.0,"\68\73\86\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x // 1
end,10.0,10.0,"\73\68\73\86\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x % (100 - 10)
end,91,1,"\77\79\68\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return k1 << x
end,3,8,"\83\72\76\73","\77\77\66\73\78\73","\82\69\84\85\82\78\49")
checkR(function (x)
return x << 127
end,10,0,"\83\72\82\73","\77\77\66\73\78\73","\82\69\84\85\82\78\49")
checkR(function (x)
return x << - 127
end,10,0,"\83\72\82\73","\77\77\66\73\78\73","\82\69\84\85\82\78\49")
checkR(function (x)
return x >> 128
end,8,0,"\83\72\82\73","\77\77\66\73\78\73","\82\69\84\85\82\78\49")
checkR(function (x)
return x >> - 127
end,8,0,"\83\72\82\73","\77\77\66\73\78\73","\82\69\84\85\82\78\49")
checkR(function (x)
return x & 1
end,9,1,"\66\65\78\68\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return 10 | x
end,1,11,"\66\79\82\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return - 10 ~ x
end,- 1,9,"\66\88\79\82\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x + 0.0
end,1,1.0,"\65\68\68\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x * - 10000
end,2,- 20000,"\77\85\76\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x ^ 0.5
end,4,2.0,"\80\79\87\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x / 2.0
end,4,2.0,"\68\73\86\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x // 10000
end,10000,1,"\73\68\73\86\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
checkR(function (x)
return x % (100.0 - 10)
end,91,1.0,"\77\79\68\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
check(function ()
return - 0.0
end,"\76\79\65\68\70","\85\78\77","\82\69\84\85\82\78\49")
check(function ()
return k3 / 0
end,"\76\79\65\68\73","\68\73\86\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
check(function ()
return 0 % 0
end,"\76\79\65\68\73","\77\79\68\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
check(function ()
return - 4 // 0
end,"\76\79\65\68\73","\73\68\73\86\75","\77\77\66\73\78\75","\82\69\84\85\82\78\49")
check(function (x)
return x >> 2.0
end,"\76\79\65\68\70","\83\72\82","\77\77\66\73\78","\82\69\84\85\82\78\49")
check(function (x)
return x << 128
end,"\76\79\65\68\73","\83\72\76","\77\77\66\73\78","\82\69\84\85\82\78\49")
check(function (x)
return x & 2.0
end,"\76\79\65\68\70","\66\65\78\68","\77\77\66\73\78","\82\69\84\85\82\78\49")
check(function ()
for i = - 10, 10.5
do

end
end,"\76\79\65\68\73","\76\79\65\68\75","\76\79\65\68\73","\70\79\82\80\82\69\80","\70\79\82\76\79\79\80","\82\69\84\85\82\78\48")
check(function ()
for i = 268435455, 10.0, 1
do

end
end,"\76\79\65\68\75","\76\79\65\68\70","\76\79\65\68\73","\70\79\82\80\82\69\80","\70\79\82\76\79\79\80","\82\69\84\85\82\78\48")
check(function ()
return - nil
end,"\76\79\65\68\78\73\76","\85\78\77","\82\69\84\85\82\78\49")
check(function ()
local a,b,c
b[c],a=c,b
b[a],a=c,b
a,b=c,a
a=a
end,"\76\79\65\68\78\73\76","\77\79\86\69","\77\79\86\69","\83\69\84\84\65\66\76\69","\77\79\86\69","\77\79\86\69","\77\79\86\69","\83\69\84\84\65\66\76\69","\77\79\86\69","\77\79\86\69","\77\79\86\69","\82\69\84\85\82\78\48")
do
local t
check(function ()
t[kx]=t.y
end,"\71\69\84\84\65\66\85\80","\83\69\84\84\65\66\85\80")
check(function (a)
t[a()]=t[a()]
end,"\77\79\86\69","\67\65\76\76","\71\69\84\85\80\86\65\76","\77\79\86\69","\67\65\76\76","\71\69\84\85\80\86\65\76","\71\69\84\84\65\66\76\69","\83\69\84\84\65\66\76\69")
end
checkequal(function ()
local a
;
if not (a or b) then
b=a
end
end,function ()
local a
;
if (not a and not b) then
b=a
end
end)
checkequal(function (l)
local a
;
return 0 <= a and a <= l
end,function (l)
local a
;
return not (not (a >= 0) or not (a <= l))
end)
check(function (a,b)
while a do
if b then
break
else
a=a + 1
end
end
end,"\84\69\83\84","\74\77\80","\84\69\83\84","\74\77\80","\65\68\68\73","\77\77\66\73\78\73","\74\77\80","\82\69\84\85\82\78\48")
checkequal(function ()
return 6 or true or nil
end,function ()
return k6 or kTrue or kNil
end)
checkequal(function ()
return 6 and true or nil
end,function ()
return k6 and kTrue or kNil
end)
do
local k0 <const> = "\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48"
local function f1
()
local k <const> = k0
return function ()
return function ()
return k
end
end
end
local f2 = f1()
local f3 = f2()
assert(f3() == k0)
checkK(f3,k0)
assert(T.listk(f1)[1] == nil)
assert(T.listk(f2)[1] == nil)
end
print("\79\75")