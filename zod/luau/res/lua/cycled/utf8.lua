print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{55}\u{54}\u{46}\u{2d}\u{38}\u{20}\u{6c}\u{69}\u{62}\u{72}\u{61}\u{72}\u{79}")
local utf8 = require("\u{75}\u{74}\u{66}\u{38}")
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
local function len
(s)
return # string.gsub(s,"\u{5b}\u{80}\u{2d}\u{bf}\u{5d}","")
end
local justone = "\u{5e}" .. utf8.charpattern .. "\u{24}"
local function checksyntax
(s,t)
local ts = {"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{27}"}
for i = 1, # t
do
ts[i + 1]=string.format("\u{5c}\u{75}\u{7b}\u{25}\u{78}\u{7d}",t[i])
end
ts[# t + 2]="\u{27}"
ts=table.concat(ts)
assert(assert(load(ts))() == s)
end
assert(not utf8.offset("\u{61}\u{6c}\u{6f}",5))
assert(not utf8.offset("\u{61}\u{6c}\u{6f}",- 4))
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
do
local function check
(s,p)
local a,b = utf8.len(s)
assert(not a and b == p)
end
check("\u{61}\u{62}\u{63}\u{e3}\u{64}\u{65}\u{66}",4)
check("\u{f4}\u{9f}\u{bf}",1)
check("\u{f4}\u{9f}\u{bf}\u{bf}",1)
check("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}\u{80}",# ("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}") + 1)
check("\u{80}\u{68}\u{65}\u{6c}\u{6c}\u{6f}",1)
check("\u{68}\u{65}\u{6c}\u{80}\u{6c}\u{6f}",4)
check("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}\u{bf}",# ("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}") + 1)
check("\u{bf}\u{68}\u{65}\u{6c}\u{6c}\u{6f}",1)
check("\u{68}\u{65}\u{6c}\u{bf}\u{6c}\u{6f}",4)
end
do
local function errorcodes
(s)
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{55}\u{54}\u{46}\u{25}\u{2d}\u{38}\u{20}\u{63}\u{6f}\u{64}\u{65}",function ()
for c in utf8.codes(s)
do
assert(c)
end
end)
end
errorcodes("\u{61}\u{62}\u{ff}")
errorcodes("\u{110000}")
errorcodes("\u{69}\u{6e}\u{80}\u{76}\u{61}\u{6c}\u{69}\u{64}")
errorcodes("\u{bf}\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}")
errorcodes("\u{ce}\u{b1}\u{ce}\u{bb}\u{cf}\u{86}\u{bf}\u{ce}\u{b1}")
local f = utf8.codes("")
assert(f("",2) == nil)
assert(f("",- 1) == nil)
assert(f("",math.mininteger) == nil)
end
checkerror("\u{70}\u{6f}\u{73}\u{69}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.offset,"\u{61}\u{62}\u{63}",1,5)
checkerror("\u{70}\u{6f}\u{73}\u{69}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.offset,"\u{61}\u{62}\u{63}",1,- 4)
checkerror("\u{70}\u{6f}\u{73}\u{69}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.offset,"",1,2)
checkerror("\u{70}\u{6f}\u{73}\u{69}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.offset,"",1,- 1)
checkerror("\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{62}\u{79}\u{74}\u{65}",utf8.offset,"\u{f0}\u{a6}\u{a7}\u{ba}",1,2)
checkerror("\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{62}\u{79}\u{74}\u{65}",utf8.offset,"\u{f0}\u{a6}\u{a7}\u{ba}",1,2)
checkerror("\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{62}\u{79}\u{74}\u{65}",utf8.offset,"\u{80}",1)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.len,"\u{61}\u{62}\u{63}",0,2)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.len,"\u{61}\u{62}\u{63}",1,4)
local s = "\u{68}\u{65}\u{6c}\u{6c}\u{6f}\u{20}\u{57}\u{6f}\u{72}\u{6c}\u{64}"
local t = {string.byte(s,1,- 1)}
for i = 1, utf8.len(s)
do
assert(t[i] == string.byte(s,i))
end
check(s,t)
check("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}\u{2f}\u{e6}\u{bc}\u{a2}\u{e5}\u{ad}\u{97}",{27721,23383,47,28450,23383})
do
local s = "\u{c3}\u{a1}\u{c3}\u{a9}\u{c3}\u{ad}\u{80}"
local t = {utf8.codepoint(s,1,# s - 1)}
assert(# t == 3 and t[1] == 225 and t[2] == 233 and t[3] == 237)
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{55}\u{54}\u{46}\u{25}\u{2d}\u{38}\u{20}\u{63}\u{6f}\u{64}\u{65}",utf8.codepoint,s,1,# s)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.codepoint,s,# s + 1)
t={utf8.codepoint(s,4,3)}
assert(# t == 0)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.codepoint,s,- (# s + 1),1)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.codepoint,s,1,# s + 1)
assert(utf8.codepoint("\u{d7ff}") == 55296 - 1)
assert(utf8.codepoint("\u{e000}") == 57343 + 1)
assert(utf8.codepoint("\u{d800}",1,1,true) == 55296)
assert(utf8.codepoint("\u{dfff}",1,1,true) == 57343)
assert(utf8.codepoint("\u{7fffffff}",1,1,true) == 2147483647)
end
assert(utf8.char() == "")
assert(utf8.char(0,97,98,99,1) == "\u{0}\u{61}\u{62}\u{63}\u{1}")
assert(utf8.codepoint(utf8.char(1114111)) == 1114111)
assert(utf8.codepoint(utf8.char(2147483647),1,1,true) == (1 << 31) - 1)
checkerror("\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}",utf8.char,2147483647 + 1)
checkerror("\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}",utf8.char,- 1)
local function invalid
(s)
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{55}\u{54}\u{46}\u{25}\u{2d}\u{38}\u{20}\u{63}\u{6f}\u{64}\u{65}",utf8.codepoint,s)
assert(not utf8.len(s))
end
invalid("\u{f4}\u{9f}\u{bf}\u{bf}")
invalid("\u{d800}")
invalid("\u{dfff}")
invalid("\u{c0}\u{80}")
invalid("\u{c1}\u{bf}")
invalid("\u{e0}\u{9f}\u{bf}")
invalid("\u{f0}\u{8f}\u{bf}\u{bf}")
invalid("\u{80}")
invalid("\u{bf}")
invalid("\u{fe}")
invalid("\u{ff}")
check("",{})
s="\u{0}\u{20}\u{7f}\u{c2}\u{80}\u{20}\u{df}\u{bf}\u{e0}\u{a0}\u{80}\u{20}\u{ef}\u{bf}\u{bf}\u{f0}\u{90}\u{80}\u{80}\u{20}\u{20}\u{f4}\u{8f}\u{bf}\u{bf}"
s=string.gsub(s,"\u{20}","")
check(s,{0,127,128,2047,2048,65535,65536,1114111})
do
local s = "\u{4000000}\u{7fffffff}"
assert(# s == 12)
check(s,{67108864,2147483647},true)
s="\u{200000}\u{3ffffff}"
assert(# s == 10)
check(s,{2097152,67108863},true)
s="\u{10000}\u{1fffff}"
assert(# s == 8)
check(s,{65536,2097151},true)
end
local x = "\u{e6}\u{97}\u{a5}\u{e6}\u{9c}\u{ac}\u{e8}\u{aa}\u{9e}\u{61}\u{2d}\u{34}\u{0}\u{c3}\u{a9}\u{c3}\u{b3}"
check(x,{26085,26412,35486,97,45,52,0,233,243})
check("\u{f0}\u{a3}\u{b2}\u{b7}\u{f0}\u{a0}\u{9c}\u{8e}\u{f0}\u{a0}\u{b1}\u{93}\u{f0}\u{a1}\u{81}\u{bb}\u{f0}\u{a0}\u{b5}\u{bc}\u{61}\u{62}\u{f0}\u{a0}\u{ba}\u{a2}",{146615,132878,134227,135291,134524,97,98,134818})
check("\u{f0}\u{a8}\u{b3}\u{8a}\u{f0}\u{a9}\u{b6}\u{98}\u{f0}\u{a6}\u{a7}\u{ba}\u{f0}\u{a8}\u{b3}\u{92}\u{f0}\u{a5}\u{84}\u{ab}\u{f0}\u{a4}\u{93}\u{93}\u{f4}\u{8f}\u{bf}\u{bf}",{167114,171416,158202,167122,151851,148691,1114111})
local i = 0
for p,c in string.gmatch(x,"\u{28}\u{29}\u{28}" .. utf8.charpattern .. "\u{29}")
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
print("\u{6f}\u{6b}")