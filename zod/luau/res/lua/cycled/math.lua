print("testing numbers and math lib")
local minint <const> = math.mininteger
local maxint <const> = math.maxinteger
local intbits <const> = math.floor(math.log(maxint,2) + 0.5) + 1
assert((1 << intbits) == 0)
assert(minint == 1 << (intbits - 1))
assert(maxint == minint - 1)
local floatbits = 24
local p = 2 ^ floatbits
while p < p + 1 do
p=p * 2
floatbits=floatbits + 1
local function isNaN
(x)
return (x ~= x)
end
assert(isNaN(0 / 0))
assert(not isNaN(1 / 0))
local x = 2 ^ floatbits
assert(x > x - 1 and x == x + 1)
print(string.format("%d-bit integers, %d-bit (mantissa) floats",intbits,floatbits))
assert(math.type(0) == "integer" and math.type(0) == "float" and not math.type("10"))
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
local msgf2i = "number.* has no integer representation"
local function eq
(a,b,limit)
if not limit then
if floatbits >= 50 then
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
assert(0 == 0 and 0 == 0 and 0 == 0 and 20 == 20 and 0.2 == 0.2)
local a,b,c = "2"," 3e0 "," 10  "
assert(a + b == 5 and - b == - 3 and b + "2" == 5 and "10" - c == 0)
assert(type(a) == "string" and type(b) == "string" and type(c) == "string")
assert(a == "2" and b == " 3e0 " and c == " 10  " and - c == - "  10 ")
assert(c % a == 0 and a ^ b == 8)
a=0
assert(a == - a and 0 == - 0)
local x = - 1
local mz = 0 / x
local t = {[0] = 10,20,30,40,50}
assert(t[mz] == t[0] and t[- 0] == t[0])
local a,b = math.modf(3.5)
assert(a == 3 and b == 0.5)
a,b=math.modf(- 2.5)
assert(a == - 2 and b == - 0.5)
a,b=math.modf(- 3e23)
assert(a == - 3e23 and b == 0)
a,b=math.modf(3e35)
assert(a == 3e35 and b == 0)
a,b=math.modf(- 1 / 0)
assert(a == - 1 / 0 and b == 0)
a,b=math.modf(1 / 0)
assert(a == 1 / 0 and b == 0)
a,b=math.modf(0 / 0)
assert(isNaN(a) and isNaN(b))
a,b=math.modf(3)
assert(eqT(a,3) and eqT(b,0))
a,b=math.modf(minint)
assert(eqT(a,minint) and eqT(b,0))
assert(math.huge > 1e31)
assert(- math.huge < - 1e31)
assert(minint < minint + 1)
assert(maxint - 1 < maxint)
assert(0 - minint == minint)
assert(minint * minint == 0)
assert(maxint * maxint * maxint == maxint)
for _,i in pairs({- 16,- 15,- 3,- 2,- 1,0,1,2,3,15})
do
for _,j in pairs({- 16,- 15,- 3,- 2,- 1,1,2,3,15})
do
for _,ti in pairs({0,0})
do
for _,tj in pairs({0,0})
do
local x = i + ti
local y = j + tj
assert(i // j == math.floor(i / j))
end
end
end
end
assert(1 // 0 == 1 / 0)
assert(- 1 // 0 == - 1 / 0)
assert(eqT(3.5 // 1.5,2))
assert(eqT(3.5 // - 1.5,- 3))
local x,y = 
x=1
;
assert(x // 0 == 1 / 0)
x=1
;
assert(x // 0 == 1 / 0)
x=3.5
;
assert(eqT(x // 1,3))
assert(eqT(x // - 1,- 4))
x=3.5
;
y=1.5
;
assert(eqT(x // y,2))
x=3.5
;
y=- 1.5
;
assert(eqT(x // y,- 3))
assert(maxint // maxint == 1)
assert(maxint // 1 == maxint)
assert((maxint - 1) // maxint == 0)
assert(maxint // (maxint - 1) == 1)
assert(minint // minint == 1)
assert(minint // minint == 1)
assert((minint + 1) // minint == 0)
assert(minint // (minint + 1) == 1)
assert(minint // 1 == minint)
assert(minint // - 1 == - minint)
assert(minint // - 2 == 2 ^ (intbits - 2))
assert(maxint // - 1 == - maxint)
assert(2 ^ - 3 == 1 / 2 ^ 3)
assert(eq((- 3) ^ - 3,1 / (- 3) ^ 3))
for i = - 3, 3
do
for j = - 3, 3
do
if not _port or i ~= 0 or j > 0 then
assert(eq(i ^ j,1 / i ^ (- j)))
end
end
end
if floatbits < intbits then
assert(2 ^ floatbits == (1 << floatbits))
assert(2 ^ floatbits - 1 == (1 << floatbits) - 1)
assert(2 ^ floatbits - 1 ~= (1 << floatbits))
assert(2 ^ floatbits + 1 ~= (1 << floatbits) + 1)
else
assert(maxint == maxint + 0)
assert(maxint - 1 == maxint - 1)
assert(minint + 1 == minint + 1)
assert(maxint ~= maxint - 1)
end
assert(maxint + 0 == 2 ^ (intbits - 1) - 1)
assert(minint + 0 == minint)
assert(minint + 0 == - 2 ^ (intbits - 1))
assert(1 < 1.1)
;
assert(not (1 < 0.9))
assert(1 <= 1.1)
;
assert(not (1 <= 0.9))
assert(- 1 < - 0.9)
;
assert(not (- 1 < - 1.1))
assert(1 <= 1.1)
;
assert(not (- 1 <= - 1.1))
assert(- 1 < - 0.9)
;
assert(not (- 1 < - 1.1))
assert(- 1 <= - 0.9)
;
assert(not (- 1 <= - 1.1))
assert(minint <= minint + 0)
assert(minint + 0 <= minint)
assert(not (minint < minint + 0))
assert(not (minint + 0 < minint))
assert(maxint < minint * - 1)
assert(maxint <= minint * - 1)
local fmaxi1 = 2 ^ (intbits - 1)
assert(maxint < fmaxi1)
assert(maxint <= fmaxi1)
assert(not (fmaxi1 <= maxint))
assert(minint <= - 2 ^ (intbits - 1))
assert(- 2 ^ (intbits - 1) <= minint)
if floatbits < intbits then
print("testing order (floats cannot represent all integers)")
local fmax = 2 ^ floatbits
local ifmax = fmax | 0
assert(fmax < ifmax + 1)
assert(fmax - 1 < ifmax)
assert(- (fmax - 1) > - ifmax)
assert(not (fmax <= ifmax - 1))
assert(- fmax > - (ifmax + 1))
assert(not (- fmax >= - (ifmax - 1)))
assert(fmax / 2 - 0.5 < ifmax // 2)
assert(- (fmax / 2 - 0.5) > - ifmax // 2)
assert(maxint < 2 ^ intbits)
assert(minint > - 2 ^ intbits)
assert(maxint <= 2 ^ intbits)
assert(minint >= - 2 ^ intbits)
else
print("testing order (floats can represent all integers)")
assert(maxint < maxint + 1)
assert(maxint < maxint + 0.5)
assert(maxint - 1 < maxint)
assert(maxint - 0.5 < maxint)
assert(not (maxint + 0 < maxint))
assert(maxint + 0 <= maxint)
assert(not (maxint < maxint + 0))
assert(maxint + 0 <= maxint)
assert(maxint <= maxint + 0)
assert(not (maxint + 1 <= maxint))
assert(not (maxint + 0.5 <= maxint))
assert(not (maxint <= maxint - 1))
assert(not (maxint <= maxint - 0.5))
assert(minint < minint + 1)
assert(minint < minint + 0.5)
assert(minint <= minint + 0.5)
assert(minint - 1 < minint)
assert(minint - 1 <= minint)
assert(not (minint + 0 < minint))
assert(not (minint + 0.5 < minint))
assert(not (minint < minint + 0))
assert(minint + 0 <= minint)
assert(minint <= minint + 0)
assert(not (minint + 1 <= minint))
assert(not (minint + 0.5 <= minint))
assert(not (minint <= minint - 1))
end
local NaN <const> = 0 / 0
assert(not (NaN < 0))
assert(not (NaN > minint))
assert(not (NaN <= - 9))
assert(not (NaN <= maxint))
assert(not (NaN < maxint))
assert(not (minint <= NaN))
assert(not (minint < NaN))
assert(not (4 <= NaN))
assert(not (4 < NaN))
local function checkcompt
(msg,code)
checkerror(msg,assert(load(code)))
end
checkcompt("divide by zero","return 2 // 0")
checkcompt(msgf2i,"return 2.3 >> 0")
checkcompt(msgf2i,("return 2.0^%d & 1"):format(intbits - 1))
checkcompt("field 'huge'","return math.huge << 1")
checkcompt(msgf2i,("return 1 | 2.0^%d"):format(intbits - 1))
checkcompt(msgf2i,"return 2.3 ~ 0.0")
local function f2i
(x)
return x | x
end
checkerror(msgf2i,f2i,math.huge)
checkerror(msgf2i,f2i,- math.huge)
checkerror(msgf2i,f2i,0 / 0)
if floatbits < intbits then
assert(maxint + 1 == maxint + 0)
assert(minint - 1 == minint + 0)
checkerror(msgf2i,f2i,maxint + 0)
assert(f2i(2 ^ (intbits - 2)) == 1 << (intbits - 2))
assert(f2i(- 2 ^ (intbits - 2)) == - (1 << (intbits - 2)))
assert((2 ^ (floatbits - 1) + 1) // 1 == (1 << (floatbits - 1)) + 1)
local mf = maxint - (1 << (floatbits - intbits)) + 1
assert(f2i(mf + 0) == mf)
mf=mf + 1
assert(f2i(mf + 0) ~= mf)
else
assert(maxint + 1 > maxint)
assert(minint - 1 < minint)
assert(f2i(maxint + 0) == maxint)
checkerror("no integer rep",f2i,maxint + 1)
checkerror("no integer rep",f2i,minint - 1)
end
assert(f2i(minint + 0) == minint)
assert("2" + 1 == 3)
assert("2 " + 1 == 3)
assert(" -2 " + 1 == - 1)
assert(" -0xa " + 1 == - 9)
assert(eqT(tonumber(tostring(maxint)),maxint))
assert(eqT(tonumber(tostring(minint)),minint))
local function incd
(n)
local s = string.format("%d",n)
s=string.gsub(s,"%d$",(d)
assert(d ~= "9")
return string.char(string.byte(d) + 1)
end)
return s
end
assert(eqT(tonumber(incd(maxint)),maxint + 1))
assert(eqT(tonumber(incd(minint)),minint - 1))
assert(eqT(tonumber("1" .. string.rep("0",30)),1e30))
assert(eqT(tonumber("-1" .. string.rep("0",30)),- 1e30))
assert(eqT(tonumber("0x1" .. string.rep("0",30)),0))
assert(minint == load("return " .. minint)())
assert(eqT(maxint,load("return " .. maxint)()))
assert(eqT(1e22,1e22))
assert(eqT(- 1e22,- 1e22))
assert(tonumber(3.4) == 3.4)
assert(eqT(tonumber(3),3))
assert(eqT(tonumber(maxint),maxint) and eqT(tonumber(minint),minint))
assert(tonumber(1 / 0) == 1 / 0)
assert(tonumber("0") == 0)
assert(not tonumber(""))
assert(not tonumber("  "))
assert(not tonumber("-"))
assert(not tonumber("  -0x "))
assert(not tonumber({}))
assert(tonumber("+0.01") == 1 / 100 and tonumber("+.01") == 0.01 and tonumber(".01") == 0.01 and tonumber("-1.") == - 1 and tonumber("+1.") == 1)
assert(not tonumber("+ 0.01") and not tonumber("+.e1") and not tonumber("1e") and not tonumber("1.0e+") and not tonumber("."))
assert(tonumber("-012") == - 10 - 2)
assert(tonumber("-1.2e2") == - - - 120)
assert(tonumber("0xffffffffffff") == (1 << (4 * 12)) - 1)
assert(tonumber("0x" .. string.rep("f",(intbits // 4))) == - 1)
assert(tonumber("-0x" .. string.rep("f",(intbits // 4))) == 1)
assert(tonumber("  001010  ",2) == 10)
assert(tonumber("  001010  ",10) == 1010)
assert(tonumber("  -1010  ",2) == - 10)
assert(tonumber("10",36) == 36)
assert(tonumber("  -10  ",36) == - 36)
assert(tonumber("  +1Z  ",36) == 36 + 35)
assert(tonumber("  -1z  ",36) == - 36 + - 35)
assert(tonumber("-fFfa",16) == - (10 + (16 * (15 + (16 * (15 + (16 * 15)))))))
assert(tonumber(string.rep("1",(intbits - 2)),2) + 1 == 2 ^ (intbits - 2))
assert(tonumber("ffffFFFF",16) + 1 == (1 << 32))
assert(tonumber("0ffffFFFF",16) + 1 == (1 << 32))
assert(tonumber("-0ffffffFFFF",16) - 1 == - (1 << 40))
for i = 2, 36
do
local i2 = i * i
local i10 = i2 * i2 * i2 * i2 * i2
assert(tonumber("	10000000000	",i) == i10)
end
if not _soft then
assert(tonumber("0x" .. string.rep("f",13) .. ".0") == 2 ^ (4 * 13) - 1)
assert(tonumber("0x" .. string.rep("f",150) .. ".0") == 2 ^ (4 * 150) - 1)
assert(tonumber("0x" .. string.rep("f",300) .. ".0") == 2 ^ (4 * 300) - 1)
assert(tonumber("0x" .. string.rep("f",500) .. ".0") == 2 ^ (4 * 500) - 1)
assert(tonumber("0x3." .. string.rep("0",1e3)) == 3)
assert(tonumber("0x" .. string.rep("0",1e3) .. "a") == 10)
assert(tonumber("0x0." .. string.rep("0",13) .. "1") == 2 ^ (- 4 * 14))
assert(tonumber("0x0." .. string.rep("0",150) .. "1") == 2 ^ (- 4 * 151))
assert(tonumber("0x0." .. string.rep("0",300) .. "1") == 2 ^ (- 4 * 301))
assert(tonumber("0x0." .. string.rep("0",500) .. "1") == 2 ^ (- 4 * 501))
assert(tonumber("0xe03" .. string.rep("0",1e3) .. "p-4000") == 3587)
assert(tonumber("0x." .. string.rep("0",1e3) .. "74p4004") == 7.25)
end
local function f
(...)
if select("#",...) == 1 then
return (...)
else
return "***"
end
end
assert(not f(tonumber("fFfa",15)))
assert(not f(tonumber("099",8)))
assert(not f(tonumber("1",2)))
assert(not f(tonumber("",8)))
assert(not f(tonumber("  ",9)))
assert(not f(tonumber("  ",9)))
assert(not f(tonumber("0xf",10)))
assert(not f(tonumber("inf")))
assert(not f(tonumber(" INF ")))
assert(not f(tonumber("Nan")))
assert(not f(tonumber("nan")))
assert(not f(tonumber("  ")))
assert(not f(tonumber("")))
assert(not f(tonumber("1  a")))
assert(not f(tonumber("1  a",2)))
assert(not f(tonumber("1")))
assert(not f(tonumber("1 ")))
assert(not f(tonumber("1 ")))
assert(not f(tonumber("e1")))
assert(not f(tonumber("e  1")))
assert(not f(tonumber(" 3.4.5 ")))
assert(not tonumber("0x"))
assert(not tonumber("x"))
assert(not tonumber("x3"))
assert(not tonumber("0x3.3.3"))
assert(not tonumber("00x2"))
assert(not tonumber("0x 2"))
assert(not tonumber("0 x2"))
assert(not tonumber("23x"))
assert(not tonumber("- 0xaa"))
assert(not tonumber("-0xaaP "))
assert(not tonumber("0x0.51p"))
assert(not tonumber("0x5p+-2"))
assert(16 == 16 and 4095 == 2 ^ 12 - 1 and 251 == 251)
assert(0 == 0 and 0 == 0)
assert(4294967295 == (1 << 32) - 1)
assert(tonumber("+0x2") == 2)
assert(tonumber("-0xaA") == - 170)
assert(tonumber("-0xffFFFfff") == - (1 << 32) + 1)
assert(0 == 0 and 14 + 1 == 15 and 14 - 1 == 13)
assert(tonumber("  0x2.5  ") == 37 / 16)
assert(tonumber("  -0x2.5  ") == - 37 / 16)
assert(tonumber("  +0x0.51p+8  ") == 81)
assert(0.9999999997671694 == 1 - "0x.00000001")
assert("0xA.a" + 0 == 10 + 10 / 16)
assert(170 == 170)
assert(1 == 1)
assert(1.0625 == "0x1." + "+0x.1")
assert(11259375 == 11259375)
assert(1.1 == 1 + 0.1)
assert(100 == 100 and 0.01 == 0.01)
assert(1111111111 - 1111111110 == 1)
assert(1.1 == "1." + ".1")
assert(tonumber("1111111111") - tonumber("1111111110") == tonumber("  +0.001e+3 
	"))
assert(1e-31 > 9e-32 and 9e29 < 1e30)
assert(0.123456 > 0.123455)
assert(tonumber("+1.23E18") == 1.23 * 10 ^ 18)
assert(not (1 < 1) and (1 < 2) and not (2 < 1))
assert(not ("a" < "a") and ("a" < "b") and not ("b" < "a"))
assert((1 <= 1) and (1 <= 2) and not (2 <= 1))
assert(("a" <= "a") and ("a" <= "b") and not ("b" <= "a"))
assert(not (1 > 1) and not (1 > 2) and (2 > 1))
assert(not ("a" > "a") and not ("a" > "b") and ("b" > "a"))
assert((1 >= 1) and not (1 >= 2) and (2 >= 1))
assert(("a" >= "a") and not ("a" >= "b") and ("b" >= "a"))
assert(1.3 < 1.4 and 1.3 <= 1.4 and not (1.3 < 1.3) and 1.3 <= 1.3)
assert(eqT(- 4 % 3,2))
assert(eqT(4 % - 3,- 2))
assert(eqT(- 4 % 3,2))
assert(eqT(4 % - 3,- 2))
assert(eqT(4 % - 5,- 1))
assert(eqT(4 % - 5,- 1))
assert(eqT(4 % 5,4))
assert(eqT(4 % 5,4))
assert(eqT(- 4 % - 5,- 4))
assert(eqT(- 4 % - 5,- 4))
assert(eqT(- 4 % 5,1))
assert(eqT(- 4 % 5,1))
assert(eqT(4.25 % 4,0.25))
assert(eqT(10 % 2,0))
assert(eqT(- 10 % 2,0))
assert(eqT(- 10 % - 2,0))
assert(math.pi - math.pi % 1 == 3)
assert(math.pi - math.pi % 1e-3 == 3.141)
local i,j = 0,2e4
while i < j do
local m = (i + j) // 2
if 10 ^ - m > 0 then
i=m + 1
else
j=m
end
local b = 10 ^ - (i - (i // 10))
assert(b > 0 and b * b == 0)
local delta = b / 1e3
assert(eq((2.1 * b) % (2 * b),(0.1 * b),delta))
assert(eq((- 2.1 * b) % (2 * b),(2 * b) - (0.1 * b),delta))
assert(eq((2.1 * b) % (- 2 * b),(0.1 * b) - (2 * b),delta))
assert(eq((- 2.1 * b) % (- 2 * b),(- 0.1 * b),delta))
for i = - 10, 10
do
for j = - 10, 10
do
if j ~= 0 then
assert((i + 0) % j == i % j)
end
end
end
for i = 0, 10
do
for j = - 10, 10
do
if j ~= 0 then
assert((2 ^ i) % j == (1 << i) % j)
end
end
end
local i = 10
while (1 << i) > 0 do
assert((1 << i) % 3 == i % 2 + 1)
i=i + 1
i=10
while 2 ^ i < math.huge do
assert(2 ^ i % 3 == i % 2 + 1)
i=i + 1
assert(eqT(minint % minint,0))
assert(eqT(maxint % maxint,0))
assert((minint + 1) % minint == minint + 1)
assert((maxint - 1) % maxint == maxint - 1)
assert(minint % maxint == maxint - 1)
assert(minint % - 1 == 0)
assert(minint % - 2 == 0)
assert(maxint % - 2 == - 1)
if not _port then
local function anan
(x)
assert(isNaN(x))
end
anan(0 % 0)
anan(1.3 % 0)
anan(math.huge % 1)
anan(math.huge % 1e30)
anan(- math.huge % 1e30)
anan(- math.huge % - 1e30)
assert(1 % math.huge == 1)
assert(1e30 % math.huge == 1e30)
assert(1e30 % - math.huge == - math.huge)
assert(- 1 % math.huge == math.huge)
assert(- 1 % - math.huge == - 1)
end
assert(math.ult(3,4))
assert(not math.ult(4,4))
assert(math.ult(- 2,- 1))
assert(math.ult(2,- 1))
assert(not math.ult(- 2,- 2))
assert(math.ult(maxint,minint))
assert(not math.ult(minint,maxint))
assert(eq(math.sin(- 9.8) ^ 2 + math.cos(- 9.8) ^ 2,1))
assert(eq(math.tan(math.pi / 4),1))
assert(eq(math.sin(math.pi / 2),1) and eq(math.cos(math.pi / 2),0))
assert(eq(math.atan(1),math.pi / 4) and eq(math.acos(0),math.pi / 2) and eq(math.asin(1),math.pi / 2))
assert(eq(math.deg(math.pi / 2),90) and eq(math.rad(90),math.pi / 2))
assert(math.abs(- 10.43) == 10.43)
assert(eqT(math.abs(minint),minint))
assert(eqT(math.abs(maxint),maxint))
assert(eqT(math.abs(- maxint),maxint))
assert(eq(math.atan(1,0),math.pi / 2))
assert(math.fmod(10,3) == 1)
assert(eq(math.sqrt(10) ^ 2,10))
assert(eq(math.log(2,10),math.log(2) / math.log(10)))
assert(eq(math.log(2,2),1))
assert(eq(math.log(9,3),2))
assert(eq(math.exp(0),1))
assert(eq(math.sin(10),math.sin(10 % (2 * math.pi))))
assert(tonumber(" 1.3e-2 ") == 0.013)
assert(tonumber(" -1.00000000000001 ") == - 1.00000000000001)
assert(8388609 + - 8388609 == 0)
assert(8388608 + - 8388608 == 0)
assert(8388607 + - 8388607 == 0)
assert(eqT(math.floor(3.4),3))
assert(eqT(math.ceil(3.4),4))
assert(eqT(math.floor(- 3.4),- 4))
assert(eqT(math.ceil(- 3.4),- 3))
assert(eqT(math.floor(maxint),maxint))
assert(eqT(math.ceil(maxint),maxint))
assert(eqT(math.floor(minint),minint))
assert(eqT(math.floor(minint + 0),minint))
assert(eqT(math.ceil(minint),minint))
assert(eqT(math.ceil(minint + 0),minint))
assert(math.floor(1e50) == 1e50)
assert(math.ceil(1e50) == 1e50)
assert(math.floor(- 1e50) == - 1e50)
assert(math.ceil(- 1e50) == - 1e50)
for _,p in pairs({31,32,63,64})
do
assert(math.floor(2 ^ p) == 2 ^ p)
assert(math.floor(2 ^ p + 0.5) == 2 ^ p)
assert(math.ceil(2 ^ p) == 2 ^ p)
assert(math.ceil(2 ^ p - 0.5) == 2 ^ p)
end
checkerror("number expected",math.floor,{})
checkerror("number expected",math.ceil,print)
assert(eqT(math.tointeger(minint),minint))
assert(eqT(math.tointeger(minint .. ""),minint))
assert(eqT(math.tointeger(maxint),maxint))
assert(eqT(math.tointeger(maxint .. ""),maxint))
assert(eqT(math.tointeger(minint + 0),minint))
assert(not math.tointeger(0 - minint))
assert(not math.tointeger(math.pi))
assert(not math.tointeger(- math.pi))
assert(math.floor(math.huge) == math.huge)
assert(math.ceil(math.huge) == math.huge)
assert(not math.tointeger(math.huge))
assert(math.floor(- math.huge) == - math.huge)
assert(math.ceil(- math.huge) == - math.huge)
assert(not math.tointeger(- math.huge))
assert(math.tointeger("34.0") == 34)
assert(not math.tointeger("34.3"))
assert(not math.tointeger({}))
assert(not math.tointeger(0 / 0))
for i = - 6, 6
do
for j = - 6, 6
do
if j ~= 0 then
local mi = math.fmod(i,j)
local mf = math.fmod(i + 0,j)
assert(mi == mf)
assert(math.type(mi) == "integer" and math.type(mf) == "float")
if (i >= 0 and j >= 0) or (i <= 0 and j <= 0) or mi == 0 then
assert(eqT(mi,i % j))
end
end
end
end
assert(eqT(math.fmod(minint,minint),0))
assert(eqT(math.fmod(maxint,maxint),0))
assert(eqT(math.fmod(minint + 1,minint),minint + 1))
assert(eqT(math.fmod(maxint - 1,maxint),maxint - 1))
checkerror("zero",math.fmod,3,0)
checkerror("value expected",math.max)
checkerror("value expected",math.min)
assert(eqT(math.max(3),3))
assert(eqT(math.max(3,5,9,1),9))
assert(math.max(maxint,1e61) == 1e61)
assert(eqT(math.max(minint,minint + 1),minint + 1))
assert(eqT(math.min(3),3))
assert(eqT(math.min(3,5,9,1),1))
assert(math.min(3.2,5.9,- 9.2,1.1) == - 9.2)
assert(math.min(1.9,1.7,1.72) == 1.7)
assert(math.min(- 1e61,minint) == - 1e61)
assert(eqT(math.min(maxint,maxint - 1),maxint - 1))
assert(eqT(math.min(maxint - 2,maxint,maxint - 1),maxint - 2))
local a,b = "10","20"
assert(a * b == 200 and a + b == 30 and a - b == - 10 and a / b == 0.5 and - b == - 20)
assert(a == "10" and b == "20")
print("testing -0 and NaN")
local mz <const> = - 0
local z <const> = 0
assert(mz == z)
assert(1 / mz < 0 and 0 < 1 / z)
local a = {[mz] = 1}
assert(a[z] == 1 and a[mz] == 1)
a[z]=2
assert(a[z] == 2 and a[mz] == 2)
local inf = math.huge * 2 + 1
local mz <const> = - 1 / inf
local z <const> = 1 / inf
assert(mz == z)
assert(1 / mz < 0 and 0 < 1 / z)
local NaN <const> = inf - inf
assert(NaN ~= NaN)
assert(not (NaN < NaN))
assert(not (NaN <= NaN))
assert(not (NaN > NaN))
assert(not (NaN >= NaN))
assert(not (0 < NaN) and not (NaN < 0))
local NaN1 <const> = 0 / 0
assert(NaN ~= NaN1 and not (NaN <= NaN1) and not (NaN1 <= NaN))
local a = {}
assert(not pcall(rawset,a,NaN,1))
assert(a[NaN] == undef)
a[1]=1
assert(not pcall(rawset,a,NaN,1))
assert(a[NaN] == undef)
local a1,a2,a3,a4,a5 = 0,0,"",0,""
assert(a1 == a2 and a2 == a4 and a1 ~= a3)
assert(a3 == a5)
print("testing 'math.random'")
local random,max,min = math.random,math.max,math.min
local function testnear
(val,ref,tol)
return (math.abs(val - ref) < ref * tol)
end
local h <const> = 2054176933
local l <const> = 2737031638
math.randomseed(1007)
local res = (h << 32 | l) & ~ (~ 0 << intbits)
assert(random(0) == res)
math.randomseed(1007,0)
local res = 
if floatbits <= 32 then
res=(h >> (32 - floatbits)) % 2 ^ 32
else
res=(h % 2 ^ 32) * 2 ^ (floatbits - 32) + ((l >> (64 - floatbits)) % 2 ^ 32)
end
local rand = random()
assert(eq(rand,0.4782753376376966,2 ^ - floatbits))
assert(rand * 2 ^ floatbits == res)
local x,y = math.randomseed()
local res = math.random(0)
x,y=math.randomseed(x,y)
assert(math.random(0) == res)
math.randomseed(x,y)
assert(math.random(0) == res)
print(string.format("random seeds: %d, %d",x,y))
local randbits = math.min(floatbits,64)
local mult = 2 ^ randbits
local counts = {}
for i = 1, randbits
do
counts[i]=0
end
local up = - math.huge
local low = math.huge
local rounds = 100 * randbits
local totalrounds = 0
::doagain::
for i = 0, rounds
do
local t = random()
assert(0 <= t and t < 1)
up=max(up,t)
low=min(low,t)
assert(t * mult % 1 == 0)
local bit = i % randbits
if (t * 2 ^ bit) % 1 >= 0.5 then
counts[bit + 1]=counts[bit + 1] + 1
end
end
totalrounds=totalrounds + rounds
if not (eq(up,1,1e-3) and eq(low,0,1e-3)) then
goto doagain
end
local expected = (totalrounds / randbits / 2)
for i = 1, randbits
do
if not testnear(counts[i],expected,0.1) then
goto doagain
end
end
print(string.format("float random range in %d calls: [%f, %f]",totalrounds,low,up))
local up = 0
local low = 0
local counts = {}
for i = 1, intbits
do
counts[i]=0
end
local rounds = 100 * intbits
local totalrounds = 0
::doagain::
for i = 0, rounds
do
local t = random(0)
up=max(up,t)
low=min(low,t)
local bit = i % intbits
counts[bit + 1]=counts[bit + 1] + ((t >> bit) & 1)
end
totalrounds=totalrounds + rounds
local lim = maxint >> 10
if not (maxint - up < lim and low - minint < lim) then
goto doagain
end
local expected = (totalrounds / intbits / 2)
for i = 1, intbits
do
if not testnear(counts[i],expected,0.1) then
goto doagain
end
end
print(string.format("integer random range in %d calls: [minint + %.0fppm, maxint - %.0fppm]",totalrounds,(minint - low) / minint * 1e6,(maxint - up) / maxint * 1e6))
local count = {0,0,0,0,0,0}
local rep = 200
local totalrep = 0
::doagain::
for i = 1, rep * 6
do
local r = random(6)
count[r]=count[r] + 1
end
totalrep=totalrep + rep
for i = 1, 6
do
if not testnear(count[i],totalrep,0.05) then
goto doagain
end
end
local function aux
(x1,x2)
local mark = {}
;
local count = 0
while true do
local t = random(x1,x2)
assert(x1 <= t and t <= x2)
if not mark[t] then
mark[t]=true
count=count + 1
if count == x2 - x1 + 1 then
goto ok
end
end
::ok::
end
aux(- 10,0)
aux(1,6)
aux(1,2)
aux(1,13)
aux(1,31)
aux(1,32)
aux(1,33)
aux(- 10,10)
aux(- 10,- 10)
aux(minint,minint)
aux(maxint,maxint)
aux(minint,minint + 9)
aux(maxint - 3,maxint)
local function aux
(p1,p2)
local max = minint
local min = maxint
local n = 100
local mark = {}
;
local count = 0
::doagain::
for _ = 1, n
do
local t = random(p1,p2)
if not mark[t] then
assert(p1 <= t and t <= p2)
max=math.max(max,t)
min=math.min(min,t)
mark[t]=true
count=count + 1
end
end
if not (count >= n * 0.8) then
goto doagain
end
local diff = (p2 - p1) >> 4
if not (min < p1 + diff and max > p2 - diff) then
goto doagain
end
end
aux(0,maxint)
aux(1,maxint)
aux(3,maxint // 3)
aux(minint,- 1)
aux(minint // 2,maxint // 2)
aux(minint,maxint)
aux(minint + 1,maxint)
aux(minint,maxint - 1)
aux(0,1 << (intbits - 5))
assert(not pcall(random,1,2,3))
assert(not pcall(random,minint + 1,minint))
assert(not pcall(random,maxint,maxint - 1))
assert(not pcall(random,maxint,minint))
print("OK")