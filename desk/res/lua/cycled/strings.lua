print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{73}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{69}\u{62}\u{72}\u{61}\u{72}\u{79}")
local maxi <const> = math.maxinteger
local mini <const> = math.mininteger
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert((not (s and string.find(err,msg))))
end
assert(("\u{61}\u{6c}\u{6f}" < "\u{61}\u{6c}\u{6f}\u{31}"))
assert(("" < "\u{61}"))
assert(("\u{61}\u{6c}\u{6f}\u{0}\u{61}\u{6c}\u{6f}" < "\u{61}\u{6c}\u{6f}\u{0}\u{62}"))
assert(("\u{61}\u{6c}\u{6f}\u{0}\u{61}\u{6c}\u{6f}\u{0}\u{0}" > "\u{61}\u{6c}\u{6f}\u{0}\u{61}\u{6c}\u{6f}\u{0}"))
assert(("\u{61}\u{6c}\u{6f}" < "\u{61}\u{6c}\u{6f}\u{0}"))
assert(("\u{61}\u{6c}\u{6f}\u{0}" > "\u{61}\u{6c}\u{6f}"))
assert(("\u{0}" < "\u{1}"))
assert(("\u{0}\u{0}" < "\u{0}\u{1}"))
assert(("\u{1}\u{0}\u{61}\u{0}\u{61}" <= "\u{1}\u{0}\u{61}\u{0}\u{61}"))
assert((not ("\u{1}\u{0}\u{61}\u{0}\u{62}" <= "\u{1}\u{0}\u{61}\u{0}\u{61}")))
assert(("\u{0}\u{0}\u{0}" < "\u{0}\u{0}\u{0}\u{0}"))
assert((not ("\u{0}\u{0}\u{0}\u{0}" < "\u{0}\u{0}\u{0}")))
assert(("\u{0}\u{0}\u{0}" <= "\u{0}\u{0}\u{0}\u{0}"))
assert((not ("\u{0}\u{0}\u{0}\u{0}" <= "\u{0}\u{0}\u{0}")))
assert(("\u{0}\u{0}\u{0}" <= "\u{0}\u{0}\u{0}"))
assert(("\u{0}\u{0}\u{0}" >= "\u{0}\u{0}\u{0}"))
assert((not ("\u{0}\u{0}\u{62}" < "\u{0}\u{0}\u{61}\u{0}")))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",0x2,0x4) == "\u{32}\u{33}\u{34}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",0x7) == "\u{37}\u{38}\u{39}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",0x7,0x6) == ""))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",0x7,0x7) == "\u{37}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",0x0,0x0) == ""))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",(- 0xa),0xa) == "\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",0x1,0x9) == "\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",(- 0xa),(- 0x14)) == ""))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",(- 0x1)) == "\u{39}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",(- 0x4)) == "\u{36}\u{37}\u{38}\u{39}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",(- 0x6),(- 0x4)) == "\u{34}\u{35}\u{36}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",mini,(- 0x4)) == "\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",mini,maxi) == "\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}"))
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",mini,mini) == ""))
assert((string.sub("\u{0}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",0x3,0x5) == "\u{32}\u{33}\u{34}"))
assert((("\u{0}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}"):sub(0x8) == "\u{37}\u{38}\u{39}"))
assert((string.find("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}","\u{33}\u{34}\u{35}") == 0x3))
local a,b = string.find("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}","\u{33}\u{34}\u{35}")
assert((string.sub("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}",a,b) == "\u{33}\u{34}\u{35}"))
assert((string.find("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}","\u{33}\u{34}\u{35}",0x3) == 0x3))
assert((string.find("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}","\u{33}\u{34}\u{35}",0x4) == 0xd))
assert((not string.find("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}","\u{33}\u{34}\u{36}",0x4)))
assert((string.find("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}","\u{2e}\u{34}\u{35}",(- 0x9)) == 0xd))
assert((not string.find("\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}\u{67}","\u{0}",0x5,0x1)))
assert((string.find("","") == 0x1))
assert((string.find("","",0x1) == 0x1))
assert((not string.find("","",0x2)))
assert((not string.find("","\u{61}\u{61}\u{61}",0x1)))
assert((("\u{61}\u{6c}\u{6f}\u{28}\u{2e}\u{29}\u{61}\u{6c}\u{6f}"):find("\u{28}\u{2e}\u{29}",0x1,0x1) == 0x4))
assert((string.len("") == 0x0))
assert((string.len("\u{0}\u{0}\u{0}") == 0x3))
assert((string.len("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}") == 0xa))
assert((# ("" == 0x0)))
assert((# ("\u{0}\u{0}\u{0}" == 0x3)))
assert((# ("\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}" == 0xa)))
assert((string.byte("\u{61}") == 0x61))
assert((string.byte("\u{e4}") > 0x7f))
assert((string.byte(string.char(0xff)) == 0xff))
assert((string.byte(string.char(0x0)) == 0x0))
assert((string.byte("\u{0}") == 0x0))
assert((string.byte("\u{0}\u{0}\u{61}\u{6c}\u{6f}\u{0}\u{78}",(- 0x1)) == string.byte("\u{78}")))
assert((string.byte("\u{62}\u{61}",0x2) == 0x61))
assert((string.byte("\u{a}\u{a}",0x2,(- 0x1)) == 0xa))
assert((string.byte("\u{a}\u{a}",0x2,0x2) == 0xa))
assert((string.byte("") == nil))
assert((string.byte("\u{68}\u{69}",(- 0x3)) == nil))
assert((string.byte("\u{68}\u{69}",0x3) == nil))
assert((string.byte("\u{68}\u{69}",0x9,0xa) == nil))
assert((string.byte("\u{68}\u{69}",0x2,0x1) == nil))
assert((string.char() == ""))
assert((string.char(0x0,0xff,0x0) == "\u{0}\u{ff}\u{0}"))
assert((string.char(0x0,string.byte("\u{e4}"),0x0) == "\u{0}\u{e4}\u{0}"))
assert((string.char(string.byte("\u{e4}\u{6c}\u{0}\u{f3}\u{75}",0x1,(- 0x1))) == "\u{e4}\u{6c}\u{0}\u{f3}\u{75}"))
assert((string.char(string.byte("\u{e4}\u{6c}\u{0}\u{f3}\u{75}",0x1,0x0)) == ""))
assert((string.char(string.byte("\u{e4}\u{6c}\u{0}\u{f3}\u{75}",(- 0xa),0x64)) == "\u{e4}\u{6c}\u{0}\u{f3}\u{75}"))
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}",string.char,0x100)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}",string.char,(- 0x1))
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}",string.char,math.maxinteger)
checkerror("\u{6f}\u{75}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{72}\u{61}\u{6e}\u{67}\u{65}",string.char,math.mininteger)
assert((string.upper("\u{61}\u{62}\u{0}\u{63}") == "\u{41}\u{42}\u{0}\u{43}"))
assert((string.lower("\u{0}\u{41}\u{42}\u{43}\u{63}\u{25}\u{24}") == "\u{0}\u{61}\u{62}\u{63}\u{63}\u{25}\u{24}"))
assert((string.rep("\u{74}\u{65}\u{73}\u{74}\u{65}",0x0) == ""))
assert((string.rep("\u{74}\u{e9}\u{73}\u{0}\u{74}\u{ea}",0x2) == "\u{74}\u{e9}\u{73}\u{0}\u{74}\u{ea}\u{74}\u{e9}\u{73}\u{0}\u{74}\u{ea}"))
assert((string.rep("",0xa) == ""))
if (string.packsize("\u{69}") == 0x4) then
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{61}\u{72}\u{67}\u{65}",string.rep,"\u{61}\u{61}",(0x1 << 0x1e))
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{61}\u{72}\u{67}\u{65}",string.rep,"\u{61}",(0x1 << 0x1e),"\u{2c}")
end
assert((string.rep("\u{74}\u{65}\u{73}\u{74}\u{65}",0x0,"\u{78}\u{75}\u{78}\u{75}") == ""))
assert((string.rep("\u{74}\u{65}\u{73}\u{74}\u{65}",0x1,"\u{78}\u{75}\u{78}\u{75}") == "\u{74}\u{65}\u{73}\u{74}\u{65}"))
assert((string.rep("\u{1}\u{0}\u{1}",0x2,"\u{0}\u{0}") == "\u{1}\u{0}\u{1}\u{0}\u{0}\u{1}\u{0}\u{1}"))
assert((string.rep("",0xa,"\u{2e}") == string.rep("\u{2e}",0x9)))
assert((not pcall(string.rep,"\u{61}\u{61}",((maxi // 0x2) + 0xa))))
assert((not pcall(string.rep,"",((maxi // 0x2) + 0xa),"\u{61}\u{61}")))
assert((string.reverse("") == ""))
assert((string.reverse("\u{0}\u{1}\u{2}\u{3}") == "\u{3}\u{2}\u{1}\u{0}"))
assert((string.reverse("\u{0}\u{31}\u{32}\u{33}\u{34}") == "\u{34}\u{33}\u{32}\u{31}\u{0}"))
for i = 0x0, 0x1e
do
assert((string.len(string.rep("\u{61}",i)) == i))
end
assert((type(tostring(nil)) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"))
assert((type(tostring(0xc)) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"))
assert(string.find(tostring({}),"\u{74}\u{61}\u{62}\u{6c}\u{65}\u{3a}"))
assert(string.find(tostring(print),"\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{3a}"))
assert((# (tostring("\u{0}") == 0x1)))
assert((tostring(true) == "\u{74}\u{72}\u{75}\u{65}"))
assert((tostring(false) == "\u{66}\u{61}\u{6c}\u{73}\u{65}"))
assert((tostring((- 0x4b3)) == "\u{2d}\u{31}\u{32}\u{30}\u{33}"))
assert((tostring(1203.125) == "\u{31}\u{32}\u{30}\u{33}\u{2e}\u{31}\u{32}\u{35}"))
assert((tostring((- 0.5)) == "\u{2d}\u{30}\u{2e}\u{35}"))
assert((tostring((- 0x7fff)) == "\u{2d}\u{33}\u{32}\u{37}\u{36}\u{37}"))
if math.tointeger(0x7fffffff) then
assert((tostring((- 0x7fffffff)) == "\u{2d}\u{32}\u{31}\u{34}\u{37}\u{34}\u{38}\u{33}\u{36}\u{34}\u{37}"))
end
if math.tointeger(0x4000000000000000) then
assert((tostring(0x4000000000000000) == "\u{34}\u{36}\u{31}\u{31}\u{36}\u{38}\u{36}\u{30}\u{31}\u{38}\u{34}\u{32}\u{37}\u{33}\u{38}\u{37}\u{39}\u{30}\u{34}"))
assert((tostring((- 0x4000000000000000)) == "\u{2d}\u{34}\u{36}\u{31}\u{31}\u{36}\u{38}\u{36}\u{30}\u{31}\u{38}\u{34}\u{32}\u{37}\u{33}\u{38}\u{37}\u{39}\u{30}\u{34}"))
end
if (tostring(0.0) == "\u{30}\u{2e}\u{30}") then
assert(((("" .. 0xc) == "\u{31}\u{32}") and ((12.0 .. "") == "\u{31}\u{32}\u{2e}\u{30}")))
assert((tostring((- (0x4b3 + 0.0))) == "\u{2d}\u{31}\u{32}\u{30}\u{33}\u{2e}\u{30}"))
else
assert((tostring(0.0) == "\u{30}"))
assert(((("" .. 0xc) == "\u{31}\u{32}") and ((12.0 .. "") == "\u{31}\u{32}")))
assert((tostring((- (0x4b3 + 0.0))) == "\u{2d}\u{31}\u{32}\u{30}\u{33}"))
end
do
local null = "\u{28}\u{6e}\u{75}\u{6c}\u{6c}\u{29}"
assert((string.format("\u{25}\u{70}",0x4) == null))
assert((string.format("\u{25}\u{70}",true) == null))
assert((string.format("\u{25}\u{70}",nil) == null))
assert((string.format("\u{25}\u{70}",{}) ~= null))
assert((string.format("\u{25}\u{70}",print) ~= null))
assert((string.format("\u{25}\u{70}",coroutine.running()) ~= null))
assert((string.format("\u{25}\u{70}",io.stdin) ~= null))
assert((string.format("\u{25}\u{70}",io.stdin) == string.format("\u{25}\u{70}",io.stdin)))
assert((string.format("\u{25}\u{70}",print) == string.format("\u{25}\u{70}",print)))
assert((string.format("\u{25}\u{70}",print) ~= string.format("\u{25}\u{70}",assert)))
assert((# (string.format("\u{25}\u{39}\u{30}\u{70}",{}) == 0x5a)))
assert((# (string.format("\u{25}\u{2d}\u{36}\u{30}\u{70}",{}) == 0x3c)))
assert((string.format("\u{25}\u{31}\u{30}\u{70}",false) == (string.rep("\u{20}",(0xa - (# null))) .. null)))
assert((string.format("\u{25}\u{2d}\u{31}\u{32}\u{70}",1.5) == (null .. string.rep("\u{20}",(0xc - (# null))))))
do
local t1 = {}
;
local t2 = {}
assert((string.format("\u{25}\u{70}",t1) ~= string.format("\u{25}\u{70}",t2)))
end
do
local s1 = string.rep("\u{61}",0xa)
local s2 = string.rep("\u{61}\u{61}",0x5)
assert((string.format("\u{25}\u{70}",s1) == string.format("\u{25}\u{70}",s2)))
end
do
local s1 = string.rep("\u{61}",0x12c)
;
local s2 = string.rep("\u{61}",0x12c)
assert((string.format("\u{25}\u{70}",s1) ~= string.format("\u{25}\u{70}",s2)))
end
end
local x = "\u{22}\u{ed}\u{6c}\u{6f}\u{22}\u{a}\u{5c}"
assert((string.format("\u{25}\u{71}\u{25}\u{73}",x,x) == "\u{22}\u{5c}\u{22}\u{ed}\u{6c}\u{6f}\u{5c}\u{22}\u{5c}\u{a}\u{5c}\u{5c}\u{22}\u{22}\u{ed}\u{6c}\u{6f}\u{22}\u{a}\u{5c}"))
assert((string.format("\u{25}\u{71}","\u{0}") == "\u{22}\u{5c}\u{30}\u{22}"))
assert((load(string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{25}\u{71}",x))() == x))
x="\u{0}\u{1}\u{2}\u{33}\u{5}\u{0}\u{39}"
assert((load(string.format("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{25}\u{71}",x))() == x))
assert((string.format("\u{0}\u{25}\u{63}\u{0}\u{25}\u{63}\u{25}\u{78}\u{0}",string.byte("\u{e4}"),string.byte("\u{62}"),0x8c) == "\u{0}\u{e4}\u{0}\u{62}\u{38}\u{63}\u{0}"))
assert((string.format("") == ""))
assert(((string.format("\u{25}\u{63}",0x22) .. (string.format("\u{25}\u{63}",0x30) .. (string.format("\u{25}\u{63}",0x5a) .. string.format("\u{25}\u{63}",0x64)))) == string.format("\u{25}\u{31}\u{63}\u{25}\u{2d}\u{63}\u{25}\u{2d}\u{31}\u{63}\u{25}\u{63}",0x22,0x30,0x5a,0x64)))
assert((string.format("\u{25}\u{73}\u{0}\u{20}\u{69}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{0}\u{25}\u{73}","\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}","\u{62}\u{65}") == "\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{0}\u{20}\u{69}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{0}\u{62}\u{65}"))
assert((string.format("\u{25}\u{25}\u{25}\u{64}\u{20}\u{25}\u{30}\u{31}\u{30}\u{64}",0xa,0x17) == "\u{25}\u{31}\u{30}\u{20}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{32}\u{33}"))
assert((tonumber(string.format("\u{25}\u{66}",10.3)) == 10.3))
assert((string.format("\u{22}\u{25}\u{2d}\u{35}\u{30}\u{73}\u{22}","\u{61}") == ("\u{22}\u{61}" .. (string.rep("\u{20}",0x31) .. "\u{22}"))))
assert((string.format("\u{2d}\u{25}\u{2e}\u{32}\u{30}\u{73}\u{2e}\u{32}\u{30}\u{73}",string.rep("\u{25}",0x7d0)) == ("\u{2d}" .. (string.rep("\u{25}",0x14) .. "\u{2e}\u{32}\u{30}\u{73}"))))
assert((string.format("\u{22}\u{2d}\u{25}\u{32}\u{30}\u{73}\u{2e}\u{32}\u{30}\u{73}\u{22}",string.rep("\u{25}",0x7d0)) == string.format("\u{25}\u{71}",("\u{2d}" .. (string.rep("\u{25}",0x7d0) .. "\u{2e}\u{32}\u{30}\u{73}")))))
do
local function checkQ
(v)
local s = string.format("\u{25}\u{71}",v)
local nv = load(("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}" .. s))()
assert(((v == nv) and (math.type(v) == math.type(nv))))
end
checkQ("\u{0}\u{0}\u{1}\u{ff}\u{234}")
checkQ(math.maxinteger)
checkQ(math.mininteger)
checkQ(math.pi)
checkQ(0.1)
checkQ(true)
checkQ(nil)
checkQ(false)
checkQ(math.huge)
checkQ((- math.huge))
assert((string.format("\u{25}\u{71}",(0x0 / 0x0)) == "\u{28}\u{30}\u{2f}\u{30}\u{29}"))
checkerror("\u{6e}\u{6f}\u{20}\u{6c}\u{69}\u{74}\u{65}\u{72}\u{61}\u{6c}",string.format,"\u{25}\u{71}",{})
end
assert((string.format("\u{0}\u{25}\u{73}\u{0}","\u{0}\u{0}\u{1}") == "\u{0}\u{0}\u{0}\u{1}\u{0}"))
checkerror("\u{63}\u{6f}\u{6e}\u{74}\u{61}\u{69}\u{6e}\u{73}\u{20}\u{7a}\u{65}\u{72}\u{6f}\u{73}",string.format,"\u{25}\u{31}\u{30}\u{73}","\u{0}")
assert((string.format("\u{25}\u{73}\u{20}\u{25}\u{73}",nil,true) == "\u{6e}\u{69}\u{6c}\u{20}\u{74}\u{72}\u{75}\u{65}"))
assert((string.format("\u{25}\u{73}\u{20}\u{25}\u{2e}\u{34}\u{73}",false,true) == "\u{66}\u{61}\u{6c}\u{73}\u{65}\u{20}\u{74}\u{72}\u{75}\u{65}"))
assert((string.format("\u{25}\u{2e}\u{33}\u{73}\u{20}\u{25}\u{2e}\u{33}\u{73}",false,true) == "\u{66}\u{61}\u{6c}\u{20}\u{74}\u{72}\u{75}"))
local m = setmetatable({},{["\u{5f}\u{5f}\u{74}\u{6f}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"] = function ()
return "\u{68}\u{65}\u{6c}\u{6c}\u{6f}"
end,["\u{5f}\u{5f}\u{6e}\u{61}\u{6d}\u{65}"] = "\u{68}\u{69}"})
assert((string.format("\u{25}\u{73}\u{20}\u{25}\u{2e}\u{31}\u{30}\u{73}",m,m) == "\u{68}\u{65}\u{6c}\u{6c}\u{6f}\u{20}\u{68}\u{65}\u{6c}\u{6c}\u{6f}"))
getmetatable(m).__tostring=nil
assert((string.format("\u{25}\u{2e}\u{34}\u{73}",m) == "\u{68}\u{69}\u{3a}\u{20}"))
getmetatable(m).__tostring=function ()
return {}
end
checkerror("\u{27}\u{5f}\u{5f}\u{74}\u{6f}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{27}\u{20}\u{6d}\u{75}\u{73}\u{74}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{61}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}",tostring,m)
assert((string.format("\u{25}\u{78}",0.0) == "\u{30}"))
assert((string.format("\u{25}\u{30}\u{32}\u{78}",0.0) == "\u{30}\u{30}"))
assert((string.format("\u{25}\u{30}\u{38}\u{58}",0xffffffff) == "\u{46}\u{46}\u{46}\u{46}\u{46}\u{46}\u{46}\u{46}"))
assert((string.format("\u{25}\u{2b}\u{30}\u{38}\u{64}",0x7b0d) == "\u{2b}\u{30}\u{30}\u{33}\u{31}\u{35}\u{30}\u{31}"))
assert((string.format("\u{25}\u{2b}\u{30}\u{38}\u{64}",(- 0x78cf)) == "\u{2d}\u{30}\u{30}\u{33}\u{30}\u{39}\u{32}\u{37}"))
do
local i = 0x1
local j = 0x2710
while ((i + 0x1) < j) do
local m = ((i + j) // 0x2)
if ((0xa ^ m) < math.huge) then
i=m
else
j=m
end
end
assert((((0xa ^ i) < math.huge) and ((0xa ^ j) == math.huge)))
local s = string.format("\u{25}\u{2e}\u{39}\u{39}\u{66}",(- (0xa ^ i)))
assert((string.len(s) >= (i + 0x65)))
assert((tonumber(s) == (- (0xa ^ i))))
assert(((0xa ^ 0x26) < math.huge))
local s = string.format("\u{25}\u{2e}\u{39}\u{39}\u{66}",(- (0xa ^ 0x26)))
assert((string.len(s) >= (0x26 + 0x65)))
assert((tonumber(s) == (- (0xa ^ 0x26))))
end
do
local max,min = 0x7fffffff,(- 0x80000000)
assert((string.sub(string.format("\u{25}\u{38}\u{78}",(- 0x1)),(- 0x8)) == "\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}"))
assert((string.format("\u{25}\u{78}",max) == "\u{37}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}"))
assert((string.sub(string.format("\u{25}\u{78}",min),(- 0x8)) == "\u{38}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}"))
assert((string.format("\u{25}\u{64}",max) == "\u{32}\u{31}\u{34}\u{37}\u{34}\u{38}\u{33}\u{36}\u{34}\u{37}"))
assert((string.format("\u{25}\u{64}",min) == "\u{2d}\u{32}\u{31}\u{34}\u{37}\u{34}\u{38}\u{33}\u{36}\u{34}\u{38}"))
assert((string.format("\u{25}\u{75}",0xffffffff) == "\u{34}\u{32}\u{39}\u{34}\u{39}\u{36}\u{37}\u{32}\u{39}\u{35}"))
assert((string.format("\u{25}\u{6f}",0xabcd) == "\u{31}\u{32}\u{35}\u{37}\u{31}\u{35}"))
max,min=0x7fffffffffffffff,(- 0x8000000000000000)
if (max > (2.0 ^ 0x35)) then
assert((string.format("\u{25}\u{78}",(((0x2 ^ 0x34) | 0x0) - 0x1)) == "\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}"))
assert((string.format("\u{30}\u{78}\u{25}\u{38}\u{58}",0x8f000003) == "\u{30}\u{78}\u{38}\u{46}\u{30}\u{30}\u{30}\u{30}\u{30}\u{33}"))
assert((string.format("\u{25}\u{64}",(0x2 ^ 0x35)) == "\u{39}\u{30}\u{30}\u{37}\u{31}\u{39}\u{39}\u{32}\u{35}\u{34}\u{37}\u{34}\u{30}\u{39}\u{39}\u{32}"))
assert((string.format("\u{25}\u{69}",(- (0x2 ^ 0x35))) == "\u{2d}\u{39}\u{30}\u{30}\u{37}\u{31}\u{39}\u{39}\u{32}\u{35}\u{34}\u{37}\u{34}\u{30}\u{39}\u{39}\u{32}"))
assert((string.format("\u{25}\u{78}",max) == "\u{37}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}"))
assert((string.format("\u{25}\u{78}",min) == "\u{38}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}"))
assert((string.format("\u{25}\u{64}",max) == "\u{39}\u{32}\u{32}\u{33}\u{33}\u{37}\u{32}\u{30}\u{33}\u{36}\u{38}\u{35}\u{34}\u{37}\u{37}\u{35}\u{38}\u{30}\u{37}"))
assert((string.format("\u{25}\u{64}",min) == "\u{2d}\u{39}\u{32}\u{32}\u{33}\u{33}\u{37}\u{32}\u{30}\u{33}\u{36}\u{38}\u{35}\u{34}\u{37}\u{37}\u{35}\u{38}\u{30}\u{38}"))
assert((string.format("\u{25}\u{75}",(~ (- (0x1 << 0x40)))) == "\u{31}\u{38}\u{34}\u{34}\u{36}\u{37}\u{34}\u{34}\u{30}\u{37}\u{33}\u{37}\u{30}\u{39}\u{35}\u{35}\u{31}\u{36}\u{31}\u{35}"))
assert((tostring(0x11f71fb04cb) == "\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}"))
end
end
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}\u{20}\u{25}\u{61}\u{20}\u{25}\u{41}\u{27}")
local function matchhexa
(n)
local s = string.format("\u{25}\u{61}",n)
assert(string.find(s,"\u{5e}\u{25}\u{2d}\u{3f}\u{30}\u{78}\u{5b}\u{31}\u{2d}\u{39}\u{61}\u{2d}\u{66}\u{5d}\u{25}\u{2e}\u{3f}\u{5b}\u{30}\u{2d}\u{39}\u{61}\u{2d}\u{66}\u{5d}\u{2a}\u{70}\u{5b}\u{2d}\u{2b}\u{5d}\u{3f}\u{25}\u{64}\u{2b}\u{24}"))
assert((tonumber(s) == n))
s=string.format("\u{25}\u{41}",n)
assert(string.find(s,"\u{5e}\u{25}\u{2d}\u{3f}\u{30}\u{58}\u{5b}\u{31}\u{2d}\u{39}\u{41}\u{2d}\u{46}\u{5d}\u{25}\u{2e}\u{3f}\u{5b}\u{30}\u{2d}\u{39}\u{41}\u{2d}\u{46}\u{5d}\u{2a}\u{50}\u{5b}\u{2d}\u{2b}\u{5d}\u{3f}\u{25}\u{64}\u{2b}\u{24}"))
assert((tonumber(s) == n))
end
for _,n in ipairs({0.1,(- 0.1),(0x1 / 0x3),(- (0x1 / 0x3)),1e30,(- 1e30),(- (0x2d / 0xf7)),0x1,(- 0x1),0x2,(- 0x2),3e-20,(- 3e-20)})
do
matchhexa(n)
end
assert(string.find(string.format("\u{25}\u{41}",0.0),"\u{5e}\u{30}\u{58}\u{30}\u{25}\u{2e}\u{3f}\u{30}\u{2a}\u{50}\u{25}\u{2b}\u{3f}\u{30}\u{24}"))
assert(string.find(string.format("\u{25}\u{61}",(- 0.0)),"\u{5e}\u{25}\u{2d}\u{30}\u{78}\u{30}\u{25}\u{2e}\u{3f}\u{30}\u{2a}\u{70}\u{25}\u{2b}\u{3f}\u{30}\u{24}"))
if (not _port) then
assert(string.find(string.format("\u{25}\u{61}",(0x1 / 0x0)),"\u{5e}\u{69}\u{6e}\u{66}"))
assert(string.find(string.format("\u{25}\u{41}",(- (0x1 / 0x0))),"\u{5e}\u{25}\u{2d}\u{49}\u{4e}\u{46}"))
assert(string.find(string.format("\u{25}\u{61}",(0x0 / 0x0)),"\u{5e}\u{25}\u{2d}\u{3f}\u{6e}\u{61}\u{6e}"))
assert(string.find(string.format("\u{25}\u{61}",(- 0.0)),"\u{5e}\u{25}\u{2d}\u{30}\u{78}\u{30}"))
end
if (not pcall(string.format,"\u{25}\u{2e}\u{33}\u{61}",0x0)) then
(Message or print)("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{6d}\u{6f}\u{64}\u{69}\u{66}\u{69}\u{65}\u{72}\u{73}\u{20}\u{66}\u{6f}\u{72}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}\u{20}\u{27}\u{25}\u{61}\u{27}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{76}\u{61}\u{69}\u{6c}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
else
assert(string.find(string.format("\u{25}\u{2b}\u{2e}\u{32}\u{41}",0xc),"\u{5e}\u{25}\u{2b}\u{30}\u{58}\u{25}\u{78}\u{25}\u{2e}\u{25}\u{78}\u{30}\u{50}\u{25}\u{2b}\u{3f}\u{25}\u{64}\u{24}"))
assert(string.find(string.format("\u{25}\u{2e}\u{34}\u{41}",(- 0xc)),"\u{5e}\u{25}\u{2d}\u{30}\u{58}\u{25}\u{78}\u{25}\u{2e}\u{25}\u{78}\u{30}\u{30}\u{30}\u{50}\u{25}\u{2b}\u{3f}\u{25}\u{64}\u{24}"))
end
end
assert((string.format("\u{25}\u{23}\u{31}\u{32}\u{6f}",0xa) == "\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{30}\u{31}\u{32}"))
assert((string.format("\u{25}\u{23}\u{31}\u{30}\u{78}",0x64) == "\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{30}\u{78}\u{36}\u{34}"))
assert((string.format("\u{25}\u{23}\u{2d}\u{31}\u{37}\u{58}",0x64) == "\u{30}\u{58}\u{36}\u{34}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}"))
assert((string.format("\u{25}\u{30}\u{31}\u{33}\u{69}",(- 0x64)) == "\u{2d}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{31}\u{30}\u{30}"))
assert((string.format("\u{25}\u{32}\u{2e}\u{35}\u{64}",(- 0x64)) == "\u{2d}\u{30}\u{30}\u{31}\u{30}\u{30}"))
assert((string.format("\u{25}\u{2e}\u{75}",0x0) == ""))
assert((string.format("\u{25}\u{2b}\u{23}\u{30}\u{31}\u{34}\u{2e}\u{30}\u{66}",0x64) == "\u{2b}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{30}\u{31}\u{30}\u{30}\u{2e}"))
assert((string.format("\u{25}\u{2d}\u{31}\u{36}\u{63}",0x61) == "\u{61}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}"))
assert((string.format("\u{25}\u{2b}\u{2e}\u{33}\u{47}",1.5) == "\u{2b}\u{31}\u{2e}\u{35}"))
assert((string.format("\u{25}\u{2e}\u{30}\u{73}","\u{61}\u{6c}\u{6f}") == ""))
assert((string.format("\u{25}\u{2e}\u{73}","\u{61}\u{6c}\u{6f}") == ""))
assert(string.match(string.format("\u{25}\u{20}\u{31}\u{2e}\u{30}\u{45}",0x64),"\u{5e}\u{20}\u{31}\u{45}\u{25}\u{2b}\u{30}\u{2b}\u{32}\u{24}"))
assert(string.match(string.format("\u{25}\u{20}\u{2e}\u{31}\u{67}",(0x2 ^ 0xa)),"\u{5e}\u{20}\u{31}\u{65}\u{25}\u{2b}\u{30}\u{2b}\u{33}\u{24}"))
local function check
(fmt,msg)
checkerror(msg,string.format,fmt,0xa)
end
local aux = string.rep("\u{30}",0x258)
check("\u{25}\u{31}\u{30}\u{30}\u{2e}\u{33}\u{64}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
check(("\u{25}\u{31}" .. (aux .. "\u{2e}\u{33}\u{64}")),"\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{6f}\u{6e}\u{67}")
check("\u{25}\u{31}\u{2e}\u{31}\u{30}\u{30}\u{64}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
check(("\u{25}\u{31}\u{30}\u{2e}\u{31}" .. (aux .. "\u{30}\u{30}\u{34}\u{64}")),"\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{6f}\u{6e}\u{67}")
check("\u{25}\u{74}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
check(("\u{25}" .. (aux .. "\u{64}")),"\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{6f}\u{6e}\u{67}")
check("\u{25}\u{64}\u{20}\u{25}\u{64}","\u{6e}\u{6f}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}")
check("\u{25}\u{30}\u{31}\u{30}\u{63}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
check("\u{25}\u{2e}\u{31}\u{30}\u{63}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
check("\u{25}\u{30}\u{2e}\u{33}\u{34}\u{73}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
check("\u{25}\u{23}\u{69}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
check("\u{25}\u{33}\u{2e}\u{31}\u{70}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
check("\u{25}\u{30}\u{2e}\u{73}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
check("\u{25}\u{31}\u{30}\u{71}","\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{68}\u{61}\u{76}\u{65}\u{20}\u{6d}\u{6f}\u{64}\u{69}\u{66}\u{69}\u{65}\u{72}\u{73}")
check("\u{25}\u{46}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}")
assert((load("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}\u{a}\u{2d}\u{2d}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{20}\u{77}\u{69}\u{74}\u{68}\u{6f}\u{75}\u{74}\u{20}\u{65}\u{6e}\u{64}\u{69}\u{6e}\u{67}\u{20}\u{45}\u{4f}\u{4c}")() == 0x1))
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.concat,0x3)
checkerror(("\u{61}\u{74}\u{20}\u{69}\u{6e}\u{64}\u{65}\u{78}\u{20}" .. maxi),table.concat,{},"\u{20}",maxi,maxi)
checkerror(("\u{61}\u{74}\u{20}\u{69}\u{6e}\u{64}\u{65}\u{78}\u{20}\u{25}" .. mini),table.concat,{},"\u{20}",mini,mini)
assert((table.concat({}) == ""))
assert((table.concat({},"\u{78}") == ""))
assert((table.concat({"\u{0}","\u{0}\u{1}","\u{0}\u{1}\u{2}"},"\u{2e}\u{0}\u{2e}") == "\u{0}\u{2e}\u{0}\u{2e}\u{0}\u{1}\u{2e}\u{0}\u{2e}\u{0}\u{1}\u{2}"))
local a = {}
;
for i = 0x1, 0x12c
do
a[i]="\u{78}\u{75}\u{78}\u{75}"
end
assert(((table.concat(a,"\u{31}\u{32}\u{33}") .. "\u{31}\u{32}\u{33}") == string.rep("\u{78}\u{75}\u{78}\u{75}\u{31}\u{32}\u{33}",0x12c)))
assert((table.concat(a,"\u{62}",0x14,0x14) == "\u{78}\u{75}\u{78}\u{75}"))
assert((table.concat(a,"",0x14,0x15) == "\u{78}\u{75}\u{78}\u{75}\u{78}\u{75}\u{78}\u{75}"))
assert((table.concat(a,"\u{78}",0x16,0x15) == ""))
assert((table.concat(a,"\u{33}",0x12b) == "\u{78}\u{75}\u{78}\u{75}\u{33}\u{78}\u{75}\u{78}\u{75}"))
assert((table.concat({},"\u{78}",maxi,(maxi - 0x1)) == ""))
assert((table.concat({},"\u{78}",(mini + 0x1),mini) == ""))
assert((table.concat({},"\u{78}",maxi,mini) == ""))
assert((table.concat({[maxi] = "\u{61}\u{6c}\u{6f}"},"\u{78}",maxi,maxi) == "\u{61}\u{6c}\u{6f}"))
assert((table.concat({[maxi] = "\u{61}\u{6c}\u{6f}",[(maxi - 0x1)] = "\u{79}"},"\u{2d}",(maxi - 0x1),maxi) == "\u{79}\u{2d}\u{61}\u{6c}\u{6f}"))
assert((not pcall(table.concat,{"\u{61}","\u{62}",{}})))
a={"\u{61}","\u{62}","\u{63}"}
assert((table.concat(a,"\u{2c}",0x1,0x0) == ""))
assert((table.concat(a,"\u{2c}",0x1,0x1) == "\u{61}"))
assert((table.concat(a,"\u{2c}",0x1,0x2) == "\u{61}\u{2c}\u{62}"))
assert((table.concat(a,"\u{2c}",0x2) == "\u{62}\u{2c}\u{63}"))
assert((table.concat(a,"\u{2c}",0x3) == "\u{63}"))
assert((table.concat(a,"\u{2c}",0x4) == ""))
if (not _port) then
local locales = {"\u{70}\u{74}\u{62}","\u{70}\u{74}\u{5f}\u{42}\u{52}\u{2e}\u{69}\u{73}\u{6f}\u{38}\u{38}\u{35}\u{39}\u{31}","\u{49}\u{53}\u{4f}\u{2d}\u{38}\u{38}\u{35}\u{39}\u{2d}\u{31}"}
local function trylocale
(w)
for i = 0x1, (# locales)
do
if os.setlocale(locales[i],w) then
print(string.format("\u{27}\u{25}\u{73}\u{27}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{65}\u{20}\u{73}\u{65}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{27}\u{25}\u{73}\u{27}",w,locales[i]))
return locales[i]
end
end
print(string.format("\u{27}\u{25}\u{73}\u{27}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{65}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{66}\u{6f}\u{75}\u{6e}\u{64}",w))
return false
end
if trylocale("\u{63}\u{6f}\u{6c}\u{6c}\u{61}\u{74}\u{65}") then
assert((("\u{61}\u{6c}\u{6f}" < "\u{e1}\u{6c}\u{6f}") and ("\u{e1}\u{6c}\u{6f}" < "\u{61}\u{6d}\u{6f}")))
end
if trylocale("\u{63}\u{74}\u{79}\u{70}\u{65}") then
assert((string.gsub("\u{e1}\u{e9}\u{ed}\u{f3}\u{fa}","\u{25}\u{61}","\u{78}") == "\u{78}\u{78}\u{78}\u{78}\u{78}"))
assert((string.gsub("\u{e1}\u{c1}\u{e9}\u{c9}","\u{25}\u{6c}","\u{78}") == "\u{78}\u{c1}\u{78}\u{c9}"))
assert((string.gsub("\u{e1}\u{c1}\u{e9}\u{c9}","\u{25}\u{75}","\u{78}") == "\u{e1}\u{78}\u{e9}\u{78}"))
assert((string.upper("\u{e1}\u{c1}\u{e9}\u{7b}\u{78}\u{75}\u{78}\u{75}\u{7d}\u{e7}\u{e3}\u{6f}") == "\u{c1}\u{c1}\u{c9}\u{7b}\u{58}\u{55}\u{58}\u{55}\u{7d}\u{c7}\u{c3}\u{4f}"))
end
os.setlocale("\u{43}")
assert((os.setlocale() == "\u{43}"))
assert((os.setlocale(nil,"\u{6e}\u{75}\u{6d}\u{65}\u{72}\u{69}\u{63}") == "\u{43}"))
end
do
local f = string.gmatch("\u{31}\u{20}\u{32}\u{20}\u{33}\u{20}\u{34}\u{20}\u{35}","\u{25}\u{64}\u{2b}")
assert((f() == "\u{31}"))
local co = coroutine.wrap(f)
assert((co() == "\u{32}"))
end
if (T == nil) then
(Message or print)("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{3a}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{70}\u{75}\u{73}\u{68}\u{66}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{27}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
else
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{70}\u{75}\u{73}\u{68}\u{66}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{27}")
local blen = 0xc8
local function callpfs
(op,fmt,n)
local x = {T.testC(("\u{70}\u{75}\u{73}\u{68}\u{66}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}" .. (op .. "\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{2a}")),fmt,n)}
assert((# (x == 0x4)))
return x[0x4]
end
local function testpfs
(op,fmt,n)
assert((callpfs(op,fmt,n) == string.format(fmt,n)))
end
testpfs("\u{49}","",0x0)
testpfs("\u{49}",string.rep("\u{61}",(blen - 0x1)),0x0)
testpfs("\u{49}",string.rep("\u{61}",blen),0x0)
testpfs("\u{49}",string.rep("\u{61}",(blen + 0x1)),0x0)
local str = (string.rep("\u{61}\u{62}",blen) .. ("\u{25}\u{64}" .. string.rep("\u{64}",(blen / 0x2))))
testpfs("\u{49}",str,(0x2 ^ 0xe))
testpfs("\u{49}",str,(- (0x2 ^ 0xf)))
str=("\u{25}\u{64}" .. string.rep("\u{63}\u{64}",blen))
testpfs("\u{49}",str,(0x2 ^ 0xe))
testpfs("\u{49}",str,(- (0x2 ^ 0xf)))
str=(string.rep("\u{63}",(blen - 0x2)) .. "\u{25}\u{64}")
testpfs("\u{49}",str,(0x2 ^ 0xe))
testpfs("\u{49}",str,(- (0x2 ^ 0xf)))
for l = 0xc, 0xe
do
local str1 = string.rep("\u{61}",l)
for i = 0x0, 0x1f4, 0xd
do
for j = 0x0, 0x1f4, 0xd
do
str=(string.rep("\u{61}",i) .. ("\u{25}\u{73}" .. string.rep("\u{64}",j)))
testpfs("\u{53}",str,str1)
testpfs("\u{53}",str,str)
end
end
end
str="\u{61}\u{62}\u{63}\u{20}\u{25}\u{63}\u{20}\u{64}\u{65}\u{66}"
testpfs("\u{49}",str,string.byte("\u{41}"))
testpfs("\u{49}",str,0xff)
str=(string.rep("\u{61}",(blen - 0x1)) .. ("\u{25}\u{70}" .. string.rep("\u{63}\u{64}",blen)))
testpfs("\u{50}",str,{})
str=(string.rep("\u{25}\u{25}",(0x3 * blen)) .. ("\u{25}\u{70}" .. string.rep("\u{25}\u{25}",(0x2 * blen))))
testpfs("\u{50}",str,{})
end
print("\u{4f}\u{4b}")