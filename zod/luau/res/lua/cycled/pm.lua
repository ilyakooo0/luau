print("testing pattern matching")
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
local function f
(s,p)
local i,e = string.find(s,p)
if i then
return string.sub(s,i,e)
end
end
local a,b = string.find("","")
assert(a == 1 and b == 0)
;
a,b=string.find("alo","")
assert(a == 1 and b == 0)
a,b=string.find("ao ao ao","a",1)
assert(a == 1 and b == 1)
a,b=string.find("ao ao ao","ao",2)
assert(a == 5 and b == 7)
a,b=string.find("ao ao ao","ao",9)
assert(a == 9 and b == 11)
a,b=string.find("aaaaab","ab",2)
;
assert(a == 9 and b == 11)
;
a,b=string.find("aaaaab","b")
assert(a == 11 and b == 11)
assert(not string.find("aaaaab","b"))
assert(not string.find("",""))
assert(string.find("alo123alo","12") == 4)
assert(not string.find("alo123alo","^12"))
assert(string.match("aaab",".*b") == "aaab")
assert(string.match("aaa",".*a") == "aaa")
assert(string.match("b",".*b") == "b")
assert(string.match("aaab",".+b") == "aaab")
assert(string.match("aaa",".+a") == "aaa")
assert(not string.match("b",".+b"))
assert(string.match("aaab",".?b") == "ab")
assert(string.match("aaa",".?a") == "aa")
assert(string.match("b",".?b") == "b")
assert(f("aloALO","%l*") == "alo")
assert(f("aLo_ALO","%a*") == "aLo")
assert(f("  
*&
   xuxu  

","%g%g%g+") == "xuxu")
local function PU
(p)
p=string.gsub(p,"(" .. utf8.charpattern .. ")%?",(c)
return string.gsub(c,".","%0?")
end)
p=string.gsub(p,"%.",utf8.charpattern)
return p
end
assert(f("aaab","a*") == "aaa")
;
assert(f("aaa","^.*$") == "aaa")
;
assert(f("aaa","b*") == "")
;
assert(f("aaa","ab*a") == "aa")
assert(f("aba","ab*a") == "aba")
assert(f("aaab","a+") == "aaa")
assert(f("aaa","^.+$") == "aaa")
assert(not f("aaa","b+"))
assert(not f("aaa","ab+a"))
assert(f("aba","ab+a") == "aba")
assert(f("a$a",".$") == "a")
assert(f("a$a",".%$") == "a$")
assert(f("a$a",".$.") == "a$a")
assert(not f("a$a","$$"))
assert(not f("a$b","a$"))
assert(f("a$a","$") == "")
assert(f("","b*") == "")
assert(not f("aaa","bb*"))
assert(f("aaab","a-") == "")
assert(f("aaa","^.-$") == "aaa")
assert(f("aabaaabaaabaaaba","b.*b") == "baaabaaabaaab")
assert(f("aabaaabaaabaaaba","b.-b") == "baaab")
assert(f("alo xo",".o$") == "xo")
assert(f(" 
 isto é assim","%S%S*") == "isto")
assert(f(" 
 isto é assim","%S*$") == "assim")
assert(f(" 
 isto é assim","[a-z]*$") == "assim")
assert(f("um caracter ? extra","[^%sa-z]") == "?")
assert(f("","a?") == "")
assert(f("á",PU("á?")) == "á")
assert(f("ábl",PU("á?b?l?")) == "ábl")
assert(f("  ábl",PU("á?b?l?")) == "")
assert(f("aa","^aa?a?a") == "aa")
assert(f("]]]áb","[^]]+") == "áb")
assert(f("0alo alo","%x*") == "0a")
assert(f("alo alo","%C+") == "alo alo")
print("+")
local function f1
(s,p)
p=string.gsub(p,"%%([0-9])",(s)
return "%" .. (tonumber(s) + 1)
end)
p=string.gsub(p,"^(^?)","%1()",1)
p=string.gsub(p,"($?)$","()%1",1)
local t = {string.match(s,p)}
return string.sub(s,t[1],t[# t] - 1)
end
assert(f1("alo alx 123 bo bo","(..*) %1") == "bo bo")
assert(f1("axz123= 4= 4 34","(.+)=(.*)=%2 %1") == "3= 4= 4 3")
assert(f1("=======","^(=*)=%1$") == "=======")
assert(not string.match("==========","^([=]*)=%1$"))
local function range
(i,j)
if i <= j then
return i,range(i + 1,j)
end
end
local abc = string.char(range(0,127)) .. string.char(range(128,255))
;
assert(string.len(abc) == 256)
local function strset
(p)
local res = {["s"] = ""}
string.gsub(abc,p,(c)
res.s=res.s .. c
end)
return res.s
end
;
assert(string.len(strset("[�-�]")) == 11)
assert(strset("[a-z]") == "abcdefghijklmnopqrstuvwxyz")
assert(strset("[a-z%d]") == strset("[%da-uu-z]"))
assert(strset("[a-]") == "-a")
assert(strset("[^%W]") == strset("[%w]"))
assert(strset("[]%%]") == "%]")
assert(strset("[a%-z]") == "-az")
assert(strset("[%^%[%-a%]%-b]") == "-[]^ab")
assert(strset("%Z") == strset("[-�]"))
assert(strset(".") == strset("[-�%z]"))
print("+")
;
assert(string.match("alo xyzK","(%w+)K") == "xyz")
assert(string.match("254 K","(%d*)K") == "")
assert(string.match("alo ","(%w*)$") == "")
assert(not string.match("alo ","(%w+)$"))
assert(string.find("(álo)","%(á") == 1)
local a,b,c,d,e = string.match("âlo alo",PU("^(((.).). (%w*))$"))
assert(a == "âlo alo" and b == "âl" and c == "â" and d == "alo" and e == nil)
a,b,c,d=string.match("0123456789","(.+(.?)())")
assert(a == "0123456789" and b == "" and c == 11 and d == nil)
print("+")
assert(string.gsub("ülo ülo","ü","x") == "xlo xlo")
assert(string.gsub("alo úlo  "," +$","") == "alo úlo")
assert(string.gsub("  alo alo  ","^%s*(.-)%s*$","%1") == "alo alo")
assert(string.gsub("alo  alo  
 123
 ","%s+"," ") == "alo alo 123 ")
local t = "abç d"
a,b=string.gsub(t,PU("(.)"),"%1@")
assert(a == "a@b@ç@ @d@" and b == 5)
a,b=string.gsub("abçd",PU("(.)"),"%0@",2)
assert(a == "a@b@çd" and b == 2)
assert(string.gsub("alo alo","()[al]","%1") == "12o 56o")
assert(string.gsub("abc=xyz","(%w*)(%p)(%w+)","%3%2%1-%0") == "xyz=abc-abc=xyz")
assert(string.gsub("abc","%w","%1%0") == "aabbcc")
assert(string.gsub("abc","%w+","%0%1") == "abcabc")
assert(string.gsub("áéí","$","óú") == "áéíóú")
assert(string.gsub("","^","r") == "r")
assert(string.gsub("","$","r") == "r")
print("+")
assert(string.gsub("a b cd"," *","-") == "-a-b-c-d-")
local res = ""
local sub = "a  
bc		d"
local i = 1
for p,e in string.gmatch(sub,"()%s*()")
do
res=res .. string.sub(sub,i,p - 1) .. "-"
i=e
end
assert(res == "-a-b-c-d-")
assert(string.gsub("um (dois) tres (quatro)","(%(%w+%))",string.upper) == "um (DOIS) tres (QUATRO)")
local function setglobal
(n,v)
rawset(_G,n,v)
end
string.gsub("a=roberto,roberto=a","(%w+)=(%w%w*)",setglobal)
assert(_G.a == "roberto" and _G.roberto == "a")
_G.a=nil
;
_G.roberto=nil
function f(a,b)
return string.gsub(a,".",b)
end
assert(string.gsub("trocar tudo em |teste|b| é |beleza|al|","|([^|]*)|([^|]*)|",f) == "trocar tudo em bbbbb é alalalalalal")
local function dostring
(s)
return load(s,"")() or ""
end
assert(string.gsub("alo $a='x'$ novamente $return a$","$([^$]*)%$",dostring) == "alo  novamente x")
local x = string.gsub("$x=string.gsub('alo', '.', string.upper)$ assim vai para $return x$","$([^$]*)%$",dostring)
assert(x == " assim vai para ALO")
_G.a,_G.x=nil
local t = {}
local s = "a alo jose  joao"
local r = string.gsub(s,"()(%w+)()",(a,w,b)
assert(string.len(w) == b - a)
;
t[a]=b - a
;
end)
assert(s == r and t[1] == 1 and t[3] == 3 and t[7] == 4 and t[13] == 4)
local function isbalanced
(s)
return not string.find(string.gsub(s,"%b()",""),"[()]")
end
assert(isbalanced("(9 ((8))() 7)  a b ()(c)() a"))
assert(not isbalanced("(9 ((8) 7) a b ( c) a"))
assert(string.gsub("alo 'oi' alo","%b''",""") == "alo " alo")
local t = {"apple","orange","lime",["n"] = 0}
assert(string.gsub("x and x and x","x",()
t.n=t.n + 1
;
return t[t.n]
end) == "apple and orange and lime")
t={["n"] = 0}
string.gsub("first second word","%w%w*",(w)
t.n=t.n + 1
;
t[t.n]=w
end)
assert(t[1] == "first" and t[2] == "second" and t[3] == "word" and t.n == 3)
t={["n"] = 0}
assert(string.gsub("first second word","%w+",(w)
t.n=t.n + 1
;
t[t.n]=w
end,2) == "first second word")
assert(t[1] == "first" and t[2] == "second" and t[3] == undef)
checkerror("invalid replacement value %(a table%)",string.gsub,"alo",".",{["a"] = {}})
checkerror("invalid capture index %%2",string.gsub,"alo",".","%2")
checkerror("invalid capture index %%0",string.gsub,"alo","(%0)","a")
checkerror("invalid capture index %%1",string.gsub,"alo","(%1)","a")
checkerror("invalid use of '%%'",string.gsub,"alo",".","%x")
if not _soft then
print("big strings")
local a = string.rep("a",3e5)
assert(string.find(a,"^a*.?$"))
assert(not string.find(a,"^a*.?b$"))
assert(string.find(a,"^a-.?$"))
a=string.rep("a",1e4) .. string.rep("b",1e4)
assert(not pcall(string.gsub,a,"b"))
end
local function rev
(s)
return string.gsub(s,"(.)(.+)",(c,s1)
return rev(s1) .. c
end)
end
local x = "abcdef"
assert(rev(rev(x)) == x)
assert(string.gsub("alo alo",".",{}) == "alo alo")
assert(string.gsub("alo alo","(.)",{["a"] = "AA",["l"] = ""}) == "AAo AAo")
assert(string.gsub("alo alo","(.).",{["a"] = "AA",["l"] = "K"}) == "AAo AAo")
assert(string.gsub("alo alo","((.)(.?))",{["al"] = "AA",["o"] = false}) == "AAo AAo")
assert(string.gsub("alo alo","().",{"x","yy","zzz"}) == "xyyzzz alo")
t={}
;
setmetatable(t,{["__index"] = (t,s)
return string.upper(s)
end})
assert(string.gsub("a alo b hi","%w%w+",t) == "a ALO b HI")
local a = 0
for i in string.gmatch("abcde","()")
do
assert(i == a + 1)
;
a=i
end
assert(a == 6)
t={["n"] = 0}
for w in string.gmatch("first second word","%w+")
do
t.n=t.n + 1
;
t[t.n]=w
end
assert(t[1] == "first" and t[2] == "second" and t[3] == "word")
t={3,6,9}
for i in string.gmatch("xuxx uu ppar r","()(.)%2")
do
assert(i == table.remove(t,1))
end
assert(# t == 0)
t={}
for i,j in string.gmatch("13 14 10 = 11, 15= 16, 22=23","(%d+)%s*=%s*(%d+)")
do
t[tonumber(i)]=tonumber(j)
end
a=0
for k,v in pairs(t)
do
assert(k + 1 == v + 0)
;
a=a + 1
end
assert(a == 3)
local s = 0
for k in string.gmatch("10 20 30","%d+",3)
do
s=s + tonumber(k)
end
assert(s == 50)
s=0
for k in string.gmatch("11 21 31","%d+",- 4)
do
s=s + tonumber(k)
end
assert(s == 32)
s=0
for k in string.gmatch("11 21 31","%w*",9)
do
s=s + 1
end
assert(s == 1)
s=0
for k in string.gmatch("11 21 31","%w*",10)
do
s=s + 1
end
assert(s == 0)
assert(string.gsub("aaa aa a aaa a","%f[%w]a","x") == "xaa xa x xaa x")
assert(string.gsub("[[]] [][] [[[[","%f[[].","x") == "x[]] x]x] x[[[")
assert(string.gsub("01abc45de3","%f[%d]",".") == ".01abc.45de.3")
assert(string.gsub("01abc45 de3x","%f[%D]%w",".") == "01.bc45 de3.")
assert(string.gsub("function","%f[-�]%w",".") == ".unction")
assert(string.gsub("function","%f[^-�]",".") == "function.")
assert(string.find("a","%f[a]") == 1)
assert(string.find("a","%f[^%z]") == 1)
assert(string.find("a","%f[^%l]") == 2)
assert(string.find("aba","%f[a%z]") == 3)
assert(string.find("aba","%f[%z]") == 4)
assert(not string.find("aba","%f[%l%z]"))
assert(not string.find("aba","%f[^%l%z]"))
local i,e = string.find(" alo aalo allo","%f[%S].-%f[%s].-%f[%S]")
assert(i == 2 and e == 5)
local k = string.match(" alo aalo allo","%f[%S](.-%f[%s].-%f[%S])")
assert(k == "alo ")
local a = {1,5,9,14,17}
for k in string.gmatch("alo alo th02 is 1hat","()%f[%w%d]")
do
assert(table.remove(a,1) == k)
end
assert(# a == 0)
local function malform
(p,m)
m=m or "malformed"
local r,msg = pcall(string.find,"a",p)
assert(not r and string.find(msg,m))
end
malform("(.","unfinished capture")
malform(".)","invalid pattern capture")
malform("[a")
malform("[]")
malform("[^]")
malform("[a%]")
malform("[a%")
malform("%b")
malform("%ba")
malform("%")
malform("%f","missing")
assert(string.match("abc","[-]+") == "")
assert(string.match("abc","[-]+") == "")
assert(string.find("b$a","$?") == 2)
assert(string.find("abcefg","%") == 4)
assert(string.match("abcefgeg","%b") == "efge")
assert(string.match("abc","%+") == "")
assert(string.match("abc","%%?") == "")
assert(string.find("abc",".") == 4)
assert(string.find("abcxabcabc","xabca.") == 4)
local s = string.rep("a",100)
local r = string.gsub(s,"b","c")
assert(string.format("%p",s) == string.format("%p",r))
r=string.gsub(s,".",{["x"] = "y"})
assert(string.format("%p",s) == string.format("%p",r))
local count = 0
r=string.gsub(s,".",(x)
assert(x == "a")
count=count + 1
return nil
end)
r=string.gsub(r,".",{["b"] = "x"})
assert(count == 100)
assert(string.format("%p",s) == string.format("%p",r))
count=0
r=string.gsub(s,".",(x)
assert(x == "a")
count=count + 1
return x
end)
assert(count == 100)
assert(r == s and string.format("%p",s) ~= string.format("%p",r))
print("OK")