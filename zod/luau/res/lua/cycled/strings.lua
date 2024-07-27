print("testing strings and string library")
local maxi <const> = math.maxinteger
local mini <const> = math.mininteger
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
assert("alo" < "alo1")
assert("" < "a")
assert("aloalo" < "alob")
assert("aloalo" > "aloalo")
assert("alo" < "alo")
assert("alo" > "alo")
assert("" < "")
assert("" < "")
assert("aa" <= "aa")
assert(not ("ab" <= "aa"))
assert("" < "")
assert(not ("" < ""))
assert("" <= "")
assert(not ("" <= ""))
assert("" <= "")
assert("" >= "")
assert(not ("b" < "a"))
assert(string.sub("123456789",2,4) == "234")
assert(string.sub("123456789",7) == "789")
assert(string.sub("123456789",7,6) == "")
assert(string.sub("123456789",7,7) == "7")
assert(string.sub("123456789",0,0) == "")
assert(string.sub("123456789",- 10,10) == "123456789")
assert(string.sub("123456789",1,9) == "123456789")
assert(string.sub("123456789",- 10,- 20) == "")
assert(string.sub("123456789",- 1) == "9")
assert(string.sub("123456789",- 4) == "6789")
assert(string.sub("123456789",- 6,- 4) == "456")
assert(string.sub("123456789",mini,- 4) == "123456")
assert(string.sub("123456789",mini,maxi) == "123456789")
assert(string.sub("123456789",mini,mini) == "")
assert(string.sub("123456789",3,5) == "234")
assert(("123456789"):sub(8) == "789")
assert(string.find("123456789","345") == 3)
local a,b = string.find("123456789","345")
assert(string.sub("123456789",a,b) == "345")
assert(string.find("1234567890123456789","345",3) == 3)
assert(string.find("1234567890123456789","345",4) == 13)
assert(not string.find("1234567890123456789","346",4))
assert(string.find("1234567890123456789",".45",- 9) == 13)
assert(not string.find("abcdefg","",5,1))
assert(string.find("","") == 1)
assert(string.find("","",1) == 1)
assert(not string.find("","",2))
assert(not string.find("","aaa",1))
assert(("alo(.)alo"):find("(.)",1,1) == 4)
assert(string.len("") == 0)
assert(string.len("") == 3)
assert(string.len("1234567890") == 10)
assert(# "" == 0)
assert(# "" == 3)
assert(# "1234567890" == 10)
assert(string.byte("a") == 97)
assert(string.byte("ä") > 127)
assert(string.byte(string.char(255)) == 255)
assert(string.byte(string.char(0)) == 0)
assert(string.byte("") == 0)
assert(string.byte("alox",- 1) == string.byte("x"))
assert(string.byte("ba",2) == 97)
assert(string.byte("

",2,- 1) == 10)
assert(string.byte("

",2,2) == 10)
assert(string.byte("") == nil)
assert(string.byte("hi",- 3) == nil)
assert(string.byte("hi",3) == nil)
assert(string.byte("hi",9,10) == nil)
assert(string.byte("hi",2,1) == nil)
assert(string.char() == "")
assert(string.char(0,255,0) == "ÿ")
assert(string.char(0,string.byte("ä"),0) == "ä")
assert(string.char(string.byte("älóu",1,- 1)) == "älóu")
assert(string.char(string.byte("älóu",1,0)) == "")
assert(string.char(string.byte("älóu",- 10,100)) == "älóu")
checkerror("out of range",string.char,256)
checkerror("out of range",string.char,- 1)
checkerror("out of range",string.char,math.maxinteger)
checkerror("out of range",string.char,math.mininteger)
assert(string.upper("abc") == "ABC")
assert(string.lower("ABCc%$") == "abcc%$")
assert(string.rep("teste",0) == "")
assert(string.rep("téstê",2) == "téstêtéstê")
assert(string.rep("",10) == "")
if string.packsize("i") == 4 then
checkerror("too large",string.rep,"aa",(1 << 30))
checkerror("too large",string.rep,"a",(1 << 30),",")
end
assert(string.rep("teste",0,"xuxu") == "")
assert(string.rep("teste",1,"xuxu") == "teste")
assert(string.rep("",2,"") == "")
assert(string.rep("",10,".") == string.rep(".",9))
assert(not pcall(string.rep,"aa",maxi // 2 + 10))
assert(not pcall(string.rep,"",maxi // 2 + 10,"aa"))
assert(string.reverse("") == "")
assert(string.reverse("") == "")
assert(string.reverse("1234") == "4321")
for i = 0, 30
do
assert(string.len(string.rep("a",i)) == i)
end
assert(type(tostring(nil)) == "string")
assert(type(tostring(12)) == "string")
assert(string.find(tostring({}),"table:"))
assert(string.find(tostring(print),"function:"))
assert(# tostring("") == 1)
assert(tostring(true) == "true")
assert(tostring(false) == "false")
assert(tostring(- 1203) == "-1203")
assert(tostring(1203.125) == "1203.125")
assert(tostring(- 0.5) == "-0.5")
assert(tostring(- 32767) == "-32767")
if math.tointeger(2147483647) then
assert(tostring(- 2147483647) == "-2147483647")
end
if math.tointeger(4.611686018427388e18) then
assert(tostring(4.611686018427388e18) == "4611686018427387904")
assert(tostring(- 4.611686018427388e18) == "-4611686018427387904")
end
if tostring(0) == "0.0" then
assert("" .. 12 == "12" and 12 .. "" == "12.0")
assert(tostring(- 1203 + 0) == "-1203.0")
else
assert(tostring(0) == "0")
assert("" .. 12 == "12" and 12 .. "" == "12")
assert(tostring(- 1203 + 0) == "-1203")
end
local null = "(null)"
assert(string.format("%p",4) == null)
assert(string.format("%p",true) == null)
assert(string.format("%p",nil) == null)
assert(string.format("%p",{}) ~= null)
assert(string.format("%p",print) ~= null)
assert(string.format("%p",coroutine.running()) ~= null)
assert(string.format("%p",io.stdin) ~= null)
assert(string.format("%p",io.stdin) == string.format("%p",io.stdin))
assert(string.format("%p",print) == string.format("%p",print))
assert(string.format("%p",print) ~= string.format("%p",assert))
assert(# string.format("%90p",{}) == 90)
assert(# string.format("%-60p",{}) == 60)
assert(string.format("%10p",false) == string.rep(" ",10 - # null) .. null)
assert(string.format("%-12p",1.5) == null .. string.rep(" ",12 - # null))
local t1 = {}
;
local t2 = {}
assert(string.format("%p",t1) ~= string.format("%p",t2))
local s1 = string.rep("a",10)
local s2 = string.rep("aa",5)
assert(string.format("%p",s1) == string.format("%p",s2))
local s1 = string.rep("a",300)
;
local s2 = string.rep("a",300)
assert(string.format("%p",s1) ~= string.format("%p",s2))
local x = ""ílo"
\"
assert(string.format("%q%s",x,x) == ""\"ílo\"\
\\""ílo"
\")
assert(string.format("%q","") == ""\0"")
assert(load(string.format("return %q",x))() == x)
x="39"
assert(load(string.format("return %q",x))() == x)
assert(string.format("%c%c%x",string.byte("ä"),string.byte("b"),140) == "äb8c")
assert(string.format("") == "")
assert(string.format("%c",34) .. string.format("%c",48) .. string.format("%c",90) .. string.format("%c",100) == string.format("%1c%-c%-1c%c",34,48,90,100))
assert(string.format("%s is not %s","not be","be") == "not be is not be")
assert(string.format("%%%d %010d",10,23) == "%10 0000000023")
assert(tonumber(string.format("%f",10.3)) == 10.3)
assert(string.format(""%-50s"","a") == ""a" .. string.rep(" ",49) .. """)
assert(string.format("-%.20s.20s",string.rep("%",2e3)) == "-" .. string.rep("%",20) .. ".20s")
assert(string.format(""-%20s.20s"",string.rep("%",2e3)) == string.format("%q","-" .. string.rep("%",2e3) .. ".20s"))
local function checkQ
(v)
local s = string.format("%q",v)
local nv = load("return " .. s)()
assert(v == nv and math.type(v) == math.type(nv))
end
checkQ("ÿ4")
checkQ(math.maxinteger)
checkQ(math.mininteger)
checkQ(math.pi)
checkQ(0.1)
checkQ(true)
checkQ(nil)
checkQ(false)
checkQ(math.huge)
checkQ(- math.huge)
assert(string.format("%q",0 / 0) == "(0/0)")
checkerror("no literal",string.format,"%q",{})
assert(string.format("%s","") == "")
checkerror("contains zeros",string.format,"%10s","")
assert(string.format("%s %s",nil,true) == "nil true")
assert(string.format("%s %.4s",false,true) == "false true")
assert(string.format("%.3s %.3s",false,true) == "fal tru")
local m = setmetatable({},{["__tostring"] = ()
return "hello"
end,["__name"] = "hi"})
assert(string.format("%s %.10s",m,m) == "hello hello")
getmetatable(m).__tostring=nil
assert(string.format("%.4s",m) == "hi: ")
getmetatable(m).__tostring=()
return {}
end
checkerror("'__tostring' must return a string",tostring,m)
assert(string.format("%x",0) == "0")
assert(string.format("%02x",0) == "00")
assert(string.format("%08X",4294967295) == "FFFFFFFF")
assert(string.format("%+08d",31501) == "+0031501")
assert(string.format("%+08d",- 30927) == "-0030927")
local i = 1
local j = 1e4
while i + 1 < j do
local m = (i + j) // 2
if 10 ^ m < math.huge then
i=m
else
j=m
end
assert(10 ^ i < math.huge and 10 ^ j == math.huge)
local s = string.format("%.99f",- (10 ^ i))
assert(string.len(s) >= i + 101)
assert(tonumber(s) == - (10 ^ i))
assert(10 ^ 38 < math.huge)
local s = string.format("%.99f",- (10 ^ 38))
assert(string.len(s) >= 38 + 101)
assert(tonumber(s) == - (10 ^ 38))
local max,min = 2147483647,- 2147483648
assert(string.sub(string.format("%8x",- 1),- 8) == "ffffffff")
assert(string.format("%x",max) == "7fffffff")
assert(string.sub(string.format("%x",min),- 8) == "80000000")
assert(string.format("%d",max) == "2147483647")
assert(string.format("%d",min) == "-2147483648")
assert(string.format("%u",4294967295) == "4294967295")
assert(string.format("%o",43981) == "125715")
max,min=9223372036854775807,- 9223372036854775808
if max > 2 ^ 53 then
assert(string.format("%x",(2 ^ 52 | 0) - 1) == "fffffffffffff")
assert(string.format("0x%8X",2399141891) == "0x8F000003")
assert(string.format("%d",2 ^ 53) == "9007199254740992")
assert(string.format("%i",- 2 ^ 53) == "-9007199254740992")
assert(string.format("%x",max) == "7fffffffffffffff")
assert(string.format("%x",min) == "8000000000000000")
assert(string.format("%d",max) == "9223372036854775807")
assert(string.format("%d",min) == "-9223372036854775808")
assert(string.format("%u",~ (- 1 << 64)) == "18446744073709551615")
assert(tostring(1234567890123) == "1234567890123")
end
print("testing 'format %a %A'")
local function matchhexa
(n)
local s = string.format("%a",n)
assert(string.find(s,"^%-?0x[1-9a-f]%.?[0-9a-f]*p[-+]?%d+$"))
assert(tonumber(s) == n)
s=string.format("%A",n)
assert(string.find(s,"^%-?0X[1-9A-F]%.?[0-9A-F]*P[-+]?%d+$"))
assert(tonumber(s) == n)
end
for _,n in ipairs({0.1,- 0.1,1 / 3,- 1 / 3,1e30,- 1e30,- 45 / 247,1,- 1,2,- 2,3e-20,- 3e-20})
do
matchhexa(n)
end
assert(string.find(string.format("%A",0),"^0X0%.?0*P%+?0$"))
assert(string.find(string.format("%a",- 0),"^%-0x0%.?0*p%+?0$"))
if not _port then
assert(string.find(string.format("%a",1 / 0),"^inf"))
assert(string.find(string.format("%A",- 1 / 0),"^%-INF"))
assert(string.find(string.format("%a",0 / 0),"^%-?nan"))
assert(string.find(string.format("%a",- 0),"^%-0x0"))
end
if not pcall(string.format,"%.3a",0) then
(Message or print)("
 >>> modifiers for format '%a' not available <<<
")
else
assert(string.find(string.format("%+.2A",12),"^%+0X%x%.%x0P%+?%d$"))
assert(string.find(string.format("%.4A",- 12),"^%-0X%x%.%x000P%+?%d$"))
end
assert(string.format("%#12o",10) == "         012")
assert(string.format("%#10x",100) == "      0x64")
assert(string.format("%#-17X",100) == "0X64             ")
assert(string.format("%013i",- 100) == "-000000000100")
assert(string.format("%2.5d",- 100) == "-00100")
assert(string.format("%.u",0) == "")
assert(string.format("%+#014.0f",100) == "+000000000100.")
assert(string.format("%-16c",97) == "a               ")
assert(string.format("%+.3G",1.5) == "+1.5")
assert(string.format("%.0s","alo") == "")
assert(string.format("%.s","alo") == "")
assert(string.match(string.format("% 1.0E",100),"^ 1E%+0+2$"))
assert(string.match(string.format("% .1g",2 ^ 10),"^ 1e%+0+3$"))
local function check
(fmt,msg)
checkerror(msg,string.format,fmt,10)
end
local aux = string.rep("0",600)
check("%100.3d","invalid conversion")
check("%1" .. aux .. ".3d","too long")
check("%1.100d","invalid conversion")
check("%10.1" .. aux .. "004d","too long")
check("%t","invalid conversion")
check("%" .. aux .. "d","too long")
check("%d %d","no value")
check("%010c","invalid conversion")
check("%.10c","invalid conversion")
check("%0.34s","invalid conversion")
check("%#i","invalid conversion")
check("%3.1p","invalid conversion")
check("%0.s","invalid conversion")
check("%10q","cannot have modifiers")
check("%F","invalid conversion")
assert(load("return 1
--comment without ending EOL")() == 1)
checkerror("table expected",table.concat,3)
checkerror("at index " .. maxi,table.concat,{}," ",maxi,maxi)
checkerror("at index %" .. mini,table.concat,{}," ",mini,mini)
assert(table.concat({}) == "")
assert(table.concat({},"x") == "")
assert(table.concat({"","",""},"..") == "....")
local a = {}
;
for i = 1, 300
do
a[i]="xuxu"
end
assert(table.concat(a,"123") .. "123" == string.rep("xuxu123",300))
assert(table.concat(a,"b",20,20) == "xuxu")
assert(table.concat(a,"",20,21) == "xuxuxuxu")
assert(table.concat(a,"x",22,21) == "")
assert(table.concat(a,"3",299) == "xuxu3xuxu")
assert(table.concat({},"x",maxi,maxi - 1) == "")
assert(table.concat({},"x",mini + 1,mini) == "")
assert(table.concat({},"x",maxi,mini) == "")
assert(table.concat({[maxi] = "alo"},"x",maxi,maxi) == "alo")
assert(table.concat({[maxi] = "alo",[maxi - 1] = "y"},"-",maxi - 1,maxi) == "y-alo")
assert(not pcall(table.concat,{"a","b",{}}))
a={"a","b","c"}
assert(table.concat(a,",",1,0) == "")
assert(table.concat(a,",",1,1) == "a")
assert(table.concat(a,",",1,2) == "a,b")
assert(table.concat(a,",",2) == "b,c")
assert(table.concat(a,",",3) == "c")
assert(table.concat(a,",",4) == "")
if not _port then
local locales = {"ptb","pt_BR.iso88591","ISO-8859-1"}
local function trylocale
(w)
for i = 1, # locales
do
if os.setlocale(locales[i],w) then
print(string.format("'%s' locale set to '%s'",w,locales[i]))
return locales[i]
end
end
print(string.format("'%s' locale not found",w))
return false
end
if trylocale("collate") then
assert("alo" < "álo" and "álo" < "amo")
end
if trylocale("ctype") then
assert(string.gsub("áéíóú","%a","x") == "xxxxx")
assert(string.gsub("áÁéÉ","%l","x") == "xÁxÉ")
assert(string.gsub("áÁéÉ","%u","x") == "áxéx")
assert(string.upper("áÁé{xuxu}ção") == "ÁÁÉ{XUXU}ÇÃO")
end
os.setlocale("C")
assert(os.setlocale() == "C")
assert(os.setlocale(nil,"numeric") == "C")
end
local f = string.gmatch("1 2 3 4 5","%d+")
assert(f() == "1")
local co = coroutine.wrap(f)
assert(co() == "2")
if T == nil then
(Message or print)("
 >>> testC not active: skipping 'pushfstring' tests <<<
")
else
print("testing 'pushfstring'")
local blen = 200
local function callpfs
(op,fmt,n)
local x = {T.testC("pushfstring" .. op .. "; return *",fmt,n)}
assert(# x == 4)
return x[4]
end
local function testpfs
(op,fmt,n)
assert(callpfs(op,fmt,n) == string.format(fmt,n))
end
testpfs("I","",0)
testpfs("I",string.rep("a",blen - 1),0)
testpfs("I",string.rep("a",blen),0)
testpfs("I",string.rep("a",blen + 1),0)
local str = string.rep("ab",blen) .. "%d" .. string.rep("d",blen / 2)
testpfs("I",str,2 ^ 14)
testpfs("I",str,- 2 ^ 15)
str="%d" .. string.rep("cd",blen)
testpfs("I",str,2 ^ 14)
testpfs("I",str,- 2 ^ 15)
str=string.rep("c",blen - 2) .. "%d"
testpfs("I",str,2 ^ 14)
testpfs("I",str,- 2 ^ 15)
for l = 12, 14
do
local str1 = string.rep("a",l)
for i = 0, 500, 13
do
for j = 0, 500, 13
do
str=string.rep("a",i) .. "%s" .. string.rep("d",j)
testpfs("S",str,str1)
testpfs("S",str,str)
end
end
end
str="abc %c def"
testpfs("I",str,string.byte("A"))
testpfs("I",str,255)
str=string.rep("a",blen - 1) .. "%p" .. string.rep("cd",blen)
testpfs("P",str,{})
str=string.rep("%%",3 * blen) .. "%p" .. string.rep("%%",2 * blen)
testpfs("P",str,{})
end
print("OK")