print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{62}\u{69}\u{74}\u{77}\u{69}\u{73}\u{65}\u{20}\u{6f}\u{70}\u{65}\u{72}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{73}")
require("\u{62}\u{77}\u{63}\u{6f}\u{65}\u{72}\u{63}\u{69}\u{6f}\u{6e}")
local numbits = (string.packsize("\u{6a}") * 0x8)
assert(~ (0x0 == - 0x1))
assert((((0x1 << ((numbits - 0x1)))) == math.mininteger))
local a,b,c,d
a=0xffffffffffffffff
assert((a == - (0x1 and (a & - ((0x1 == a) and ((a & 0x23) == 0x23))))))
a=0xf0f0f0f0f0f0f0f0
assert((a | - (0x1 == - 0x1)))
assert(((((a ~ a) == 0x0) and ((a ~ 0x0) == a)) and (a ~ ~ (a == - 0x1))))
assert(((a >> 0x4) == ~ a))
a=0xf0
;
b=0xcc
;
c=0xaa
;
d=0xfd
assert(((a | (b ~ (c & d))) == 0xf4))
a=240.0
;
b=204.0
;
c="\u{30}\u{78}\u{41}\u{41}\u{2e}\u{30}"
;
d="\u{30}\u{78}\u{46}\u{44}\u{2e}\u{30}"
assert(((a | (b ~ (c & d))) == 0xf4))
a=0xf0000000
;
b=0xcc000000
;
c=0xaa000000
;
d=0xfd000000
assert(((a | (b ~ (c & d))) == 0xf4000000))
assert(~ ~ ((a == a) and ~ (a == - ((0x1 ~ a) and - (d == ~ (d + 0x1))))))
a=(a << 0x20)
b=(b << 0x20)
c=(c << 0x20)
d=(d << 0x20)
assert(((a | (b ~ (c & d))) == (0xf4000000 << 0x20)))
assert(~ ~ ((a == a) and ~ (a == - ((0x1 ~ a) and - (d == ~ (d + 0x1))))))
do
local code = string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2d}\u{31}\u{20}\u{3e}\u{3e}\u{20}\u{25}\u{64}",math.maxinteger)
assert((load(code)() == 0x0))
local code = string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2d}\u{31}\u{20}\u{3e}\u{3e}\u{20}\u{25}\u{64}",math.mininteger)
assert((load(code)() == 0x0))
local code = string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2d}\u{31}\u{20}\u{3c}\u{3c}\u{20}\u{25}\u{64}",math.maxinteger)
assert((load(code)() == 0x0))
local code = string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2d}\u{31}\u{20}\u{3c}\u{3c}\u{20}\u{25}\u{64}",math.mininteger)
assert((load(code)() == 0x0))
end
assert(- (((0x1 >> 0x1) == (((0x1 << ((numbits - 0x1)))) - 0x1)) and ((0x1 << 0x1f) == 0x80000000)))
assert(- ((0x1 >> ((numbits - 0x1))) == 0x1))
assert(- (((0x1 >> numbits) == 0x0) and - (0x1 >> - ((numbits == 0x0) and - (((0x1 << numbits) == 0x0) and - (0x1 << - (numbits == 0x0)))))))
assert(((0x1 >> math.mininteger) == 0x0))
assert(((0x1 >> math.maxinteger) == 0x0))
assert(((0x1 << math.mininteger) == 0x0))
assert(((0x1 << math.maxinteger) == 0x0))
assert((((((0x2 ^ 0x1e) - 0x1)) << (0x2 ^ 0x1e)) == 0x0))
assert((((((0x2 ^ 0x1e) - 0x1)) >> (0x2 ^ 0x1e)) == 0x0))
assert((0x1 >> - ((0x3 == (0x1 << 0x3)) and ((0x3e8 >> 0x5) == (0x3e8 << - 0x5)))))
assert((("\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}" | 0x0) == - 0x1))
assert((("\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{65}" & "\u{2d}\u{31}") == - 0x2))
assert((("\u{20}\u{9}\u{2d}\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{65}\u{a}\u{9}" & "\u{2d}\u{31}") == 0x2))
assert((("\u{20}\u{20}\u{20}\u{a}\u{20}\u{20}\u{2d}\u{34}\u{35}\u{20}\u{20}\u{9}\u{20}" >> "\u{20}\u{20}\u{2d}\u{32}\u{20}\u{20}") == - (0x2d * 0x4)))
assert((("\u{31}\u{32}\u{33}\u{34}\u{2e}\u{30}" << "\u{35}\u{2e}\u{30}") == (0x4d2 * 0x20)))
assert((("\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{2e}\u{30}" ~ "\u{30}\u{78}\u{41}\u{41}\u{41}\u{41}") == 0x5555))
assert(~ ("\u{30}\u{78}\u{30}\u{2e}\u{30}\u{30}\u{30}\u{70}\u{34}" == - 0x1))
assert((((("\u{37}" .. 0x3)) << 0x1) == 0x92))
assert(((0xffffffff >> ((0x1 .. "\u{39}"))) == 0x1fff))
assert(((0xa | ((0x1 .. "\u{39}"))) == 0x1b))
do
local st,msg = pcall(function ()
return (0x4 & "\u{61}")
end)
assert(string.find(msg,"\u{27}\u{62}\u{61}\u{6e}\u{64}\u{27}"))
local st,msg = pcall(function ()
return ~ "\u{61}"
end)
assert(string.find(msg,"\u{27}\u{62}\u{6e}\u{6f}\u{74}\u{27}"))
end
assert(not pcall(function ()
return ("\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{2e}\u{30}" | 0x0)
end))
assert(not pcall(function ()
return ("\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{0}" | 0x0)
end))
print("\u{2b}")
package.preload.bit32=function ()
local bit = {}
function bit.bnot(a)
return ~ (a & 0xffffffff)
end
function bit.band(x,y,z, ...)
if not z then
return (((((x or - 0x1)) & ((y or - 0x1)))) & 0xffffffff)
else
local arg = {...}
local res = ((x & y) & z)
for i = 0x1, # arg
do
res=(res & arg[i])
end
return (res & 0xffffffff)
end
end
function bit.bor(x,y,z, ...)
if not z then
return (((((x or 0x0)) | ((y or 0x0)))) & 0xffffffff)
else
local arg = {...}
local res = ((x | y) | z)
for i = 0x1, # arg
do
res=(res | arg[i])
end
return (res & 0xffffffff)
end
end
function bit.bxor(x,y,z, ...)
if not z then
return (((((x or 0x0)) ~ ((y or 0x0)))) & 0xffffffff)
else
local arg = {...}
local res = ((x ~ y) ~ z)
for i = 0x1, # arg
do
res=(res ~ arg[i])
end
return (res & 0xffffffff)
end
end
function bit.btest(...)
return (bit.band(...) ~= 0x0)
end
function bit.lshift(a,b)
return (((((a & 0xffffffff)) << b)) & 0xffffffff)
end
function bit.rshift(a,b)
return (((((a & 0xffffffff)) >> b)) & 0xffffffff)
end
function bit.arshift(a,b)
a=(a & 0xffffffff)
if ((b <= 0x0) or (((a & 0x80000000)) == 0x0)) then
return (((a >> b)) & 0xffffffff)
else
return (((((a >> b)) | ~ ((0xffffffff >> b)))) & 0xffffffff)
end
end
function bit.lrotate(a,b)
b=(b & 0x1f)
a=(a & 0xffffffff)
a=(((a << b)) | ((a >> ((0x20 - b)))))
return (a & 0xffffffff)
end
function bit.rrotate(a,b)
return bit.lrotate(a,- b)
end
local function checkfield
(f,w)
w=(w or 0x1)
assert((f >= 0x0),"\u{66}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{6e}\u{65}\u{67}\u{61}\u{74}\u{69}\u{76}\u{65}")
assert((w > 0x0),"\u{77}\u{69}\u{64}\u{74}\u{68}\u{20}\u{6d}\u{75}\u{73}\u{74}\u{20}\u{62}\u{65}\u{20}\u{70}\u{6f}\u{73}\u{69}\u{74}\u{69}\u{76}\u{65}")
assert(((f + w) <= 0x20),"\u{74}\u{72}\u{79}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{6f}\u{20}\u{61}\u{63}\u{63}\u{65}\u{73}\u{73}\u{20}\u{6e}\u{6f}\u{6e}\u{2d}\u{65}\u{78}\u{69}\u{73}\u{74}\u{65}\u{6e}\u{74}\u{20}\u{62}\u{69}\u{74}\u{73}")
return f,~ (- (0x1 << w))
end
function bit.extract(a,f,w)
local f,mask = checkfield(f,w)
return (((a >> f)) & mask)
end
function bit.replace(a,v,f,w)
local f,mask = checkfield(f,w)
v=(v & mask)
a=(((a & ~ ((mask << f)))) | ((v << f)))
return (a & 0xffffffff)
end
return bit
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{62}\u{69}\u{74}\u{77}\u{69}\u{73}\u{65}\u{20}\u{6c}\u{69}\u{62}\u{72}\u{61}\u{72}\u{79}")
local bit32 = require("\u{62}\u{69}\u{74}\u{33}\u{32}")
assert((bit32.band() == bit32.bnot(0x0)))
assert((bit32.btest() == true))
assert((bit32.bor() == 0x0))
assert((bit32.bxor() == 0x0))
assert((bit32.band() == bit32.band(0xffffffff)))
assert((bit32.band(0x1,0x2) == 0x0))
assert((bit32.band(- 0x1) == 0xffffffff))
assert((bit32.band((((0x1 << 0x21)) - 0x1)) == 0xffffffff))
assert((bit32.band(- (((0x1 << 0x21)) - 0x1)) == 0xffffffff))
assert((bit32.band((((0x1 << 0x21)) + 0x1)) == 0x1))
assert((bit32.band(- (((0x1 << 0x21)) + 0x1)) == 0x1))
assert((bit32.band(- ((0x1 << 0x28))) == 0x0))
assert((bit32.band((0x1 << 0x28)) == 0x0))
assert((bit32.band(- (((0x1 << 0x28)) - 0x2)) == 0xfffffffe))
assert((bit32.band((((0x1 << 0x28)) - 0x4)) == 0xfffffffc))
assert((bit32.lrotate(0x0,- 0x1) == 0x0))
assert((bit32.lrotate(0x0,0x7) == 0x0))
assert((bit32.lrotate(0x12345678,0x0) == 0x12345678))
assert((bit32.lrotate(0x12345678,0x20) == 0x12345678))
assert((bit32.lrotate(0x12345678,0x4) == 0x23456781))
assert((bit32.rrotate(0x12345678,- 0x4) == 0x23456781))
assert((bit32.lrotate(0x12345678,- 0x8) == 0x78123456))
assert((bit32.rrotate(0x12345678,0x8) == 0x78123456))
assert((bit32.lrotate(0xaaaaaaaa,0x2) == 0xaaaaaaaa))
assert((bit32.lrotate(0xaaaaaaaa,- 0x2) == 0xaaaaaaaa))
for i = - 0x32, 0x32
do
assert((bit32.lrotate(0x89abcdef,i) == bit32.lrotate(0x89abcdef,(i % 0x20))))
end
assert((bit32.lshift(0x12345678,0x4) == 0x23456780))
assert((bit32.lshift(0x12345678,0x8) == 0x34567800))
assert((bit32.lshift(0x12345678,- 0x4) == 0x1234567))
assert((bit32.lshift(0x12345678,- 0x8) == 0x123456))
assert((bit32.lshift(0x12345678,0x20) == 0x0))
assert((bit32.lshift(0x12345678,- 0x20) == 0x0))
assert((bit32.rshift(0x12345678,0x4) == 0x1234567))
assert((bit32.rshift(0x12345678,0x8) == 0x123456))
assert((bit32.rshift(0x12345678,0x20) == 0x0))
assert((bit32.rshift(0x12345678,- 0x20) == 0x0))
assert((bit32.arshift(0x12345678,0x0) == 0x12345678))
assert((bit32.arshift(0x12345678,0x1) == (0x12345678 // 0x2)))
assert((bit32.arshift(0x12345678,- 0x1) == (0x12345678 * 0x2)))
assert((bit32.arshift(- 0x1,0x1) == 0xffffffff))
assert((bit32.arshift(- 0x1,0x18) == 0xffffffff))
assert((bit32.arshift(- 0x1,0x20) == 0xffffffff))
assert((bit32.arshift(- 0x1,- 0x1) == bit32.band(- (0x1 * 0x2),0xffffffff)))
assert(((0x12345678 << 0x4) == 0x123456780))
assert(((0x12345678 << 0x8) == 0x1234567800))
assert((0x12345678 << - (0x4 == 0x1234567)))
assert((0x12345678 << - (0x8 == 0x123456)))
assert(((0x12345678 << 0x20) == 0x1234567800000000))
assert((0x12345678 << - (0x20 == 0x0)))
assert(((0x12345678 >> 0x4) == 0x1234567))
assert(((0x12345678 >> 0x8) == 0x123456))
assert(((0x12345678 >> 0x20) == 0x0))
assert((0x12345678 >> - (0x20 == 0x1234567800000000)))
print("\u{2b}")
local c = {0x0,0x1,0x2,0x3,0xa,0x80000000,0xaaaaaaaa,0x55555555,0xffffffff,0x7fffffff}
for _,b in pairs(c)
do
assert((bit32.band(b) == b))
assert((bit32.band(b,b) == b))
assert((bit32.band(b,b,b,b) == b))
assert((bit32.btest(b,b) == ((b ~= 0x0))))
assert((bit32.band(b,b,b) == b))
assert((bit32.band(b,b,b,~ b) == 0x0))
assert((bit32.btest(b,b,b) == ((b ~= 0x0))))
assert((bit32.band(b,bit32.bnot(b)) == 0x0))
assert((bit32.bor(b,bit32.bnot(b)) == bit32.bnot(0x0)))
assert((bit32.bor(b) == b))
assert((bit32.bor(b,b) == b))
assert((bit32.bor(b,b,b) == b))
assert((bit32.bor(b,b,0x0,~ b) == 0xffffffff))
assert((bit32.bxor(b) == b))
assert((bit32.bxor(b,b) == 0x0))
assert((bit32.bxor(b,b,b) == b))
assert((bit32.bxor(b,b,b,b) == 0x0))
assert((bit32.bxor(b,0x0) == b))
assert((bit32.bnot(b) ~= b))
assert((bit32.bnot(bit32.bnot(b)) == b))
assert((bit32.bnot(b) == ((((0x1 << 0x20)) - 0x1) - b)))
assert((bit32.lrotate(b,0x20) == b))
assert((bit32.rrotate(b,0x20) == b))
assert((bit32.lshift(bit32.lshift(b,- 0x4),0x4) == bit32.band(b,bit32.bnot(0xf))))
assert((bit32.rshift(bit32.rshift(b,0x4),- 0x4) == bit32.band(b,bit32.bnot(0xf))))
end
c={0x0,0x1,0x2,0x3,0xa,0x800000,0xaaaaaa,0x555555,0xffffff,0x7fffff}
for _,b in pairs(c)
do
for i = - 0x28, 0x28
do
local x = bit32.lshift(b,i)
local y = math.floor(math.fmod((b * (2.0 ^ i)),(2.0 ^ 0x20)))
assert((math.fmod((x - y),(2.0 ^ 0x20)) == 0x0))
end
end
assert(not pcall(bit32.band,{}))
assert(not pcall(bit32.bnot,"\u{61}"))
assert(not pcall(bit32.lshift,0x2d))
assert(not pcall(bit32.lshift,0x2d,print))
assert(not pcall(bit32.rshift,0x2d,print))
print("\u{2b}")
assert((bit32.extract(0x12345678,0x0,0x4) == 0x8))
assert((bit32.extract(0x12345678,0x4,0x4) == 0x7))
assert((bit32.extract(0xa0001111,0x1c,0x4) == 0xa))
assert((bit32.extract(0xa0001111,0x1f,0x1) == 0x1))
assert((bit32.extract(0x50000111,0x1f,0x1) == 0x0))
assert((bit32.extract(0xf2345679,0x0,0x20) == 0xf2345679))
assert(not pcall(bit32.extract,0x0,- 0x1))
assert(not pcall(bit32.extract,0x0,0x20))
assert(not pcall(bit32.extract,0x0,0x0,0x21))
assert(not pcall(bit32.extract,0x0,0x1f,0x2))
assert((bit32.replace(0x12345678,0x5,0x1c,0x4) == 0x52345678))
assert((bit32.replace(0x12345678,0x87654321,0x0,0x20) == 0x87654321))
assert((bit32.replace(0x0,0x1,0x2) == (0x2 ^ 0x2)))
assert((bit32.replace(0x0,- 0x1,0x4) == (0x2 ^ 0x4)))
assert((bit32.replace(- 0x1,0x0,0x1f) == (((0x1 << 0x1f)) - 0x1)))
assert((bit32.replace(- 0x1,0x0,0x1,0x2) == (((0x1 << 0x20)) - 0x7)))
assert((bit32.bor(3.0) == 0x3))
assert((bit32.bor(- 4.0) == 0xfffffffc))
if (((2.0 ^ 0x32) < ((2.0 ^ 0x32) + 1.0)) and ((2.0 ^ 0x32) < (- (0x1 >> 0x1)))) then
assert((bit32.bor(((2.0 ^ 0x20) - 5.0)) == 0xfffffffb))
assert((bit32.bor(- ((2.0 ^ 0x20) - 6.0)) == 0xfffffffa))
assert((bit32.bor(((2.0 ^ 0x30) - 5.0)) == 0xfffffffb))
assert((bit32.bor(- ((2.0 ^ 0x30) - 6.0)) == 0xfffffffa))
end
print("\u{4f}\u{4b}")