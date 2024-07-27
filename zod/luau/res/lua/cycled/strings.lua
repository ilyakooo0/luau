print("\116\101\115\116\105\110\103\32\115\116\114\105\110\103\115\32\97\110\100\32\115\116\114\105\110\103\32\108\105\98\114\97\114\121")
local maxi <const> = math.maxinteger
local mini <const> = math.mininteger
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
assert("\97\108\111" < "\97\108\111\49")
assert("" < "\97")
assert("\97\108\111\97\108\111" < "\97\108\111\98")
assert("\97\108\111\97\108\111" > "\97\108\111\97\108\111")
assert("\97\108\111" < "\97\108\111")
assert("\97\108\111" > "\97\108\111")
assert("" < "\1")
assert("" < "\1")
assert("\1\97\97" <= "\1\97\97")
assert(not ("\1\97\98" <= "\1\97\97"))
assert("" < "")
assert(not ("" < ""))
assert("" <= "")
assert(not ("" <= ""))
assert("" <= "")
assert("" >= "")
assert(not ("\98" < "\97"))
assert(string.sub("\49\50\51\52\53\54\55\56\57",2,4) == "\50\51\52")
assert(string.sub("\49\50\51\52\53\54\55\56\57",7) == "\55\56\57")
assert(string.sub("\49\50\51\52\53\54\55\56\57",7,6) == "")
assert(string.sub("\49\50\51\52\53\54\55\56\57",7,7) == "\55")
assert(string.sub("\49\50\51\52\53\54\55\56\57",0,0) == "")
assert(string.sub("\49\50\51\52\53\54\55\56\57",- 10,10) == "\49\50\51\52\53\54\55\56\57")
assert(string.sub("\49\50\51\52\53\54\55\56\57",1,9) == "\49\50\51\52\53\54\55\56\57")
assert(string.sub("\49\50\51\52\53\54\55\56\57",- 10,- 20) == "")
assert(string.sub("\49\50\51\52\53\54\55\56\57",- 1) == "\57")
assert(string.sub("\49\50\51\52\53\54\55\56\57",- 4) == "\54\55\56\57")
assert(string.sub("\49\50\51\52\53\54\55\56\57",- 6,- 4) == "\52\53\54")
assert(string.sub("\49\50\51\52\53\54\55\56\57",mini,- 4) == "\49\50\51\52\53\54")
assert(string.sub("\49\50\51\52\53\54\55\56\57",mini,maxi) == "\49\50\51\52\53\54\55\56\57")
assert(string.sub("\49\50\51\52\53\54\55\56\57",mini,mini) == "")
assert(string.sub("\49\50\51\52\53\54\55\56\57",3,5) == "\50\51\52")
assert(("\49\50\51\52\53\54\55\56\57"):sub(8) == "\55\56\57")
assert(string.find("\49\50\51\52\53\54\55\56\57","\51\52\53") == 3)
local a,b = string.find("\49\50\51\52\53\54\55\56\57","\51\52\53")
assert(string.sub("\49\50\51\52\53\54\55\56\57",a,b) == "\51\52\53")
assert(string.find("\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57","\51\52\53",3) == 3)
assert(string.find("\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57","\51\52\53",4) == 13)
assert(not string.find("\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57","\51\52\54",4))
assert(string.find("\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57","\46\52\53",- 9) == 13)
assert(not string.find("\97\98\99\100\101\102\103","",5,1))
assert(string.find("","") == 1)
assert(string.find("","",1) == 1)
assert(not string.find("","",2))
assert(not string.find("","\97\97\97",1))
assert(("\97\108\111\40\46\41\97\108\111"):find("\40\46\41",1,1) == 4)
assert(string.len("") == 0)
assert(string.len("") == 3)
assert(string.len("\49\50\51\52\53\54\55\56\57\48") == 10)
assert(# "" == 0)
assert(# "" == 3)
assert(# "\49\50\51\52\53\54\55\56\57\48" == 10)
assert(string.byte("\97") == 97)
assert(string.byte("\228") > 127)
assert(string.byte(string.char(255)) == 255)
assert(string.byte(string.char(0)) == 0)
assert(string.byte("") == 0)
assert(string.byte("\97\108\111\120",- 1) == string.byte("\120"))
assert(string.byte("\98\97",2) == 97)
assert(string.byte("\10\10",2,- 1) == 10)
assert(string.byte("\10\10",2,2) == 10)
assert(string.byte("") == nil)
assert(string.byte("\104\105",- 3) == nil)
assert(string.byte("\104\105",3) == nil)
assert(string.byte("\104\105",9,10) == nil)
assert(string.byte("\104\105",2,1) == nil)
assert(string.char() == "")
assert(string.char(0,255,0) == "\255")
assert(string.char(0,string.byte("\228"),0) == "\228")
assert(string.char(string.byte("\228\108\243\117",1,- 1)) == "\228\108\243\117")
assert(string.char(string.byte("\228\108\243\117",1,0)) == "")
assert(string.char(string.byte("\228\108\243\117",- 10,100)) == "\228\108\243\117")
checkerror("\111\117\116\32\111\102\32\114\97\110\103\101",string.char,256)
checkerror("\111\117\116\32\111\102\32\114\97\110\103\101",string.char,- 1)
checkerror("\111\117\116\32\111\102\32\114\97\110\103\101",string.char,math.maxinteger)
checkerror("\111\117\116\32\111\102\32\114\97\110\103\101",string.char,math.mininteger)
assert(string.upper("\97\98\99") == "\65\66\67")
assert(string.lower("\65\66\67\99\37\36") == "\97\98\99\99\37\36")
assert(string.rep("\116\101\115\116\101",0) == "")
assert(string.rep("\116\233\115\116\234",2) == "\116\233\115\116\234\116\233\115\116\234")
assert(string.rep("",10) == "")
if string.packsize("\105") == 4 then
checkerror("\116\111\111\32\108\97\114\103\101",string.rep,"\97\97",(1 << 30))
checkerror("\116\111\111\32\108\97\114\103\101",string.rep,"\97",(1 << 30),"\44")
end
assert(string.rep("\116\101\115\116\101",0,"\120\117\120\117") == "")
assert(string.rep("\116\101\115\116\101",1,"\120\117\120\117") == "\116\101\115\116\101")
assert(string.rep("\1\1",2,"") == "\1\1\1\1")
assert(string.rep("",10,"\46") == string.rep("\46",9))
assert(not pcall(string.rep,"\97\97",maxi // 2 + 10))
assert(not pcall(string.rep,"",maxi // 2 + 10,"\97\97"))
assert(string.reverse("") == "")
assert(string.reverse("\1\2\3") == "\3\2\1")
assert(string.reverse("\49\50\51\52") == "\52\51\50\49")
for i = 0, 30
do
assert(string.len(string.rep("\97",i)) == i)
end
assert(type(tostring(nil)) == "\115\116\114\105\110\103")
assert(type(tostring(12)) == "\115\116\114\105\110\103")
assert(string.find(tostring({}),"\116\97\98\108\101\58"))
assert(string.find(tostring(print),"\102\117\110\99\116\105\111\110\58"))
assert(# tostring("") == 1)
assert(tostring(true) == "\116\114\117\101")
assert(tostring(false) == "\102\97\108\115\101")
assert(tostring(- 1203) == "\45\49\50\48\51")
assert(tostring(1203.125) == "\49\50\48\51\46\49\50\53")
assert(tostring(- 0.5) == "\45\48\46\53")
assert(tostring(- 32767) == "\45\51\50\55\54\55")
if math.tointeger(2147483647) then
assert(tostring(- 2147483647) == "\45\50\49\52\55\52\56\51\54\52\55")
end
if math.tointeger(4611686018427387904) then
assert(tostring(4611686018427387904) == "\52\54\49\49\54\56\54\48\49\56\52\50\55\51\56\55\57\48\52")
assert(tostring(- 4611686018427387904) == "\45\52\54\49\49\54\56\54\48\49\56\52\50\55\51\56\55\57\48\52")
end
if tostring(0.0) == "\48\46\48" then
assert("" .. 12 == "\49\50" and 12.0 .. "" == "\49\50\46\48")
assert(tostring(- 1203 + 0.0) == "\45\49\50\48\51\46\48")
else
assert(tostring(0.0) == "\48")
assert("" .. 12 == "\49\50" and 12.0 .. "" == "\49\50")
assert(tostring(- 1203 + 0.0) == "\45\49\50\48\51")
end
do
local null = "\40\110\117\108\108\41"
assert(string.format("\37\112",4) == null)
assert(string.format("\37\112",true) == null)
assert(string.format("\37\112",nil) == null)
assert(string.format("\37\112",{}) ~= null)
assert(string.format("\37\112",print) ~= null)
assert(string.format("\37\112",coroutine.running()) ~= null)
assert(string.format("\37\112",io.stdin) ~= null)
assert(string.format("\37\112",io.stdin) == string.format("\37\112",io.stdin))
assert(string.format("\37\112",print) == string.format("\37\112",print))
assert(string.format("\37\112",print) ~= string.format("\37\112",assert))
assert(# string.format("\37\57\48\112",{}) == 90)
assert(# string.format("\37\45\54\48\112",{}) == 60)
assert(string.format("\37\49\48\112",false) == string.rep("\32",10 - # null) .. null)
assert(string.format("\37\45\49\50\112",1.5) == null .. string.rep("\32",12 - # null))
do
local t1 = {}
;
local t2 = {}
assert(string.format("\37\112",t1) ~= string.format("\37\112",t2))
end
do
local s1 = string.rep("\97",10)
local s2 = string.rep("\97\97",5)
assert(string.format("\37\112",s1) == string.format("\37\112",s2))
end
do
local s1 = string.rep("\97",300)
;
local s2 = string.rep("\97",300)
assert(string.format("\37\112",s1) ~= string.format("\37\112",s2))
end
end
local x = "\34\237\108\111\34\10\92"
assert(string.format("\37\113\37\115",x,x) == "\34\92\34\237\108\111\92\34\92\10\92\92\34\34\237\108\111\34\10\92")
assert(string.format("\37\113","") == "\34\92\48\34")
assert(load(string.format("\114\101\116\117\114\110\32\37\113",x))() == x)
x="\1\2\51\5\57"
assert(load(string.format("\114\101\116\117\114\110\32\37\113",x))() == x)
assert(string.format("\37\99\37\99\37\120",string.byte("\228"),string.byte("\98"),140) == "\228\98\56\99")
assert(string.format("") == "")
assert(string.format("\37\99",34) .. string.format("\37\99",48) .. string.format("\37\99",90) .. string.format("\37\99",100) == string.format("\37\49\99\37\45\99\37\45\49\99\37\99",34,48,90,100))
assert(string.format("\37\115\32\105\115\32\110\111\116\32\37\115","\110\111\116\32\98\101","\98\101") == "\110\111\116\32\98\101\32\105\115\32\110\111\116\32\98\101")
assert(string.format("\37\37\37\100\32\37\48\49\48\100",10,23) == "\37\49\48\32\48\48\48\48\48\48\48\48\50\51")
assert(tonumber(string.format("\37\102",10.3)) == 10.3)
assert(string.format("\34\37\45\53\48\115\34","\97") == "\34\97" .. string.rep("\32",49) .. "\34")
assert(string.format("\45\37\46\50\48\115\46\50\48\115",string.rep("\37",2000)) == "\45" .. string.rep("\37",20) .. "\46\50\48\115")
assert(string.format("\34\45\37\50\48\115\46\50\48\115\34",string.rep("\37",2000)) == string.format("\37\113","\45" .. string.rep("\37",2000) .. "\46\50\48\115"))
do
local function checkQ
(v)
local s = string.format("\37\113",v)
local nv = load("\114\101\116\117\114\110\32" .. s)()
assert(v == nv and math.type(v) == math.type(nv))
end
checkQ("\1\255\52\2")
checkQ(math.maxinteger)
checkQ(math.mininteger)
checkQ(math.pi)
checkQ(0.1)
checkQ(true)
checkQ(nil)
checkQ(false)
checkQ(math.huge)
checkQ(- math.huge)
assert(string.format("\37\113",0 / 0) == "\40\48\47\48\41")
checkerror("\110\111\32\108\105\116\101\114\97\108",string.format,"\37\113",{})
end
assert(string.format("\37\115","\1") == "\1")
checkerror("\99\111\110\116\97\105\110\115\32\122\101\114\111\115",string.format,"\37\49\48\115","")
assert(string.format("\37\115\32\37\115",nil,true) == "\110\105\108\32\116\114\117\101")
assert(string.format("\37\115\32\37\46\52\115",false,true) == "\102\97\108\115\101\32\116\114\117\101")
assert(string.format("\37\46\51\115\32\37\46\51\115",false,true) == "\102\97\108\32\116\114\117")
local m = setmetatable({},{["\95\95\116\111\115\116\114\105\110\103"] = function ()
return "\104\101\108\108\111"
end,["\95\95\110\97\109\101"] = "\104\105"})
assert(string.format("\37\115\32\37\46\49\48\115",m,m) == "\104\101\108\108\111\32\104\101\108\108\111")
getmetatable(m).__tostring=nil
assert(string.format("\37\46\52\115",m) == "\104\105\58\32")
getmetatable(m).__tostring=function ()
return {}
end
checkerror("\39\95\95\116\111\115\116\114\105\110\103\39\32\109\117\115\116\32\114\101\116\117\114\110\32\97\32\115\116\114\105\110\103",tostring,m)
assert(string.format("\37\120",0.0) == "\48")
assert(string.format("\37\48\50\120",0.0) == "\48\48")
assert(string.format("\37\48\56\88",4294967295) == "\70\70\70\70\70\70\70\70")
assert(string.format("\37\43\48\56\100",31501) == "\43\48\48\51\49\53\48\49")
assert(string.format("\37\43\48\56\100",- 30927) == "\45\48\48\51\48\57\50\55")
do
local i = 1
local j = 10000
while i + 1 < j do
local m = (i + j) // 2
if 10 ^ m < math.huge then
i=m
else
j=m
end
end
assert(10 ^ i < math.huge and 10 ^ j == math.huge)
local s = string.format("\37\46\57\57\102",- (10 ^ i))
assert(string.len(s) >= i + 101)
assert(tonumber(s) == - (10 ^ i))
assert(10 ^ 38 < math.huge)
local s = string.format("\37\46\57\57\102",- (10 ^ 38))
assert(string.len(s) >= 38 + 101)
assert(tonumber(s) == - (10 ^ 38))
end
do
local max,min = 2147483647,- 2147483648
assert(string.sub(string.format("\37\56\120",- 1),- 8) == "\102\102\102\102\102\102\102\102")
assert(string.format("\37\120",max) == "\55\102\102\102\102\102\102\102")
assert(string.sub(string.format("\37\120",min),- 8) == "\56\48\48\48\48\48\48\48")
assert(string.format("\37\100",max) == "\50\49\52\55\52\56\51\54\52\55")
assert(string.format("\37\100",min) == "\45\50\49\52\55\52\56\51\54\52\56")
assert(string.format("\37\117",4294967295) == "\52\50\57\52\57\54\55\50\57\53")
assert(string.format("\37\111",43981) == "\49\50\53\55\49\53")
max,min=9223372036854775807,- 9223372036854775808
if max > 2.0 ^ 53 then
assert(string.format("\37\120",(2 ^ 52 | 0) - 1) == "\102\102\102\102\102\102\102\102\102\102\102\102\102")
assert(string.format("\48\120\37\56\88",2399141891) == "\48\120\56\70\48\48\48\48\48\51")
assert(string.format("\37\100",2 ^ 53) == "\57\48\48\55\49\57\57\50\53\52\55\52\48\57\57\50")
assert(string.format("\37\105",- 2 ^ 53) == "\45\57\48\48\55\49\57\57\50\53\52\55\52\48\57\57\50")
assert(string.format("\37\120",max) == "\55\102\102\102\102\102\102\102\102\102\102\102\102\102\102\102")
assert(string.format("\37\120",min) == "\56\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48")
assert(string.format("\37\100",max) == "\57\50\50\51\51\55\50\48\51\54\56\53\52\55\55\53\56\48\55")
assert(string.format("\37\100",min) == "\45\57\50\50\51\51\55\50\48\51\54\56\53\52\55\55\53\56\48\56")
assert(string.format("\37\117",~ (- 1 << 64)) == "\49\56\52\52\54\55\52\52\48\55\51\55\48\57\53\53\49\54\49\53")
assert(tostring(1234567890123) == "\49\50\51\52\53\54\55\56\57\48\49\50\51")
end
end
do
print("\116\101\115\116\105\110\103\32\39\102\111\114\109\97\116\32\37\97\32\37\65\39")
local function matchhexa
(n)
local s = string.format("\37\97",n)
assert(string.find(s,"\94\37\45\63\48\120\91\49\45\57\97\45\102\93\37\46\63\91\48\45\57\97\45\102\93\42\112\91\45\43\93\63\37\100\43\36"))
assert(tonumber(s) == n)
s=string.format("\37\65",n)
assert(string.find(s,"\94\37\45\63\48\88\91\49\45\57\65\45\70\93\37\46\63\91\48\45\57\65\45\70\93\42\80\91\45\43\93\63\37\100\43\36"))
assert(tonumber(s) == n)
end
for _,n in ipairs({0.1,- 0.1,1 / 3,- 1 / 3,1e30.0,- 1e30.0,- 45 / 247,1,- 1,2,- 2,3e-20.0,- 3e-20.0})
do
matchhexa(n)
end
assert(string.find(string.format("\37\65",0.0),"\94\48\88\48\37\46\63\48\42\80\37\43\63\48\36"))
assert(string.find(string.format("\37\97",- 0.0),"\94\37\45\48\120\48\37\46\63\48\42\112\37\43\63\48\36"))
if not _port then
assert(string.find(string.format("\37\97",1 / 0),"\94\105\110\102"))
assert(string.find(string.format("\37\65",- 1 / 0),"\94\37\45\73\78\70"))
assert(string.find(string.format("\37\97",0 / 0),"\94\37\45\63\110\97\110"))
assert(string.find(string.format("\37\97",- 0.0),"\94\37\45\48\120\48"))
end
if not pcall(string.format,"\37\46\51\97",0) then
(Message or print)("\10\32\62\62\62\32\109\111\100\105\102\105\101\114\115\32\102\111\114\32\102\111\114\109\97\116\32\39\37\97\39\32\110\111\116\32\97\118\97\105\108\97\98\108\101\32\60\60\60\10")
else
assert(string.find(string.format("\37\43\46\50\65",12),"\94\37\43\48\88\37\120\37\46\37\120\48\80\37\43\63\37\100\36"))
assert(string.find(string.format("\37\46\52\65",- 12),"\94\37\45\48\88\37\120\37\46\37\120\48\48\48\80\37\43\63\37\100\36"))
end
end
assert(string.format("\37\35\49\50\111",10) == "\32\32\32\32\32\32\32\32\32\48\49\50")
assert(string.format("\37\35\49\48\120",100) == "\32\32\32\32\32\32\48\120\54\52")
assert(string.format("\37\35\45\49\55\88",100) == "\48\88\54\52\32\32\32\32\32\32\32\32\32\32\32\32\32")
assert(string.format("\37\48\49\51\105",- 100) == "\45\48\48\48\48\48\48\48\48\48\49\48\48")
assert(string.format("\37\50\46\53\100",- 100) == "\45\48\48\49\48\48")
assert(string.format("\37\46\117",0) == "")
assert(string.format("\37\43\35\48\49\52\46\48\102",100) == "\43\48\48\48\48\48\48\48\48\48\49\48\48\46")
assert(string.format("\37\45\49\54\99",97) == "\97\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32")
assert(string.format("\37\43\46\51\71",1.5) == "\43\49\46\53")
assert(string.format("\37\46\48\115","\97\108\111") == "")
assert(string.format("\37\46\115","\97\108\111") == "")
assert(string.match(string.format("\37\32\49\46\48\69",100),"\94\32\49\69\37\43\48\43\50\36"))
assert(string.match(string.format("\37\32\46\49\103",2 ^ 10),"\94\32\49\101\37\43\48\43\51\36"))
local function check
(fmt,msg)
checkerror(msg,string.format,fmt,10)
end
local aux = string.rep("\48",600)
check("\37\49\48\48\46\51\100","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
check("\37\49" .. aux .. "\46\51\100","\116\111\111\32\108\111\110\103")
check("\37\49\46\49\48\48\100","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
check("\37\49\48\46\49" .. aux .. "\48\48\52\100","\116\111\111\32\108\111\110\103")
check("\37\116","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
check("\37" .. aux .. "\100","\116\111\111\32\108\111\110\103")
check("\37\100\32\37\100","\110\111\32\118\97\108\117\101")
check("\37\48\49\48\99","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
check("\37\46\49\48\99","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
check("\37\48\46\51\52\115","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
check("\37\35\105","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
check("\37\51\46\49\112","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
check("\37\48\46\115","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
check("\37\49\48\113","\99\97\110\110\111\116\32\104\97\118\101\32\109\111\100\105\102\105\101\114\115")
check("\37\70","\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110")
assert(load("\114\101\116\117\114\110\32\49\10\45\45\99\111\109\109\101\110\116\32\119\105\116\104\111\117\116\32\101\110\100\105\110\103\32\69\79\76")() == 1)
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.concat,3)
checkerror("\97\116\32\105\110\100\101\120\32" .. maxi,table.concat,{},"\32",maxi,maxi)
checkerror("\97\116\32\105\110\100\101\120\32\37" .. mini,table.concat,{},"\32",mini,mini)
assert(table.concat({}) == "")
assert(table.concat({},"\120") == "")
assert(table.concat({"","\1","\1\2"},"\46\46") == "\46\46\1\46\46\1\2")
local a = {}
;
for i = 1, 300
do
a[i]="\120\117\120\117"
end
assert(table.concat(a,"\49\50\51") .. "\49\50\51" == string.rep("\120\117\120\117\49\50\51",300))
assert(table.concat(a,"\98",20,20) == "\120\117\120\117")
assert(table.concat(a,"",20,21) == "\120\117\120\117\120\117\120\117")
assert(table.concat(a,"\120",22,21) == "")
assert(table.concat(a,"\51",299) == "\120\117\120\117\51\120\117\120\117")
assert(table.concat({},"\120",maxi,maxi - 1) == "")
assert(table.concat({},"\120",mini + 1,mini) == "")
assert(table.concat({},"\120",maxi,mini) == "")
assert(table.concat({[maxi] = "\97\108\111"},"\120",maxi,maxi) == "\97\108\111")
assert(table.concat({[maxi] = "\97\108\111",[maxi - 1] = "\121"},"\45",maxi - 1,maxi) == "\121\45\97\108\111")
assert(not pcall(table.concat,{"\97","\98",{}}))
a={"\97","\98","\99"}
assert(table.concat(a,"\44",1,0) == "")
assert(table.concat(a,"\44",1,1) == "\97")
assert(table.concat(a,"\44",1,2) == "\97\44\98")
assert(table.concat(a,"\44",2) == "\98\44\99")
assert(table.concat(a,"\44",3) == "\99")
assert(table.concat(a,"\44",4) == "")
if not _port then
local locales = {"\112\116\98","\112\116\95\66\82\46\105\115\111\56\56\53\57\49","\73\83\79\45\56\56\53\57\45\49"}
local function trylocale
(w)
for i = 1, # locales
do
if os.setlocale(locales[i],w) then
print(string.format("\39\37\115\39\32\108\111\99\97\108\101\32\115\101\116\32\116\111\32\39\37\115\39",w,locales[i]))
return locales[i]
end
end
print(string.format("\39\37\115\39\32\108\111\99\97\108\101\32\110\111\116\32\102\111\117\110\100",w))
return false
end
if trylocale("\99\111\108\108\97\116\101") then
assert("\97\108\111" < "\225\108\111" and "\225\108\111" < "\97\109\111")
end
if trylocale("\99\116\121\112\101") then
assert(string.gsub("\225\233\237\243\250","\37\97","\120") == "\120\120\120\120\120")
assert(string.gsub("\225\193\233\201","\37\108","\120") == "\120\193\120\201")
assert(string.gsub("\225\193\233\201","\37\117","\120") == "\225\120\233\120")
assert(string.upper("\225\193\233\123\120\117\120\117\125\231\227\111") == "\193\193\201\123\88\85\88\85\125\199\195\79")
end
os.setlocale("\67")
assert(os.setlocale() == "\67")
assert(os.setlocale(nil,"\110\117\109\101\114\105\99") == "\67")
end
do
local f = string.gmatch("\49\32\50\32\51\32\52\32\53","\37\100\43")
assert(f() == "\49")
local co = coroutine.wrap(f)
assert(co() == "\50")
end
if T == nil then
(Message or print)("\10\32\62\62\62\32\116\101\115\116\67\32\110\111\116\32\97\99\116\105\118\101\58\32\115\107\105\112\112\105\110\103\32\39\112\117\115\104\102\115\116\114\105\110\103\39\32\116\101\115\116\115\32\60\60\60\10")
else
print("\116\101\115\116\105\110\103\32\39\112\117\115\104\102\115\116\114\105\110\103\39")
local blen = 200
local function callpfs
(op,fmt,n)
local x = {T.testC("\112\117\115\104\102\115\116\114\105\110\103" .. op .. "\59\32\114\101\116\117\114\110\32\42",fmt,n)}
assert(# x == 4)
return x[4]
end
local function testpfs
(op,fmt,n)
assert(callpfs(op,fmt,n) == string.format(fmt,n))
end
testpfs("\73","",0)
testpfs("\73",string.rep("\97",blen - 1),0)
testpfs("\73",string.rep("\97",blen),0)
testpfs("\73",string.rep("\97",blen + 1),0)
local str = string.rep("\97\98",blen) .. "\37\100" .. string.rep("\100",blen / 2)
testpfs("\73",str,2 ^ 14)
testpfs("\73",str,- 2 ^ 15)
str="\37\100" .. string.rep("\99\100",blen)
testpfs("\73",str,2 ^ 14)
testpfs("\73",str,- 2 ^ 15)
str=string.rep("\99",blen - 2) .. "\37\100"
testpfs("\73",str,2 ^ 14)
testpfs("\73",str,- 2 ^ 15)
for l = 12, 14
do
local str1 = string.rep("\97",l)
for i = 0, 500, 13
do
for j = 0, 500, 13
do
str=string.rep("\97",i) .. "\37\115" .. string.rep("\100",j)
testpfs("\83",str,str1)
testpfs("\83",str,str)
end
end
end
str="\97\98\99\32\37\99\32\100\101\102"
testpfs("\73",str,string.byte("\65"))
testpfs("\73",str,255)
str=string.rep("\97",blen - 1) .. "\37\112" .. string.rep("\99\100",blen)
testpfs("\80",str,{})
str=string.rep("\37\37",3 * blen) .. "\37\112" .. string.rep("\37\37",2 * blen)
testpfs("\80",str,{})
end
print("\79\75")