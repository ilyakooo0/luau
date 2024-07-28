local pack = string.pack
local packsize = string.packsize
local unpack = string.unpack
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{61}\u{63}\u{6b}\u{2f}\u{75}\u{6e}\u{70}\u{61}\u{63}\u{6b}")
local NB = 16
local sizeshort = packsize("\u{68}")
local sizeint = packsize("\u{69}")
local sizelong = packsize("\u{6c}")
local sizesize_t = packsize("\u{54}")
local sizeLI = packsize("\u{6a}")
local sizefloat = packsize("\u{66}")
local sizedouble = packsize("\u{64}")
local sizenumber = packsize("\u{6e}")
local little = (pack("\u{69}\u{32}",1) == "\u{1}\u{0}")
local align = packsize("\u{21}\u{78}\u{58}\u{69}\u{31}\u{36}")
assert(1 <= sizeshort and sizeshort <= sizeint and sizeint <= sizelong and sizefloat <= sizedouble)
print("\u{70}\u{6c}\u{61}\u{74}\u{66}\u{6f}\u{72}\u{6d}\u{3a}")
print(string.format("\u{9}\u{73}\u{68}\u{6f}\u{72}\u{74}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{69}\u{6e}\u{74}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{6c}\u{6f}\u{6e}\u{67}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{73}\u{69}\u{7a}\u{65}\u{5f}\u{74}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{64}\u{6f}\u{75}\u{62}\u{6c}\u{65}\u{20}\u{25}\u{64}\u{2c}\u{a}\u{9}\u{6c}\u{75}\u{61}\u{20}\u{49}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}\u{20}\u{25}\u{64}\u{2c}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{4e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{20}\u{25}\u{64}",sizeshort,sizeint,sizelong,sizesize_t,sizefloat,sizedouble,sizeLI,sizenumber))
print("\u{9}" .. (little and "\u{6c}\u{69}\u{74}\u{74}\u{6c}\u{65}" or "\u{62}\u{69}\u{67}") .. "\u{20}\u{65}\u{6e}\u{64}\u{69}\u{61}\u{6e}")
print("\u{9}\u{61}\u{6c}\u{69}\u{67}\u{6e}\u{6d}\u{65}\u{6e}\u{74}\u{3a}\u{20}" .. align)
local function checkerror
(msg,f, ...)
local status,err = pcall(f,...)
assert(not status and string.find(err,msg))
end
assert(unpack("\u{42}",pack("\u{42}",255)) == 255)
assert(unpack("\u{62}",pack("\u{62}",127)) == 127)
assert(unpack("\u{62}",pack("\u{62}",- 128)) == - 128)
assert(unpack("\u{48}",pack("\u{48}",65535)) == 65535)
assert(unpack("\u{68}",pack("\u{68}",32767)) == 32767)
assert(unpack("\u{68}",pack("\u{68}",- 32768)) == - 32768)
assert(unpack("\u{4c}",pack("\u{4c}",4294967295)) == 4294967295)
assert(unpack("\u{6c}",pack("\u{6c}",2147483647)) == 2147483647)
assert(unpack("\u{6c}",pack("\u{6c}",- 2147483648)) == - 2147483648)
for i = 1, NB
do
local s = string.rep("\u{ff}",i)
assert(pack("\u{69}" .. i,- 1) == s)
assert(packsize("\u{69}" .. i) == # s)
assert(unpack("\u{69}" .. i,s) == - 1)
s="\u{aa}" .. string.rep("\u{0}",i - 1)
assert(pack("\u{3c}\u{49}" .. i,170) == s)
assert(unpack("\u{3c}\u{49}" .. i,s) == 170)
assert(pack("\u{3e}\u{49}" .. i,170) == s:reverse())
assert(unpack("\u{3e}\u{49}" .. i,s:reverse()) == 170)
end
do
local lnum = 1510926445411202934483812811265
local s = pack("\u{3c}\u{6a}",lnum)
assert(unpack("\u{3c}\u{6a}",s) == lnum)
assert(unpack("\u{3c}\u{69}" .. sizeLI + 1,s .. "\u{0}") == lnum)
assert(unpack("\u{3c}\u{69}" .. sizeLI + 1,s .. "\u{0}") == lnum)
for i = sizeLI + 1, NB
do
local s = pack("\u{3c}\u{6a}",- lnum)
assert(unpack("\u{3c}\u{6a}",s) == - lnum)
assert(unpack("\u{3c}\u{69}" .. i,s .. ("\u{ff}"):rep(i - sizeLI)) == - lnum)
assert(unpack("\u{3e}\u{69}" .. i,("\u{ff}"):rep(i - sizeLI) .. s:reverse()) == - lnum)
assert(unpack("\u{3c}\u{49}" .. i,s .. ("\u{0}"):rep(i - sizeLI)) == - lnum)
checkerror("\u{64}\u{6f}\u{65}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{66}\u{69}\u{74}",unpack,"\u{3c}\u{49}" .. i,("\u{0}"):rep(i - 1) .. "\u{1}")
checkerror("\u{64}\u{6f}\u{65}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{66}\u{69}\u{74}",unpack,"\u{3e}\u{69}" .. i,"\u{1}" .. ("\u{0}"):rep(i - 1))
end
end
for i = 1, sizeLI
do
local lstr = "\u{1}\u{2}\u{3}\u{4}\u{5}\u{6}\u{7}\u{8}\u{9}\u{a}\u{b}\u{c}\u{d}"
local lnum = 1510926445411202934483812811265
local n = lnum & (~ (- 1 << (i * 8)))
local s = string.sub(lstr,1,i)
assert(pack("\u{3c}\u{69}" .. i,n) == s)
assert(pack("\u{3e}\u{69}" .. i,n) == s:reverse())
assert(unpack("\u{3e}\u{69}" .. i,s:reverse()) == n)
end
do
local u = 240
for i = 1, sizeLI - 1
do
assert(unpack("\u{3c}\u{69}" .. i,"\u{f0}" .. ("\u{ff}"):rep(i - 1)) == - 16)
assert(unpack("\u{3e}\u{49}" .. i,"\u{f0}" .. ("\u{ff}"):rep(i - 1)) == u)
u=u * 256 + 255
end
end
do
assert(pack("\u{3e}\u{69}\u{32}\u{20}\u{3c}\u{69}\u{32}",10,20) == "\u{0}\u{a}\u{14}\u{0}")
local a,b = unpack("\u{3c}\u{69}\u{32}\u{20}\u{3e}\u{69}\u{32}","\u{a}\u{0}\u{0}\u{14}")
assert(a == 10 and b == 20)
assert(pack("\u{3d}\u{69}\u{34}",2001) == pack("\u{69}\u{34}",2001))
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}\u{73}")
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}",pack,"\u{69}\u{30}",0)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}",pack,"\u{69}" .. NB + 1,0)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}",pack,"\u{21}" .. NB + 1,0)
checkerror("\u{25}\u{28}\u{31}\u{37}\u{25}\u{29}\u{20}\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}\u{20}\u{25}\u{5b}\u{31}\u{2c}\u{31}\u{36}\u{25}\u{5d}",pack,"\u{58}\u{69}" .. NB + 1)
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{27}\u{72}\u{27}",pack,"\u{69}\u{33}\u{72}",0)
checkerror("\u{31}\u{36}\u{25}\u{2d}\u{62}\u{79}\u{74}\u{65}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}",unpack,"\u{69}\u{31}\u{36}",string.rep("\u{3}",16))
checkerror("\u{6e}\u{6f}\u{74}\u{20}\u{70}\u{6f}\u{77}\u{65}\u{72}\u{20}\u{6f}\u{66}\u{20}\u{32}",pack,"\u{21}\u{34}\u{69}\u{33}",0)
;
checkerror("\u{6d}\u{69}\u{73}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{69}\u{7a}\u{65}",pack,"\u{63}","")
checkerror("\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{25}\u{2d}\u{6c}\u{65}\u{6e}\u{67}\u{74}\u{68}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}",packsize,"\u{73}")
checkerror("\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{25}\u{2d}\u{6c}\u{65}\u{6e}\u{67}\u{74}\u{68}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}",packsize,"\u{7a}")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}",packsize,"\u{63}\u{31}" .. string.rep("\u{30}",40))
if packsize("\u{69}") == 4 then
local s = string.rep("\u{63}\u{32}\u{36}\u{38}\u{34}\u{33}\u{35}\u{34}\u{35}\u{36}",2 ^ 3)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{61}\u{72}\u{67}\u{65}",packsize,s)
s=string.rep("\u{63}\u{32}\u{36}\u{38}\u{34}\u{33}\u{35}\u{34}\u{35}\u{36}",2 ^ 3 - 1) .. "\u{63}\u{32}\u{36}\u{38}\u{34}\u{33}\u{35}\u{34}\u{35}\u{35}"
assert(packsize(s) == 2147483647)
end
for i = 1, sizeLI - 1
do
local umax = (1 << (i * 8)) - 1
local max = umax >> 1
local min = ~ max
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,"\u{3c}\u{49}" .. i,- 1)
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,"\u{3c}\u{49}" .. i,min)
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,"\u{3e}\u{49}" .. i,umax + 1)
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,"\u{3e}\u{69}" .. i,umax)
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,"\u{3e}\u{69}" .. i,max + 1)
checkerror("\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}",pack,"\u{3c}\u{69}" .. i,min - 1)
assert(unpack("\u{3e}\u{69}" .. i,pack("\u{3e}\u{69}" .. i,max)) == max)
assert(unpack("\u{3c}\u{69}" .. i,pack("\u{3c}\u{69}" .. i,min)) == min)
assert(unpack("\u{3e}\u{49}" .. i,pack("\u{3e}\u{49}" .. i,umax)) == umax)
end
assert(unpack("\u{3e}\u{6a}",pack("\u{3e}\u{6a}",math.maxinteger)) == math.maxinteger)
assert(unpack("\u{3c}\u{6a}",pack("\u{3c}\u{6a}",math.mininteger)) == math.mininteger)
assert(unpack("\u{3c}\u{4a}",pack("\u{3c}\u{6a}",- 1)) == - 1)
if little then
assert(pack("\u{66}",24) == pack("\u{3c}\u{66}",24))
else
assert(pack("\u{66}",24) == pack("\u{3e}\u{66}",24))
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{61}\u{63}\u{6b}\u{2f}\u{75}\u{6e}\u{70}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{66}\u{20}\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{2d}\u{70}\u{6f}\u{69}\u{6e}\u{74}\u{20}\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{73}")
for _,n in ipairs({0,- 1.1,1.9,1 / 0,- 1 / 0,1e20,- 1e20,0.1,2000.7})
do
assert(unpack("\u{6e}",pack("\u{6e}",n)) == n)
assert(unpack("\u{3c}\u{6e}",pack("\u{3c}\u{6e}",n)) == n)
assert(unpack("\u{3e}\u{6e}",pack("\u{3e}\u{6e}",n)) == n)
assert(pack("\u{3c}\u{66}",n) == pack("\u{3e}\u{66}",n):reverse())
assert(pack("\u{3e}\u{64}",n) == pack("\u{3c}\u{64}",n):reverse())
end
for _,n in ipairs({0,- 1.5,1 / 0,- 1 / 0,1e10,- 1e9,0.5,2000.25})
do
assert(unpack("\u{3c}\u{66}",pack("\u{3c}\u{66}",n)) == n)
assert(unpack("\u{3e}\u{66}",pack("\u{3e}\u{66}",n)) == n)
assert(unpack("\u{3c}\u{64}",pack("\u{3c}\u{64}",n)) == n)
assert(unpack("\u{3e}\u{64}",pack("\u{3e}\u{64}",n)) == n)
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{61}\u{63}\u{6b}\u{2f}\u{75}\u{6e}\u{70}\u{61}\u{63}\u{6b}\u{20}\u{6f}\u{66}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{73}")
do
local s = string.rep("\u{61}\u{62}\u{63}",1000)
assert(pack("\u{7a}\u{42}",s,247) == s .. "\u{0}\u{f7}")
local s1,b = unpack("\u{7a}\u{42}",s .. "\u{0}\u{f9}")
assert(b == 249 and s1 == s)
s1=pack("\u{73}",s)
assert(unpack("\u{73}",s1) == s)
checkerror("\u{64}\u{6f}\u{65}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{66}\u{69}\u{74}",pack,"\u{73}\u{31}",s)
checkerror("\u{63}\u{6f}\u{6e}\u{74}\u{61}\u{69}\u{6e}\u{73}\u{20}\u{7a}\u{65}\u{72}\u{6f}\u{73}",pack,"\u{7a}","\u{61}\u{6c}\u{6f}\u{0}")
;
checkerror("\u{75}\u{6e}\u{66}\u{69}\u{6e}\u{69}\u{73}\u{68}\u{65}\u{64}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}",unpack,"\u{7a}\u{63}\u{31}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}","\u{61}\u{6c}\u{6f}")
for i = 2, NB
do
local s1 = pack("\u{73}" .. i,s)
assert(unpack("\u{73}" .. i,s1) == s and # s1 == # s + i)
end
end
do
local x = pack("\u{73}","\u{61}\u{6c}\u{6f}")
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{73}\u{68}\u{6f}\u{72}\u{74}",unpack,"\u{73}",x:sub(1,- 2))
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{73}\u{68}\u{6f}\u{72}\u{74}",unpack,"\u{63}\u{35}","\u{61}\u{62}\u{63}\u{64}")
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{6c}\u{69}\u{6d}\u{69}\u{74}\u{73}",pack,"\u{73}\u{31}\u{30}\u{30}","\u{61}\u{6c}\u{6f}")
end
do
assert(pack("\u{63}\u{30}","") == "")
assert(packsize("\u{63}\u{30}") == 0)
assert(unpack("\u{63}\u{30}","") == "")
assert(pack("\u{3c}\u{21}\u{20}\u{63}\u{33}","\u{61}\u{62}\u{63}") == "\u{61}\u{62}\u{63}")
assert(packsize("\u{3c}\u{21}\u{20}\u{63}\u{33}") == 3)
assert(pack("\u{3e}\u{21}\u{34}\u{20}\u{63}\u{36}","\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}") == "\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}")
assert(pack("\u{63}\u{33}","\u{31}\u{32}\u{33}") == "\u{31}\u{32}\u{33}")
assert(pack("\u{63}\u{30}","") == "")
assert(pack("\u{63}\u{38}","\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}") == "\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{0}\u{0}")
assert(pack("\u{63}\u{38}\u{38}","") == string.rep("\u{0}",88))
assert(pack("\u{63}\u{31}\u{38}\u{38}","\u{61}\u{62}") == "\u{61}\u{62}" .. string.rep("\u{0}",188 - 2))
local a,b,c = unpack("\u{21}\u{34}\u{20}\u{7a}\u{20}\u{63}\u{33}","\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}\u{67}\u{68}\u{69}\u{0}\u{78}\u{79}\u{7a}")
assert(a == "\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}\u{67}\u{68}\u{69}" and b == "\u{78}\u{79}\u{7a}" and c == 14)
checkerror("\u{6c}\u{6f}\u{6e}\u{67}\u{65}\u{72}\u{20}\u{74}\u{68}\u{61}\u{6e}",pack,"\u{63}\u{33}","\u{31}\u{32}\u{33}\u{34}")
end
do
local x = pack("\u{3c}\u{62}\u{20}\u{68}\u{20}\u{62}\u{20}\u{66}\u{20}\u{64}\u{20}\u{66}\u{20}\u{6e}\u{20}\u{69}",1,2,3,4,5,6,7,8)
assert(# x == packsize("\u{3c}\u{62}\u{20}\u{68}\u{20}\u{62}\u{20}\u{66}\u{20}\u{64}\u{20}\u{66}\u{20}\u{6e}\u{20}\u{69}"))
local a,b,c,d,e,f,g,h = unpack("\u{3c}\u{62}\u{20}\u{68}\u{20}\u{62}\u{20}\u{66}\u{20}\u{64}\u{20}\u{66}\u{20}\u{6e}\u{20}\u{69}",x)
assert(a == 1 and b == 2 and c == 3 and d == 4 and e == 5 and f == 6 and g == 7 and h == 8)
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{61}\u{6c}\u{69}\u{67}\u{6e}\u{6d}\u{65}\u{6e}\u{74}")
do
assert(pack("\u{20}\u{3c}\u{20}\u{69}\u{31}\u{20}\u{69}\u{32}\u{20}",2,3) == "\u{2}\u{3}\u{0}")
local x = pack("\u{3e}\u{21}\u{38}\u{20}\u{62}\u{20}\u{58}\u{68}\u{20}\u{69}\u{34}\u{20}\u{69}\u{38}\u{20}\u{63}\u{31}\u{20}\u{58}\u{69}\u{38}",- 12,100,200,"\u{ec}")
assert(# x == packsize("\u{3e}\u{21}\u{38}\u{20}\u{62}\u{20}\u{58}\u{68}\u{20}\u{69}\u{34}\u{20}\u{69}\u{38}\u{20}\u{63}\u{31}\u{20}\u{58}\u{69}\u{38}"))
assert(x == "\u{f4}" .. "\u{0}\u{0}\u{0}" .. "\u{0}\u{0}\u{0}\u{64}" .. "\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{c8}" .. "\u{ec}" .. "\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}")
local a,b,c,d,pos = unpack("\u{3e}\u{21}\u{38}\u{20}\u{63}\u{31}\u{20}\u{58}\u{68}\u{20}\u{69}\u{34}\u{20}\u{69}\u{38}\u{20}\u{62}\u{20}\u{58}\u{69}\u{38}\u{20}\u{58}\u{49}\u{20}\u{58}\u{48}",x)
assert(a == "\u{f4}" and b == 100 and c == 200 and d == - 20 and (pos - 1) == # x)
x=pack("\u{3e}\u{21}\u{34}\u{20}\u{63}\u{33}\u{20}\u{63}\u{34}\u{20}\u{63}\u{32}\u{20}\u{7a}\u{20}\u{69}\u{34}\u{20}\u{63}\u{35}\u{20}\u{63}\u{32}\u{20}\u{58}\u{69}\u{34}","\u{61}\u{62}\u{63}","\u{61}\u{62}\u{63}\u{64}","\u{78}\u{7a}","\u{68}\u{65}\u{6c}\u{6c}\u{6f}",5,"\u{77}\u{6f}\u{72}\u{6c}\u{64}","\u{78}\u{79}")
assert(x == "\u{61}\u{62}\u{63}\u{61}\u{62}\u{63}\u{64}\u{78}\u{7a}\u{68}\u{65}\u{6c}\u{6c}\u{6f}\u{0}\u{0}\u{0}\u{0}\u{0}\u{5}\u{77}\u{6f}\u{72}\u{6c}\u{64}\u{78}\u{79}\u{0}")
local a,b,c,d,e,f,g,pos = unpack("\u{3e}\u{21}\u{34}\u{20}\u{63}\u{33}\u{20}\u{63}\u{34}\u{20}\u{63}\u{32}\u{20}\u{7a}\u{20}\u{69}\u{34}\u{20}\u{63}\u{35}\u{20}\u{63}\u{32}\u{20}\u{58}\u{68}\u{20}\u{58}\u{69}\u{34}",x)
assert(a == "\u{61}\u{62}\u{63}" and b == "\u{61}\u{62}\u{63}\u{64}" and c == "\u{78}\u{7a}" and d == "\u{68}\u{65}\u{6c}\u{6c}\u{6f}" and e == 5 and f == "\u{77}\u{6f}\u{72}\u{6c}\u{64}" and g == "\u{78}\u{79}" and (pos - 1) % 4 == 0)
x=pack("\u{20}\u{62}\u{20}\u{62}\u{20}\u{58}\u{64}\u{20}\u{62}\u{20}\u{58}\u{62}\u{20}\u{78}",1,2,3)
assert(packsize("\u{20}\u{62}\u{20}\u{62}\u{20}\u{58}\u{64}\u{20}\u{62}\u{20}\u{58}\u{62}\u{20}\u{78}") == 4)
assert(x == "\u{1}\u{2}\u{3}\u{0}")
a,b,c,pos=unpack("\u{62}\u{62}\u{58}\u{64}\u{62}",x)
assert(a == 1 and b == 2 and c == 3 and pos == # x)
assert(packsize("\u{21}\u{38}\u{20}\u{78}\u{58}\u{69}\u{38}") == 8)
local pos = unpack("\u{21}\u{38}\u{20}\u{78}\u{58}\u{69}\u{38}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert(pos == 9)
assert(packsize("\u{21}\u{38}\u{20}\u{78}\u{58}\u{69}\u{32}") == 2)
local pos = unpack("\u{21}\u{38}\u{20}\u{78}\u{58}\u{69}\u{32}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert(pos == 3)
assert(packsize("\u{21}\u{32}\u{20}\u{78}\u{58}\u{69}\u{32}") == 2)
local pos = unpack("\u{21}\u{32}\u{20}\u{78}\u{58}\u{69}\u{32}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert(pos == 3)
assert(packsize("\u{21}\u{32}\u{20}\u{78}\u{58}\u{69}\u{38}") == 2)
local pos = unpack("\u{21}\u{32}\u{20}\u{78}\u{58}\u{69}\u{38}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert(pos == 3)
assert(packsize("\u{21}\u{31}\u{36}\u{20}\u{78}\u{58}\u{69}\u{31}\u{36}") == 16)
local pos = unpack("\u{21}\u{31}\u{36}\u{20}\u{78}\u{58}\u{69}\u{31}\u{36}","\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}")
;
assert(pos == 17)
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}",pack,"\u{58}")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}",unpack,"\u{58}\u{58}\u{69}","")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}",unpack,"\u{58}\u{20}\u{69}","")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}",pack,"\u{58}\u{63}\u{31}")
end
do
local x = pack("\u{69}\u{34}\u{69}\u{34}\u{69}\u{34}\u{69}\u{34}",1,2,3,4)
for pos = 1, 16, 4
do
local i,p = unpack("\u{69}\u{34}",x,pos)
assert(i == pos // 4 + 1 and p == pos + 4)
end
for pos = 0, 12
do
local i,p = unpack("\u{21}\u{34}\u{20}\u{69}\u{34}",x,pos + 1)
assert(i == (pos + 3) // 4 + 1 and p == i * 4 + 1)
end
local i,p = unpack("\u{21}\u{34}\u{20}\u{69}\u{34}",x,- 4)
assert(i == 4 and p == 17)
local i,p = unpack("\u{21}\u{34}\u{20}\u{69}\u{34}",x,- 7)
assert(i == 4 and p == 17)
local i,p = unpack("\u{21}\u{34}\u{20}\u{69}\u{34}",x,- # x)
assert(i == 1 and p == 5)
for i = 1, # x + 1
do
assert(unpack("\u{63}\u{30}",x,i) == "")
end
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}",unpack,"\u{63}\u{30}",x,# x + 2)
end
print("\u{4f}\u{4b}")