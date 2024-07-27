print("\116\101\115\116\105\110\103\32\110\117\109\98\101\114\115\32\97\110\100\32\109\97\116\104\32\108\105\98")
local minint <const> = math.mininteger
local maxint <const> = math.maxinteger
local intbits <const> = math.floor(math.log(maxint,2) + 0.5) + 1
assert((1 << intbits) == 0)
assert(minint == 1 << (intbits - 1))
assert(maxint == minint - 1)
local floatbits = 24
do
local p = 2.0 ^ floatbits
while p < p + 1.0 do
p=p * 2.0
floatbits=floatbits + 1
end
end
local function isNaN
(x)
return (x ~= x)
end
assert(isNaN(0 / 0))
assert(not isNaN(1 / 0))
do
local x = 2.0 ^ floatbits
assert(x > x - 1.0 and x == x + 1.0)
print(string.format("\37\100\45\98\105\116\32\105\110\116\101\103\101\114\115\44\32\37\100\45\98\105\116\32\40\109\97\110\116\105\115\115\97\41\32\102\108\111\97\116\115",intbits,floatbits))
end
assert(math.type(0) == "\105\110\116\101\103\101\114" and math.type(0.0) == "\102\108\111\97\116" and not math.type("\49\48"))
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
local msgf2i = "\110\117\109\98\101\114\46\42\32\104\97\115\32\110\111\32\105\110\116\101\103\101\114\32\114\101\112\114\101\115\101\110\116\97\116\105\111\110"
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
assert(0.0 == 0 and 0.0 == 0 and 0.0 == 0 and 20.0 == 20 and 0.2 == 0.2)
do
local a,b,c = "\50","\32\51\101\48\32","\32\49\48\32\32"
assert(a + b == 5 and - b == - 3 and b + "\50" == 5 and "\49\48" - c == 0)
assert(type(a) == "\115\116\114\105\110\103" and type(b) == "\115\116\114\105\110\103" and type(c) == "\115\116\114\105\110\103")
assert(a == "\50" and b == "\32\51\101\48\32" and c == "\32\49\48\32\32" and - c == - "\32\32\49\48\32")
assert(c % a == 0 and a ^ b == 8)
a=0
assert(a == - a and 0 == - 0)
end
do
local x = - 1
local mz = 0 / x
local t = {[0] = 10,20,30,40,50}
assert(t[mz] == t[0] and t[- 0] == t[0])
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
a,b=math.modf(- 1 / 0)
assert(a == - 1 / 0 and b == 0.0)
a,b=math.modf(1 / 0)
assert(a == 1 / 0 and b == 0.0)
a,b=math.modf(0 / 0)
assert(isNaN(a) and isNaN(b))
a,b=math.modf(3)
assert(eqT(a,3) and eqT(b,0.0))
a,b=math.modf(minint)
assert(eqT(a,minint) and eqT(b,0.0))
end
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
for _,ti in pairs({0,0.0})
do
for _,tj in pairs({0,0.0})
do
local x = i + ti
local y = j + tj
assert(i // j == math.floor(i / j))
end
end
end
end
assert(1 // 0.0 == 1 / 0)
assert(- 1 // 0.0 == - 1 / 0)
assert(eqT(3.5 // 1.5,2.0))
assert(eqT(3.5 // - 1.5,- 3.0))
do
local x,y
x=1
;
assert(x // 0.0 == 1 / 0)
x=1.0
;
assert(x // 0 == 1 / 0)
x=3.5
;
assert(eqT(x // 1,3.0))
assert(eqT(x // - 1,- 4.0))
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
do
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
end
if floatbits < intbits then
assert(2.0 ^ floatbits == (1 << floatbits))
assert(2.0 ^ floatbits - 1.0 == (1 << floatbits) - 1.0)
assert(2.0 ^ floatbits - 1.0 ~= (1 << floatbits))
assert(2.0 ^ floatbits + 1.0 ~= (1 << floatbits) + 1)
else
assert(maxint == maxint + 0.0)
assert(maxint - 1 == maxint - 1.0)
assert(minint + 1 == minint + 1.0)
assert(maxint ~= maxint - 1.0)
end
assert(maxint + 0.0 == 2.0 ^ (intbits - 1) - 1.0)
assert(minint + 0.0 == minint)
assert(minint + 0.0 == - 2.0 ^ (intbits - 1))
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
assert(minint <= minint + 0.0)
assert(minint + 0.0 <= minint)
assert(not (minint < minint + 0.0))
assert(not (minint + 0.0 < minint))
assert(maxint < minint * - 1.0)
assert(maxint <= minint * - 1.0)
do
local fmaxi1 = 2 ^ (intbits - 1)
assert(maxint < fmaxi1)
assert(maxint <= fmaxi1)
assert(not (fmaxi1 <= maxint))
assert(minint <= - 2 ^ (intbits - 1))
assert(- 2 ^ (intbits - 1) <= minint)
end
if floatbits < intbits then
print("\116\101\115\116\105\110\103\32\111\114\100\101\114\32\40\102\108\111\97\116\115\32\99\97\110\110\111\116\32\114\101\112\114\101\115\101\110\116\32\97\108\108\32\105\110\116\101\103\101\114\115\41")
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
print("\116\101\115\116\105\110\103\32\111\114\100\101\114\32\40\102\108\111\97\116\115\32\99\97\110\32\114\101\112\114\101\115\101\110\116\32\97\108\108\32\105\110\116\101\103\101\114\115\41")
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
end
local function checkcompt
(msg,code)
checkerror(msg,assert(load(code)))
end
checkcompt("\100\105\118\105\100\101\32\98\121\32\122\101\114\111","\114\101\116\117\114\110\32\50\32\47\47\32\48")
checkcompt(msgf2i,"\114\101\116\117\114\110\32\50\46\51\32\62\62\32\48")
checkcompt(msgf2i,("\114\101\116\117\114\110\32\50\46\48\94\37\100\32\38\32\49"):format(intbits - 1))
checkcompt("\102\105\101\108\100\32\39\104\117\103\101\39","\114\101\116\117\114\110\32\109\97\116\104\46\104\117\103\101\32\60\60\32\49")
checkcompt(msgf2i,("\114\101\116\117\114\110\32\49\32\124\32\50\46\48\94\37\100"):format(intbits - 1))
checkcompt(msgf2i,"\114\101\116\117\114\110\32\50\46\51\32\126\32\48\46\48")
local function f2i
(x)
return x | x
end
checkerror(msgf2i,f2i,math.huge)
checkerror(msgf2i,f2i,- math.huge)
checkerror(msgf2i,f2i,0 / 0)
if floatbits < intbits then
assert(maxint + 1.0 == maxint + 0.0)
assert(minint - 1.0 == minint + 0.0)
checkerror(msgf2i,f2i,maxint + 0.0)
assert(f2i(2.0 ^ (intbits - 2)) == 1 << (intbits - 2))
assert(f2i(- 2.0 ^ (intbits - 2)) == - (1 << (intbits - 2)))
assert((2.0 ^ (floatbits - 1) + 1.0) // 1 == (1 << (floatbits - 1)) + 1)
local mf = maxint - (1 << (floatbits - intbits)) + 1
assert(f2i(mf + 0.0) == mf)
mf=mf + 1
assert(f2i(mf + 0.0) ~= mf)
else
assert(maxint + 1.0 > maxint)
assert(minint - 1.0 < minint)
assert(f2i(maxint + 0.0) == maxint)
checkerror("\110\111\32\105\110\116\101\103\101\114\32\114\101\112",f2i,maxint + 1.0)
checkerror("\110\111\32\105\110\116\101\103\101\114\32\114\101\112",f2i,minint - 1.0)
end
assert(f2i(minint + 0.0) == minint)
assert("\50" + 1 == 3)
assert("\50\32" + 1 == 3)
assert("\32\45\50\32" + 1 == - 1)
assert("\32\45\48\120\97\32" + 1 == - 9)
do
assert(eqT(tonumber(tostring(maxint)),maxint))
assert(eqT(tonumber(tostring(minint)),minint))
local function incd
(n)
local s = string.format("\37\100",n)
s=string.gsub(s,"\37\100\36",function (d)
assert(d ~= "\57")
return string.char(string.byte(d) + 1)
end)
return s
end
assert(eqT(tonumber(incd(maxint)),maxint + 1.0))
assert(eqT(tonumber(incd(minint)),minint - 1.0))
assert(eqT(tonumber("\49" .. string.rep("\48",30)),1e30))
assert(eqT(tonumber("\45\49" .. string.rep("\48",30)),- 1e30))
assert(eqT(tonumber("\48\120\49" .. string.rep("\48",30)),0))
assert(minint == load("\114\101\116\117\114\110\32" .. minint)())
assert(eqT(maxint,load("\114\101\116\117\114\110\32" .. maxint)()))
assert(eqT(1e22,10000000000000000000000))
assert(eqT(- 1e22,- 10000000000000000000000))
end
assert(tonumber(3.4) == 3.4)
assert(eqT(tonumber(3),3))
assert(eqT(tonumber(maxint),maxint) and eqT(tonumber(minint),minint))
assert(tonumber(1 / 0) == 1 / 0)
assert(tonumber("\48") == 0)
assert(not tonumber(""))
assert(not tonumber("\32\32"))
assert(not tonumber("\45"))
assert(not tonumber("\32\32\45\48\120\32"))
assert(not tonumber({}))
assert(tonumber("\43\48\46\48\49") == 1 / 100 and tonumber("\43\46\48\49") == 0.01 and tonumber("\46\48\49") == 0.01 and tonumber("\45\49\46") == - 1 and tonumber("\43\49\46") == 1)
assert(not tonumber("\43\32\48\46\48\49") and not tonumber("\43\46\101\49") and not tonumber("\49\101") and not tonumber("\49\46\48\101\43") and not tonumber("\46"))
assert(tonumber("\45\48\49\50") == - 10 - 2)
assert(tonumber("\45\49\46\50\101\50") == - - - 120)
assert(tonumber("\48\120\102\102\102\102\102\102\102\102\102\102\102\102") == (1 << (4 * 12)) - 1)
assert(tonumber("\48\120" .. string.rep("\102",(intbits // 4))) == - 1)
assert(tonumber("\45\48\120" .. string.rep("\102",(intbits // 4))) == 1)
assert(tonumber("\32\32\48\48\49\48\49\48\32\32",2) == 10)
assert(tonumber("\32\32\48\48\49\48\49\48\32\32",10) == 1010)
assert(tonumber("\32\32\45\49\48\49\48\32\32",2) == - 10)
assert(tonumber("\49\48",36) == 36)
assert(tonumber("\32\32\45\49\48\32\32",36) == - 36)
assert(tonumber("\32\32\43\49\90\32\32",36) == 36 + 35)
assert(tonumber("\32\32\45\49\122\32\32",36) == - 36 + - 35)
assert(tonumber("\45\102\70\102\97",16) == - (10 + (16 * (15 + (16 * (15 + (16 * 15)))))))
assert(tonumber(string.rep("\49",(intbits - 2)),2) + 1 == 2 ^ (intbits - 2))
assert(tonumber("\102\102\102\102\70\70\70\70",16) + 1 == (1 << 32))
assert(tonumber("\48\102\102\102\102\70\70\70\70",16) + 1 == (1 << 32))
assert(tonumber("\45\48\102\102\102\102\102\102\70\70\70\70",16) - 1 == - (1 << 40))
for i = 2, 36
do
local i2 = i * i
local i10 = i2 * i2 * i2 * i2 * i2
assert(tonumber("\9\49\48\48\48\48\48\48\48\48\48\48\9",i) == i10)
end
if not _soft then
assert(tonumber("\48\120" .. string.rep("\102",13) .. "\46\48") == 2.0 ^ (4 * 13) - 1)
assert(tonumber("\48\120" .. string.rep("\102",150) .. "\46\48") == 2.0 ^ (4 * 150) - 1)
assert(tonumber("\48\120" .. string.rep("\102",300) .. "\46\48") == 2.0 ^ (4 * 300) - 1)
assert(tonumber("\48\120" .. string.rep("\102",500) .. "\46\48") == 2.0 ^ (4 * 500) - 1)
assert(tonumber("\48\120\51\46" .. string.rep("\48",1000)) == 3)
assert(tonumber("\48\120" .. string.rep("\48",1000) .. "\97") == 10)
assert(tonumber("\48\120\48\46" .. string.rep("\48",13) .. "\49") == 2.0 ^ (- 4 * 14))
assert(tonumber("\48\120\48\46" .. string.rep("\48",150) .. "\49") == 2.0 ^ (- 4 * 151))
assert(tonumber("\48\120\48\46" .. string.rep("\48",300) .. "\49") == 2.0 ^ (- 4 * 301))
assert(tonumber("\48\120\48\46" .. string.rep("\48",500) .. "\49") == 2.0 ^ (- 4 * 501))
assert(tonumber("\48\120\101\48\51" .. string.rep("\48",1000) .. "\112\45\52\48\48\48") == 3587.0)
assert(tonumber("\48\120\46" .. string.rep("\48",1000) .. "\55\52\112\52\48\48\52") == 7.25)
end
local function f
(...)
if select("\35",...) == 1 then
return (...)
else
return "\42\42\42"
end
end
assert(not f(tonumber("\102\70\102\97",15)))
assert(not f(tonumber("\48\57\57",8)))
assert(not f(tonumber("\49",2)))
assert(not f(tonumber("",8)))
assert(not f(tonumber("\32\32",9)))
assert(not f(tonumber("\32\32",9)))
assert(not f(tonumber("\48\120\102",10)))
assert(not f(tonumber("\105\110\102")))
assert(not f(tonumber("\32\73\78\70\32")))
assert(not f(tonumber("\78\97\110")))
assert(not f(tonumber("\110\97\110")))
assert(not f(tonumber("\32\32")))
assert(not f(tonumber("")))
assert(not f(tonumber("\49\32\32\97")))
assert(not f(tonumber("\49\32\32\97",2)))
assert(not f(tonumber("\49")))
assert(not f(tonumber("\49\32")))
assert(not f(tonumber("\49\32")))
assert(not f(tonumber("\101\49")))
assert(not f(tonumber("\101\32\32\49")))
assert(not f(tonumber("\32\51\46\52\46\53\32")))
assert(not tonumber("\48\120"))
assert(not tonumber("\120"))
assert(not tonumber("\120\51"))
assert(not tonumber("\48\120\51\46\51\46\51"))
assert(not tonumber("\48\48\120\50"))
assert(not tonumber("\48\120\32\50"))
assert(not tonumber("\48\32\120\50"))
assert(not tonumber("\50\51\120"))
assert(not tonumber("\45\32\48\120\97\97"))
assert(not tonumber("\45\48\120\97\97\80\32"))
assert(not tonumber("\48\120\48\46\53\49\112"))
assert(not tonumber("\48\120\53\112\43\45\50"))
assert(16 == 16 and 4095 == 2 ^ 12 - 1 and 251 == 251)
assert(0.0 == 0 and 0.0 == 0)
assert(4294967295 == (1 << 32) - 1)
assert(tonumber("\43\48\120\50") == 2)
assert(tonumber("\45\48\120\97\65") == - 170)
assert(tonumber("\45\48\120\102\102\70\70\70\102\102\102") == - (1 << 32) + 1)
assert(0.0 == 0 and 14 + 1 == 15 and 14 - 1 == 13)
assert(tonumber("\32\32\48\120\50\46\53\32\32") == 37 / 16)
assert(tonumber("\32\32\45\48\120\50\46\53\32\32") == - 37 / 16)
assert(tonumber("\32\32\43\48\120\48\46\53\49\112\43\56\32\32") == 81)
assert(0.9999999997671694 == 1 - "\48\120\46\48\48\48\48\48\48\48\49")
assert("\48\120\65\46\97" + 0 == 10 + 10 / 16)
assert(170.0 == 170)
assert(1.0 == 1)
assert(1.0625 == "\48\120\49\46" + "\43\48\120\46\49")
assert(11259375.0 == 11259375.0)
assert(1.1 == 1.0 + 0.1)
assert(100.0 == 100.0 and 0.01 == 0.01)
assert(1111111111 - 1111111110 == 1.0)
assert(1.1 == "\49\46" + "\46\49")
assert(tonumber("\49\49\49\49\49\49\49\49\49\49") - tonumber("\49\49\49\49\49\49\49\49\49\48") == tonumber("\32\32\43\48\46\48\48\49\101\43\51\32\10\9"))
assert(1e-31 > 9e-32 and 9e29 < 1e30)
assert(0.123456 > 0.123455)
assert(tonumber("\43\49\46\50\51\69\49\56") == 1.23 * 10.0 ^ 18)
assert(not (1 < 1) and (1 < 2) and not (2 < 1))
assert(not ("\97" < "\97") and ("\97" < "\98") and not ("\98" < "\97"))
assert((1 <= 1) and (1 <= 2) and not (2 <= 1))
assert(("\97" <= "\97") and ("\97" <= "\98") and not ("\98" <= "\97"))
assert(not (1 > 1) and not (1 > 2) and (2 > 1))
assert(not ("\97" > "\97") and not ("\97" > "\98") and ("\98" > "\97"))
assert((1 >= 1) and not (1 >= 2) and (2 >= 1))
assert(("\97" >= "\97") and not ("\97" >= "\98") and ("\98" >= "\97"))
assert(1.3 < 1.4 and 1.3 <= 1.4 and not (1.3 < 1.3) and 1.3 <= 1.3)
assert(eqT(- 4 % 3,2))
assert(eqT(4 % - 3,- 2))
assert(eqT(- 4.0 % 3,2.0))
assert(eqT(4 % - 3.0,- 2.0))
assert(eqT(4 % - 5,- 1))
assert(eqT(4 % - 5.0,- 1.0))
assert(eqT(4 % 5,4))
assert(eqT(4 % 5.0,4.0))
assert(eqT(- 4 % - 5,- 4))
assert(eqT(- 4 % - 5.0,- 4.0))
assert(eqT(- 4 % 5,1))
assert(eqT(- 4 % 5.0,1.0))
assert(eqT(4.25 % 4,0.25))
assert(eqT(10.0 % 2,0.0))
assert(eqT(- 10.0 % 2,0.0))
assert(eqT(- 10.0 % - 2,0.0))
assert(math.pi - math.pi % 1 == 3)
assert(math.pi - math.pi % 1e-3 == 3.141)
do
local i,j = 0,20000
while i < j do
local m = (i + j) // 2
if 10 ^ - m > 0 then
i=m + 1
else
j=m
end
end
local b = 10 ^ - (i - (i // 10))
assert(b > 0 and b * b == 0)
local delta = b / 1000
assert(eq((2.1 * b) % (2 * b),(0.1 * b),delta))
assert(eq((- 2.1 * b) % (2 * b),(2 * b) - (0.1 * b),delta))
assert(eq((2.1 * b) % (- 2 * b),(0.1 * b) - (2 * b),delta))
assert(eq((- 2.1 * b) % (- 2 * b),(- 0.1 * b),delta))
end
for i = - 10, 10
do
for j = - 10, 10
do
if j ~= 0 then
assert((i + 0.0) % j == i % j)
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
do
local i = 10
while (1 << i) > 0 do
assert((1 << i) % 3 == i % 2 + 1)
i=i + 1
end
i=10
while 2 ^ i < math.huge do
assert(2 ^ i % 3 == i % 2 + 1)
i=i + 1
end
end
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
anan(0.0 % 0)
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
assert(tonumber("\32\49\46\51\101\45\50\32") == 0.013)
assert(tonumber("\32\45\49\46\48\48\48\48\48\48\48\48\48\48\48\48\48\49\32") == - 1.00000000000001)
assert(8388609 + - 8388609 == 0)
assert(8388608 + - 8388608 == 0)
assert(8388607 + - 8388607 == 0)
do
assert(eqT(math.floor(3.4),3))
assert(eqT(math.ceil(3.4),4))
assert(eqT(math.floor(- 3.4),- 4))
assert(eqT(math.ceil(- 3.4),- 3))
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
for _,p in pairs({31,32,63,64})
do
assert(math.floor(2 ^ p) == 2 ^ p)
assert(math.floor(2 ^ p + 0.5) == 2 ^ p)
assert(math.ceil(2 ^ p) == 2 ^ p)
assert(math.ceil(2 ^ p - 0.5) == 2 ^ p)
end
checkerror("\110\117\109\98\101\114\32\101\120\112\101\99\116\101\100",math.floor,{})
checkerror("\110\117\109\98\101\114\32\101\120\112\101\99\116\101\100",math.ceil,print)
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
assert(math.tointeger("\51\52\46\48") == 34)
assert(not math.tointeger("\51\52\46\51"))
assert(not math.tointeger({}))
assert(not math.tointeger(0 / 0))
end
for i = - 6, 6
do
for j = - 6, 6
do
if j ~= 0 then
local mi = math.fmod(i,j)
local mf = math.fmod(i + 0.0,j)
assert(mi == mf)
assert(math.type(mi) == "\105\110\116\101\103\101\114" and math.type(mf) == "\102\108\111\97\116")
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
checkerror("\122\101\114\111",math.fmod,3,0)
do
checkerror("\118\97\108\117\101\32\101\120\112\101\99\116\101\100",math.max)
checkerror("\118\97\108\117\101\32\101\120\112\101\99\116\101\100",math.min)
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
end
local a,b = "\49\48","\50\48"
assert(a * b == 200 and a + b == 30 and a - b == - 10 and a / b == 0.5 and - b == - 20)
assert(a == "\49\48" and b == "\50\48")
do
print("\116\101\115\116\105\110\103\32\45\48\32\97\110\100\32\78\97\78")
local mz <const> = - 0.0
local z <const> = 0.0
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
end
print("\116\101\115\116\105\110\103\32\39\109\97\116\104\46\114\97\110\100\111\109\39")
local random,max,min = math.random,math.max,math.min
local function testnear
(val,ref,tol)
return (math.abs(val - ref) < ref * tol)
end
do
local h <const> = 2054176933
local l <const> = 2737031638
math.randomseed(1007)
local res = (h << 32 | l) & ~ (~ 0 << intbits)
assert(random(0) == res)
math.randomseed(1007,0)
local res
if floatbits <= 32 then
res=(h >> (32 - floatbits)) % 2 ^ 32
else
res=(h % 2 ^ 32) * 2 ^ (floatbits - 32) + ((l >> (64 - floatbits)) % 2 ^ 32)
end
local rand = random()
assert(eq(rand,0.4782753376376966,2 ^ - floatbits))
assert(rand * 2 ^ floatbits == res)
end
do
local x,y = math.randomseed()
local res = math.random(0)
x,y=math.randomseed(x,y)
assert(math.random(0) == res)
math.randomseed(x,y)
assert(math.random(0) == res)
print(string.format("\114\97\110\100\111\109\32\115\101\101\100\115\58\32\37\100\44\32\37\100",x,y))
end
do
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
print(string.format("\102\108\111\97\116\32\114\97\110\100\111\109\32\114\97\110\103\101\32\105\110\32\37\100\32\99\97\108\108\115\58\32\91\37\102\44\32\37\102\93",totalrounds,low,up))
end
do
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
print(string.format("\105\110\116\101\103\101\114\32\114\97\110\100\111\109\32\114\97\110\103\101\32\105\110\32\37\100\32\99\97\108\108\115\58\32\91\109\105\110\105\110\116\32\43\32\37\46\48\102\112\112\109\44\32\109\97\120\105\110\116\32\45\32\37\46\48\102\112\112\109\93",totalrounds,(minint - low) / minint * 1e6,(maxint - up) / maxint * 1e6))
end
do
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
end
do
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
end
do
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
end
assert(not pcall(random,1,2,3))
assert(not pcall(random,minint + 1,minint))
assert(not pcall(random,maxint,maxint - 1))
assert(not pcall(random,maxint,minint))
print("\79\75")