print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{61}\u{74}\u{74}\u{65}\u{72}\u{6e}\u{20}\u{6d}\u{61}\u{74}\u{63}\u{68}\u{69}\u{6e}\u{67}")
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
assert(a == 0x1 and b == 0x0)
;
a,b=string.find("\u{61}\u{6c}\u{6f}","")
assert(a == 0x1 and b == 0x0)
a,b=string.find("\u{61}\u{0}\u{6f}\u{20}\u{61}\u{0}\u{6f}\u{20}\u{61}\u{0}\u{6f}","\u{61}",0x1)
assert(a == 0x1 and b == 0x1)
a,b=string.find("\u{61}\u{0}\u{6f}\u{20}\u{61}\u{0}\u{6f}\u{20}\u{61}\u{0}\u{6f}","\u{61}\u{0}\u{6f}",0x2)
assert(a == 0x5 and b == 0x7)
a,b=string.find("\u{61}\u{0}\u{6f}\u{20}\u{61}\u{0}\u{6f}\u{20}\u{61}\u{0}\u{6f}","\u{61}\u{0}\u{6f}",0x9)
assert(a == 0x9 and b == 0xb)
a,b=string.find("\u{61}\u{0}\u{61}\u{0}\u{61}\u{0}\u{61}\u{0}\u{0}\u{61}\u{62}","\u{0}\u{61}\u{62}",0x2)
;
assert(a == 0x9 and b == 0xb)
;
a,b=string.find("\u{61}\u{0}\u{61}\u{0}\u{61}\u{0}\u{61}\u{0}\u{0}\u{61}\u{62}","\u{62}")
assert(a == 0xb and b == 0xb)
assert(not string.find("\u{61}\u{0}\u{61}\u{0}\u{61}\u{0}\u{61}\u{0}\u{0}\u{61}\u{62}","\u{62}\u{0}"))
assert(not string.find("","\u{0}"))
assert(string.find("\u{61}\u{6c}\u{6f}\u{31}\u{32}\u{33}\u{61}\u{6c}\u{6f}","\u{31}\u{32}") == 0x4)
assert(not string.find("\u{61}\u{6c}\u{6f}\u{31}\u{32}\u{33}\u{61}\u{6c}\u{6f}","\u{5e}\u{31}\u{32}"))
assert(string.match("\u{61}\u{61}\u{61}\u{62}","\u{2e}\u{2a}\u{62}") == "\u{61}\u{61}\u{61}\u{62}")
assert(string.match("\u{61}\u{61}\u{61}","\u{2e}\u{2a}\u{61}") == "\u{61}\u{61}\u{61}")
assert(string.match("\u{62}","\u{2e}\u{2a}\u{62}") == "\u{62}")
assert(string.match("\u{61}\u{61}\u{61}\u{62}","\u{2e}\u{2b}\u{62}") == "\u{61}\u{61}\u{61}\u{62}")
assert(string.match("\u{61}\u{61}\u{61}","\u{2e}\u{2b}\u{61}") == "\u{61}\u{61}\u{61}")
assert(not string.match("\u{62}","\u{2e}\u{2b}\u{62}"))
assert(string.match("\u{61}\u{61}\u{61}\u{62}","\u{2e}\u{3f}\u{62}") == "\u{61}\u{62}")
assert(string.match("\u{61}\u{61}\u{61}","\u{2e}\u{3f}\u{61}") == "\u{61}\u{61}")
assert(string.match("\u{62}","\u{2e}\u{3f}\u{62}") == "\u{62}")
assert(f("\u{61}\u{6c}\u{6f}\u{41}\u{4c}\u{4f}","\u{25}\u{6c}\u{2a}") == "\u{61}\u{6c}\u{6f}")
assert(f("\u{61}\u{4c}\u{6f}\u{5f}\u{41}\u{4c}\u{4f}","\u{25}\u{61}\u{2a}") == "\u{61}\u{4c}\u{6f}")
assert(f("\u{20}\u{20}\u{a}\u{d}\u{2a}\u{26}\u{a}\u{d}\u{20}\u{20}\u{20}\u{78}\u{75}\u{78}\u{75}\u{20}\u{20}\u{a}\u{a}","\u{25}\u{67}\u{25}\u{67}\u{25}\u{67}\u{2b}") == "\u{78}\u{75}\u{78}\u{75}")
local function PU
(p)
p=string.gsub(p,"\u{28}" .. utf8.charpattern .. "\u{29}\u{25}\u{3f}",function (c)
return string.gsub(c,"\u{2e}","\u{25}\u{30}\u{3f}")
end)
p=string.gsub(p,"\u{25}\u{2e}",utf8.charpattern)
return p
end
assert(f("\u{61}\u{61}\u{61}\u{62}","\u{61}\u{2a}") == "\u{61}\u{61}\u{61}")
;
assert(f("\u{61}\u{61}\u{61}","\u{5e}\u{2e}\u{2a}\u{24}") == "\u{61}\u{61}\u{61}")
;
assert(f("\u{61}\u{61}\u{61}","\u{62}\u{2a}") == "")
;
assert(f("\u{61}\u{61}\u{61}","\u{61}\u{62}\u{2a}\u{61}") == "\u{61}\u{61}")
assert(f("\u{61}\u{62}\u{61}","\u{61}\u{62}\u{2a}\u{61}") == "\u{61}\u{62}\u{61}")
assert(f("\u{61}\u{61}\u{61}\u{62}","\u{61}\u{2b}") == "\u{61}\u{61}\u{61}")
assert(f("\u{61}\u{61}\u{61}","\u{5e}\u{2e}\u{2b}\u{24}") == "\u{61}\u{61}\u{61}")
assert(not f("\u{61}\u{61}\u{61}","\u{62}\u{2b}"))
assert(not f("\u{61}\u{61}\u{61}","\u{61}\u{62}\u{2b}\u{61}"))
assert(f("\u{61}\u{62}\u{61}","\u{61}\u{62}\u{2b}\u{61}") == "\u{61}\u{62}\u{61}")
assert(f("\u{61}\u{24}\u{61}","\u{2e}\u{24}") == "\u{61}")
assert(f("\u{61}\u{24}\u{61}","\u{2e}\u{25}\u{24}") == "\u{61}\u{24}")
assert(f("\u{61}\u{24}\u{61}","\u{2e}\u{24}\u{2e}") == "\u{61}\u{24}\u{61}")
assert(not f("\u{61}\u{24}\u{61}","\u{24}\u{24}"))
assert(not f("\u{61}\u{24}\u{62}","\u{61}\u{24}"))
assert(f("\u{61}\u{24}\u{61}","\u{24}") == "")
assert(f("","\u{62}\u{2a}") == "")
assert(not f("\u{61}\u{61}\u{61}","\u{62}\u{62}\u{2a}"))
assert(f("\u{61}\u{61}\u{61}\u{62}","\u{61}\u{2d}") == "")
assert(f("\u{61}\u{61}\u{61}","\u{5e}\u{2e}\u{2d}\u{24}") == "\u{61}\u{61}\u{61}")
assert(f("\u{61}\u{61}\u{62}\u{61}\u{61}\u{61}\u{62}\u{61}\u{61}\u{61}\u{62}\u{61}\u{61}\u{61}\u{62}\u{61}","\u{62}\u{2e}\u{2a}\u{62}") == "\u{62}\u{61}\u{61}\u{61}\u{62}\u{61}\u{61}\u{61}\u{62}\u{61}\u{61}\u{61}\u{62}")
assert(f("\u{61}\u{61}\u{62}\u{61}\u{61}\u{61}\u{62}\u{61}\u{61}\u{61}\u{62}\u{61}\u{61}\u{61}\u{62}\u{61}","\u{62}\u{2e}\u{2d}\u{62}") == "\u{62}\u{61}\u{61}\u{61}\u{62}")
assert(f("\u{61}\u{6c}\u{6f}\u{20}\u{78}\u{6f}","\u{2e}\u{6f}\u{24}") == "\u{78}\u{6f}")
assert(f("\u{20}\u{a}\u{20}\u{69}\u{73}\u{74}\u{6f}\u{20}\u{c3}\u{a9}\u{20}\u{61}\u{73}\u{73}\u{69}\u{6d}","\u{25}\u{53}\u{25}\u{53}\u{2a}") == "\u{69}\u{73}\u{74}\u{6f}")
assert(f("\u{20}\u{a}\u{20}\u{69}\u{73}\u{74}\u{6f}\u{20}\u{c3}\u{a9}\u{20}\u{61}\u{73}\u{73}\u{69}\u{6d}","\u{25}\u{53}\u{2a}\u{24}") == "\u{61}\u{73}\u{73}\u{69}\u{6d}")
assert(f("\u{20}\u{a}\u{20}\u{69}\u{73}\u{74}\u{6f}\u{20}\u{c3}\u{a9}\u{20}\u{61}\u{73}\u{73}\u{69}\u{6d}","\u{5b}\u{61}\u{2d}\u{7a}\u{5d}\u{2a}\u{24}") == "\u{61}\u{73}\u{73}\u{69}\u{6d}")
assert(f("\u{75}\u{6d}\u{20}\u{63}\u{61}\u{72}\u{61}\u{63}\u{74}\u{65}\u{72}\u{20}\u{3f}\u{20}\u{65}\u{78}\u{74}\u{72}\u{61}","\u{5b}\u{5e}\u{25}\u{73}\u{61}\u{2d}\u{7a}\u{5d}") == "\u{3f}")
assert(f("","\u{61}\u{3f}") == "")
assert(f("\u{c3}\u{a1}",PU("\u{c3}\u{a1}\u{3f}")) == "\u{c3}\u{a1}")
assert(f("\u{c3}\u{a1}\u{62}\u{6c}",PU("\u{c3}\u{a1}\u{3f}\u{62}\u{3f}\u{6c}\u{3f}")) == "\u{c3}\u{a1}\u{62}\u{6c}")
assert(f("\u{20}\u{20}\u{c3}\u{a1}\u{62}\u{6c}",PU("\u{c3}\u{a1}\u{3f}\u{62}\u{3f}\u{6c}\u{3f}")) == "")
assert(f("\u{61}\u{61}","\u{5e}\u{61}\u{61}\u{3f}\u{61}\u{3f}\u{61}") == "\u{61}\u{61}")
assert(f("\u{5d}\u{5d}\u{5d}\u{c3}\u{a1}\u{62}","\u{5b}\u{5e}\u{5d}\u{5d}\u{2b}") == "\u{c3}\u{a1}\u{62}")
assert(f("\u{30}\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}","\u{25}\u{78}\u{2a}") == "\u{30}\u{61}")
assert(f("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}","\u{25}\u{43}\u{2b}") == "\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}")
print("\u{2b}")
local function f1
(s,p)
p=string.gsub(p,"\u{25}\u{25}\u{28}\u{5b}\u{30}\u{2d}\u{39}\u{5d}\u{29}",function (s)
return "\u{25}" .. (tonumber(s) + 0x1)
end)
p=string.gsub(p,"\u{5e}\u{28}\u{5e}\u{3f}\u{29}","\u{25}\u{31}\u{28}\u{29}",0x1)
p=string.gsub(p,"\u{28}\u{24}\u{3f}\u{29}\u{24}","\u{28}\u{29}\u{25}\u{31}",0x1)
local t = {string.match(s,p)}
return string.sub(s,t[0x1],t[# t] - 0x1)
end
assert(f1("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{78}\u{20}\u{31}\u{32}\u{33}\u{20}\u{62}\u{0}\u{6f}\u{20}\u{62}\u{0}\u{6f}","\u{28}\u{2e}\u{2e}\u{2a}\u{29}\u{20}\u{25}\u{31}") == "\u{62}\u{0}\u{6f}\u{20}\u{62}\u{0}\u{6f}")
assert(f1("\u{61}\u{78}\u{7a}\u{31}\u{32}\u{33}\u{3d}\u{20}\u{34}\u{3d}\u{20}\u{34}\u{20}\u{33}\u{34}","\u{28}\u{2e}\u{2b}\u{29}\u{3d}\u{28}\u{2e}\u{2a}\u{29}\u{3d}\u{25}\u{32}\u{20}\u{25}\u{31}") == "\u{33}\u{3d}\u{20}\u{34}\u{3d}\u{20}\u{34}\u{20}\u{33}")
assert(f1("\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}","\u{5e}\u{28}\u{3d}\u{2a}\u{29}\u{3d}\u{25}\u{31}\u{24}") == "\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}")
assert(not string.match("\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}\u{3d}","\u{5e}\u{28}\u{5b}\u{3d}\u{5d}\u{2a}\u{29}\u{3d}\u{25}\u{31}\u{24}"))
local function range
(i,j)
if i <= j then
return i,range(i + 0x1,j)
end
end
local abc = string.char(range(0x0,0x7f)) .. string.char(range(0x80,0xff))
;
assert(string.len(abc) == 0x100)
local function strset
(p)
local res = {["\u{73}"] = ""}
string.gsub(abc,p,function (c)
res.s=res.s .. c
end)
return res.s
end
;
assert(string.len(strset("\u{5b}\u{c8}\u{2d}\u{d2}\u{5d}")) == 0xb)
assert(strset("\u{5b}\u{61}\u{2d}\u{7a}\u{5d}") == "\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}\u{67}\u{68}\u{69}\u{6a}\u{6b}\u{6c}\u{6d}\u{6e}\u{6f}\u{70}\u{71}\u{72}\u{73}\u{74}\u{75}\u{76}\u{77}\u{78}\u{79}\u{7a}")
assert(strset("\u{5b}\u{61}\u{2d}\u{7a}\u{25}\u{64}\u{5d}") == strset("\u{5b}\u{25}\u{64}\u{61}\u{2d}\u{75}\u{75}\u{2d}\u{7a}\u{5d}"))
assert(strset("\u{5b}\u{61}\u{2d}\u{5d}") == "\u{2d}\u{61}")
assert(strset("\u{5b}\u{5e}\u{25}\u{57}\u{5d}") == strset("\u{5b}\u{25}\u{77}\u{5d}"))
assert(strset("\u{5b}\u{5d}\u{25}\u{25}\u{5d}") == "\u{25}\u{5d}")
assert(strset("\u{5b}\u{61}\u{25}\u{2d}\u{7a}\u{5d}") == "\u{2d}\u{61}\u{7a}")
assert(strset("\u{5b}\u{25}\u{5e}\u{25}\u{5b}\u{25}\u{2d}\u{61}\u{25}\u{5d}\u{25}\u{2d}\u{62}\u{5d}") == "\u{2d}\u{5b}\u{5d}\u{5e}\u{61}\u{62}")
assert(strset("\u{25}\u{5a}") == strset("\u{5b}\u{1}\u{2d}\u{ff}\u{5d}"))
assert(strset("\u{2e}") == strset("\u{5b}\u{1}\u{2d}\u{ff}\u{25}\u{7a}\u{5d}"))
print("\u{2b}")
;
assert(string.match("\u{61}\u{6c}\u{6f}\u{20}\u{78}\u{79}\u{7a}\u{4b}","\u{28}\u{25}\u{77}\u{2b}\u{29}\u{4b}") == "\u{78}\u{79}\u{7a}")
assert(string.match("\u{32}\u{35}\u{34}\u{20}\u{4b}","\u{28}\u{25}\u{64}\u{2a}\u{29}\u{4b}") == "")
assert(string.match("\u{61}\u{6c}\u{6f}\u{20}","\u{28}\u{25}\u{77}\u{2a}\u{29}\u{24}") == "")
assert(not string.match("\u{61}\u{6c}\u{6f}\u{20}","\u{28}\u{25}\u{77}\u{2b}\u{29}\u{24}"))
assert(string.find("\u{28}\u{c3}\u{a1}\u{6c}\u{6f}\u{29}","\u{25}\u{28}\u{c3}\u{a1}") == 0x1)
local a,b,c,d,e = string.match("\u{c3}\u{a2}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}",PU("\u{5e}\u{28}\u{28}\u{28}\u{2e}\u{29}\u{2e}\u{29}\u{2e}\u{20}\u{28}\u{25}\u{77}\u{2a}\u{29}\u{29}\u{24}"))
assert(a == "\u{c3}\u{a2}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}" and b == "\u{c3}\u{a2}\u{6c}" and c == "\u{c3}\u{a2}" and d == "\u{61}\u{6c}\u{6f}" and e == nil)
a,b,c,d=string.match("\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}","\u{28}\u{2e}\u{2b}\u{28}\u{2e}\u{3f}\u{29}\u{28}\u{29}\u{29}")
assert(a == "\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}" and b == "" and c == 0xb and d == nil)
print("\u{2b}")
assert(string.gsub("\u{c3}\u{bc}\u{6c}\u{6f}\u{20}\u{c3}\u{bc}\u{6c}\u{6f}","\u{c3}\u{bc}","\u{78}") == "\u{78}\u{6c}\u{6f}\u{20}\u{78}\u{6c}\u{6f}")
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{c3}\u{ba}\u{6c}\u{6f}\u{20}\u{20}","\u{20}\u{2b}\u{24}","") == "\u{61}\u{6c}\u{6f}\u{20}\u{c3}\u{ba}\u{6c}\u{6f}")
assert(string.gsub("\u{20}\u{20}\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}\u{20}\u{20}","\u{5e}\u{25}\u{73}\u{2a}\u{28}\u{2e}\u{2d}\u{29}\u{25}\u{73}\u{2a}\u{24}","\u{25}\u{31}") == "\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}")
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{20}\u{61}\u{6c}\u{6f}\u{20}\u{20}\u{a}\u{20}\u{31}\u{32}\u{33}\u{a}\u{20}","\u{25}\u{73}\u{2b}","\u{20}") == "\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}\u{20}\u{31}\u{32}\u{33}\u{20}")
local t = "\u{61}\u{62}\u{c3}\u{a7}\u{20}\u{64}"
a,b=string.gsub(t,PU("\u{28}\u{2e}\u{29}"),"\u{25}\u{31}\u{40}")
assert(a == "\u{61}\u{40}\u{62}\u{40}\u{c3}\u{a7}\u{40}\u{20}\u{40}\u{64}\u{40}" and b == 0x5)
a,b=string.gsub("\u{61}\u{62}\u{c3}\u{a7}\u{64}",PU("\u{28}\u{2e}\u{29}"),"\u{25}\u{30}\u{40}",0x2)
assert(a == "\u{61}\u{40}\u{62}\u{40}\u{c3}\u{a7}\u{64}" and b == 0x2)
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}","\u{28}\u{29}\u{5b}\u{61}\u{6c}\u{5d}","\u{25}\u{31}") == "\u{31}\u{32}\u{6f}\u{20}\u{35}\u{36}\u{6f}")
assert(string.gsub("\u{61}\u{62}\u{63}\u{3d}\u{78}\u{79}\u{7a}","\u{28}\u{25}\u{77}\u{2a}\u{29}\u{28}\u{25}\u{70}\u{29}\u{28}\u{25}\u{77}\u{2b}\u{29}","\u{25}\u{33}\u{25}\u{32}\u{25}\u{31}\u{2d}\u{25}\u{30}") == "\u{78}\u{79}\u{7a}\u{3d}\u{61}\u{62}\u{63}\u{2d}\u{61}\u{62}\u{63}\u{3d}\u{78}\u{79}\u{7a}")
assert(string.gsub("\u{61}\u{62}\u{63}","\u{25}\u{77}","\u{25}\u{31}\u{25}\u{30}") == "\u{61}\u{61}\u{62}\u{62}\u{63}\u{63}")
assert(string.gsub("\u{61}\u{62}\u{63}","\u{25}\u{77}\u{2b}","\u{25}\u{30}\u{25}\u{31}") == "\u{61}\u{62}\u{63}\u{61}\u{62}\u{63}")
assert(string.gsub("\u{c3}\u{a1}\u{c3}\u{a9}\u{c3}\u{ad}","\u{24}","\u{0}\u{c3}\u{b3}\u{c3}\u{ba}") == "\u{c3}\u{a1}\u{c3}\u{a9}\u{c3}\u{ad}\u{0}\u{c3}\u{b3}\u{c3}\u{ba}")
assert(string.gsub("","\u{5e}","\u{72}") == "\u{72}")
assert(string.gsub("","\u{24}","\u{72}") == "\u{72}")
print("\u{2b}")
do
assert(string.gsub("\u{61}\u{20}\u{62}\u{20}\u{63}\u{64}","\u{20}\u{2a}","\u{2d}") == "\u{2d}\u{61}\u{2d}\u{62}\u{2d}\u{63}\u{2d}\u{64}\u{2d}")
local res = ""
local sub = "\u{61}\u{20}\u{20}\u{a}\u{62}\u{63}\u{9}\u{9}\u{64}"
local i = 0x1
for p,e in string.gmatch(sub,"\u{28}\u{29}\u{25}\u{73}\u{2a}\u{28}\u{29}")
do
res=res .. string.sub(sub,i,p - 0x1) .. "\u{2d}"
i=e
end
assert(res == "\u{2d}\u{61}\u{2d}\u{62}\u{2d}\u{63}\u{2d}\u{64}\u{2d}")
end
assert(string.gsub("\u{75}\u{6d}\u{20}\u{28}\u{64}\u{6f}\u{69}\u{73}\u{29}\u{20}\u{74}\u{72}\u{65}\u{73}\u{20}\u{28}\u{71}\u{75}\u{61}\u{74}\u{72}\u{6f}\u{29}","\u{28}\u{25}\u{28}\u{25}\u{77}\u{2b}\u{25}\u{29}\u{29}",string.upper) == "\u{75}\u{6d}\u{20}\u{28}\u{44}\u{4f}\u{49}\u{53}\u{29}\u{20}\u{74}\u{72}\u{65}\u{73}\u{20}\u{28}\u{51}\u{55}\u{41}\u{54}\u{52}\u{4f}\u{29}")
do
local function setglobal
(n,v)
rawset(_G,n,v)
end
string.gsub("\u{61}\u{3d}\u{72}\u{6f}\u{62}\u{65}\u{72}\u{74}\u{6f}\u{2c}\u{72}\u{6f}\u{62}\u{65}\u{72}\u{74}\u{6f}\u{3d}\u{61}","\u{28}\u{25}\u{77}\u{2b}\u{29}\u{3d}\u{28}\u{25}\u{77}\u{25}\u{77}\u{2a}\u{29}",setglobal)
assert(_G.a == "\u{72}\u{6f}\u{62}\u{65}\u{72}\u{74}\u{6f}" and _G.roberto == "\u{61}")
_G.a=nil
;
_G.roberto=nil
end
function f(a,b)
return string.gsub(a,"\u{2e}",b)
end
assert(string.gsub("\u{74}\u{72}\u{6f}\u{63}\u{61}\u{72}\u{20}\u{74}\u{75}\u{64}\u{6f}\u{20}\u{65}\u{6d}\u{20}\u{7c}\u{74}\u{65}\u{73}\u{74}\u{65}\u{7c}\u{62}\u{7c}\u{20}\u{c3}\u{a9}\u{20}\u{7c}\u{62}\u{65}\u{6c}\u{65}\u{7a}\u{61}\u{7c}\u{61}\u{6c}\u{7c}","\u{7c}\u{28}\u{5b}\u{5e}\u{7c}\u{5d}\u{2a}\u{29}\u{7c}\u{28}\u{5b}\u{5e}\u{7c}\u{5d}\u{2a}\u{29}\u{7c}",f) == "\u{74}\u{72}\u{6f}\u{63}\u{61}\u{72}\u{20}\u{74}\u{75}\u{64}\u{6f}\u{20}\u{65}\u{6d}\u{20}\u{62}\u{62}\u{62}\u{62}\u{62}\u{20}\u{c3}\u{a9}\u{20}\u{61}\u{6c}\u{61}\u{6c}\u{61}\u{6c}\u{61}\u{6c}\u{61}\u{6c}\u{61}\u{6c}")
local function dostring
(s)
return load(s,"")() or ""
end
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{24}\u{61}\u{3d}\u{27}\u{78}\u{27}\u{24}\u{20}\u{6e}\u{6f}\u{76}\u{61}\u{6d}\u{65}\u{6e}\u{74}\u{65}\u{20}\u{24}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{61}\u{24}","\u{24}\u{28}\u{5b}\u{5e}\u{24}\u{5d}\u{2a}\u{29}\u{25}\u{24}",dostring) == "\u{61}\u{6c}\u{6f}\u{20}\u{20}\u{6e}\u{6f}\u{76}\u{61}\u{6d}\u{65}\u{6e}\u{74}\u{65}\u{20}\u{78}")
local x = string.gsub("\u{24}\u{78}\u{3d}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{2e}\u{67}\u{73}\u{75}\u{62}\u{28}\u{27}\u{61}\u{6c}\u{6f}\u{27}\u{2c}\u{20}\u{27}\u{2e}\u{27}\u{2c}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{2e}\u{75}\u{70}\u{70}\u{65}\u{72}\u{29}\u{24}\u{20}\u{61}\u{73}\u{73}\u{69}\u{6d}\u{20}\u{76}\u{61}\u{69}\u{20}\u{70}\u{61}\u{72}\u{61}\u{20}\u{24}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}\u{24}","\u{24}\u{28}\u{5b}\u{5e}\u{24}\u{5d}\u{2a}\u{29}\u{25}\u{24}",dostring)
assert(x == "\u{20}\u{61}\u{73}\u{73}\u{69}\u{6d}\u{20}\u{76}\u{61}\u{69}\u{20}\u{70}\u{61}\u{72}\u{61}\u{20}\u{41}\u{4c}\u{4f}")
_G.a,_G.x=nil
local t = {}
local s = "\u{61}\u{20}\u{61}\u{6c}\u{6f}\u{20}\u{6a}\u{6f}\u{73}\u{65}\u{20}\u{20}\u{6a}\u{6f}\u{61}\u{6f}"
local r = string.gsub(s,"\u{28}\u{29}\u{28}\u{25}\u{77}\u{2b}\u{29}\u{28}\u{29}",function (a,w,b)
assert(string.len(w) == b - a)
;
t[a]=b - a
;
end)
assert(s == r and t[0x1] == 0x1 and t[0x3] == 0x3 and t[0x7] == 0x4 and t[0xd] == 0x4)
local function isbalanced
(s)
return not string.find(string.gsub(s,"\u{25}\u{62}\u{28}\u{29}",""),"\u{5b}\u{28}\u{29}\u{5d}")
end
assert(isbalanced("\u{28}\u{39}\u{20}\u{28}\u{28}\u{38}\u{29}\u{29}\u{28}\u{0}\u{29}\u{20}\u{37}\u{29}\u{20}\u{0}\u{0}\u{20}\u{61}\u{20}\u{62}\u{20}\u{28}\u{29}\u{28}\u{63}\u{29}\u{28}\u{29}\u{20}\u{61}"))
assert(not isbalanced("\u{28}\u{39}\u{20}\u{28}\u{28}\u{38}\u{29}\u{20}\u{37}\u{29}\u{20}\u{61}\u{20}\u{62}\u{20}\u{28}\u{0}\u{20}\u{63}\u{29}\u{20}\u{61}"))
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{27}\u{6f}\u{69}\u{27}\u{20}\u{61}\u{6c}\u{6f}","\u{25}\u{62}\u{27}\u{27}","\u{22}") == "\u{61}\u{6c}\u{6f}\u{20}\u{22}\u{20}\u{61}\u{6c}\u{6f}")
local t = {"\u{61}\u{70}\u{70}\u{6c}\u{65}","\u{6f}\u{72}\u{61}\u{6e}\u{67}\u{65}","\u{6c}\u{69}\u{6d}\u{65}",["\u{6e}"] = 0x0}
assert(string.gsub("\u{78}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{78}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{78}","\u{78}",function ()
t.n=t.n + 0x1
;
return t[t.n]
end) == "\u{61}\u{70}\u{70}\u{6c}\u{65}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{6f}\u{72}\u{61}\u{6e}\u{67}\u{65}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{6c}\u{69}\u{6d}\u{65}")
t={["\u{6e}"] = 0x0}
string.gsub("\u{66}\u{69}\u{72}\u{73}\u{74}\u{20}\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}\u{20}\u{77}\u{6f}\u{72}\u{64}","\u{25}\u{77}\u{25}\u{77}\u{2a}",function (w)
t.n=t.n + 0x1
;
t[t.n]=w
end)
assert(t[0x1] == "\u{66}\u{69}\u{72}\u{73}\u{74}" and t[0x2] == "\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}" and t[0x3] == "\u{77}\u{6f}\u{72}\u{64}" and t.n == 0x3)
t={["\u{6e}"] = 0x0}
assert(string.gsub("\u{66}\u{69}\u{72}\u{73}\u{74}\u{20}\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}\u{20}\u{77}\u{6f}\u{72}\u{64}","\u{25}\u{77}\u{2b}",function (w)
t.n=t.n + 0x1
;
t[t.n]=w
end,0x2) == "\u{66}\u{69}\u{72}\u{73}\u{74}\u{20}\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}\u{20}\u{77}\u{6f}\u{72}\u{64}")
assert(t[0x1] == "\u{66}\u{69}\u{72}\u{73}\u{74}" and t[0x2] == "\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}" and t[0x3] == undef)
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{72}\u{65}\u{70}\u{6c}\u{61}\u{63}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{25}\u{28}\u{61}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{25}\u{29}",string.gsub,"\u{61}\u{6c}\u{6f}","\u{2e}",{["\u{61}"] = {}})
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{61}\u{70}\u{74}\u{75}\u{72}\u{65}\u{20}\u{69}\u{6e}\u{64}\u{65}\u{78}\u{20}\u{25}\u{25}\u{32}",string.gsub,"\u{61}\u{6c}\u{6f}","\u{2e}","\u{25}\u{32}")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{61}\u{70}\u{74}\u{75}\u{72}\u{65}\u{20}\u{69}\u{6e}\u{64}\u{65}\u{78}\u{20}\u{25}\u{25}\u{30}",string.gsub,"\u{61}\u{6c}\u{6f}","\u{28}\u{25}\u{30}\u{29}","\u{61}")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{61}\u{70}\u{74}\u{75}\u{72}\u{65}\u{20}\u{69}\u{6e}\u{64}\u{65}\u{78}\u{20}\u{25}\u{25}\u{31}",string.gsub,"\u{61}\u{6c}\u{6f}","\u{28}\u{25}\u{31}\u{29}","\u{61}")
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{75}\u{73}\u{65}\u{20}\u{6f}\u{66}\u{20}\u{27}\u{25}\u{25}\u{27}",string.gsub,"\u{61}\u{6c}\u{6f}","\u{2e}","\u{25}\u{78}")
if not _soft then
print("\u{62}\u{69}\u{67}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{73}")
local a = string.rep("\u{61}",0x493e0)
assert(string.find(a,"\u{5e}\u{61}\u{2a}\u{2e}\u{3f}\u{24}"))
assert(not string.find(a,"\u{5e}\u{61}\u{2a}\u{2e}\u{3f}\u{62}\u{24}"))
assert(string.find(a,"\u{5e}\u{61}\u{2d}\u{2e}\u{3f}\u{24}"))
a=string.rep("\u{61}",0x2710) .. string.rep("\u{62}",0x2710)
assert(not pcall(string.gsub,a,"\u{62}"))
end
local function rev
(s)
return string.gsub(s,"\u{28}\u{2e}\u{29}\u{28}\u{2e}\u{2b}\u{29}",function (c,s1)
return rev(s1) .. c
end)
end
local x = "\u{61}\u{62}\u{63}\u{64}\u{65}\u{66}"
assert(rev(rev(x)) == x)
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}","\u{2e}",{}) == "\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}")
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}","\u{28}\u{2e}\u{29}",{["\u{61}"] = "\u{41}\u{41}",["\u{6c}"] = ""}) == "\u{41}\u{41}\u{6f}\u{20}\u{41}\u{41}\u{6f}")
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}","\u{28}\u{2e}\u{29}\u{2e}",{["\u{61}"] = "\u{41}\u{41}",["\u{6c}"] = "\u{4b}"}) == "\u{41}\u{41}\u{6f}\u{20}\u{41}\u{41}\u{6f}")
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}","\u{28}\u{28}\u{2e}\u{29}\u{28}\u{2e}\u{3f}\u{29}\u{29}",{["\u{61}\u{6c}"] = "\u{41}\u{41}",["\u{6f}"] = false}) == "\u{41}\u{41}\u{6f}\u{20}\u{41}\u{41}\u{6f}")
assert(string.gsub("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}","\u{28}\u{29}\u{2e}",{"\u{78}","\u{79}\u{79}","\u{7a}\u{7a}\u{7a}"}) == "\u{78}\u{79}\u{79}\u{7a}\u{7a}\u{7a}\u{20}\u{61}\u{6c}\u{6f}")
t={}
;
setmetatable(t,{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,s)
return string.upper(s)
end})
assert(string.gsub("\u{61}\u{20}\u{61}\u{6c}\u{6f}\u{20}\u{62}\u{20}\u{68}\u{69}","\u{25}\u{77}\u{25}\u{77}\u{2b}",t) == "\u{61}\u{20}\u{41}\u{4c}\u{4f}\u{20}\u{62}\u{20}\u{48}\u{49}")
local a = 0x0
for i in string.gmatch("\u{61}\u{62}\u{63}\u{64}\u{65}","\u{28}\u{29}")
do
assert(i == a + 0x1)
;
a=i
end
assert(a == 0x6)
t={["\u{6e}"] = 0x0}
for w in string.gmatch("\u{66}\u{69}\u{72}\u{73}\u{74}\u{20}\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}\u{20}\u{77}\u{6f}\u{72}\u{64}","\u{25}\u{77}\u{2b}")
do
t.n=t.n + 0x1
;
t[t.n]=w
end
assert(t[0x1] == "\u{66}\u{69}\u{72}\u{73}\u{74}" and t[0x2] == "\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}" and t[0x3] == "\u{77}\u{6f}\u{72}\u{64}")
t={0x3,0x6,0x9}
for i in string.gmatch("\u{78}\u{75}\u{78}\u{78}\u{20}\u{75}\u{75}\u{20}\u{70}\u{70}\u{61}\u{72}\u{20}\u{72}","\u{28}\u{29}\u{28}\u{2e}\u{29}\u{25}\u{32}")
do
assert(i == table.remove(t,0x1))
end
assert(# t == 0x0)
t={}
for i,j in string.gmatch("\u{31}\u{33}\u{20}\u{31}\u{34}\u{20}\u{31}\u{30}\u{20}\u{3d}\u{20}\u{31}\u{31}\u{2c}\u{20}\u{31}\u{35}\u{3d}\u{20}\u{31}\u{36}\u{2c}\u{20}\u{32}\u{32}\u{3d}\u{32}\u{33}","\u{28}\u{25}\u{64}\u{2b}\u{29}\u{25}\u{73}\u{2a}\u{3d}\u{25}\u{73}\u{2a}\u{28}\u{25}\u{64}\u{2b}\u{29}")
do
t[tonumber(i)]=tonumber(j)
end
a=0x0
for k,v in pairs(t)
do
assert(k + 0x1 == v + 0x0)
;
a=a + 0x1
end
assert(a == 0x3)
do
local s = 0x0
for k in string.gmatch("\u{31}\u{30}\u{20}\u{32}\u{30}\u{20}\u{33}\u{30}","\u{25}\u{64}\u{2b}",0x3)
do
s=s + tonumber(k)
end
assert(s == 0x32)
s=0x0
for k in string.gmatch("\u{31}\u{31}\u{20}\u{32}\u{31}\u{20}\u{33}\u{31}","\u{25}\u{64}\u{2b}",- 0x4)
do
s=s + tonumber(k)
end
assert(s == 0x20)
s=0x0
for k in string.gmatch("\u{31}\u{31}\u{20}\u{32}\u{31}\u{20}\u{33}\u{31}","\u{25}\u{77}\u{2a}",0x9)
do
s=s + 0x1
end
assert(s == 0x1)
s=0x0
for k in string.gmatch("\u{31}\u{31}\u{20}\u{32}\u{31}\u{20}\u{33}\u{31}","\u{25}\u{77}\u{2a}",0xa)
do
s=s + 0x1
end
assert(s == 0x0)
end
assert(string.gsub("\u{61}\u{61}\u{61}\u{20}\u{61}\u{61}\u{20}\u{61}\u{20}\u{61}\u{61}\u{61}\u{20}\u{61}","\u{25}\u{66}\u{5b}\u{25}\u{77}\u{5d}\u{61}","\u{78}") == "\u{78}\u{61}\u{61}\u{20}\u{78}\u{61}\u{20}\u{78}\u{20}\u{78}\u{61}\u{61}\u{20}\u{78}")
assert(string.gsub("\u{5b}\u{5b}\u{5d}\u{5d}\u{20}\u{5b}\u{5d}\u{5b}\u{5d}\u{20}\u{5b}\u{5b}\u{5b}\u{5b}","\u{25}\u{66}\u{5b}\u{5b}\u{5d}\u{2e}","\u{78}") == "\u{78}\u{5b}\u{5d}\u{5d}\u{20}\u{78}\u{5d}\u{78}\u{5d}\u{20}\u{78}\u{5b}\u{5b}\u{5b}")
assert(string.gsub("\u{30}\u{31}\u{61}\u{62}\u{63}\u{34}\u{35}\u{64}\u{65}\u{33}","\u{25}\u{66}\u{5b}\u{25}\u{64}\u{5d}","\u{2e}") == "\u{2e}\u{30}\u{31}\u{61}\u{62}\u{63}\u{2e}\u{34}\u{35}\u{64}\u{65}\u{2e}\u{33}")
assert(string.gsub("\u{30}\u{31}\u{61}\u{62}\u{63}\u{34}\u{35}\u{20}\u{64}\u{65}\u{33}\u{78}","\u{25}\u{66}\u{5b}\u{25}\u{44}\u{5d}\u{25}\u{77}","\u{2e}") == "\u{30}\u{31}\u{2e}\u{62}\u{63}\u{34}\u{35}\u{20}\u{64}\u{65}\u{33}\u{2e}")
assert(string.gsub("\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}","\u{25}\u{66}\u{5b}\u{1}\u{2d}\u{ff}\u{5d}\u{25}\u{77}","\u{2e}") == "\u{2e}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
assert(string.gsub("\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}","\u{25}\u{66}\u{5b}\u{5e}\u{1}\u{2d}\u{ff}\u{5d}","\u{2e}") == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{2e}")
assert(string.find("\u{61}","\u{25}\u{66}\u{5b}\u{61}\u{5d}") == 0x1)
assert(string.find("\u{61}","\u{25}\u{66}\u{5b}\u{5e}\u{25}\u{7a}\u{5d}") == 0x1)
assert(string.find("\u{61}","\u{25}\u{66}\u{5b}\u{5e}\u{25}\u{6c}\u{5d}") == 0x2)
assert(string.find("\u{61}\u{62}\u{61}","\u{25}\u{66}\u{5b}\u{61}\u{25}\u{7a}\u{5d}") == 0x3)
assert(string.find("\u{61}\u{62}\u{61}","\u{25}\u{66}\u{5b}\u{25}\u{7a}\u{5d}") == 0x4)
assert(not string.find("\u{61}\u{62}\u{61}","\u{25}\u{66}\u{5b}\u{25}\u{6c}\u{25}\u{7a}\u{5d}"))
assert(not string.find("\u{61}\u{62}\u{61}","\u{25}\u{66}\u{5b}\u{5e}\u{25}\u{6c}\u{25}\u{7a}\u{5d}"))
local i,e = string.find("\u{20}\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6c}\u{6f}","\u{25}\u{66}\u{5b}\u{25}\u{53}\u{5d}\u{2e}\u{2d}\u{25}\u{66}\u{5b}\u{25}\u{73}\u{5d}\u{2e}\u{2d}\u{25}\u{66}\u{5b}\u{25}\u{53}\u{5d}")
assert(i == 0x2 and e == 0x5)
local k = string.match("\u{20}\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6c}\u{6f}","\u{25}\u{66}\u{5b}\u{25}\u{53}\u{5d}\u{28}\u{2e}\u{2d}\u{25}\u{66}\u{5b}\u{25}\u{73}\u{5d}\u{2e}\u{2d}\u{25}\u{66}\u{5b}\u{25}\u{53}\u{5d}\u{29}")
assert(k == "\u{61}\u{6c}\u{6f}\u{20}")
local a = {0x1,0x5,0x9,0xe,0x11}
for k in string.gmatch("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}\u{20}\u{74}\u{68}\u{30}\u{32}\u{20}\u{69}\u{73}\u{20}\u{31}\u{68}\u{61}\u{74}","\u{28}\u{29}\u{25}\u{66}\u{5b}\u{25}\u{77}\u{25}\u{64}\u{5d}")
do
assert(table.remove(a,0x1) == k)
end
assert(# a == 0x0)
local function malform
(p,m)
m=m or "\u{6d}\u{61}\u{6c}\u{66}\u{6f}\u{72}\u{6d}\u{65}\u{64}"
local r,msg = pcall(string.find,"\u{61}",p)
assert(not r and string.find(msg,m))
end
malform("\u{28}\u{2e}","\u{75}\u{6e}\u{66}\u{69}\u{6e}\u{69}\u{73}\u{68}\u{65}\u{64}\u{20}\u{63}\u{61}\u{70}\u{74}\u{75}\u{72}\u{65}")
malform("\u{2e}\u{29}","\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{70}\u{61}\u{74}\u{74}\u{65}\u{72}\u{6e}\u{20}\u{63}\u{61}\u{70}\u{74}\u{75}\u{72}\u{65}")
malform("\u{5b}\u{61}")
malform("\u{5b}\u{5d}")
malform("\u{5b}\u{5e}\u{5d}")
malform("\u{5b}\u{61}\u{25}\u{5d}")
malform("\u{5b}\u{61}\u{25}")
malform("\u{25}\u{62}")
malform("\u{25}\u{62}\u{61}")
malform("\u{25}")
malform("\u{25}\u{66}","\u{6d}\u{69}\u{73}\u{73}\u{69}\u{6e}\u{67}")
assert(string.match("\u{61}\u{62}\u{0}\u{1}\u{2}\u{63}","\u{5b}\u{0}\u{2d}\u{2}\u{5d}\u{2b}") == "\u{0}\u{1}\u{2}")
assert(string.match("\u{61}\u{62}\u{0}\u{1}\u{2}\u{63}","\u{5b}\u{0}\u{2d}\u{0}\u{5d}\u{2b}") == "\u{0}")
assert(string.find("\u{62}\u{24}\u{61}","\u{24}\u{0}\u{3f}") == 0x2)
assert(string.find("\u{61}\u{62}\u{63}\u{0}\u{65}\u{66}\u{67}","\u{25}\u{0}") == 0x4)
assert(string.match("\u{61}\u{62}\u{63}\u{0}\u{65}\u{66}\u{67}\u{0}\u{1}\u{65}\u{1}\u{67}","\u{25}\u{62}\u{0}\u{1}") == "\u{0}\u{65}\u{66}\u{67}\u{0}\u{1}\u{65}\u{1}")
assert(string.match("\u{61}\u{62}\u{63}\u{0}\u{0}\u{0}","\u{25}\u{0}\u{2b}") == "\u{0}\u{0}\u{0}")
assert(string.match("\u{61}\u{62}\u{63}\u{0}\u{0}\u{0}","\u{25}\u{0}\u{25}\u{0}\u{3f}") == "\u{0}\u{0}")
assert(string.find("\u{61}\u{62}\u{63}\u{0}\u{0}","\u{0}\u{2e}") == 0x4)
assert(string.find("\u{61}\u{62}\u{63}\u{78}\u{0}\u{0}\u{61}\u{62}\u{63}\u{0}\u{61}\u{62}\u{63}","\u{78}\u{0}\u{0}\u{61}\u{62}\u{63}\u{0}\u{61}\u{2e}") == 0x4)
do
local s = string.rep("\u{61}",0x64)
local r = string.gsub(s,"\u{62}","\u{63}")
assert(string.format("\u{25}\u{70}",s) == string.format("\u{25}\u{70}",r))
r=string.gsub(s,"\u{2e}",{["\u{78}"] = "\u{79}"})
assert(string.format("\u{25}\u{70}",s) == string.format("\u{25}\u{70}",r))
local count = 0x0
r=string.gsub(s,"\u{2e}",function (x)
assert(x == "\u{61}")
count=count + 0x1
return nil
end)
r=string.gsub(r,"\u{2e}",{["\u{62}"] = "\u{78}"})
assert(count == 0x64)
assert(string.format("\u{25}\u{70}",s) == string.format("\u{25}\u{70}",r))
count=0x0
r=string.gsub(s,"\u{2e}",function (x)
assert(x == "\u{61}")
count=count + 0x1
return x
end)
assert(count == 0x64)
assert(r == s and string.format("\u{25}\u{70}",s) ~= string.format("\u{25}\u{70}",r))
end
print("\u{4f}\u{4b}")