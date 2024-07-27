print("testing bitwise operations")
require("bwcoercion")
local numbits = string.packsize("j") * 8
assert(~ 0 == - 1)
assert((1 << (numbits - 1)) == math.mininteger)
local a,b,c,d = 
a=18446744073709551615
assert(a == - 1 and a & - 1 == a and a & 35 == 35)
a=17361641481138401520
assert(a | - 1 == - 1)
assert(a ~ a == 0 and a ~ 0 == a and a ~ ~ a == - 1)
assert(a >> 4 == ~ a)
a=240
;
b=204
;
c=170
;
d=253
assert(a | b ~ c & d == 244)
a=240
;
b=204
;
c="0xAA.0"
;
d="0xFD.0"
assert(a | b ~ c & d == 244)
a=4026531840
;
b=3422552064
;
c=2852126720
;
d=4244635648
assert(a | b ~ c & d == 4093640704)
assert(~ ~ a == a and ~ a == - 1 ~ a and - d == ~ d + 1)
a=a << 32
b=b << 32
c=c << 32
d=d << 32
assert(a | b ~ c & d == 4093640704 << 32)
assert(~ ~ a == a and ~ a == - 1 ~ a and - d == ~ d + 1)
local code = string.format("return -1 >> %d",math.maxinteger)
assert(load(code)() == 0)
local code = string.format("return -1 >> %d",math.mininteger)
assert(load(code)() == 0)
local code = string.format("return -1 << %d",math.maxinteger)
assert(load(code)() == 0)
local code = string.format("return -1 << %d",math.mininteger)
assert(load(code)() == 0)
assert(- 1 >> 1 == (1 << (numbits - 1)) - 1 and 1 << 31 == 2147483648)
assert(- 1 >> (numbits - 1) == 1)
assert(- 1 >> numbits == 0 and - 1 >> - numbits == 0 and - 1 << numbits == 0 and - 1 << - numbits == 0)
assert(1 >> math.mininteger == 0)
assert(1 >> math.maxinteger == 0)
assert(1 << math.mininteger == 0)
assert(1 << math.maxinteger == 0)
assert((2 ^ 30 - 1) << 2 ^ 30 == 0)
assert((2 ^ 30 - 1) >> 2 ^ 30 == 0)
assert(1 >> - 3 == 1 << 3 and 1e3 >> 5 == 1e3 << - 5)
assert("0xffffffffffffffff" | 0 == - 1)
assert("0xfffffffffffffffe" & "-1" == - 2)
assert(" 	-0xfffffffffffffffe
	" & "-1" == 2)
assert("   
  -45  	 " >> "  -2  " == - 45 * 4)
assert("1234.0" << "5.0" == 1234 * 32)
assert("0xffff.0" ~ "0xAAAA" == 21845)
assert(~ "0x0.000p4" == - 1)
assert(("7" .. 3) << 1 == 146)
assert(4294967295 >> (1 .. "9") == 8191)
assert(10 | (1 .. "9") == 27)
local st,msg = pcall(()
return 4 & "a"
end)
assert(string.find(msg,"'band'"))
local st,msg = pcall(()
return ~ "a"
end)
assert(string.find(msg,"'bnot'"))
assert(not pcall(()
return "0xffffffffffffffff.0" | 0
end))
assert(not pcall(()
return "0xffffffffffffffff" | 0
end))
print("+")
package.preload.bit32=()
local bit = {}
function bit.bnot(a)
return ~ a & 4294967295
end
function bit.band(x,y,z, ...)
if not z then
return ((x or - 1) & (y or - 1)) & 4294967295
else
local arg = {...}
local res = x & y & z
for i = 1, # arg
do
res=res & arg[i]
end
return res & 4294967295
end
end
function bit.bor(x,y,z, ...)
if not z then
return ((x or 0) | (y or 0)) & 4294967295
else
local arg = {...}
local res = x | y | z
for i = 1, # arg
do
res=res | arg[i]
end
return res & 4294967295
end
end
function bit.bxor(x,y,z, ...)
if not z then
return ((x or 0) ~ (y or 0)) & 4294967295
else
local arg = {...}
local res = x ~ y ~ z
for i = 1, # arg
do
res=res ~ arg[i]
end
return res & 4294967295
end
end
function bit.btest(...)
return bit.band(...) ~= 0
end
function bit.lshift(a,b)
return ((a & 4294967295) << b) & 4294967295
end
function bit.rshift(a,b)
return ((a & 4294967295) >> b) & 4294967295
end
function bit.arshift(a,b)
a=a & 4294967295
if b <= 0 or (a & 2147483648) == 0 then
return (a >> b) & 4294967295
else
return ((a >> b) | ~ (4294967295 >> b)) & 4294967295
end
end
function bit.lrotate(a,b)
b=b & 31
a=a & 4294967295
a=(a << b) | (a >> (32 - b))
return a & 4294967295
end
function bit.rrotate(a,b)
return bit.lrotate(a,- b)
end
local function checkfield
(f,w)
w=w or 1
assert(f >= 0,"field cannot be negative")
assert(w > 0,"width must be positive")
assert(f + w <= 32,"trying to access non-existent bits")
return f,~ (- 1 << w)
end
function bit.extract(a,f,w)
local f,mask = checkfield(f,w)
return (a >> f) & mask
end
function bit.replace(a,v,f,w)
local f,mask = checkfield(f,w)
v=v & mask
a=(a & ~ (mask << f)) | (v << f)
return a & 4294967295
end
return bit
end
print("testing bitwise library")
local bit32 = require("bit32")
assert(bit32.band() == bit32.bnot(0))
assert(bit32.btest() == true)
assert(bit32.bor() == 0)
assert(bit32.bxor() == 0)
assert(bit32.band() == bit32.band(4294967295))
assert(bit32.band(1,2) == 0)
assert(bit32.band(- 1) == 4294967295)
assert(bit32.band((1 << 33) - 1) == 4294967295)
assert(bit32.band(- (1 << 33) - 1) == 4294967295)
assert(bit32.band((1 << 33) + 1) == 1)
assert(bit32.band(- (1 << 33) + 1) == 1)
assert(bit32.band(- (1 << 40)) == 0)
assert(bit32.band(1 << 40) == 0)
assert(bit32.band(- (1 << 40) - 2) == 4294967294)
assert(bit32.band((1 << 40) - 4) == 4294967292)
assert(bit32.lrotate(0,- 1) == 0)
assert(bit32.lrotate(0,7) == 0)
assert(bit32.lrotate(305419896,0) == 305419896)
assert(bit32.lrotate(305419896,32) == 305419896)
assert(bit32.lrotate(305419896,4) == 591751041)
assert(bit32.rrotate(305419896,- 4) == 591751041)
assert(bit32.lrotate(305419896,- 8) == 2014458966)
assert(bit32.rrotate(305419896,8) == 2014458966)
assert(bit32.lrotate(2863311530,2) == 2863311530)
assert(bit32.lrotate(2863311530,- 2) == 2863311530)
for i = - 50, 50
do
assert(bit32.lrotate(2309737967,i) == bit32.lrotate(2309737967,i % 32))
end
assert(bit32.lshift(305419896,4) == 591751040)
assert(bit32.lshift(305419896,8) == 878082048)
assert(bit32.lshift(305419896,- 4) == 19088743)
assert(bit32.lshift(305419896,- 8) == 1193046)
assert(bit32.lshift(305419896,32) == 0)
assert(bit32.lshift(305419896,- 32) == 0)
assert(bit32.rshift(305419896,4) == 19088743)
assert(bit32.rshift(305419896,8) == 1193046)
assert(bit32.rshift(305419896,32) == 0)
assert(bit32.rshift(305419896,- 32) == 0)
assert(bit32.arshift(305419896,0) == 305419896)
assert(bit32.arshift(305419896,1) == 305419896 // 2)
assert(bit32.arshift(305419896,- 1) == 305419896 * 2)
assert(bit32.arshift(- 1,1) == 4294967295)
assert(bit32.arshift(- 1,24) == 4294967295)
assert(bit32.arshift(- 1,32) == 4294967295)
assert(bit32.arshift(- 1,- 1) == bit32.band(- 1 * 2,4294967295))
assert(305419896 << 4 == 4886718336)
assert(305419896 << 8 == 78187493376)
assert(305419896 << - 4 == 19088743)
assert(305419896 << - 8 == 1193046)
assert(305419896 << 32 == 1311768464867721216)
assert(305419896 << - 32 == 0)
assert(305419896 >> 4 == 19088743)
assert(305419896 >> 8 == 1193046)
assert(305419896 >> 32 == 0)
assert(305419896 >> - 32 == 1311768464867721216)
print("+")
local c = {0,1,2,3,10,2147483648,2863311530,1431655765,4294967295,2147483647}
for _,b in pairs(c)
do
assert(bit32.band(b) == b)
assert(bit32.band(b,b) == b)
assert(bit32.band(b,b,b,b) == b)
assert(bit32.btest(b,b) == (b ~= 0))
assert(bit32.band(b,b,b) == b)
assert(bit32.band(b,b,b,~ b) == 0)
assert(bit32.btest(b,b,b) == (b ~= 0))
assert(bit32.band(b,bit32.bnot(b)) == 0)
assert(bit32.bor(b,bit32.bnot(b)) == bit32.bnot(0))
assert(bit32.bor(b) == b)
assert(bit32.bor(b,b) == b)
assert(bit32.bor(b,b,b) == b)
assert(bit32.bor(b,b,0,~ b) == 4294967295)
assert(bit32.bxor(b) == b)
assert(bit32.bxor(b,b) == 0)
assert(bit32.bxor(b,b,b) == b)
assert(bit32.bxor(b,b,b,b) == 0)
assert(bit32.bxor(b,0) == b)
assert(bit32.bnot(b) ~= b)
assert(bit32.bnot(bit32.bnot(b)) == b)
assert(bit32.bnot(b) == (1 << 32) - 1 - b)
assert(bit32.lrotate(b,32) == b)
assert(bit32.rrotate(b,32) == b)
assert(bit32.lshift(bit32.lshift(b,- 4),4) == bit32.band(b,bit32.bnot(15)))
assert(bit32.rshift(bit32.rshift(b,4),- 4) == bit32.band(b,bit32.bnot(15)))
end
c={0,1,2,3,10,8388608,11184810,5592405,16777215,8388607}
for _,b in pairs(c)
do
for i = - 40, 40
do
local x = bit32.lshift(b,i)
local y = math.floor(math.fmod(b * 2 ^ i,2 ^ 32))
assert(math.fmod(x - y,2 ^ 32) == 0)
end
end
assert(not pcall(bit32.band,{}))
assert(not pcall(bit32.bnot,"a"))
assert(not pcall(bit32.lshift,45))
assert(not pcall(bit32.lshift,45,print))
assert(not pcall(bit32.rshift,45,print))
print("+")
assert(bit32.extract(305419896,0,4) == 8)
assert(bit32.extract(305419896,4,4) == 7)
assert(bit32.extract(2684358929,28,4) == 10)
assert(bit32.extract(2684358929,31,1) == 1)
assert(bit32.extract(1342177553,31,1) == 0)
assert(bit32.extract(4063516281,0,32) == 4063516281)
assert(not pcall(bit32.extract,0,- 1))
assert(not pcall(bit32.extract,0,32))
assert(not pcall(bit32.extract,0,0,33))
assert(not pcall(bit32.extract,0,31,2))
assert(bit32.replace(305419896,5,28,4) == 1379161720)
assert(bit32.replace(305419896,2271560481,0,32) == 2271560481)
assert(bit32.replace(0,1,2) == 2 ^ 2)
assert(bit32.replace(0,- 1,4) == 2 ^ 4)
assert(bit32.replace(- 1,0,31) == (1 << 31) - 1)
assert(bit32.replace(- 1,0,1,2) == (1 << 32) - 7)
assert(bit32.bor(3) == 3)
assert(bit32.bor(- 4) == 4294967292)
if 2 ^ 50 < 2 ^ 50 + 1 and 2 ^ 50 < (- 1 >> 1) then
assert(bit32.bor(2 ^ 32 - 5) == 4294967291)
assert(bit32.bor(- 2 ^ 32 - 6) == 4294967290)
assert(bit32.bor(2 ^ 48 - 5) == 4294967291)
assert(bit32.bor(- 2 ^ 48 - 6) == 4294967290)
end
print("OK")