print("testing UTF-8 library")
local utf8 = require("utf8")
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
local function len
(s)
return # string.gsub(s,"[€-¿]","")
end
local justone = "^" .. utf8.charpattern .. "$"
local function checksyntax
(s,t)
local ts = {"return '"}
for i = 1, # t
do
ts[i + 1]=string.format("\u{%x}",t[i])
end
ts[# t + 2]="'"
ts=table.concat(ts)
assert(assert(load(ts))() == s)
end
assert(not utf8.offset("alo",5))
assert(not utf8.offset("alo",- 4))
local function check
(s,t,nonstrict)
local l = utf8.len(s,1,- 1,nonstrict)
assert(# t == l and len(s) == l)
assert(utf8.char(table.unpack(t)) == s)
assert(utf8.offset(s,0) == 1)
checksyntax(s,t)
local t1 = {utf8.codepoint(s,1,- 1,nonstrict)}
assert(# t == # t1)
for i = 1, # t
do
assert(t[i] == t1[i])
end
for i = 1, l
do
local pi = utf8.offset(s,i)
local pi1 = utf8.offset(s,2,pi)
assert(string.find(string.sub(s,pi,pi1 - 1),justone))
assert(utf8.offset(s,- 1,pi1) == pi)
assert(utf8.offset(s,i - l - 1) == pi)
assert(pi1 - pi == # utf8.char(utf8.codepoint(s,pi,pi,nonstrict)))
for j = pi, pi1 - 1
do
assert(utf8.offset(s,0,j) == pi)
end
for j = pi + 1, pi1 - 1
do
assert(not utf8.len(s,j))
end
assert(utf8.len(s,pi,pi,nonstrict) == 1)
assert(utf8.len(s,pi,pi1 - 1,nonstrict) == 1)
assert(utf8.len(s,pi,- 1,nonstrict) == l - i + 1)
assert(utf8.len(s,pi1,- 1,nonstrict) == l - i)
assert(utf8.len(s,1,pi,nonstrict) == i)
end
local i = 0
for p,c in utf8.codes(s,nonstrict)
do
i=i + 1
assert(c == t[i] and p == utf8.offset(s,i))
assert(utf8.codepoint(s,p,p,nonstrict) == c)
end
assert(i == # t)
i=0
for c in string.gmatch(s,utf8.charpattern)
do
i=i + 1
assert(c == utf8.char(t[i]))
end
assert(i == # t)
for i = 1, l
do
assert(utf8.offset(s,i) == utf8.offset(s,i - l - 1,# s + 1))
end
end
local function check
(s,p)
local a,b = utf8.len(s)
assert(not a and b == p)
end
check("abcãdef",4)
check("ôŸ¿",1)
check("ôŸ¿¿",1)
check("æ±‰å­—€",# ("æ±‰å­—") + 1)
check("€hello",1)
check("hel€lo",4)
check("æ±‰å­—¿",# ("æ±‰å­—") + 1)
check("¿hello",1)
check("hel¿lo",4)
local function errorcodes
(s)
checkerror("invalid UTF%-8 code",()
for c in utf8.codes(s)
do
assert(c)
end
end)
end
errorcodes("abÿ")
errorcodes("")
errorcodes("in€valid")
errorcodes("¿invalid")
errorcodes("Î±Î»Ï†¿Î±")
local f = utf8.codes("")
assert(f("",2) == nil)
assert(f("",- 1) == nil)
assert(f("",math.mininteger) == nil)
checkerror("position out of bounds",utf8.offset,"abc",1,5)
checkerror("position out of bounds",utf8.offset,"abc",1,- 4)
checkerror("position out of bounds",utf8.offset,"",1,2)
checkerror("position out of bounds",utf8.offset,"",1,- 1)
checkerror("continuation byte",utf8.offset,"ð¦§º",1,2)
checkerror("continuation byte",utf8.offset,"ð¦§º",1,2)
checkerror("continuation byte",utf8.offset,"€",1)
checkerror("out of bounds",utf8.len,"abc",0,2)
checkerror("out of bounds",utf8.len,"abc",1,4)
local s = "hello World"
local t = {string.byte(s,1,- 1)}
for i = 1, utf8.len(s)
do
assert(t[i] == string.byte(s,i))
end
check(s,t)
check("æ±‰å­—/æ¼¢å­—",{27721,23383,47,28450,23383})
local s = "Ã¡Ã©Ã­€"
local t = {utf8.codepoint(s,1,# s - 1)}
assert(# t == 3 and t[1] == 225 and t[2] == 233 and t[3] == 237)
checkerror("invalid UTF%-8 code",utf8.codepoint,s,1,# s)
checkerror("out of bounds",utf8.codepoint,s,# s + 1)
t={utf8.codepoint(s,4,3)}
assert(# t == 0)
checkerror("out of bounds",utf8.codepoint,s,- (# s + 1),1)
checkerror("out of bounds",utf8.codepoint,s,1,# s + 1)
assert(utf8.codepoint("ÿ×") == 55296 - 1)
assert(utf8.codepoint("à") == 57343 + 1)
assert(utf8.codepoint("Ø",1,1,true) == 55296)
assert(utf8.codepoint("ÿß",1,1,true) == 57343)
assert(utf8.codepoint("ÿÿÿ",1,1,true) == 2147483647)
assert(utf8.char() == "")
assert(utf8.char(0,97,98,99,1) == "abc")
assert(utf8.codepoint(utf8.char(1114111)) == 1114111)
assert(utf8.codepoint(utf8.char(2147483647),1,1,true) == (1 << 31) - 1)
checkerror("value out of range",utf8.char,2147483647 + 1)
checkerror("value out of range",utf8.char,- 1)
local function invalid
(s)
checkerror("invalid UTF%-8 code",utf8.codepoint,s)
assert(not utf8.len(s))
end
invalid("ôŸ¿¿")
invalid("Ø")
invalid("ÿß")
invalid("À€")
invalid("Á¿")
invalid("àŸ¿")
invalid("ð¿¿")
invalid("€")
invalid("¿")
invalid("þ")
invalid("ÿ")
check("",{})
s=" Â€ ß¿à € ï¿¿ð€€  ô¿¿"
s=string.gsub(s," ","")
check(s,{0,127,128,2047,2048,65535,65536,1114111})
local s = "ÿÿÿ"
assert(# s == 12)
check(s,{67108864,2147483647},true)
s=" ÿÿÿ"
assert(# s == 10)
check(s,{2097152,67108863},true)
s="ÿÿ"
assert(# s == 8)
check(s,{65536,2097151},true)
local x = "æ—¥æœ¬èªža-4Ã©Ã³"
check(x,{26085,26412,35486,97,45,52,0,233,243})
check("ð£²·ð œŽð ±“ð¡»ð µ¼abð º¢",{146615,132878,134227,135291,134524,97,98,134818})
check("ð¨³Šð©¶˜ð¦§ºð¨³’ð¥„«ð¤““ô¿¿",{167114,171416,158202,167122,151851,148691,1114111})
local i = 0
for p,c in string.gmatch(x,"()(" .. utf8.charpattern .. ")")
do
i=i + 1
assert(utf8.offset(x,i) == p)
assert(utf8.len(x,p) == utf8.len(x) - i + 1)
assert(utf8.len(c) == 1)
for j = 1, # c - 1
do
assert(utf8.offset(x,0,p + j - 1) == p)
end
end
print("ok")