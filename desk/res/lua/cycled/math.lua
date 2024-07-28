print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{73}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{6d}\u{61}\u{74}\u{68}\u{20}\u{6c}\u{69}\u{62}")
local minint <const> = math.mininteger
local maxint <const> = math.maxinteger
local intbits <const> = math.floor(math.log(maxint,0x2) + 0.5) + 0x1
assert((0x1 << intbits) == 0x0)
assert(minint == 0x1 << (intbits - 0x1))
assert(maxint == minint - 0x1)
local floatbits = 0x18
do
local p = 2.0 ^ floatbits
while p < p + 1.0 do
p=p * 2.0
floatbits=floatbits + 0x1
end
end
local function isNaN
(x)
return (x ~= x)
end
assert(isNaN(0x0 / 0x0))
assert(not isNaN(0x1 / 0x0))
do
local x = 2.0 ^ floatbits
assert(x > x - 1.0 and x == x + 1.0)
print(string.format("\u{25}\u{64}\u{2d}\u{62}\u{69}\u{74}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}\u{73}\u{2c}\u{20}\u{25}\u{64}\u{2d}\u{62}\u{69}\u{74}\u{20}\u{28}\u{6d}\u{61}\u{6e}\u{74}\u{69}\u{73}\u{73}\u{61}\u{29}\u{20}\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{73}",intbits,floatbits))
end
assert(math.type(0x0) == "\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}" and math.type(0.0) == "\u{66}\u{6c}\u{6f}\u{61}\u{74}" and not math.type("\u{31}\u{30}"))
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
local msgf2i = "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{2e}\u{2a}\u{20}\u{68}\u{61}\u{73}\u{20}\u{6e}\u{6f}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}\u{20}\u{72}\u{65}\u{70}\u{72}\u{65}\u{73}\u{65}\u{6e}\u{74}\u{61}\u{74}\u{69}\u{6f}\u{6e}"
local function eq
(a,b,limit)
if not limit then
if floatbits >= 0x32 then
limit=1e-11
else
limit=1e-5
end
end
return a == b or math.abs(a - b) <= limit
end
local function eqT
(a,b)
return a == b and math.type(a) == math.type(b)
end
assert(0.0 == 0x0 and 0.0 == 0x0 and 0.0 == 0x0 and 20.0 == 0x14 and 0.2 == 0.2)
do
local a,b,c = "\u{32}","\u{20}\u{33}\u{65}\u{30}\u{20}","\u{20}\u{31}\u{30}\u{20}\u{20}"
assert(a + b == 0x5 and - b == - 0x3 and b + "\u{32}" == 0x5 and "\u{31}\u{30}" - c == 0x0)
assert(type(a) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}" and type(b) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}" and type(c) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")
assert(a == "\u{32}" and b == "\u{20}\u{33}\u{65}\u{30}\u{20}" and c == "\u{20}\u{31}\u{30}\u{20}\u{20}" and - c == - "\u{20}\u{20}\u{31}\u{30}\u{20}")
assert(c % a == 0x0 and a ^ b == 0x8)
a=0x0
assert(a == - a and 0x0 == - 0x0)
end
do
local x = - 0x1
local mz = 0x0 / x
local t = {[0x0] = 0xa,0x14,0x1e,0x28,0x32}
assert(t[mz] == t[0x0] and t[- 0x0] == t[0x0])
end
do
local a,b = math.modf(3.5)
assert(a == 3.0 and b == 0.5)
a,b=math.modf(- 2.5)
assert(a == - 2.0 and b == - 0.5)
a,b=math.modf(- 3e23)
assert(a == - 3e23 and b == 0.0)
a,b=math.modf(3e35)
assert(a == 3e35 and b == 0.0)
a,b=math.modf(- 0x1 / 0x0)
assert(a == - 0x1 / 0x0 and b == 0.0)
a,b=math.modf(0x1 / 0x0)
assert(a == 0x1 / 0x0 and b == 0.0)
a,b=math.modf(0x0 / 0x0)
assert(isNaN(a) and isNaN(b))
a,b=math.modf(0x3)
assert(eqT(a,0x3) and eqT(b,0.0))
a,b=math.modf(minint)
assert(eqT(a,minint) and eqT(b,0.0))
end
assert(math.huge > 1e31)
assert(- math.huge < - 1e31)
assert(minint < minint + 0x1)
assert(maxint - 0x1 < maxint)
assert(0x0 - minint == minint)
assert(minint * minint == 0x0)
assert(maxint * maxint * maxint == maxint)
for _,i in pairs({- 0x10,- 0xf,- 0x3,- 0x2,- 0x1,0x0,0x1,0x2,0x3,0xf})
do
for _,j in pairs({- 0x10,- 0xf,- 0x3,- 0x2,- 0x1,0x1,0x2,0x3,0xf})
do
for _,ti in pairs({0x0,0.0})
do
for _,tj in pairs({0x0,0.0})
do
local x = i + ti
local y = j + tj
assert(i // j == math.floor(i / j))
end
end
end
end
assert(0x1 // 0.0 == 0x1 / 0x0)
assert(- 0x1 // 0.0 == - 0x1 / 0x0)
assert(eqT(3.5 // 1.5,2.0))
assert(eqT(3.5 // - 1.5,- 3.0))
do
local x,y
x=0x1
;
assert(x // 0.0 == 0x1 / 0x0)
x=1.0
;
assert(x // 0x0 == 0x1 / 0x0)
x=3.5
;
assert(eqT(x // 0x1,3.0))
assert(eqT(x // - 0x1,- 4.0))
x=3.5
;
y=1.5
;
assert(eqT(x // y,2.0))
x=3.5
;
y=- 1.5
;
assert(eqT(x // y,- 3.0))
end
assert(maxint // maxint == 0x1)
assert(maxint // 0x1 == maxint)
assert((maxint - 0x1) // maxint == 0x0)
assert(maxint // (maxint - 0x1) == 0x1)
assert(minint // minint == 0x1)
assert(minint // minint == 0x1)
assert((minint + 0x1) // minint == 0x0)
assert(minint // (minint + 0x1) == 0x1)
assert(minint // 0x1 == minint)
assert(minint // - 0x1 == - minint)
assert(minint // - 0x2 == 0x2 ^ (intbits - 0x2))
assert(maxint // - 0x1 == - maxint)
do
assert(0x2 ^ - 0x3 == 0x1 / 0x2 ^ 0x3)
assert(eq((- 0x3) ^ - 0x3,0x1 / (- 0x3) ^ 0x3))
for i = - 0x3, 0x3
do
for j = - 0x3, 0x3
do
if not _port or i ~= 0x0 or j > 0x0 then
assert(eq(i ^ j,0x1 / i ^ (- j)))
end
end
end
end
if floatbits < intbits then
assert(2.0 ^ floatbits == (0x1 << floatbits))
assert(2.0 ^ floatbits - 1.0 == (0x1 << floatbits) - 1.0)
assert(2.0 ^ floatbits - 1.0 ~= (0x1 << floatbits))
assert(2.0 ^ floatbits + 1.0 ~= (0x1 << floatbits) + 0x1)
else
assert(maxint == maxint + 0.0)
assert(maxint - 0x1 == maxint - 1.0)
assert(minint + 0x1 == minint + 1.0)
assert(maxint ~= maxint - 1.0)
end
assert(maxint + 0.0 == 2.0 ^ (intbits - 0x1) - 1.0)
assert(minint + 0.0 == minint)
assert(minint + 0.0 == - 2.0 ^ (intbits - 0x1))
assert(0x1 < 1.1)
;
assert(not (0x1 < 0.9))
assert(0x1 <= 1.1)
;
assert(not (0x1 <= 0.9))
assert(- 0x1 < - 0.9)
;
assert(not (- 0x1 < - 1.1))
assert(0x1 <= 1.1)
;
assert(not (- 0x1 <= - 1.1))
assert(- 0x1 < - 0.9)
;
assert(not (- 0x1 < - 1.1))
assert(- 0x1 <= - 0.9)
;
assert(not (- 0x1 <= - 1.1))
assert(minint <= minint + 0.0)
assert(minint + 0.0 <= minint)
assert(not (minint < minint + 0.0))
assert(not (minint + 0.0 < minint))
assert(maxint < minint * - 1.0)
assert(maxint <= minint * - 1.0)
do
local fmaxi1 = 0x2 ^ (intbits - 0x1)
assert(maxint < fmaxi1)
assert(maxint <= fmaxi1)
assert(not (fmaxi1 <= maxint))
assert(minint <= - 0x2 ^ (intbits - 0x1))
assert(- 0x2 ^ (intbits - 0x1) <= minint)
end
if floatbits < intbits then
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{72}\u{64}\u{65}\u{72}\u{20}\u{28}\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{73}\u{20}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{72}\u{65}\u{70}\u{72}\u{65}\u{73}\u{65}\u{6e}\u{74}\u{20}\u{61}\u{6c}\u{6c}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}\u{73}\u{29}")
local fmax = 0x2 ^ floatbits
local ifmax = fmax | 0x0
assert(fmax < ifmax + 0x1)
assert(fmax - 0x1 < ifmax)
assert(- (fmax - 0x1) > - ifmax)
assert(not (fmax <= ifmax - 0x1))
assert(- fmax > - (ifmax + 0x1))
assert(not (- fmax >= - (ifmax - 0x1)))
assert(fmax / 0x2 - 0.5 < ifmax // 0x2)
assert(- (fmax / 0x2 - 0.5) > - ifmax // 0x2)
assert(maxint < 0x2 ^ intbits)
assert(minint > - 0x2 ^ intbits)
assert(maxint <= 0x2 ^ intbits)
assert(minint >= - 0x2 ^ intbits)
else
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{72}\u{64}\u{65}\u{72}\u{20}\u{28}\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{73}\u{20}\u{63}\u{61}\u{6e}\u{20}\u{72}\u{65}\u{70}\u{72}\u{65}\u{73}\u{65}\u{6e}\u{74}\u{20}\u{61}\u{6c}\u{6c}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}\u{73}\u{29}")
assert(maxint < maxint + 1.0)
assert(maxint < maxint + 0.5)
assert(maxint - 1.0 < maxint)
assert(maxint - 0.5 < maxint)
assert(not (maxint + 0.0 < maxint))
assert(maxint + 0.0 <= maxint)
assert(not (maxint < maxint + 0.0))
assert(maxint + 0.0 <= maxint)
assert(maxint <= maxint + 0.0)
assert(not (maxint + 1.0 <= maxint))
assert(not (maxint + 0.5 <= maxint))
assert(not (maxint <= maxint - 1.0))
assert(not (maxint <= maxint - 0.5))
assert(minint < minint + 1.0)
assert(minint < minint + 0.5)
assert(minint <= minint + 0.5)
assert(minint - 1.0 < minint)
assert(minint - 1.0 <= minint)
assert(not (minint + 0.0 < minint))
assert(not (minint + 0.5 < minint))
assert(not (minint < minint + 0.0))
assert(minint + 0.0 <= minint)
assert(minint <= minint + 0.0)
assert(not (minint + 1.0 <= minint))
assert(not (minint + 0.5 <= minint))
assert(not (minint <= minint - 1.0))
end
do
local NaN <const> = 0x0 / 0x0
assert(not (NaN < 0x0))
assert(not (NaN > minint))
assert(not (NaN <= - 0x9))
assert(not (NaN <= maxint))
assert(not (NaN < maxint))
assert(not (minint <= NaN))
assert(not (minint < NaN))
assert(not (0x4 <= NaN))
assert(not (0x4 < NaN))
end
local function checkcompt
(msg,code)
checkerror(msg,assert(load(code)))
end
checkcompt("\u{64}\u{69}\u{76}\u{69}\u{64}\u{65}\u{20}\u{62}\u{79}\u{20}\u{7a}\u{65}\u{72}\u{6f}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{32}\u{20}\u{2f}\u{2f}\u{20}\u{30}")
checkcompt(msgf2i,"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{32}\u{2e}\u{33}\u{20}\u{3e}\u{3e}\u{20}\u{30}")
checkcompt(msgf2i,("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{32}\u{2e}\u{30}\u{5e}\u{25}\u{64}\u{20}\u{26}\u{20}\u{31}"):format(intbits - 0x1))
checkcompt("\u{66}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{27}\u{68}\u{75}\u{67}\u{65}\u{27}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{6d}\u{61}\u{74}\u{68}\u{2e}\u{68}\u{75}\u{67}\u{65}\u{20}\u{3c}\u{3c}\u{20}\u{31}")
checkcompt(msgf2i,("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}\u{20}\u{7c}\u{20}\u{32}\u{2e}\u{30}\u{5e}\u{25}\u{64}"):format(intbits - 0x1))
checkcompt(msgf2i,"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{32}\u{2e}\u{33}\u{20}\u{7e}\u{20}\u{30}\u{2e}\u{30}")
local function f2i
(x)
return x | x
end
checkerror(msgf2i,f2i,math.huge)
checkerror(msgf2i,f2i,- math.huge)
checkerror(msgf2i,f2i,0x0 / 0x0)
if floatbits < intbits then
assert(maxint + 1.0 == maxint + 0.0)
assert(minint - 1.0 == minint + 0.0)
checkerror(msgf2i,f2i,maxint + 0.0)
assert(f2i(2.0 ^ (intbits - 0x2)) == 0x1 << (intbits - 0x2))
assert(f2i(- 2.0 ^ (intbits - 0x2)) == - (0x1 << (intbits - 0x2)))
assert((2.0 ^ (floatbits - 0x1) + 1.0) // 0x1 == (0x1 << (floatbits - 0x1)) + 0x1)
local mf = maxint - (0x1 << (floatbits - intbits)) + 0x1
assert(f2i(mf + 0.0) == mf)
mf=mf + 0x1
assert(f2i(mf + 0.0) ~= mf)
else
assert(maxint + 1.0 > maxint)
assert(minint - 1.0 < minint)
assert(f2i(maxint + 0.0) == maxint)
checkerror("\u{6e}\u{6f}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}\u{20}\u{72}\u{65}\u{70}",f2i,maxint + 1.0)
checkerror("\u{6e}\u{6f}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}\u{20}\u{72}\u{65}\u{70}",f2i,minint - 1.0)
end
assert(f2i(minint + 0.0) == minint)
assert("\u{32}" + 0x1 == 0x3)
assert("\u{32}\u{20}" + 0x1 == 0x3)
assert("\u{20}\u{2d}\u{32}\u{20}" + 0x1 == - 0x1)
assert("\u{20}\u{2d}\u{30}\u{78}\u{61}\u{20}" + 0x1 == - 0x9)
do
assert(eqT(tonumber(tostring(maxint)),maxint))
assert(eqT(tonumber(tostring(minint)),minint))
local function incd
(n)
local s = string.format("\u{25}\u{64}",n)
s=string.gsub(s,"\u{25}\u{64}\u{24}",function (d)
assert(d ~= "\u{39}")
return string.char(string.byte(d) + 0x1)
end)
return s
end
assert(eqT(tonumber(incd(maxint)),maxint + 1.0))
assert(eqT(tonumber(incd(minint)),minint - 1.0))
assert(eqT(tonumber("\u{31}" .. string.rep("\u{30}",0x1e)),1e30))
assert(eqT(tonumber("\u{2d}\u{31}" .. string.rep("\u{30}",0x1e)),- 1e30))
assert(eqT(tonumber("\u{30}\u{78}\u{31}" .. string.rep("\u{30}",0x1e)),0x0))
assert(minint == load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}" .. minint)())
assert(eqT(maxint,load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}" .. maxint)()))
assert(eqT(1e22,1e22))
assert(eqT(- 1e22,- 1e22))
end
assert(tonumber(3.4) == 3.4)
assert(eqT(tonumber(0x3),0x3))
assert(eqT(tonumber(maxint),maxint) and eqT(tonumber(minint),minint))
assert(tonumber(0x1 / 0x0) == 0x1 / 0x0)
assert(tonumber("\u{30}") == 0x0)
assert(not tonumber(""))
assert(not tonumber("\u{20}\u{20}"))
assert(not tonumber("\u{2d}"))
assert(not tonumber("\u{20}\u{20}\u{2d}\u{30}\u{78}\u{20}"))
assert(not tonumber({}))
assert(tonumber("\u{2b}\u{30}\u{2e}\u{30}\u{31}") == 0x1 / 0x64 and tonumber("\u{2b}\u{2e}\u{30}\u{31}") == 0.01 and tonumber("\u{2e}\u{30}\u{31}") == 0.01 and tonumber("\u{2d}\u{31}\u{2e}") == - 0x1 and tonumber("\u{2b}\u{31}\u{2e}") == 0x1)
assert(not tonumber("\u{2b}\u{20}\u{30}\u{2e}\u{30}\u{31}") and not tonumber("\u{2b}\u{2e}\u{65}\u{31}") and not tonumber("\u{31}\u{65}") and not tonumber("\u{31}\u{2e}\u{30}\u{65}\u{2b}") and not tonumber("\u{2e}"))
assert(tonumber("\u{2d}\u{30}\u{31}\u{32}") == - 0xa - 0x2)
assert(tonumber("\u{2d}\u{31}\u{2e}\u{32}\u{65}\u{32}") == - - - 0x78)
assert(tonumber("\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}") == (0x1 << (0x4 * 0xc)) - 0x1)
assert(tonumber("\u{30}\u{78}" .. string.rep("\u{66}",(intbits // 0x4))) == - 0x1)
assert(tonumber("\u{2d}\u{30}\u{78}" .. string.rep("\u{66}",(intbits // 0x4))) == 0x1)
assert(tonumber("\u{20}\u{20}\u{30}\u{30}\u{31}\u{30}\u{31}\u{30}\u{20}\u{20}",0x2) == 0xa)
assert(tonumber("\u{20}\u{20}\u{30}\u{30}\u{31}\u{30}\u{31}\u{30}\u{20}\u{20}",0xa) == 0x3f2)
assert(tonumber("\u{20}\u{20}\u{2d}\u{31}\u{30}\u{31}\u{30}\u{20}\u{20}",0x2) == - 0xa)
assert(tonumber("\u{31}\u{30}",0x24) == 0x24)
assert(tonumber("\u{20}\u{20}\u{2d}\u{31}\u{30}\u{20}\u{20}",0x24) == - 0x24)
assert(tonumber("\u{20}\u{20}\u{2b}\u{31}\u{5a}\u{20}\u{20}",0x24) == 0x24 + 0x23)
assert(tonumber("\u{20}\u{20}\u{2d}\u{31}\u{7a}\u{20}\u{20}",0x24) == - 0x24 + - 0x23)
assert(tonumber("\u{2d}\u{66}\u{46}\u{66}\u{61}",0x10) == - (0xa + (0x10 * (0xf + (0x10 * (0xf + (0x10 * 0xf)))))))
assert(tonumber(string.rep("\u{31}",(intbits - 0x2)),0x2) + 0x1 == 0x2 ^ (intbits - 0x2))
assert(tonumber("\u{66}\u{66}\u{66}\u{66}\u{46}\u{46}\u{46}\u{46}",0x10) + 0x1 == (0x1 << 0x20))
assert(tonumber("\u{30}\u{66}\u{66}\u{66}\u{66}\u{46}\u{46}\u{46}\u{46}",0x10) + 0x1 == (0x1 << 0x20))
assert(tonumber("\u{2d}\u{30}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{46}\u{46}\u{46}\u{46}",0x10) - 0x1 == - (0x1 << 0x28))
for i = 0x2, 0x24
do
local i2 = i * i
local i10 = i2 * i2 * i2 * i2 * i2
assert(tonumber("\u{9}\u{31}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{9}",i) == i10)
end
if not _soft then
assert(tonumber("\u{30}\u{78}" .. string.rep("\u{66}",0xd) .. "\u{2e}\u{30}") == 2.0 ^ (0x4 * 0xd) - 0x1)
assert(tonumber("\u{30}\u{78}" .. string.rep("\u{66}",0x96) .. "\u{2e}\u{30}") == 2.0 ^ (0x4 * 0x96) - 0x1)
assert(tonumber("\u{30}\u{78}" .. string.rep("\u{66}",0x12c) .. "\u{2e}\u{30}") == 2.0 ^ (0x4 * 0x12c) - 0x1)
assert(tonumber("\u{30}\u{78}" .. string.rep("\u{66}",0x1f4) .. "\u{2e}\u{30}") == 2.0 ^ (0x4 * 0x1f4) - 0x1)
assert(tonumber("\u{30}\u{78}\u{33}\u{2e}" .. string.rep("\u{30}",0x3e8)) == 0x3)
assert(tonumber("\u{30}\u{78}" .. string.rep("\u{30}",0x3e8) .. "\u{61}") == 0xa)
assert(tonumber("\u{30}\u{78}\u{30}\u{2e}" .. string.rep("\u{30}",0xd) .. "\u{31}") == 2.0 ^ (- 0x4 * 0xe))
assert(tonumber("\u{30}\u{78}\u{30}\u{2e}" .. string.rep("\u{30}",0x96) .. "\u{31}") == 2.0 ^ (- 0x4 * 0x97))
assert(tonumber("\u{30}\u{78}\u{30}\u{2e}" .. string.rep("\u{30}",0x12c) .. "\u{31}") == 2.0 ^ (- 0x4 * 0x12d))
assert(tonumber("\u{30}\u{78}\u{30}\u{2e}" .. string.rep("\u{30}",0x1f4) .. "\u{31}") == 2.0 ^ (- 0x4 * 0x1f5))
assert(tonumber("\u{30}\u{78}\u{65}\u{30}\u{33}" .. string.rep("\u{30}",0x3e8) .. "\u{70}\u{2d}\u{34}\u{30}\u{30}\u{30}") == 3587.0)
assert(tonumber("\u{30}\u{78}\u{2e}" .. string.rep("\u{30}",0x3e8) .. "\u{37}\u{34}\u{70}\u{34}\u{30}\u{30}\u{34}") == 7.25)
end
local function f
(...)
if select("\u{23}",...) == 0x1 then
return (...)
else
return "\u{2a}\u{2a}\u{2a}"
end
end
assert(not f(tonumber("\u{66}\u{46}\u{66}\u{61}",0xf)))
assert(not f(tonumber("\u{30}\u{39}\u{39}",0x8)))
assert(not f(tonumber("\u{31}\u{0}",0x2)))
assert(not f(tonumber("",0x8)))
assert(not f(tonumber("\u{20}\u{20}",0x9)))
assert(not f(tonumber("\u{20}\u{20}",0x9)))
assert(not f(tonumber("\u{30}\u{78}\u{66}",0xa)))
assert(not f(tonumber("\u{69}\u{6e}\u{66}")))
assert(not f(tonumber("\u{20}\u{49}\u{4e}\u{46}\u{20}")))
assert(not f(tonumber("\u{4e}\u{61}\u{6e}")))
assert(not f(tonumber("\u{6e}\u{61}\u{6e}")))
assert(not f(tonumber("\u{20}\u{20}")))
assert(not f(tonumber("")))
assert(not f(tonumber("\u{31}\u{20}\u{20}\u{61}")))
assert(not f(tonumber("\u{31}\u{20}\u{20}\u{61}",0x2)))
assert(not f(tonumber("\u{31}\u{0}")))
assert(not f(tonumber("\u{31}\u{20}\u{0}")))
assert(not f(tonumber("\u{31}\u{0}\u{20}")))
assert(not f(tonumber("\u{65}\u{31}")))
assert(not f(tonumber("\u{65}\u{20}\u{20}\u{31}")))
assert(not f(tonumber("\u{20}\u{33}\u{2e}\u{34}\u{2e}\u{35}\u{20}")))
assert(not tonumber("\u{30}\u{78}"))
assert(not tonumber("\u{78}"))
assert(not tonumber("\u{78}\u{33}"))
assert(not tonumber("\u{30}\u{78}\u{33}\u{2e}\u{33}\u{2e}\u{33}"))
assert(not tonumber("\u{30}\u{30}\u{78}\u{32}"))
assert(not tonumber("\u{30}\u{78}\u{20}\u{32}"))
assert(not tonumber("\u{30}\u{20}\u{78}\u{32}"))
assert(not tonumber("\u{32}\u{33}\u{78}"))
assert(not tonumber("\u{2d}\u{20}\u{30}\u{78}\u{61}\u{61}"))
assert(not tonumber("\u{2d}\u{30}\u{78}\u{61}\u{61}\u{50}\u{20}"))
assert(not tonumber("\u{30}\u{78}\u{30}\u{2e}\u{35}\u{31}\u{70}"))
assert(not tonumber("\u{30}\u{78}\u{35}\u{70}\u{2b}\u{2d}\u{32}"))
assert(0x10 == 0x10 and 0xfff == 0x2 ^ 0xc - 0x1 and 0xfb == 0xfb)
assert(0.0 == 0x0 and 0.0 == 0x0)
assert(0xffffffff == (0x1 << 0x20) - 0x1)
assert(tonumber("\u{2b}\u{30}\u{78}\u{32}") == 0x2)
assert(tonumber("\u{2d}\u{30}\u{78}\u{61}\u{41}") == - 0xaa)
assert(tonumber("\u{2d}\u{30}\u{78}\u{66}\u{66}\u{46}\u{46}\u{46}\u{66}\u{66}\u{66}") == - (0x1 << 0x20) + 0x1)
assert(0.0 == 0x0 and 0xe + 0x1 == 0xf and 0xe - 0x1 == 0xd)
assert(tonumber("\u{20}\u{20}\u{30}\u{78}\u{32}\u{2e}\u{35}\u{20}\u{20}") == 0x25 / 0x10)
assert(tonumber("\u{20}\u{20}\u{2d}\u{30}\u{78}\u{32}\u{2e}\u{35}\u{20}\u{20}") == - 0x25 / 0x10)
assert(tonumber("\u{20}\u{20}\u{2b}\u{30}\u{78}\u{30}\u{2e}\u{35}\u{31}\u{70}\u{2b}\u{38}\u{20}\u{20}") == 0x51)
assert(0.9999999997671694 == 0x1 - "\u{30}\u{78}\u{2e}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{31}")
assert("\u{30}\u{78}\u{41}\u{2e}\u{61}" + 0x0 == 0xa + 0xa / 0x10)
assert(170.0 == 0xaa)
assert(1.0 == 0x1)
assert(1.0625 == "\u{30}\u{78}\u{31}\u{2e}" + "\u{2b}\u{30}\u{78}\u{2e}\u{31}")
assert(11259375.0 == 11259375.0)
assert(1.1 == 1.0 + 0.1)
assert(100.0 == 100.0 and 0.01 == 0.01)
assert(0x423a35c7 - 0x423a35c6 == 1.0)
assert(1.1 == "\u{31}\u{2e}" + "\u{2e}\u{31}")
assert(tonumber("\u{31}\u{31}\u{31}\u{31}\u{31}\u{31}\u{31}\u{31}\u{31}\u{31}") - tonumber("\u{31}\u{31}\u{31}\u{31}\u{31}\u{31}\u{31}\u{31}\u{31}\u{30}") == tonumber("\u{20}\u{20}\u{2b}\u{30}\u{2e}\u{30}\u{30}\u{31}\u{65}\u{2b}\u{33}\u{20}\u{a}\u{9}"))
assert(1e-31 > 9e-32 and 9e29 < 1e30)
assert(0.123456 > 0.123455)
assert(tonumber("\u{2b}\u{31}\u{2e}\u{32}\u{33}\u{45}\u{31}\u{38}") == 1.23 * 10.0 ^ 0x12)
assert(not (0x1 < 0x1) and (0x1 < 0x2) and not (0x2 < 0x1))
assert(not ("\u{61}" < "\u{61}") and ("\u{61}" < "\u{62}") and not ("\u{62}" < "\u{61}"))
assert((0x1 <= 0x1) and (0x1 <= 0x2) and not (0x2 <= 0x1))
assert(("\u{61}" <= "\u{61}") and ("\u{61}" <= "\u{62}") and not ("\u{62}" <= "\u{61}"))
assert(not (0x1 > 0x1) and not (0x1 > 0x2) and (0x2 > 0x1))
assert(not ("\u{61}" > "\u{61}") and not ("\u{61}" > "\u{62}") and ("\u{62}" > "\u{61}"))
assert((0x1 >= 0x1) and not (0x1 >= 0x2) and (0x2 >= 0x1))
assert(("\u{61}" >= "\u{61}") and not ("\u{61}" >= "\u{62}") and ("\u{62}" >= "\u{61}"))
assert(1.3 < 1.4 and 1.3 <= 1.4 and not (1.3 < 1.3) and 1.3 <= 1.3)
assert(eqT(- 0x4 % 0x3,0x2))
assert(eqT(0x4 % - 0x3,- 0x2))
assert(eqT(- 4.0 % 0x3,2.0))
assert(eqT(0x4 % - 3.0,- 2.0))
assert(eqT(0x4 % - 0x5,- 0x1))
assert(eqT(0x4 % - 5.0,- 1.0))
assert(eqT(0x4 % 0x5,0x4))
assert(eqT(0x4 % 5.0,4.0))
assert(eqT(- 0x4 % - 0x5,- 0x4))
assert(eqT(- 0x4 % - 5.0,- 4.0))
assert(eqT(- 0x4 % 0x5,0x1))
assert(eqT(- 0x4 % 5.0,1.0))
assert(eqT(4.25 % 0x4,0.25))
assert(eqT(10.0 % 0x2,0.0))
assert(eqT(- 10.0 % 0x2,0.0))
assert(eqT(- 10.0 % - 0x2,0.0))
assert(math.pi - math.pi % 0x1 == 0x3)
assert(math.pi - math.pi % 1e-3 == 3.141)
do
local i,j = 0x0,0x4e20
while i < j do
local m = (i + j) // 0x2
if 0xa ^ - m > 0x0 then
i=m + 0x1
else
j=m
end
end
local b = 0xa ^ - (i - (i // 0xa))
assert(b > 0x0 and b * b == 0x0)
local delta = b / 0x3e8
assert(eq((2.1 * b) % (0x2 * b),(0.1 * b),delta))
assert(eq((- 2.1 * b) % (0x2 * b),(0x2 * b) - (0.1 * b),delta))
assert(eq((2.1 * b) % (- 0x2 * b),(0.1 * b) - (0x2 * b),delta))
assert(eq((- 2.1 * b) % (- 0x2 * b),(- 0.1 * b),delta))
end
for i = - 0xa, 0xa
do
for j = - 0xa, 0xa
do
if j ~= 0x0 then
assert((i + 0.0) % j == i % j)
end
end
end
for i = 0x0, 0xa
do
for j = - 0xa, 0xa
do
if j ~= 0x0 then
assert((0x2 ^ i) % j == (0x1 << i) % j)
end
end
end
do
local i = 0xa
while (0x1 << i) > 0x0 do
assert((0x1 << i) % 0x3 == i % 0x2 + 0x1)
i=i + 0x1
end
i=0xa
while 0x2 ^ i < math.huge do
assert(0x2 ^ i % 0x3 == i % 0x2 + 0x1)
i=i + 0x1
end
end
assert(eqT(minint % minint,0x0))
assert(eqT(maxint % maxint,0x0))
assert((minint + 0x1) % minint == minint + 0x1)
assert((maxint - 0x1) % maxint == maxint - 0x1)
assert(minint % maxint == maxint - 0x1)
assert(minint % - 0x1 == 0x0)
assert(minint % - 0x2 == 0x0)
assert(maxint % - 0x2 == - 0x1)
if not _port then
local function anan
(x)
assert(isNaN(x))
end
anan(0.0 % 0x0)
anan(1.3 % 0x0)
anan(math.huge % 0x1)
anan(math.huge % 1e30)
anan(- math.huge % 1e30)
anan(- math.huge % - 1e30)
assert(0x1 % math.huge == 0x1)
assert(1e30 % math.huge == 1e30)
assert(1e30 % - math.huge == - math.huge)
assert(- 0x1 % math.huge == math.huge)
assert(- 0x1 % - math.huge == - 0x1)
end
assert(math.ult(0x3,0x4))
assert(not math.ult(0x4,0x4))
assert(math.ult(- 0x2,- 0x1))
assert(math.ult(0x2,- 0x1))
assert(not math.ult(- 0x2,- 0x2))
assert(math.ult(maxint,minint))
assert(not math.ult(minint,maxint))
assert(eq(math.sin(- 9.8) ^ 0x2 + math.cos(- 9.8) ^ 0x2,0x1))
assert(eq(math.tan(math.pi / 0x4),0x1))
assert(eq(math.sin(math.pi / 0x2),0x1) and eq(math.cos(math.pi / 0x2),0x0))
assert(eq(math.atan(0x1),math.pi / 0x4) and eq(math.acos(0x0),math.pi / 0x2) and eq(math.asin(0x1),math.pi / 0x2))
assert(eq(math.deg(math.pi / 0x2),0x5a) and eq(math.rad(0x5a),math.pi / 0x2))
assert(math.abs(- 10.43) == 10.43)
assert(eqT(math.abs(minint),minint))
assert(eqT(math.abs(maxint),maxint))
assert(eqT(math.abs(- maxint),maxint))
assert(eq(math.atan(0x1,0x0),math.pi / 0x2))
assert(math.fmod(0xa,0x3) == 0x1)
assert(eq(math.sqrt(0xa) ^ 0x2,0xa))
assert(eq(math.log(0x2,0xa),math.log(0x2) / math.log(0xa)))
assert(eq(math.log(0x2,0x2),0x1))
assert(eq(math.log(0x9,0x3),0x2))
assert(eq(math.exp(0x0),0x1))
assert(eq(math.sin(0xa),math.sin(0xa % (0x2 * math.pi))))
assert(tonumber("\u{20}\u{31}\u{2e}\u{33}\u{65}\u{2d}\u{32}\u{20}") == 0.013)
assert(tonumber("\u{20}\u{2d}\u{31}\u{2e}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{31}\u{20}") == - 1.00000000000001)
assert(0x800001 + - 0x800001 == 0x0)
assert(0x800000 + - 0x800000 == 0x0)
assert(0x7fffff + - 0x7fffff == 0x0)
do
assert(eqT(math.floor(3.4),0x3))
assert(eqT(math.ceil(3.4),0x4))
assert(eqT(math.floor(- 3.4),- 0x4))
assert(eqT(math.ceil(- 3.4),- 0x3))
assert(eqT(math.floor(maxint),maxint))
assert(eqT(math.ceil(maxint),maxint))
assert(eqT(math.floor(minint),minint))
assert(eqT(math.floor(minint + 0.0),minint))
assert(eqT(math.ceil(minint),minint))
assert(eqT(math.ceil(minint + 0.0),minint))
assert(math.floor(1e50) == 1e50)
assert(math.ceil(1e50) == 1e50)
assert(math.floor(- 1e50) == - 1e50)
assert(math.ceil(- 1e50) == - 1e50)
for _,p in pairs({0x1f,0x20,0x3f,0x40})
do
assert(math.floor(0x2 ^ p) == 0x2 ^ p)
assert(math.floor(0x2 ^ p + 0.5) == 0x2 ^ p)
assert(math.ceil(0x2 ^ p) == 0x2 ^ p)
assert(math.ceil(0x2 ^ p - 0.5) == 0x2 ^ p)
end
checkerror("\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",math.floor,{})
checkerror("\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",math.ceil,print)
assert(eqT(math.tointeger(minint),minint))
assert(eqT(math.tointeger(minint .. ""),minint))
assert(eqT(math.tointeger(maxint),maxint))
assert(eqT(math.tointeger(maxint .. ""),maxint))
assert(eqT(math.tointeger(minint + 0.0),minint))
assert(not math.tointeger(0.0 - minint))
assert(not math.tointeger(math.pi))
assert(not math.tointeger(- math.pi))
assert(math.floor(math.huge) == math.huge)
assert(math.ceil(math.huge) == math.huge)
assert(not math.tointeger(math.huge))
assert(math.floor(- math.huge) == - math.huge)
assert(math.ceil(- math.huge) == - math.huge)
assert(not math.tointeger(- math.huge))
assert(math.tointeger("\u{33}\u{34}\u{2e}\u{30}") == 0x22)
assert(not math.tointeger("\u{33}\u{34}\u{2e}\u{33}"))
assert(not math.tointeger({}))
assert(not math.tointeger(0x0 / 0x0))
end
for i = - 0x6, 0x6
do
for j = - 0x6, 0x6
do
if j ~= 0x0 then
local mi = math.fmod(i,j)
local mf = math.fmod(i + 0.0,j)
assert(mi == mf)
assert(math.type(mi) == "\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}" and math.type(mf) == "\u{66}\u{6c}\u{6f}\u{61}\u{74}")
if (i >= 0x0 and j >= 0x0) or (i <= 0x0 and j <= 0x0) or mi == 0x0 then
assert(eqT(mi,i % j))
end
end
end
end
assert(eqT(math.fmod(minint,minint),0x0))
assert(eqT(math.fmod(maxint,maxint),0x0))
assert(eqT(math.fmod(minint + 0x1,minint),minint + 0x1))
assert(eqT(math.fmod(maxint - 0x1,maxint),maxint - 0x1))
checkerror("\u{7a}\u{65}\u{72}\u{6f}",math.fmod,0x3,0x0)
do
checkerror("\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",math.max)
checkerror("\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",math.min)
assert(eqT(math.max(0x3),0x3))
assert(eqT(math.max(0x3,0x5,0x9,0x1),0x9))
assert(math.max(maxint,1e61) == 1e61)
assert(eqT(math.max(minint,minint + 0x1),minint + 0x1))
assert(eqT(math.min(0x3),0x3))
assert(eqT(math.min(0x3,0x5,0x9,0x1),0x1))
assert(math.min(3.2,5.9,- 9.2,1.1) == - 9.2)
assert(math.min(1.9,1.7,1.72) == 1.7)
assert(math.min(- 1e61,minint) == - 1e61)
assert(eqT(math.min(maxint,maxint - 0x1),maxint - 0x1))
assert(eqT(math.min(maxint - 0x2,maxint,maxint - 0x1),maxint - 0x2))
end
local a,b = "\u{31}\u{30}","\u{32}\u{30}"
assert(a * b == 0xc8 and a + b == 0x1e and a - b == - 0xa and a / b == 0.5 and - b == - 0x14)
assert(a == "\u{31}\u{30}" and b == "\u{32}\u{30}")
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{2d}\u{30}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{4e}\u{61}\u{4e}")
local mz <const> = - 0.0
local z <const> = 0.0
assert(mz == z)
assert(0x1 / mz < 0x0 and 0x0 < 0x1 / z)
local a = {[mz] = 0x1}
assert(a[z] == 0x1 and a[mz] == 0x1)
a[z]=0x2
assert(a[z] == 0x2 and a[mz] == 0x2)
local inf = math.huge * 0x2 + 0x1
local mz <const> = - 0x1 / inf
local z <const> = 0x1 / inf
assert(mz == z)
assert(0x1 / mz < 0x0 and 0x0 < 0x1 / z)
local NaN <const> = inf - inf
assert(NaN ~= NaN)
assert(not (NaN < NaN))
assert(not (NaN <= NaN))
assert(not (NaN > NaN))
assert(not (NaN >= NaN))
assert(not (0x0 < NaN) and not (NaN < 0x0))
local NaN1 <const> = 0x0 / 0x0
assert(NaN ~= NaN1 and not (NaN <= NaN1) and not (NaN1 <= NaN))
local a = {}
assert(not pcall(rawset,a,NaN,0x1))
assert(a[NaN] == undef)
a[0x1]=0x1
assert(not pcall(rawset,a,NaN,0x1))
assert(a[NaN] == undef)
local a1,a2,a3,a4,a5 = 0x0,0x0,"\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}",0x0,"\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}"
assert(a1 == a2 and a2 == a4 and a1 ~= a3)
assert(a3 == a5)
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{6d}\u{61}\u{74}\u{68}\u{2e}\u{72}\u{61}\u{6e}\u{64}\u{6f}\u{6d}\u{27}")
local random,max,min = math.random,math.max,math.min
local function testnear
(val,ref,tol)
return (math.abs(val - ref) < ref * tol)
end
do
local h <const> = 0x7a7040a5
local l <const> = 0xa323c9d6
math.randomseed(0x3ef)
local res = (h << 0x20 | l) & ~ (~ 0x0 << intbits)
assert(random(0x0) == res)
math.randomseed(0x3ef,0x0)
local res
if floatbits <= 0x20 then
res=(h >> (0x20 - floatbits)) % 0x2 ^ 0x20
else
res=(h % 0x2 ^ 0x20) * 0x2 ^ (floatbits - 0x20) + ((l >> (0x40 - floatbits)) % 0x2 ^ 0x20)
end
local rand = random()
assert(eq(rand,0.4782753376376966,0x2 ^ - floatbits))
assert(rand * 0x2 ^ floatbits == res)
end
do
local x,y = math.randomseed()
local res = math.random(0x0)
x,y=math.randomseed(x,y)
assert(math.random(0x0) == res)
math.randomseed(x,y)
assert(math.random(0x0) == res)
print(string.format("\u{72}\u{61}\u{6e}\u{64}\u{6f}\u{6d}\u{20}\u{73}\u{65}\u{65}\u{64}\u{73}\u{3a}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{25}\u{64}",x,y))
end
do
local randbits = math.min(floatbits,0x40)
local mult = 0x2 ^ randbits
local counts = {}
for i = 0x1, randbits
do
counts[i]=0x0
end
local up = - math.huge
local low = math.huge
local rounds = 0x64 * randbits
local totalrounds = 0x0
::doagain::
for i = 0x0, rounds
do
local t = random()
assert(0x0 <= t and t < 0x1)
up=max(up,t)
low=min(low,t)
assert(t * mult % 0x1 == 0x0)
local bit = i % randbits
if (t * 0x2 ^ bit) % 0x1 >= 0.5 then
counts[bit + 0x1]=counts[bit + 0x1] + 0x1
end
end
totalrounds=totalrounds + rounds
if not (eq(up,0x1,1e-3) and eq(low,0x0,1e-3)) then
goto doagain
end
local expected = (totalrounds / randbits / 0x2)
for i = 0x1, randbits
do
if not testnear(counts[i],expected,0.1) then
goto doagain
end
end
print(string.format("\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{20}\u{72}\u{61}\u{6e}\u{64}\u{6f}\u{6d}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}\u{20}\u{69}\u{6e}\u{20}\u{25}\u{64}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{73}\u{3a}\u{20}\u{5b}\u{25}\u{66}\u{2c}\u{20}\u{25}\u{66}\u{5d}",totalrounds,low,up))
end
do
local up = 0x0
local low = 0x0
local counts = {}
for i = 0x1, intbits
do
counts[i]=0x0
end
local rounds = 0x64 * intbits
local totalrounds = 0x0
::doagain::
for i = 0x0, rounds
do
local t = random(0x0)
up=max(up,t)
low=min(low,t)
local bit = i % intbits
counts[bit + 0x1]=counts[bit + 0x1] + ((t >> bit) & 0x1)
end
totalrounds=totalrounds + rounds
local lim = maxint >> 0xa
if not (maxint - up < lim and low - minint < lim) then
goto doagain
end
local expected = (totalrounds / intbits / 0x2)
for i = 0x1, intbits
do
if not testnear(counts[i],expected,0.1) then
goto doagain
end
end
print(string.format("\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}\u{20}\u{72}\u{61}\u{6e}\u{64}\u{6f}\u{6d}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}\u{20}\u{69}\u{6e}\u{20}\u{25}\u{64}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{73}\u{3a}\u{20}\u{5b}\u{6d}\u{69}\u{6e}\u{69}\u{6e}\u{74}\u{20}\u{2b}\u{20}\u{25}\u{2e}\u{30}\u{66}\u{70}\u{70}\u{6d}\u{2c}\u{20}\u{6d}\u{61}\u{78}\u{69}\u{6e}\u{74}\u{20}\u{2d}\u{20}\u{25}\u{2e}\u{30}\u{66}\u{70}\u{70}\u{6d}\u{5d}",totalrounds,(minint - low) / minint * 1e6,(maxint - up) / maxint * 1e6))
end
do
local count = {0x0,0x0,0x0,0x0,0x0,0x0}
local rep = 0xc8
local totalrep = 0x0
::doagain::
for i = 0x1, rep * 0x6
do
local r = random(0x6)
count[r]=count[r] + 0x1
end
totalrep=totalrep + rep
for i = 0x1, 0x6
do
if not testnear(count[i],totalrep,0.05) then
goto doagain
end
end
end
do
local function aux
(x1,x2)
local mark = {}
;
local count = 0x0
while true do
local t = random(x1,x2)
assert(x1 <= t and t <= x2)
if not mark[t] then
mark[t]=true
count=count + 0x1
if count == x2 - x1 + 0x1 then
goto ok
end
end
end
::ok::
end
aux(- 0xa,0x0)
aux(0x1,0x6)
aux(0x1,0x2)
aux(0x1,0xd)
aux(0x1,0x1f)
aux(0x1,0x20)
aux(0x1,0x21)
aux(- 0xa,0xa)
aux(- 0xa,- 0xa)
aux(minint,minint)
aux(maxint,maxint)
aux(minint,minint + 0x9)
aux(maxint - 0x3,maxint)
end
do
local function aux
(p1,p2)
local max = minint
local min = maxint
local n = 0x64
local mark = {}
;
local count = 0x0
::doagain::
for _ = 0x1, n
do
local t = random(p1,p2)
if not mark[t] then
assert(p1 <= t and t <= p2)
max=math.max(max,t)
min=math.min(min,t)
mark[t]=true
count=count + 0x1
end
end
if not (count >= n * 0.8) then
goto doagain
end
local diff = (p2 - p1) >> 0x4
if not (min < p1 + diff and max > p2 - diff) then
goto doagain
end
end
aux(0x0,maxint)
aux(0x1,maxint)
aux(0x3,maxint // 0x3)
aux(minint,- 0x1)
aux(minint // 0x2,maxint // 0x2)
aux(minint,maxint)
aux(minint + 0x1,maxint)
aux(minint,maxint - 0x1)
aux(0x0,0x1 << (intbits - 0x5))
end
assert(not pcall(random,0x1,0x2,0x3))
assert(not pcall(random,minint + 0x1,minint))
assert(not pcall(random,maxint,maxint - 0x1))
assert(not pcall(random,maxint,minint))
print("\u{4f}\u{4b}")