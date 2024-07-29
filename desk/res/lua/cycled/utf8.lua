print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{55}\u{54}\u{46}\u{2d}\u{38}\u{20}\u{6c}\u{69}\u{62}\u{72}\u{61}\u{72}\u{79}")
local utf8 = require("\u{75}\u{74}\u{66}\u{38}")
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not (s and string.find(err,msg)))
end
local function len
(s)
return # string.gsub(s,"\u{5b}\u{80}\u{2d}\u{bf}\u{5d}","")
end
local justone = ("\u{5e}" .. (utf8.charpattern .. "\u{24}"))
local function checksyntax
(s,t)
local ts = {"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{27}"}
for i = 0x1, # t
do
ts[(i + 0x1)]=string.format("\u{5c}\u{75}\u{7b}\u{25}\u{78}\u{7d}",t[i])
end
ts[# (t + 0x2)]="\u{27}"
ts=table.concat(ts)
assert((assert(load(ts))() == s))
end
assert(not utf8.offset("\u{61}\u{6c}\u{6f}",0x5))
assert(not utf8.offset("\u{61}\u{6c}\u{6f}",- 0x4))
local function check
(s,t,nonstrict)
local l = utf8.len(s,0x1,- 0x1,nonstrict)
assert(# ((t == l) and (len(s) == l)))
assert((utf8.char(table.unpack(t)) == s))
assert((utf8.offset(s,0x0) == 0x1))
checksyntax(s,t)
local t1 = {utf8.codepoint(s,0x1,- 0x1,nonstrict)}
assert(# (t == # t1))
for i = 0x1, # t
do
assert((t[i] == t1[i]))
end
for i = 0x1, l
do
local pi = utf8.offset(s,i)
local pi1 = utf8.offset(s,0x2,pi)
assert(string.find(string.sub(s,pi,(pi1 - 0x1)),justone))
assert((utf8.offset(s,- 0x1,pi1) == pi))
assert((utf8.offset(s,((i - l) - 0x1)) == pi))
assert(((pi1 - pi) == # utf8.char(utf8.codepoint(s,pi,pi,nonstrict))))
for j = pi, (pi1 - 0x1)
do
assert((utf8.offset(s,0x0,j) == pi))
end
for j = (pi + 0x1), (pi1 - 0x1)
do
assert(not utf8.len(s,j))
end
assert((utf8.len(s,pi,pi,nonstrict) == 0x1))
assert((utf8.len(s,pi,(pi1 - 0x1),nonstrict) == 0x1))
assert((utf8.len(s,pi,- 0x1,nonstrict) == ((l - i) + 0x1)))
assert((utf8.len(s,pi1,- 0x1,nonstrict) == (l - i)))
assert((utf8.len(s,0x1,pi,nonstrict) == i))
end
local i = 0x0
for p,c in utf8.codes(s,nonstrict)
do
i=(i + 0x1)
assert(((c == t[i]) and (p == utf8.offset(s,i))))
assert((utf8.codepoint(s,p,p,nonstrict) == c))
end
assert((i == # t))
i=0x0
for c in string.gmatch(s,utf8.charpattern)
do
i=(i + 0x1)
assert((c == utf8.char(t[i])))
end
assert((i == # t))
for i = 0x1, l
do
assert((utf8.offset(s,i) == utf8.offset(s,((i - l) - 0x1),# (s + 0x1))))
end
end
do
local function check
(s,p)
local a,b = utf8.len(s)
assert(not (a and (b == p)))
end
check("\u{61}\u{62}\u{63}\u{e3}\u{64}\u{65}\u{66}",0x4)
check("\u{f4}\u{9f}\u{bf}",0x1)
check("\u{f4}\u{9f}\u{bf}\u{bf}",0x1)
check("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}\u{80}",# (("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}") + 0x1))
check("\u{80}\u{68}\u{65}\u{6c}\u{6c}\u{6f}",0x1)
check("\u{68}\u{65}\u{6c}\u{80}\u{6c}\u{6f}",0x4)
check("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}\u{bf}",# (("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}") + 0x1))
check("\u{bf}\u{68}\u{65}\u{6c}\u{6c}\u{6f}",0x1)
check("\u{68}\u{65}\u{6c}\u{bf}\u{6c}\u{6f}",0x4)
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
assert((f("",0x2) == nil))
assert((f("",- 0x1) == nil))
assert((f("",math.mininteger) == nil))
end
checkerror("\u{70}\u{6f}\u{73}\u{69}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.offset,"\u{61}\u{62}\u{63}",0x1,0x5)
checkerror("\u{70}\u{6f}\u{73}\u{69}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.offset,"\u{61}\u{62}\u{63}",0x1,- 0x4)
checkerror("\u{70}\u{6f}\u{73}\u{69}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.offset,"",0x1,0x2)
checkerror("\u{70}\u{6f}\u{73}\u{69}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.offset,"",0x1,- 0x1)
checkerror("\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{62}\u{79}\u{74}\u{65}",utf8.offset,"\u{f0}\u{a6}\u{a7}\u{ba}",0x1,0x2)
checkerror("\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{62}\u{79}\u{74}\u{65}",utf8.offset,"\u{f0}\u{a6}\u{a7}\u{ba}",0x1,0x2)
checkerror("\u{63}\u{6f}\u{6e}\u{74}\u{69}\u{6e}\u{75}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{62}\u{79}\u{74}\u{65}",utf8.offset,"\u{80}",0x1)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.len,"\u{61}\u{62}\u{63}",0x0,0x2)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.len,"\u{61}\u{62}\u{63}",0x1,0x4)
local s = "\u{68}\u{65}\u{6c}\u{6c}\u{6f}\u{20}\u{57}\u{6f}\u{72}\u{6c}\u{64}"
local t = {string.byte(s,0x1,- 0x1)}
for i = 0x1, utf8.len(s)
do
assert((t[i] == string.byte(s,i)))
end
check(s,t)
check("\u{e6}\u{b1}\u{89}\u{e5}\u{ad}\u{97}\u{2f}\u{e6}\u{bc}\u{a2}\u{e5}\u{ad}\u{97}",{0x6c49,0x5b57,0x2f,0x6f22,0x5b57})
do
local s = "\u{c3}\u{a1}\u{c3}\u{a9}\u{c3}\u{ad}\u{80}"
local t = {utf8.codepoint(s,0x1,# (s - 0x1))}
assert(# ((((t == 0x3) and (t[0x1] == 0xe1)) and (t[0x2] == 0xe9)) and (t[0x3] == 0xed)))
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{55}\u{54}\u{46}\u{25}\u{2d}\u{38}\u{20}\u{63}\u{6f}\u{64}\u{65}",utf8.codepoint,s,0x1,# s)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.codepoint,s,# (s + 0x1))
t={utf8.codepoint(s,0x4,0x3)}
assert(# (t == 0x0))
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.codepoint,s,- (# (s + 0x1)),0x1)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{62}\u{6f}\u{75}\u{6e}\u{64}\u{73}",utf8.codepoint,s,0x1,# (s + 0x1))
assert((utf8.codepoint("\u{d7ff}") == (0xd800 - 0x1)))
assert((utf8.codepoint("\u{e000}") == (0xdfff + 0x1)))
assert((utf8.codepoint("\u{d800}",0x1,0x1,true) == 0xd800))
assert((utf8.codepoint("\u{dfff}",0x1,0x1,true) == 0xdfff))
assert((utf8.codepoint("\u{7fffffff}",0x1,0x1,true) == 0x7fffffff))
end
assert((utf8.char() == ""))
assert((utf8.char(0x0,0x61,0x62,0x63,0x1) == "\u{0}\u{61}\u{62}\u{63}\u{1}"))
assert((utf8.codepoint(utf8.char(0x10ffff)) == 0x10ffff))
assert((utf8.codepoint(utf8.char(0x7fffffff),0x1,0x1,true) == (((0x1 << 0x1f)) - 0x1)))
checkerror("\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}",utf8.char,(0x7fffffff + 0x1))
checkerror("\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}",utf8.char,- 0x1)
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
check(s,{0x0,0x7f,0x80,0x7ff,0x800,0xffff,0x10000,0x10ffff})
do
local s = "\u{4000000}\u{7fffffff}"
assert(# (s == 0xc))
check(s,{0x4000000,0x7fffffff},true)
s="\u{200000}\u{3ffffff}"
assert(# (s == 0xa))
check(s,{0x200000,0x3ffffff},true)
s="\u{10000}\u{1fffff}"
assert(# (s == 0x8))
check(s,{0x10000,0x1fffff},true)
end
local x = "\u{e6}\u{97}\u{a5}\u{e6}\u{9c}\u{ac}\u{e8}\u{aa}\u{9e}\u{61}\u{2d}\u{34}\u{0}\u{c3}\u{a9}\u{c3}\u{b3}"
check(x,{0x65e5,0x672c,0x8a9e,0x61,0x2d,0x34,0x0,0xe9,0xf3})
check("\u{f0}\u{a3}\u{b2}\u{b7}\u{f0}\u{a0}\u{9c}\u{8e}\u{f0}\u{a0}\u{b1}\u{93}\u{f0}\u{a1}\u{81}\u{bb}\u{f0}\u{a0}\u{b5}\u{bc}\u{61}\u{62}\u{f0}\u{a0}\u{ba}\u{a2}",{0x23cb7,0x2070e,0x20c53,0x2107b,0x20d7c,0x61,0x62,0x20ea2})
check("\u{f0}\u{a8}\u{b3}\u{8a}\u{f0}\u{a9}\u{b6}\u{98}\u{f0}\u{a6}\u{a7}\u{ba}\u{f0}\u{a8}\u{b3}\u{92}\u{f0}\u{a5}\u{84}\u{ab}\u{f0}\u{a4}\u{93}\u{93}\u{f4}\u{8f}\u{bf}\u{bf}",{0x28cca,0x29d98,0x269fa,0x28cd2,0x2512b,0x244d3,0x10ffff})
local i = 0x0
for p,c in string.gmatch(x,("\u{28}\u{29}\u{28}" .. (utf8.charpattern .. "\u{29}")))
do
i=(i + 0x1)
assert((utf8.offset(x,i) == p))
assert((utf8.len(x,p) == ((utf8.len(x) - i) + 0x1)))
assert((utf8.len(c) == 0x1))
for j = 0x1, # (c - 0x1)
do
assert((utf8.offset(x,0x0,((p + j) - 0x1)) == p))
end
end
print("\u{6f}\u{6b}")