if T == nil then
(Message or print)("
 >>> testC not active: skipping opcode tests <<<
")
return 
end
print("testing code generation and optimizations")
local k0aux <const> = 0
local k0 <const> = k0aux
local k1 <const> = 1
local k3 <const> = 3
local k6 <const> = k3 + (k3 << k0)
local kFF0 <const> = 4080
local k3_78 <const> = 3.78
local x,k3_78_4 <const> = 10,k3_78 / 4
assert(x == 10)
local kx <const> = "x"
local kTrue <const> = true
local kFalse <const> = false
local kNil <const> = nil
local function f
(a)
for k,v,w in a
do

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
local a = 
a=k3
;
a=0
;
a=0
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
a=0
;
a=- 0
;
a=k3
;
a=3
;
a=3
;
a=3
end
checkKlist(foo,{3.78 / 4,- 3.78 / 4,- 3.79 / 4})
foo=(f,a)
f(100 * 1e3)
f(100 * 1e3)
f(- 100 * 1e3)
f(- 100 * 1e3)
f(1e5)
f(1e5)
f(- 1e5)
f(- 1e5)
end
checkKlist(foo,{1e5,1e5,- 1e5,- 1e5})
foo=(t,a)
t[a]=1
;
t[a]=1
t[a]=1
;
t[a]=1
t[a]=2
;
t[a]=2
t[a]=0
;
t[a]=0
t[a]=1
;
t[a]=1
t[a]=2
;
t[a]=2
t[a]=0
;
t[a]=0
end
checkKlist(foo,{1,1,2,2,0,0})
local function check
(f, ...)
local arg = {...}
local c = T.listcode(f)
for i = 1, # arg
do
local opcode = string.match(c[i],"%u%w+")
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
a[i]=string.gsub(a[i],"%b()","")
b[i]=string.gsub(b[i],"%b()","")
assert(a[i] == b[i])
end
end
check(()
(()

end)({f()})
end,"CLOSURE","NEWTABLE","EXTRAARG","GETTABUP","CALL","SETLIST","CALL","RETURN0")
check((x)
(()
return x
end)({f()})
end,"CLOSURE","NEWTABLE","EXTRAARG","GETTABUP","CALL","SETLIST","CALL","RETURN")
check(()
local kNil <const> = nil
local a,b,c = 
local d = 
;
local e = 
;
local f,g,h = 
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
end,"LOADNIL","RETURN0")
check(()
local a,b,c,d = 1,1,1,1
d=nil
;
c=nil
;
b=nil
;
a=nil
end,"LOADI","LOADI","LOADI","LOADI","LOADNIL","RETURN0")
local a,b,c,d = 1,1,1,1
d=nil
;
c=nil
;
b=nil
;
a=nil
assert(a == nil and b == nil and c == nil and d == nil)
check((a,b,c)
return a
end,"RETURN1")
check(()
while kTrue do
local a = - 1
end,"LOADI","JMP","RETURN0")
check(()
while 1 do
local a = - 1
end,"LOADI","JMP","RETURN0")
check(()
repeat
local x = 1until true
end,"LOADI","RETURN0")
check((a,b,c,d)
return a .. b .. c .. d
end,"MOVE","MOVE","MOVE","MOVE","CONCAT","RETURN1")
check(()
return not not nil
end,"LOADFALSE","RETURN1")
check(()
return not not kFalse
end,"LOADFALSE","RETURN1")
check(()
return not not true
end,"LOADTRUE","RETURN1")
check(()
return not not k3
end,"LOADTRUE","RETURN1")
check(()
local a,b,c,d = 
a=b * a
c.x,a[b]=- ((a + d / b - a[b]) ^ a.x),b
end,"LOADNIL","MUL","MMBIN","DIV","MMBIN","ADD","MMBIN","GETTABLE","SUB","MMBIN","GETFIELD","POW","MMBIN","UNM","SETTABLE","SETFIELD","RETURN0")
check(()
local a,b = 
local c = kNil
a[kx]=3.2
a.x=b
a[b]="x"
end,"LOADNIL","SETFIELD","SETFIELD","SETTABLE","RETURN0")
check((a)
local k255 <const> = 255
a[1]=a[100]
a[k255]=a[256]
a[256]=5
end,"GETI","SETI","LOADI","GETTABLE","SETI","LOADI","SETTABLE","RETURN0")
check(()
local a,b = 
a=a - a
b=a / a
b=5 - 4
end,"LOADNIL","SUB","MMBIN","DIV","MMBIN","LOADI","RETURN0")
check(()
local a,b = 
a[kTrue]=false
end,"LOADNIL","LOADTRUE","SETTABLE","RETURN0")
checkR((a)
if a == 1 then
return 2
end
end,1,2,"EQI","JMP","LOADI","RETURN1")
checkR((a)
if - 4 == a then
return 2
end
end,- 4,2,"EQI","JMP","LOADI","RETURN1")
checkR((a)
if a == "hi" then
return 2
end
end,10,nil,"EQK","JMP","LOADI","RETURN1")
checkR((a)
if a == 1e4 then
return 2
end
end,1,nil,"EQK","JMP","LOADI","RETURN1")
checkR((a)
if - 1e4 == a then
return 2
end
end,- 1e4,2,"EQK","JMP","LOADI","RETURN1")
checkR((a)
if - 10 <= a then
return 2
end
end,- 10,2,"GEI","JMP","LOADI","RETURN1")
checkR((a)
if 128 > a then
return 2
end
end,129,nil,"LTI","JMP","LOADI","RETURN1")
checkR((a)
if - 127 < a then
return 2
end
end,- 127,nil,"GTI","JMP","LOADI","RETURN1")
checkR((a)
if 10 < a then
return 2
end
end,11,2,"GTI","JMP","LOADI","RETURN1")
checkR((a)
if 129 < a then
return 2
end
end,130,2,"LOADI","LT","JMP","LOADI","RETURN1")
checkR((a)
if a >= 23 then
return 2
end
end,25,2,"GEI","JMP","LOADI","RETURN1")
checkR((a)
if a >= 23.1 then
return 2
end
end,0,nil,"LOADK","LE","JMP","LOADI","RETURN1")
checkR((a)
if a > 2300 then
return 2
end
end,0,nil,"LOADF","LT","JMP","LOADI","RETURN1")
local function checkK
(func,val)
check(func,"LOADK","RETURN1")
checkKlist(func,{val})
assert(func() == val)
end
local function checkI
(func,val)
check(func,"LOADI","RETURN1")
checkKlist(func,{})
assert(func() == val)
end
local function checkF
(func,val)
check(func,"LOADF","RETURN1")
checkKlist(func,{})
assert(func() == val)
end
checkF(()
return 0
end,0)
checkI(()
return k0
end,0)
checkI(()
return - k0 // 1
end,0)
checkK(()
return 3 ^ - 1
end,1 / 3)
checkK(()
return (1 + 1) ^ (50 + 50)
end,2 ^ 100)
checkK(()
return (- 2) ^ (31 - 2)
end,- 536870912 + 0)
checkF(()
return (- k3 ^ 0 + 5) // 3
end,1)
checkI(()
return - k3 % 5
end,2)
checkF(()
return - ((2 ^ 8 + - (- 1)) % 8) / 2 * 4 - 3
end,- 5)
checkF(()
return - ((2 ^ 8 + - (- 1)) % 8) // 2 * 4 - 3
end,- 7)
checkI(()
return 240 | 204 ~ 170 & 253
end,244)
checkI(()
return ~ (~ kFF0 | kFF0)
end,0)
checkI(()
return ~ ~ - 1024
end,- 1024)
checkI(()
return ((100 << k6) << - 4) >> 2
end,100)
local a = 17
;
local sbx = ((1 << a) - 1) >> 1
local border <const> = 65535
checkI(()
return border
end,sbx)
checkI(()
return - border
end,- sbx)
checkI(()
return border + 1
end,sbx + 1)
checkK(()
return border + 2
end,sbx + 2)
checkK(()
return - (border + 1)
end,- (sbx + 1))
local border <const> = 65535
checkF(()
return border
end,sbx + 0)
checkF(()
return - border
end,- sbx + 0)
checkF(()
return border + 1
end,(sbx + 1))
checkK(()
return border + 2
end,(sbx + 2))
checkK(()
return - (border + 1)
end,- (sbx + 1))
checkR((x)
return x + k1
end,10,11,"ADDI","MMBINI","RETURN1")
checkR((x)
return x - 127
end,10,- 117,"ADDI","MMBINI","RETURN1")
checkR((x)
return 128 + x
end,0,128,"ADDI","MMBINI","RETURN1")
checkR((x)
return x * - 127
end,- 1,127,"MULK","MMBINK","RETURN1")
checkR((x)
return 20 * x
end,2,40,"MULK","MMBINK","RETURN1")
checkR((x)
return x ^ - 2
end,2,0.25,"POWK","MMBINK","RETURN1")
checkR((x)
return x / 40
end,40,1,"DIVK","MMBINK","RETURN1")
checkR((x)
return x // 1
end,10,10,"IDIVK","MMBINK","RETURN1")
checkR((x)
return x % (100 - 10)
end,91,1,"MODK","MMBINK","RETURN1")
checkR((x)
return k1 << x
end,3,8,"SHLI","MMBINI","RETURN1")
checkR((x)
return x << 127
end,10,0,"SHRI","MMBINI","RETURN1")
checkR((x)
return x << - 127
end,10,0,"SHRI","MMBINI","RETURN1")
checkR((x)
return x >> 128
end,8,0,"SHRI","MMBINI","RETURN1")
checkR((x)
return x >> - 127
end,8,0,"SHRI","MMBINI","RETURN1")
checkR((x)
return x & 1
end,9,1,"BANDK","MMBINK","RETURN1")
checkR((x)
return 10 | x
end,1,11,"BORK","MMBINK","RETURN1")
checkR((x)
return - 10 ~ x
end,- 1,9,"BXORK","MMBINK","RETURN1")
checkR((x)
return x + 0
end,1,1,"ADDK","MMBINK","RETURN1")
checkR((x)
return x * - 1e4
end,2,- 2e4,"MULK","MMBINK","RETURN1")
checkR((x)
return x ^ 0.5
end,4,2,"POWK","MMBINK","RETURN1")
checkR((x)
return x / 2
end,4,2,"DIVK","MMBINK","RETURN1")
checkR((x)
return x // 1e4
end,1e4,1,"IDIVK","MMBINK","RETURN1")
checkR((x)
return x % (100 - 10)
end,91,1,"MODK","MMBINK","RETURN1")
check(()
return - 0
end,"LOADF","UNM","RETURN1")
check(()
return k3 / 0
end,"LOADI","DIVK","MMBINK","RETURN1")
check(()
return 0 % 0
end,"LOADI","MODK","MMBINK","RETURN1")
check(()
return - 4 // 0
end,"LOADI","IDIVK","MMBINK","RETURN1")
check((x)
return x >> 2
end,"LOADF","SHR","MMBIN","RETURN1")
check((x)
return x << 128
end,"LOADI","SHL","MMBIN","RETURN1")
check((x)
return x & 2
end,"LOADF","BAND","MMBIN","RETURN1")
check(()
for i = - 10, 10.5
do

end
end,"LOADI","LOADK","LOADI","FORPREP","FORLOOP","RETURN0")
check(()
for i = 268435455, 10, 1
do

end
end,"LOADK","LOADF","LOADI","FORPREP","FORLOOP","RETURN0")
check(()
return - nil
end,"LOADNIL","UNM","RETURN1")
check(()
local a,b,c = 
b[c],a=c,b
b[a],a=c,b
a,b=c,a
a=a
end,"LOADNIL","MOVE","MOVE","SETTABLE","MOVE","MOVE","MOVE","SETTABLE","MOVE","MOVE","MOVE","RETURN0")
local t = 
check(()
t[kx]=t.y
end,"GETTABUP","SETTABUP")
check((a)
t[a()]=t[a()]
end,"MOVE","CALL","GETUPVAL","MOVE","CALL","GETUPVAL","GETTABLE","SETTABLE")
checkequal(()
local a = 
;
if not (a or b) then
b=a
end
end,()
local a = 
;
if (not a and not b) then
b=a
end
end)
checkequal((l)
local a = 
;
return 0 <= a and a <= l
end,(l)
local a = 
;
return not (not (a >= 0) or not (a <= l))
end)
check((a,b)
while a do
if b then
break
else
a=a + 1
end
end,"TEST","JMP","TEST","JMP","ADDI","MMBINI","JMP","RETURN0")
checkequal(()
return 6 or true or nil
end,()
return k6 or kTrue or kNil
end)
checkequal(()
return 6 and true or nil
end,()
return k6 and kTrue or kNil
end)
local k0 <const> = "00000000000000000000000000000000000000000000000000"
local function f1
()
local k <const> = k0
return ()
return ()
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
print("OK")