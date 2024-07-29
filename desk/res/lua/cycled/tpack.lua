local pack = string.pack
local packsize = string.packsize
local unpack = string.unpack
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{61}\u{63}\u{6b}\u{2f}\u{75}\u{6e}\u{70}\u{61}\u{63}\u{6b}")
local NB = 0x10
local sizeshort = packsize("\u{68}")
local sizeint = packsize("\u{69}")
local sizelong = packsize("\u{6c}")
local sizesize_t = packsize("\u{54}")
local sizeLI = packsize("\u{6a}")
local sizefloat = packsize("\u{66}")
local sizedouble = packsize("\u{64}")
local sizenumber = packsize("\u{6e}")
local little = ((pack("\u{69}\u{32}",0x1) == "\u{1}\u{0}"))
local align = packsize("\u{21}\u{78}\u{58}\u{69}\u{31}\u{36}")
assert(((((0x1 <= sizeshort) and (sizeshort <= sizeint)) and (sizeint <= sizelong)) and (sizefloat <= sizedouble)))
print("\u{70}\u{6c}\u{61}\u{74}\u{66}\u{6f}\u{72}\u{6d}\u{3a}")
print(string.format("\u{9}\u{73}\u{68}\u{6f}\u{72}\u{74}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{69}\u{6e}\u{74}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{6c}\u{6f}\u{6e}\u{67}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{73}\u{69}\u{7a}\u{65}\u{5f}\u{74}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{64}\u{6f}\u{75}\u{62}\u{6c}\u{65}\u{20}\u{25}\u{64}\u{2c}\u{a}\u{9}\u{6c}\u{75}\u{61}\u{20}\u{49}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{4e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{20}\u{25}\u{64}",sizeshort,sizeint,sizelong,sizesize_t,sizefloat,sizedouble,sizeLI,sizenumber))
print(("\u{9}" .. ((((little and "\u{6c}\u{69}\u{74}\u{74}\u{6c}\u{65}") or "\u{62}\u{69}\u{67}")) .. "\u{20}\u{65}\u{6e}\u{64}\u{69}\u{61}\u{6e}")))
print(("\u{9}\u{61}\u{6c}\u{69}\u{67}\u{6e}\u{6d}\u{65}\u{6e}\u{74}\u{3a}\u{20}" .. align))
local function checkerror
(msg,f, ...)
local status,err = pcall(f,...)
assert(not (status and string.find(err,msg)))
end
assert((unpack("\u{42}",pack("\u{42}",0xff)) == 0xff))
assert((unpack("\u{62}",pack("\u{62}",0x7f)) == 0x7f))
assert((unpack("\u{62}",pack("\u{62}",- 0x80)) == - 0x80))
assert((unpack("\u{48}",pack("\u{48}",0xffff)) == 0xffff))
assert((unpack("\u{68}",pack("\u{68}",0x7fff)) == 0x7fff))
assert((unpack("\u{68}",pack("\u{68}",- 0x8000)) == - 0x8000))
assert((unpack("\u{4c}",pack("\u{4c}",0xffffffff)) == 0xffffffff))
assert((unpack("\u{6c}",pack("\u{6c}",0x7fffffff)) == 0x7fffffff))
assert((unpack("\u{6c}",pack("\u{6c}",- 0x80000000)) == - 0x80000000))
for i = 0x1, NB
do
local s = string.rep("\u{ff}",i)
assert((pack(("\u{69}" .. i),- 0x1) == s))
assert((packsize(("\u{69}" .. i)) == # s))
assert((unpack(("\u{69}" .. i),s) == - 0x1))
s=("\u{aa}" .. string.rep("\u{0}",(i - 0x1)))
assert((pack(("\u{3c}\u{49}" .. i),0xaa) == s))
assert((unpack(("\u{3c}\u{49}" .. i),s) == 0xaa))
assert((pack(("\u{3e}\u{49}" .. i),0xaa) == s:reverse()))
assert((unpack(("\u{3e}\u{49}" .. i),s:reverse()) == 0xaa))
end
do
local lnum = 0x807060504030201
local s = pack("\u{3c}\u{6a}",lnum)
assert((unpack("\u{3c}\u{6a}",s) == lnum))
assert((unpack(("\u{3c}\u{69}" .. (sizeLI + 0x1)),(s .. "\u{0}")) == lnum))
assert((unpack(("\u{3c}\u{69}" .. (sizeLI + 0x1)),(s .. "\u{0}")) == lnum))
for i = (sizeLI + 0x1), NB
do
local s = pack("\u{3c}\u{6a}",- lnum)
assert((unpack("\u{3c}\u{6a}",s) == - lnum))
assert((unpack(("\u{3c}\u{69}" .. i),(s .. ("\u{ff}"):rep((i - sizeLI)))) == - lnum))
assert((unpack(("\u{3e}\u{69}" .. i),(("\u{ff}"):rep((i - sizeLI)) .. s:reverse())) == - lnum))
assert((unpack(("\u{3c}\u{49}" .. i),(s .. ("\u{0}"):rep((i - sizeLI)))) == - lnum))
checkerror("\u{64}\u{6f}\u{65}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{66}\u{69}\u{74}",unpack,("\u{3c}\u{49}" .. i),(("\u{0}"):rep((i - 0x1)) .. "\u{1}"))
checkerror("\u{64}\u{6f}\u{65}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{66}\u{69}\u{74}",unpack,("\u{3e}\u{69}" .. i),("\u{1}" .. ("\u{0}"):rep((i - 0x1))))
end
end
for i = 0x1, sizeLI
do
local lstr = "\u{1}\u{2}\u{3}\u{4}\u{5}\u{6}\u{7}\u{8}\u{9}\u{a}\u{b}\u{c}\u{d}"
local lnum = 0x807060504030201
local n = (lnum & (~ (- (0x1 << ((i * 0x8))))))
local s = string.sub(lstr,0x1,i)
assert((pack(("\u{3c}\u{69}" .. i),n) == s))
assert((pack(("\u{3e}\u{69}" .. i),n) == s:reverse()))
assert((unpack(("\u{3e}\u{69}" .. i),s:reverse()) == n))
end
do
local u = 0xf0
for i = 0x1, (sizeLI - 0x1)
do
assert((unpack(("\u{3c}\u{69}" .. i),("\u{f0}" .. ("\u{ff}"):rep((i - 0x1)))) == - 0x10))
assert((unpack(("\u{3e}\u{49}" .. i),("\u{f0}" .. ("\u{ff}"):rep((i - 0x1)))) == u))
u=((u * 0x100) + 0xff)
end
end
do
assert((pack("\u{3e}\u{69}\u{32}\u{20}\u{3c}\u{69}\u{32}",0xa,0x14) == "\u{0}\u{a}\u{14}\u{0}"))
local a,b = unpack("\u{3c}\u{69}\u{32}\u{20}\u{3e}\u{69}\u{32}","\u{a}\u{0}\u{0}\u{14}")
assert(((a == 0xa) and (b == 0x14)))
assert((pack("\u{3d}\u{69}\u{34}",0x7d1) == pack("\u{69}\u{34}",0x7d1)))
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}\u{73}")
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}",pack,"\u{69}\u{30}",0x0)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}",pack,("\u{69}" .. (NB + 0x1)),0x0)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}",pack,("\u{21}" .. (NB + 0x1)),0x0)
checkerror("\u{25}\u{28}\u{31}\u{37}\u{25}\u{29}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}\u{20}\u{25}\u{5b}\u{31}\u{2c}\u{31}\u{36}\u{25}\u{5d}",pack,("\u{58}\u{69}" .. (NB + 0x1)))
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{27}\u{72}\u{27}",pack,"\u{69}\u{33}\u{72}",0x0)
checkerror("\u{31}\u{36}\u{25}\u{2d}\u{62}\u{79}\u{74}\u{65}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}",unpack,"\u{69}\u{31}\u{36}",string.rep("\u{3}",0x10))
checkerror("\u{6e}\u{6f}\u{74}\u{20}\u{70}\u{6f}\u{77}\u{65}\u{72}\u{20}\u{6f}\u{66}\u{20}\u{32}",pack,"\u{21}\u{34}\u{69}\u{33}",0x0)
;
checkerror("\u{6d}\u{69}\u{73}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{69}\u{7a}\u{65}",pack,"\u{63}","")
checkerror("\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{25}\u{2d}\u{6c}\u{65}\u{6e}\u{67}\u{74}\u{68}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}",packsize,"\u{73}")
checkerror("\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{25}\u{2d}\u{6c}\u{65}\u{6e}\u{67}\u{74}\u{68}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}",packsize,"\u{7a}")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}",packsize,("\u{63}\u{31}" .. string.rep("\u{30}",0x28)))
if (packsize("\u{69}") == 0x4) then
local s = string.rep("\u{63}\u{32}\u{36}\u{38}\u{34}\u{33}\u{35}\u{34}\u{35}\u{36}",(0x2 ^ 0x3))
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{61}\u{72}\u{67}\u{65}",packsize,s)
s=(string.rep("\u{63}\u{32}\u{36}\u{38}\u{34}\u{33}\u{35}\u{34}\u{35}\u{36}",((0x2 ^ 0x3) - 0x1)) .. "\u{63}\u{32}\u{36}\u{38}\u{34}\u{33}\u{35}\u{34}\u{35}\u{35}")
assert((packsize(s) == 0x7fffffff))
end
for i = 0x1, (sizeLI - 0x1)
do
local umax = (((0x1 << ((i * 0x8)))) - 0x1)
local max = (umax >> 0x1)
local min = ~ max
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,("\u{3c}\u{49}" .. i),- 0x1)
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,("\u{3c}\u{49}" .. i),min)
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,("\u{3e}\u{49}" .. i),(umax + 0x1))
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,("\u{3e}\u{69}" .. i),umax)
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,("\u{3e}\u{69}" .. i),(max + 0x1))
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,("\u{3c}\u{69}" .. i),(min - 0x1))
assert((unpack(("\u{3e}\u{69}" .. i),pack(("\u{3e}\u{69}" .. i),max)) == max))
assert((unpack(("\u{3c}\u{69}" .. i),pack(("\u{3c}\u{69}" .. i),min)) == min))
assert((unpack(("\u{3e}\u{49}" .. i),pack(("\u{3e}\u{49}" .. i),umax)) == umax))
end
assert((unpack("\u{3e}\u{6a}",pack("\u{3e}\u{6a}",math.maxinteger)) == math.maxinteger))
assert((unpack("\u{3c}\u{6a}",pack("\u{3c}\u{6a}",math.mininteger)) == math.mininteger))
assert((unpack("\u{3c}\u{4a}",pack("\u{3c}\u{6a}",- 0x1)) == - 0x1))
if little then
assert((pack("\u{66}",0x18) == pack("\u{3c}\u{66}",0x18)))
else
assert((pack("\u{66}",0x18) == pack("\u{3e}\u{66}",0x18)))
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{61}\u{63}\u{6b}\u{2f}\u{75}\u{6e}\u{70}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{66}\u{20}\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{2d}\u{70}\u{6f}\u{69}\u{6e}\u{74}\u{20}\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{73}")
for _,n in ipairs({0x0,- 1.1,1.9,(0x1 / 0x0),- (0x1 / 0x0),1e20,- 1e20,0.1,2000.7})
do
assert((unpack("\u{6e}",pack("\u{6e}",n)) == n))
assert((unpack("\u{3c}\u{6e}",pack("\u{3c}\u{6e}",n)) == n))
assert((unpack("\u{3e}\u{6e}",pack("\u{3e}\u{6e}",n)) == n))
assert((pack("\u{3c}\u{66}",n) == pack("\u{3e}\u{66}",n):reverse()))
assert((pack("\u{3e}\u{64}",n) == pack("\u{3c}\u{64}",n):reverse()))
end
for _,n in ipairs({0x0,- 1.5,(0x1 / 0x0),- (0x1 / 0x0),1e10,- 1e9,0.5,2000.25})
do
assert((unpack("\u{3c}\u{66}",pack("\u{3c}\u{66}",n)) == n))
assert((unpack("\u{3e}\u{66}",pack("\u{3e}\u{66}",n)) == n))
assert((unpack("\u{3c}\u{64}",pack("\u{3c}\u{64}",n)) == n))
assert((unpack("\u{3e}\u{64}",pack("\u{3e}\u{64}",n)) == n))
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{61}\u{63}\u{6b}\u{2f}\u{75}\u{6e}\u{70}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{66}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{73}")
do
local s = string.rep("\u{61}\u{62}\u{63}",0x3e8)
assert((pack("\u{7a}\u{42}",s,0xf7) == (s .. "\u{0}\u{f7}")))
local s1,b = unpack("\u{7a}\u{42}",(s .. "\u{0}\u{f9}"))
assert(((b == 0xf9) and (s1 == s)))
s1=pack("\u{73}",s)
assert((unpack("\u{73}",s1) == s))
checkerror("\u{64}\u{6f}\u{65}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{66}\u{69}\u{74}",pack,"\u{73}\u{31}",s)
checkerror("\u{63}\u{6f}\u{6e}\u{74}\u{61}\u{69}\u{6e}\u{73}\u{20}\u{7a}\u{65}\u{72}\u{6f}\u{73}",pack,"\u{7a}","\u{61}\u{6c}\u{6f}\u{0}")
;
checkerror("\u{75}\u{6e}\u{66}\u{69}\u{6e}\u{69}\u{73}\u{68}\u{65}\u{64}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}",unpack,"\u{7a}\u{63}\u{31}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}","\u{61}\u{6c}\u{6f}")
for i = 0x2, NB
do
local s1 = pack(("\u{73}" .. i),s)
assert(((unpack(("\u{73}" .. i),s1) == s) and # (s1 == # (s + i))))
end
end
do
local x = pack("\u{73}","\u{61}\u{6c}\u{6f}")
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{73}\u{68}\u{6f}\u{72}\u{74}",unpack,"\u{73}",x:sub(0x1,- 0x2))
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{73}\u{68}\u{6f}\u{72}\u{74}",unpack,"\u{63}\u{35}","\u{61}\u{62}\u{63}\u{64}")
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}",pack,"\u{73}\u{31}\u{30}\u{30}","\u{61}\u{6c}\u{6f}")
end
do
assert((pack("\u{63}\u{30}","") == ""))
assert((packsize("\u{63}\u{30}") == 0x0))
assert((unpack("\u{63}\u{30}","") == ""))
assert((pack("\u{3c}\u{21}\u{20}\u{63}\u{33}","\u{61}\u{62}\u{63}") == "\u{61}\u{62}\u{63}"))
assert((packsize("\u{3c}\u{21}\u{20}\u{63}\u{33}") == 0x3))
assert((pack("\u{3e}\u{21}\u{34}\u{20}\u{63}\u{36}","\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}") == "\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}"))
assert((pack("\u{63}\u{33}","\u{31}\u{32}\u{33}") == "\u{31}\u{32}\u{33}"))
assert((pack("\u{63}\u{30}","") == ""))
assert((pack("\u{63}\u{38}","\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}") == "\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{0}\u{0}"))
assert((pack("\u{63}\u{38}\u{38}","") == string.rep("\u{0}",0x58)))
assert((pack("\u{63}\u{31}\u{38}\u{38}","\u{61}\u{62}") == ("\u{61}\u{62}" .. string.rep("\u{0}",(0xbc - 0x2)))))
local a,b,c = unpack("\u{21}\u{34}\u{20}\u{7a}\u{20}\u{63}\u{33}","\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}\u{67}\u{68}\u{69}\u{0}\u{78}\u{79}\u{7a}")
assert((((a == "\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}\u{67}\u{68}\u{69}") and (b == "\u{78}\u{79}\u{7a}")) and (c == 0xe)))
checkerror("\u{6c}\u{6f}\u{6e}\u{67}\u{65}\u{72}\u{20}\u{74}\u{68}\u{61}\u{6e}",pack,"\u{63}\u{33}","\u{31}\u{32}\u{33}\u{34}")
end
do
local x = pack("\u{3c}\u{62}\u{20}\u{68}\u{20}\u{62}\u{20}\u{66}\u{20}\u{64}\u{20}\u{66}\u{20}\u{6e}\u{20}\u{69}",0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8)
assert(# (x == packsize("\u{3c}\u{62}\u{20}\u{68}\u{20}\u{62}\u{20}\u{66}\u{20}\u{64}\u{20}\u{66}\u{20}\u{6e}\u{20}\u{69}")))
local a,b,c,d,e,f,g,h = unpack("\u{3c}\u{62}\u{20}\u{68}\u{20}\u{62}\u{20}\u{66}\u{20}\u{64}\u{20}\u{66}\u{20}\u{6e}\u{20}\u{69}",x)
assert(((((((((a == 0x1) and (b == 0x2)) and (c == 0x3)) and (d == 0x4)) and (e == 0x5)) and (f == 0x6)) and (g == 0x7)) and (h == 0x8)))
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{61}\u{6c}\u{69}\u{67}\u{6e}\u{6d}\u{65}\u{6e}\u{74}")
do
assert((pack("\u{20}\u{3c}\u{20}\u{69}\u{31}\u{20}\u{69}\u{32}\u{20}",0x2,0x3) == "\u{2}\u{3}\u{0}"))
local x = pack("\u{3e}\u{21}\u{38}\u{20}\u{62}\u{20}\u{58}\u{68}\u{20}\u{69}\u{34}\u{20}\u{69}\u{38}\u{20}\u{63}\u{31}\u{20}\u{58}\u{69}\u{38}",- 0xc,0x64,0xc8,"\u{ec}")
assert(# (x == packsize("\u{3e}\u{21}\u{38}\u{20}\u{62}\u{20}\u{58}\u{68}\u{20}\u{69}\u{34}\u{20}\u{69}\u{38}\u{20}\u{63}\u{31}\u{20}\u{58}\u{69}\u{38}")))
assert((x == ("\u{f4}" .. ("\u{0}\u{0}\u{0}" .. ("\u{0}\u{0}\u{0}\u{64}" .. ("\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{c8}" .. ("\u{ec}" .. "\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}")))))))
local a,b,c,d,pos = unpack("\u{3e}\u{21}\u{38}\u{20}\u{63}\u{31}\u{20}\u{58}\u{68}\u{20}\u{69}\u{34}\u{20}\u{69}\u{38}\u{20}\u{62}\u{20}\u{58}\u{69}\u{38}\u{20}\u{58}\u{49}\u{20}\u{58}\u{48}",x)
assert(((((a == "\u{f4}") and (b == 0x64)) and (c == 0xc8)) and (d == - (0x14 and (((pos - 0x1)) == # x)))))
x=pack("\u{3e}\u{21}\u{34}\u{20}\u{63}\u{33}\u{20}\u{63}\u{34}\u{20}\u{63}\u{32}\u{20}\u{7a}\u{20}\u{69}\u{34}\u{20}\u{63}\u{35}\u{20}\u{63}\u{32}\u{20}\u{58}\u{69}\u{34}","\u{61}\u{62}\u{63}","\u{61}\u{62}\u{63}\u{64}","\u{78}\u{7a}","\u{68}\u{65}\u{6c}\u{6c}\u{6f}",0x5,"\u{77}\u{6f}\u{72}\u{6c}\u{64}","\u{78}\u{79}")
assert((x == "\u{61}\u{62}\u{63}\u{61}\u{62}\u{63}\u{64}\u{78}\u{7a}\u{68}\u{65}\u{6c}\u{6c}\u{6f}\u{0}\u{0}\u{0}\u{0}\u{0}\u{5}\u{77}\u{6f}\u{72}\u{6c}\u{64}\u{78}\u{79}\u{0}"))
local a,b,c,d,e,f,g,pos = unpack("\u{3e}\u{21}\u{34}\u{20}\u{63}\u{33}\u{20}\u{63}\u{34}\u{20}\u{63}\u{32}\u{20}\u{7a}\u{20}\u{69}\u{34}\u{20}\u{63}\u{35}\u{20}\u{63}\u{32}\u{20}\u{58}\u{68}\u{20}\u{58}\u{69}\u{34}",x)
assert(((((((((a == "\u{61}\u{62}\u{63}") and (b == "\u{61}\u{62}\u{63}\u{64}")) and (c == "\u{78}\u{7a}")) and (d == "\u{68}\u{65}\u{6c}\u{6c}\u{6f}")) and (e == 0x5)) and (f == "\u{77}\u{6f}\u{72}\u{6c}\u{64}")) and (g == "\u{78}\u{79}")) and ((((pos - 0x1)) % 0x4) == 0x0)))
x=pack("\u{20}\u{62}\u{20}\u{62}\u{20}\u{58}\u{64}\u{20}\u{62}\u{20}\u{58}\u{62}\u{20}\u{78}",0x1,0x2,0x3)
assert((packsize("\u{20}\u{62}\u{20}\u{62}\u{20}\u{58}\u{64}\u{20}\u{62}\u{20}\u{58}\u{62}\u{20}\u{78}") == 0x4))
assert((x == "\u{1}\u{2}\u{3}\u{0}"))
a,b,c,pos=unpack("\u{62}\u{62}\u{58}\u{64}\u{62}",x)
assert(((((a == 0x1) and (b == 0x2)) and (c == 0x3)) and (pos == # x)))
assert((packsize("\u{21}\u{38}\u{20}\u{78}\u{58}\u{69}\u{38}") == 0x8))
local pos = unpack("\u{21}\u{38}\u{20}\u{78}\u{58}\u{69}\u{38}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert((pos == 0x9))
assert((packsize("\u{21}\u{38}\u{20}\u{78}\u{58}\u{69}\u{32}") == 0x2))
local pos = unpack("\u{21}\u{38}\u{20}\u{78}\u{58}\u{69}\u{32}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert((pos == 0x3))
assert((packsize("\u{21}\u{32}\u{20}\u{78}\u{58}\u{69}\u{32}") == 0x2))
local pos = unpack("\u{21}\u{32}\u{20}\u{78}\u{58}\u{69}\u{32}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert((pos == 0x3))
assert((packsize("\u{21}\u{32}\u{20}\u{78}\u{58}\u{69}\u{38}") == 0x2))
local pos = unpack("\u{21}\u{32}\u{20}\u{78}\u{58}\u{69}\u{38}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert((pos == 0x3))
assert((packsize("\u{21}\u{31}\u{36}\u{20}\u{78}\u{58}\u{69}\u{31}\u{36}") == 0x10))
local pos = unpack("\u{21}\u{31}\u{36}\u{20}\u{78}\u{58}\u{69}\u{31}\u{36}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert((pos == 0x11))
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}",pack,"\u{58}")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}",unpack,"\u{58}\u{58}\u{69}","")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}",unpack,"\u{58}\u{20}\u{69}","")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}",pack,"\u{58}\u{63}\u{31}")
end
do
local x = pack("\u{69}\u{34}\u{69}\u{34}\u{69}\u{34}\u{69}\u{34}",0x1,0x2,0x3,0x4)
for pos = 0x1, 0x10, 0x4
do
local i,p = unpack("\u{69}\u{34}",x,pos)
assert(((i == ((pos // 0x4) + 0x1)) and (p == (pos + 0x4))))
end
for pos = 0x0, 0xc
do
local i,p = unpack("\u{21}\u{34}\u{20}\u{69}\u{34}",x,(pos + 0x1))
assert(((i == ((((pos + 0x3)) // 0x4) + 0x1)) and (p == ((i * 0x4) + 0x1))))
end
local i,p = unpack("\u{21}\u{34}\u{20}\u{69}\u{34}",x,- 0x4)
assert(((i == 0x4) and (p == 0x11)))
local i,p = unpack("\u{21}\u{34}\u{20}\u{69}\u{34}",x,- 0x7)
assert(((i == 0x4) and (p == 0x11)))
local i,p = unpack("\u{21}\u{34}\u{20}\u{69}\u{34}",x,- # x)
assert(((i == 0x1) and (p == 0x5)))
for i = 0x1, # (x + 0x1)
do
assert((unpack("\u{63}\u{30}",x,i) == ""))
end
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}",unpack,"\u{63}\u{30}",x,# (x + 0x2))
end
print("\u{4f}\u{4b}")