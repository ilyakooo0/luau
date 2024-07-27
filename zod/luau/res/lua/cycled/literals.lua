print("testing scanner")
local debug = require("debug")
local function dostring
(x)
return assert(load(x),"")()
end
dostring("x  = 	 'aa' ")
assert(x == "aa" and string.len(x) == 3)
_G.x=nil
assert("
"'\" == "
"'\")
assert(string.find("
	","^%c%c%c%c%c%c%c$"))
assert("c12" == "c12")
assert("cab" == "cab")
assert("c" == "c")
assert("c
" == "c
")
assert("alo" == "" .. "" .. "alo")
assert(10 .. 20 .. - 30 == "1020-30")
assert("<ÿè" == "<ÿè")
local function lexstring
(x,y,n)
local f = assert(load("return " .. x .. ", require"debug".getinfo(1).currentline",""))
local s,l = f()
assert(s == y and l == n)
end
lexstring("'abc\z  
   efg'","abcefg",2)
lexstring("'abc\z  


'","abc",4)
lexstring("'\z  
	
'","",3)
lexstring("[[
alo
alo

]]","alo
alo

",5)
lexstring("[[
aloalo

]]","alo
alo

",5)
lexstring("[[
aloalo
]]","alo
alo
",4)
lexstring("[[alo
alo
]]","alo
alo
",4)
lexstring("[[alo]
]alo]]","alo]
]alo",2)
assert("abcdefghi" == "abcdefghi")
assert("" == string.char(0,0,0,0))
assert("" == "")
assert("€ÿ" == "Â€ß¿")
assert("ÿÿ" == "à €ï¿¿")
assert("ÿÿ" == "ð€€÷¿¿¿")
assert(" ÿÿÿ" == "øˆ€€€û¿¿¿¿")
assert("ÿÿÿ" == "ü„€€€€ý¿¿¿¿¿")
local function lexerror
(s,err)
local st,msg = load("return " .. s,"")
if err ~= "<eof>" then
err=err .. "'"
end
assert(not st and string.find(msg,"near .-" .. err))
end
lexerror(""abc\x"","\x"")
lexerror(""abc\x","\x")
lexerror(""\x","\x")
lexerror(""\x5"","\x5"")
lexerror(""\x5","\x5")
lexerror(""\xr"","\xr")
lexerror(""\xr","\xr")
lexerror(""\x.","\x.")
lexerror(""\x8%"","\x8%%")
lexerror(""\xAG","\xAG")
lexerror(""\g"","\g")
lexerror(""\g","\g")
lexerror(""\."","\%.")
lexerror(""\999"","\999"")
lexerror(""xyz\300"","\300"")
lexerror(""   \256"","\256"")
lexerror(""abc\u{100000000}"","abc\u{100000000")
lexerror(""abc\u11r"","abc\u1")
lexerror(""abc\u"","abc\u"")
lexerror(""abc\u{11r"","abc\u{11r")
lexerror(""abc\u{11"","abc\u{11"")
lexerror(""abc\u{11","abc\u{11")
lexerror(""abc\u{r"","abc\u{r")
lexerror("[=[alo]]","<eof>")
lexerror("[=[alo]=","<eof>")
lexerror("[=[alo]","<eof>")
lexerror("'alo","<eof>")
lexerror("'alo \z  

","<eof>")
lexerror("'alo \z","<eof>")
lexerror("'alo \98","<eof>")
for i = 0, 255
do
local s = string.char(i)
assert(not string.find(s,"[a-zA-Z_]") == not load(s .. "=1",""))
assert(not string.find(s,"[a-zA-Z_0-9]") == not load("a" .. s .. "1 = 1",""))
end
local var1 = string.rep("a",1.5e4) .. "1"
local var2 = string.rep("a",1.5e4) .. "2"
local prog = string.format("  %s = 5
  %s = %s + 1
  return function () return %s - %s end
",var1,var2,var1,var1,var2)
local f = dostring(prog)
assert(_G[var1] == 5 and _G[var2] == 6 and f() == - 1)
_G[var1],_G[var2]=nil
print("+")
assert("
	" == "
	")
assert("
 $debug" == "
 $debug")
assert(" [ " ~= " ] ")
local b = "001234567890123456789012345678901234567891234567890123456789012345678901234567890012345678901234567890123456789012345678912345678901234567890123456789012345678900123456789012345678901234567890123456789123456789012345678901234567890123456789001234567890123456789012345678901234567891234567890123456789012345678901234567890012345678901234567890123456789012345678912345678901234567890123456789012345678900123456789012345678901234567890123456789123456789012345678901234567890123456789001234567890123456789012345678901234567891234567890123456789012345678901234567890012345678901234567890123456789012345678912345678901234567890123456789012345678900123456789012345678901234567890123456789123456789012345678901234567890123456789001234567890123456789012345678901234567891234567890123456789012345678901234567890012345678901234567890123456789012345678912345678901234567890123456789012345678900123456789012345678901234567890123456789123456789012345678901234567890123456789"
assert(string.len(b) == 960)
prog="print('+')

local a1 = [["this is a 'string' with several 'quotes'"]]
local a2 = "'quotes'"

assert(string.find(a1, a2) == 34)
print('+')

a1 = [==[temp = [[an arbitrary value]]; ]==]
assert(load(a1))()
assert(temp == 'an arbitrary value')
_G.temp = nil
-- long strings --
local b = "001234567890123456789012345678901234567891234567890123456789012345678901234567890012345678901234567890123456789012345678912345678901234567890123456789012345678900123456789012345678901234567890123456789123456789012345678901234567890123456789001234567890123456789012345678901234567891234567890123456789012345678901234567890012345678901234567890123456789012345678912345678901234567890123456789012345678900123456789012345678901234567890123456789123456789012345678901234567890123456789001234567890123456789012345678901234567891234567890123456789012345678901234567890012345678901234567890123456789012345678912345678901234567890123456789012345678900123456789012345678901234567890123456789123456789012345678901234567890123456789001234567890123456789012345678901234567891234567890123456789012345678901234567890012345678901234567890123456789012345678912345678901234567890123456789012345678900123456789012345678901234567890123456789123456789012345678901234567890123456789"
assert(string.len(b) == 960)
print('+')

local a = [[00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
00123456789012345678901234567890123456789123456789012345678901234567890123456789
]]
assert(string.len(a) == 1863)
assert(string.sub(a, 1, 40) == string.sub(b, 1, 40))
x = 1
"
print("+")
_G.x=nil
dostring(prog)
assert(x)
_G.x=nil
local function getadd
(s)
return string.format("%p",s)
end
local s1 <const> = "01234567890123456789012345678901234567890123456789"
local s2 <const> = "01234567890123456789012345678901234567890123456789"
local s3 = "01234567890123456789012345678901234567890123456789"
local function foo
()
return s1
end
local function foo1
()
return s3
end
local function foo2
()
return "01234567890123456789012345678901234567890123456789"
end
local a1 = getadd(s1)
assert(a1 == getadd(s2))
assert(a1 == getadd(foo()))
assert(a1 == getadd(foo1()))
assert(a1 == getadd(foo2()))
local sd = "0123456789" .. "0123456789012345678901234567890123456789"
assert(sd == s1 and getadd(sd) ~= a1)
prog="local a = 1        -- a comment
local b = 2


x = [=[
hi
]=]
y = "\
hello\r\n\
"
return require"debug".getinfo(1).currentline
"
for _,n in pairs({"
","","
","
"})
do
local prog,nn = string.gsub(prog,"
",n)
assert(dostring(prog) == nn)
assert(_G.x == "hi
" and _G.y == "
hello

")
end
_G.x,_G.y=nil
local a = "]="
assert(a == "]=")
a="[===[[=[]]=][====[]]===]==="
assert(a == "[===[[=[]]=][====[]]===]===")
a="[===[[=[]]=][====[]]===]==="
assert(a == "[===[[=[]]=][====[]]===]===")
a="]]]]]]]]"
assert(a == "]]]]]]]]")
local x = {"=","[","]","
"}
local len = 4
local function gen
(c,n)
if n == 0 then
coroutine.yield(c)
else
for _,a in pairs(x)
do
gen(c .. a,n - 1)
end
end
end
for s in coroutine.wrap(()
gen("",len)
end)
do
assert(s == load("return [====[
" .. s .. "]====]","")())
end
if os.setlocale("pt_BR") or os.setlocale("ptb") then
assert(tonumber("3,4") == 3.4 and tonumber("3.4") == 3.4)
assert(tonumber("  -.4  ") == - 0.4)
assert(tonumber("  +0x.41  ") == 0.25390625)
assert(not load("a = (3,4)"))
assert(assert(load("return 3.4"))() == 3.4)
assert(assert(load("return .4,3"))() == 0.4)
assert(assert(load("return 4."))() == 4)
assert(assert(load("return 4.+.5"))() == 4.5)
assert(" 0x.1 " + " 0x,1" + "-0X.1	" == 0.0625)
assert(not tonumber("inf") and not tonumber("NAN"))
assert(assert(load(string.format("return %q",4.51)))() == 4.51)
local a,b = load("return 4.5.")
assert(string.find(b,"'4%.5%.'"))
assert(os.setlocale("C"))
else
(Message or print)("
 >>> pt_BR locale not available: skipping decimal point tests <<<
")
end
local s = "a string with  and 
 and 
 and 
"
local c = string.format("return %q",s)
assert(assert(load(c))() == s)
assert(not load("a = 'non-ending string"))
assert(not load("a = 'non-ending string
'"))
assert(not load("a = '\345'"))
assert(not load("a = [=x]"))
local function malformednum
(n,exp)
local s,msg = load("return " .. n)
assert(not s and string.find(msg,exp))
end
malformednum("0xe-","near <eof>")
malformednum("0xep-p","malformed number")
malformednum("1print()","malformed number")
print("OK")