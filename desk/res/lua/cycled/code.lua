if (T == nil) then
((Message or print))("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{3a}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{70}\u{63}\u{6f}\u{64}\u{65}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
return 
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6f}\u{64}\u{65}\u{20}\u{67}\u{65}\u{6e}\u{65}\u{72}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6d}\u{69}\u{7a}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{73}")
local k0aux <const> = 0x0
local k0 <const> = k0aux
local k1 <const> = 0x1
local k3 <const> = 0x3
local k6 <const> = (k3 + ((k3 << k0)))
local kFF0 <const> = 0xff0
local k3_78 <const> = 3.78
local x,k3_78_4 <const> = 0xa,(k3_78 / 0x4)
assert((x == 0xa))
local kx <const> = "\u{78}"
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
assert(# (k == # list))
for i = 0x1, # k
do
assert(((k[i] == list[i]) and (math.type(k[i]) == math.type(list[i]))))
end
end
local function foo
()
local a
a=k3
;
a=0x0
;
a=0.0
;
a=- (0x7 + 0x7)
a=(k3_78 / 0x4)
;
a=k3_78_4
a=- (k3_78 / 0x4)
;
a=(k3_78 / 0x4)
;
a=- (3.78 / 0x4)
a=- (3.79 / 0x4)
;
a=0.0
;
a=- 0x0
;
a=k3
;
a=3.0
;
a=0x3
;
a=3.0
end
checkKlist(foo,{(3.78 / 0x4),- (3.78 / 0x4),- (3.79 / 0x4)})
foo=function (f,a)
f((0x64 * 0x3e8))
f((100.0 * 0x3e8))
f(- (0x64 * 0x3e8))
f(- (0x64 * 1e3))
f(0x186a0)
f(1e5)
f(- 0x186a0)
f(- 1e5)
end
checkKlist(foo,{0x186a0,1e5,- 0x186a0,- 1e5})
foo=function (t,a)
t[a]=0x1
;
t[a]=1.0
t[a]=0x1
;
t[a]=1.0
t[a]=0x2
;
t[a]=2.0
t[a]=0x0
;
t[a]=0.0
t[a]=0x1
;
t[a]=1.0
t[a]=0x2
;
t[a]=2.0
t[a]=0x0
;
t[a]=0.0
end
checkKlist(foo,{0x1,1.0,0x2,2.0,0x0,0.0})
local function check
(f, ...)
local arg = {...}
local c = T.listcode(f)
for i = 0x1, # arg
do
local opcode = string.match(c[i],"\u{25}\u{75}\u{25}\u{77}\u{2b}")
assert((arg[i] == opcode))
end
assert((c[# (arg + 0x2)] == undef))
end
local function checkR
(f,p,r, ...)
local r1 = f(p)
assert(((r == r1) and (math.type(r) == math.type(r1))))
check(f,...)
end
local function checkequal
(a,b)
a=T.listcode(a)
b=T.listcode(b)
assert(# (a == # b))
for i = 0x1, # a
do
a[i]=string.gsub(a[i],"\u{25}\u{62}\u{28}\u{29}","")
b[i]=string.gsub(b[i],"\u{25}\u{62}\u{28}\u{29}","")
assert((a[i] == b[i]))
end
end
check(function ()
(function ()

end)({f()})
end,"\u{43}\u{4c}\u{4f}\u{53}\u{55}\u{52}\u{45}","\u{4e}\u{45}\u{57}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{45}\u{58}\u{54}\u{52}\u{41}\u{41}\u{52}\u{47}","\u{47}\u{45}\u{54}\u{54}\u{41}\u{42}\u{55}\u{50}","\u{43}\u{41}\u{4c}\u{4c}","\u{53}\u{45}\u{54}\u{4c}\u{49}\u{53}\u{54}","\u{43}\u{41}\u{4c}\u{4c}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function (x)
(function ()
return x
end)({f()})
end,"\u{43}\u{4c}\u{4f}\u{53}\u{55}\u{52}\u{45}","\u{4e}\u{45}\u{57}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{45}\u{58}\u{54}\u{52}\u{41}\u{41}\u{52}\u{47}","\u{47}\u{45}\u{54}\u{54}\u{41}\u{42}\u{55}\u{50}","\u{43}\u{41}\u{4c}\u{4c}","\u{53}\u{45}\u{54}\u{4c}\u{49}\u{53}\u{54}","\u{43}\u{41}\u{4c}\u{4c}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}")
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
end,"\u{4c}\u{4f}\u{41}\u{44}\u{4e}\u{49}\u{4c}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function ()
local a,b,c,d = 0x1,0x1,0x1,0x1
d=nil
;
c=nil
;
b=nil
;
a=nil
end,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{4c}\u{4f}\u{41}\u{44}\u{4e}\u{49}\u{4c}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
do
local a,b,c,d = 0x1,0x1,0x1,0x1
d=nil
;
c=nil
;
b=nil
;
a=nil
assert(((((a == nil) and (b == nil)) and (c == nil)) and (d == nil)))
end
check(function (a,b,c)
return a
end,"\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
while kTrue do
local a = - 0x1
end
end,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{4a}\u{4d}\u{50}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function ()
while 0x1 do
local a = - 0x1
end
end,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{4a}\u{4d}\u{50}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function ()
repeat
local x = 0x1
until true
end,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function (a,b,c,d)
return (a .. (b .. (c .. d)))
end,"\u{4d}\u{4f}\u{56}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{43}\u{4f}\u{4e}\u{43}\u{41}\u{54}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
return not not nil
end,"\u{4c}\u{4f}\u{41}\u{44}\u{46}\u{41}\u{4c}\u{53}\u{45}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
return not not kFalse
end,"\u{4c}\u{4f}\u{41}\u{44}\u{46}\u{41}\u{4c}\u{53}\u{45}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
return not not true
end,"\u{4c}\u{4f}\u{41}\u{44}\u{54}\u{52}\u{55}\u{45}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
return not not k3
end,"\u{4c}\u{4f}\u{41}\u{44}\u{54}\u{52}\u{55}\u{45}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
local a,b,c,d
a=(b * a)
c.x,a[b]=- (((((a + (d / b)) - a[b])) ^ a.x)),b
end,"\u{4c}\u{4f}\u{41}\u{44}\u{4e}\u{49}\u{4c}","\u{4d}\u{55}\u{4c}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{44}\u{49}\u{56}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{41}\u{44}\u{44}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{47}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{53}\u{55}\u{42}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{47}\u{45}\u{54}\u{46}\u{49}\u{45}\u{4c}\u{44}","\u{50}\u{4f}\u{57}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{55}\u{4e}\u{4d}","\u{53}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{53}\u{45}\u{54}\u{46}\u{49}\u{45}\u{4c}\u{44}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function ()
local a,b
local c = kNil
a[kx]=3.2
a.x=b
a[b]="\u{78}"
end,"\u{4c}\u{4f}\u{41}\u{44}\u{4e}\u{49}\u{4c}","\u{53}\u{45}\u{54}\u{46}\u{49}\u{45}\u{4c}\u{44}","\u{53}\u{45}\u{54}\u{46}\u{49}\u{45}\u{4c}\u{44}","\u{53}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function (a)
local k255 <const> = 0xff
a[0x1]=a[0x64]
a[k255]=a[0x100]
a[0x100]=0x5
end,"\u{47}\u{45}\u{54}\u{49}","\u{53}\u{45}\u{54}\u{49}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{47}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{53}\u{45}\u{54}\u{49}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{53}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function ()
local a,b
a=(a - a)
b=(a / a)
b=(0x5 - 0x4)
end,"\u{4c}\u{4f}\u{41}\u{44}\u{4e}\u{49}\u{4c}","\u{53}\u{55}\u{42}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{44}\u{49}\u{56}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function ()
local a,b
a[kTrue]=false
end,"\u{4c}\u{4f}\u{41}\u{44}\u{4e}\u{49}\u{4c}","\u{4c}\u{4f}\u{41}\u{44}\u{54}\u{52}\u{55}\u{45}","\u{53}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
checkR(function (a)
if (a == 0x1) then
return 0x2
end
end,0x1,0x2,"\u{45}\u{51}\u{49}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if - (4.0 == a) then
return 0x2
end
end,- 0x4,0x2,"\u{45}\u{51}\u{49}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if (a == "\u{68}\u{69}") then
return 0x2
end
end,0xa,nil,"\u{45}\u{51}\u{4b}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if (a == 0x2710) then
return 0x2
end
end,0x1,nil,"\u{45}\u{51}\u{4b}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if - (0x2710 == a) then
return 0x2
end
end,- 0x2710,0x2,"\u{45}\u{51}\u{4b}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if - (0xa <= a) then
return 0x2
end
end,- 0xa,0x2,"\u{47}\u{45}\u{49}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if (128.0 > a) then
return 0x2
end
end,0x81,nil,"\u{4c}\u{54}\u{49}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if - (127.0 < a) then
return 0x2
end
end,- 0x7f,nil,"\u{47}\u{54}\u{49}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if (0xa < a) then
return 0x2
end
end,0xb,0x2,"\u{47}\u{54}\u{49}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if (0x81 < a) then
return 0x2
end
end,0x82,0x2,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{4c}\u{54}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if (a >= 23.0) then
return 0x2
end
end,0x19,0x2,"\u{47}\u{45}\u{49}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if (a >= 23.1) then
return 0x2
end
end,0x0,nil,"\u{4c}\u{4f}\u{41}\u{44}\u{4b}","\u{4c}\u{45}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (a)
if (a > 2300.0) then
return 0x2
end
end,0x0,nil,"\u{4c}\u{4f}\u{41}\u{44}\u{46}","\u{4c}\u{54}","\u{4a}\u{4d}\u{50}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
local function checkK
(func,val)
check(func,"\u{4c}\u{4f}\u{41}\u{44}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkKlist(func,{val})
assert((func() == val))
end
local function checkI
(func,val)
check(func,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkKlist(func,{})
assert((func() == val))
end
local function checkF
(func,val)
check(func,"\u{4c}\u{4f}\u{41}\u{44}\u{46}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkKlist(func,{})
assert((func() == val))
end
checkF(function ()
return 0.0
end,0.0)
checkI(function ()
return k0
end,0x0)
checkI(function ()
return - (k0 // 0x1)
end,0x0)
checkK(function ()
return (0x3 ^ - 0x1)
end,(0x1 / 0x3))
checkK(function ()
return (((0x1 + 0x1)) ^ ((0x32 + 0x32)))
end,(0x2 ^ 0x64))
checkK(function ()
return ((- 0x2) ^ ((0x1f - 0x2)))
end,- (0x20000000 + 0.0))
checkF(function ()
return ((- ((k3 ^ 0x0) + 0x5)) // 3.0)
end,1.0)
checkI(function ()
return - (k3 % 0x5)
end,0x2)
checkF(function ()
return - ((((((((2.0 ^ 0x8) + - (- 0x1))) % 0x8)) / 0x2) * 0x4) - 0x3)
end,- 5.0)
checkF(function ()
return - ((((((((0x2 ^ 0x8) + - (- 0x1))) % 0x8)) // 0x2) * 0x4) - 0x3)
end,- 7.0)
checkI(function ()
return (240.0 | (204.0 ~ (0xaa & 0xfd)))
end,0xf4)
checkI(function ()
return ~ (~ (kFF0 | kFF0))
end,0x0)
checkI(function ()
return ~ ~ - 1024.0
end,- 0x400)
checkI(function ()
return (((((0x64 << k6)) << - 0x4)) >> 0x2)
end,0x64)
local a = 0x11
;
local sbx = (((((0x1 << a)) - 0x1)) >> 0x1)
local border <const> = 0xffff
checkI(function ()
return border
end,sbx)
checkI(function ()
return - border
end,- sbx)
checkI(function ()
return (border + 0x1)
end,(sbx + 0x1))
checkK(function ()
return (border + 0x2)
end,(sbx + 0x2))
checkK(function ()
return - ((border + 0x1))
end,- ((sbx + 0x1)))
local border <const> = 65535.0
checkF(function ()
return border
end,(sbx + 0.0))
checkF(function ()
return - border
end,- (sbx + 0.0))
checkF(function ()
return (border + 0x1)
end,((sbx + 1.0)))
checkK(function ()
return (border + 0x2)
end,((sbx + 2.0)))
checkK(function ()
return - ((border + 0x1))
end,- ((sbx + 1.0)))
checkR(function (x)
return (x + k1)
end,0xa,0xb,"\u{41}\u{44}\u{44}\u{49}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x - 0x7f)
end,0xa,- 0x75,"\u{41}\u{44}\u{44}\u{49}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (0x80 + x)
end,0.0,128.0,"\u{41}\u{44}\u{44}\u{49}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x * - 0x7f)
end,- 1.0,127.0,"\u{4d}\u{55}\u{4c}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (0x14 * x)
end,0x2,0x28,"\u{4d}\u{55}\u{4c}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x ^ - 0x2)
end,0x2,0.25,"\u{50}\u{4f}\u{57}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x / 0x28)
end,0x28,1.0,"\u{44}\u{49}\u{56}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x // 0x1)
end,10.0,10.0,"\u{49}\u{44}\u{49}\u{56}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x % ((0x64 - 0xa)))
end,0x5b,0x1,"\u{4d}\u{4f}\u{44}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (k1 << x)
end,0x3,0x8,"\u{53}\u{48}\u{4c}\u{49}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x << 0x7f)
end,0xa,0x0,"\u{53}\u{48}\u{52}\u{49}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x << - 0x7f)
end,0xa,0x0,"\u{53}\u{48}\u{52}\u{49}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x >> 0x80)
end,0x8,0x0,"\u{53}\u{48}\u{52}\u{49}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x >> - 0x7f)
end,0x8,0x0,"\u{53}\u{48}\u{52}\u{49}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{49}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x & 0x1)
end,0x9,0x1,"\u{42}\u{41}\u{4e}\u{44}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (0xa | x)
end,0x1,0xb,"\u{42}\u{4f}\u{52}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return - (0xa ~ x)
end,- 0x1,0x9,"\u{42}\u{58}\u{4f}\u{52}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x + 0.0)
end,0x1,1.0,"\u{41}\u{44}\u{44}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x * - 0x2710)
end,0x2,- 0x4e20,"\u{4d}\u{55}\u{4c}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x ^ 0.5)
end,0x4,2.0,"\u{50}\u{4f}\u{57}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x / 2.0)
end,0x4,2.0,"\u{44}\u{49}\u{56}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x // 0x2710)
end,0x2710,0x1,"\u{49}\u{44}\u{49}\u{56}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
checkR(function (x)
return (x % ((100.0 - 0xa)))
end,0x5b,1.0,"\u{4d}\u{4f}\u{44}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
return - 0.0
end,"\u{4c}\u{4f}\u{41}\u{44}\u{46}","\u{55}\u{4e}\u{4d}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
return (k3 / 0x0)
end,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{44}\u{49}\u{56}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
return (0x0 % 0x0)
end,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{4d}\u{4f}\u{44}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
return - (0x4 // 0x0)
end,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{49}\u{44}\u{49}\u{56}\u{4b}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{4b}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function (x)
return (x >> 2.0)
end,"\u{4c}\u{4f}\u{41}\u{44}\u{46}","\u{53}\u{48}\u{52}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function (x)
return (x << 0x80)
end,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{53}\u{48}\u{4c}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function (x)
return (x & 2.0)
end,"\u{4c}\u{4f}\u{41}\u{44}\u{46}","\u{42}\u{41}\u{4e}\u{44}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
for i = - 0xa, 10.5
do

end
end,"\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{4c}\u{4f}\u{41}\u{44}\u{4b}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{46}\u{4f}\u{52}\u{50}\u{52}\u{45}\u{50}","\u{46}\u{4f}\u{52}\u{4c}\u{4f}\u{4f}\u{50}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function ()
for i = 0xfffffff, 10.0, 0x1
do

end
end,"\u{4c}\u{4f}\u{41}\u{44}\u{4b}","\u{4c}\u{4f}\u{41}\u{44}\u{46}","\u{4c}\u{4f}\u{41}\u{44}\u{49}","\u{46}\u{4f}\u{52}\u{50}\u{52}\u{45}\u{50}","\u{46}\u{4f}\u{52}\u{4c}\u{4f}\u{4f}\u{50}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
check(function ()
return - nil
end,"\u{4c}\u{4f}\u{41}\u{44}\u{4e}\u{49}\u{4c}","\u{55}\u{4e}\u{4d}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{31}")
check(function ()
local a,b,c
b[c],a=c,b
b[a],a=c,b
a,b=c,a
a=a
end,"\u{4c}\u{4f}\u{41}\u{44}\u{4e}\u{49}\u{4c}","\u{4d}\u{4f}\u{56}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{53}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{53}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{4d}\u{4f}\u{56}\u{45}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
do
local t
check(function ()
t[kx]=t.y
end,"\u{47}\u{45}\u{54}\u{54}\u{41}\u{42}\u{55}\u{50}","\u{53}\u{45}\u{54}\u{54}\u{41}\u{42}\u{55}\u{50}")
check(function (a)
t[a()]=t[a()]
end,"\u{4d}\u{4f}\u{56}\u{45}","\u{43}\u{41}\u{4c}\u{4c}","\u{47}\u{45}\u{54}\u{55}\u{50}\u{56}\u{41}\u{4c}","\u{4d}\u{4f}\u{56}\u{45}","\u{43}\u{41}\u{4c}\u{4c}","\u{47}\u{45}\u{54}\u{55}\u{50}\u{56}\u{41}\u{4c}","\u{47}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}","\u{53}\u{45}\u{54}\u{54}\u{41}\u{42}\u{4c}\u{45}")
end
checkequal(function ()
local a
;
if not ((a or b)) then
b=a
end
end,function ()
local a
;
if (not (a and not b)) then
b=a
end
end)
checkequal(function (l)
local a
;
return ((0x0 <= a) and (a <= l))
end,function (l)
local a
;
return not (not (((a >= 0x0)) or not ((a <= l))))
end)
check(function (a,b)
while a do
if b then
break
else
a=(a + 0x1)
end
end
end,"\u{54}\u{45}\u{53}\u{54}","\u{4a}\u{4d}\u{50}","\u{54}\u{45}\u{53}\u{54}","\u{4a}\u{4d}\u{50}","\u{41}\u{44}\u{44}\u{49}","\u{4d}\u{4d}\u{42}\u{49}\u{4e}\u{49}","\u{4a}\u{4d}\u{50}","\u{52}\u{45}\u{54}\u{55}\u{52}\u{4e}\u{30}")
checkequal(function ()
return ((0x6 or true) or nil)
end,function ()
return ((k6 or kTrue) or kNil)
end)
checkequal(function ()
return ((0x6 and true) or nil)
end,function ()
return ((k6 and kTrue) or kNil)
end)
do
local k0 <const> = "\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}"
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
assert((f3() == k0))
checkK(f3,k0)
assert((T.listk(f1)[0x1] == nil))
assert((T.listk(f2)[0x1] == nil))
end
print("\u{4f}\u{4b}")