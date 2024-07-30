if _port then
return 
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{61}\u{6e}\u{64}\u{2d}\u{61}\u{6c}\u{6f}\u{6e}\u{65}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{72}\u{70}\u{72}\u{65}\u{74}\u{65}\u{72}")
assert(os.execute())
local arg = (arg or ARG)
local prog = os.tmpname()
local otherprog = os.tmpname()
local out = os.tmpname()
local progname
do
local i = 0x0
while arg[i] do
i=(i - 0x1)
end
progname=arg[(i + 0x1)]
end
print(("\u{70}\u{72}\u{6f}\u{67}\u{6e}\u{61}\u{6d}\u{65}\u{3a}\u{20}" .. progname))
local prepfile = function (s,mod,p)
mod=((mod and "\u{77}\u{62}") or "\u{77}")
p=(p or prog)
local f = io.open(p,mod)
f:write(s)
assert(f:close())
end
local function getoutput
()
local f = io.open(out)
local t = f:read("\u{61}")
f:close()
assert(os.remove(out))
return t
end
local function checkprogout
(s)
assert((string.sub(s,(- 0x1)) == "\u{a}"))
local t = getoutput()
for line in string.gmatch(s,"\u{2e}\u{2d}\u{a}")
do
assert(string.find(t,line,0x1,true))
end
end
local function checkout
(s)
local t = getoutput()
if (s ~= t) then
print(string.format("\u{27}\u{25}\u{73}\u{27}\u{20}\u{2d}\u{20}\u{27}\u{25}\u{73}\u{27}\u{a}",s,t))
end
assert((s == t))
return t
end
local function RUN
(p, ...)
p=string.gsub(p,"\u{6c}\u{75}\u{61}",("\u{22}" .. (progname .. "\u{22}")),0x1)
local s = string.format(p,...)
assert(os.execute(s))
end
local function NoRun
(msg,p, ...)
p=string.gsub(p,"\u{6c}\u{75}\u{61}",("\u{22}" .. (progname .. "\u{22}")),0x1)
local s = string.format(p,...)
s=string.format("\u{25}\u{73}\u{20}\u{3e}\u{25}\u{73}\u{20}\u{32}\u{3e}\u{26}\u{31}",s,out)
assert((not os.execute(s)))
assert(string.find(getoutput(),msg,0x1,true))
end
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{76}")
print(string.format("\u{28}\u{74}\u{65}\u{6d}\u{70}\u{6f}\u{72}\u{61}\u{72}\u{79}\u{20}\u{70}\u{72}\u{6f}\u{67}\u{72}\u{61}\u{6d}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{20}\u{75}\u{73}\u{65}\u{64}\u{20}\u{69}\u{6e}\u{20}\u{74}\u{68}\u{65}\u{73}\u{65}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{3a}\u{20}\u{25}\u{73}\u{29}",prog))
prepfile("")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{20}\u{3c}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("")
prepfile("\u{20}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{a}\u{31}\u{2c}\u{20}\u{61}\u{a}\u{29}\u{a}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{20}\u{3c}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{31}\u{9}\u{6e}\u{69}\u{6c}\u{a}")
RUN("\u{65}\u{63}\u{68}\u{6f}\u{20}\u{22}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{31}\u{30}\u{29}\u{a}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{32}\u{29}\u{a}\u{22}\u{20}\u{7c}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{3e}\u{20}\u{25}\u{73}",out)
checkout("\u{31}\u{30}\u{a}\u{32}\u{a}")
prepfile("\u{ef}\u{bb}\u{bf}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("")
prepfile("\u{ef}\u{bb}\u{bf}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{33}\u{29}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{33}\u{a}")
prepfile("\u{ef}\u{bb}\u{bf}\u{23}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{21}\u{21}\u{a}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{33}\u{29}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{33}\u{a}")
prepfile("\u{ef}",true)
NoRun("\u{75}\u{6e}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{73}\u{79}\u{6d}\u{62}\u{6f}\u{6c}","\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile("\u{ef}\u{bb}",true)
NoRun("\u{75}\u{6e}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{73}\u{79}\u{6d}\u{62}\u{6f}\u{6c}","\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile("\u{ef}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{33}\u{29}",true)
NoRun("\u{75}\u{6e}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{73}\u{79}\u{6d}\u{62}\u{6f}\u{6c}","\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile("\u{ef}\u{bb}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{33}\u{29}",true)
NoRun("\u{75}\u{6e}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{73}\u{79}\u{6d}\u{62}\u{6f}\u{6c}","\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
RUN("\u{65}\u{63}\u{68}\u{6f}\u{20}\u{22}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{61}\u{72}\u{67}\u{5b}\u{31}\u{5d}\u{29}\u{22}\u{20}\u{7c}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{20}\u{2d}\u{68}\u{20}\u{3e}\u{20}\u{25}\u{73}",out)
checkout("\u{2d}\u{68}\u{a}")
prepfile("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{70}\u{61}\u{63}\u{6b}\u{61}\u{67}\u{65}\u{2e}\u{70}\u{61}\u{74}\u{68}\u{29}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3d}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{78}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{78}\u{a}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3d}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{50}\u{41}\u{54}\u{48}\u{5f}\u{35}\u{5f}\u{34}\u{3d}\u{79}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{78}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{79}\u{a}")
prepfile("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{70}\u{61}\u{63}\u{6b}\u{61}\u{67}\u{65}\u{2e}\u{63}\u{70}\u{61}\u{74}\u{68}\u{29}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3d}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{43}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{78}\u{75}\u{78}\u{75}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{78}\u{75}\u{78}\u{75}\u{a}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3d}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{43}\u{50}\u{41}\u{54}\u{48}\u{5f}\u{35}\u{5f}\u{34}\u{3d}\u{79}\u{61}\u{63}\u{63}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{43}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{78}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{79}\u{61}\u{63}\u{63}\u{a}")
prepfile("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{58}\u{29}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3d}\u{22}\u{58}\u{3d}\u{74}\u{6f}\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{28}\u{61}\u{72}\u{67}\u{5b}\u{31}\u{5d}\u{29}\u{22}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{33}\u{2e}\u{32}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{33}\u{2e}\u{32}\u{a}")
prepfile("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{58}\u{29}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{5f}\u{35}\u{5f}\u{34}\u{3d}\u{22}\u{58}\u{3d}\u{31}\u{30}\u{22}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3d}\u{22}\u{58}\u{3d}\u{33}\u{22}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{31}\u{30}\u{a}")
prepfile("\u{78}\u{20}\u{3d}\u{20}\u{78}\u{20}\u{6f}\u{72}\u{20}\u{31}\u{30}\u{3b}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{78}\u{29}\u{3b}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{78}\u{20}\u{2b}\u{20}\u{31}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3d}\u{22}\u{40}\u{25}\u{73}\u{22}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,prog,out)
checkout("\u{31}\u{30}\u{a}\u{31}\u{31}\u{a}")
NoRun("\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3a}\u{31}\u{3a}\u{20}\u{6d}\u{73}\u{67}","\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3d}\u{22}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{28}\u{27}\u{6d}\u{73}\u{67}\u{27}\u{29}\u{22}\u{20}\u{6c}\u{75}\u{61}")
local defaultpath,defaultCpath
do
prepfile("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{70}\u{61}\u{63}\u{6b}\u{61}\u{67}\u{65}\u{2e}\u{70}\u{61}\u{74}\u{68}\u{2c}\u{20}\u{70}\u{61}\u{63}\u{6b}\u{61}\u{67}\u{65}\u{2e}\u{63}\u{70}\u{61}\u{74}\u{68}\u{29}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{49}\u{4e}\u{49}\u{54}\u{3d}\u{22}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{28}\u{31}\u{30}\u{29}\u{22}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{78}\u{78}\u{78}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{43}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{78}\u{78}\u{78}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{45}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
local output = getoutput()
defaultpath=string.match(output,"\u{5e}\u{28}\u{2e}\u{2d}\u{29}\u{9}")
defaultCpath=string.match(output,"\u{9}\u{28}\u{2e}\u{2d}\u{29}\u{24}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{2d}\u{69}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
local out = getoutput()
assert((defaultpath == string.match(output,"\u{5e}\u{28}\u{2e}\u{2d}\u{29}\u{9}")))
assert((defaultCpath == string.match(output,"\u{9}\u{28}\u{2e}\u{2d}\u{29}\u{24}")))
end
assert((not ((string.find(defaultpath,"\u{78}\u{78}\u{78}") and string.find(defaultpath,"\u{6c}\u{75}\u{61}")) and (not (string.find(defaultCpath,"\u{78}\u{78}\u{78}") and string.find(defaultCpath,"\u{6c}\u{75}\u{61}"))))))
local function convert
(p)
prepfile("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{70}\u{61}\u{63}\u{6b}\u{61}\u{67}\u{65}\u{2e}\u{70}\u{61}\u{74}\u{68}\u{29}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{22}\u{25}\u{73}\u{22}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",p,prog,out)
local expected = getoutput()
expected=string.sub(expected,0x1,(- 0x2))
if string.find(p,"\u{3b}\u{3b}") then
p=string.gsub(p,"\u{3b}\u{3b}",("\u{3b}" .. (defaultpath .. "\u{3b}")))
p=string.gsub(p,"\u{5e}\u{3b}","")
p=string.gsub(p,"\u{3b}\u{24}","")
end
assert((p == expected))
end
convert("\u{3b}")
convert("\u{3b}\u{3b}")
convert("\u{61}\u{3b}\u{3b}\u{62}")
convert("\u{3b}\u{3b}\u{62}")
convert("\u{61}\u{3b}\u{3b}")
convert("\u{61}\u{3b}\u{62}\u{3b}\u{3b}\u{63}")
prepfile("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{31}\u{29}\u{3b}\u{20}\u{61}\u{3d}\u{32}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{7b}\u{78}\u{3d}\u{31}\u{35}\u{7d}")
prepfile(("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{61}\u{29}\u{3b}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{5f}\u{47}\u{5b}\u{27}\u{25}\u{73}\u{27}\u{5d}\u{2e}\u{78}\u{29}"):format(prog),false,otherprog)
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{22}\u{3f}\u{3b}\u{3b}\u{22}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{6c}\u{20}\u{25}\u{73}\u{20}\u{2d}\u{6c}\u{25}\u{73}\u{20}\u{2d}\u{6c}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{2d}\u{6c}\u{20}\u{69}\u{6f}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,otherprog,otherprog,out)
checkout("\u{31}\u{a}\u{32}\u{a}\u{31}\u{35}\u{a}\u{32}\u{a}\u{31}\u{35}\u{a}")
prepfile("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{73}\u{74}\u{72}\u{2e}\u{75}\u{70}\u{70}\u{65}\u{72}\u{27}\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}\u{27}\u{2c}\u{20}\u{6d}\u{2e}\u{6d}\u{61}\u{78}\u{28}\u{31}\u{30}\u{2c}\u{20}\u{32}\u{30}\u{29}\u{29}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{6c}\u{20}\u{27}\u{73}\u{74}\u{72}\u{3d}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{27}\u{20}\u{27}\u{2d}\u{6c}\u{6d}\u{3d}\u{6d}\u{61}\u{74}\u{68}\u{27}\u{20}\u{2d}\u{65}\u{20}\u{27}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{6d}\u{2e}\u{73}\u{69}\u{6e}\u{28}\u{30}\u{29}\u{29}\u{27}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{30}\u{2e}\u{30}\u{a}\u{41}\u{4c}\u{4f}\u{20}\u{41}\u{4c}\u{4f}\u{9}\u{32}\u{30}\u{a}")
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{43}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{27}\u{2e}\u{2f}\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{3f}\u{2e}\u{73}\u{6f}\u{27}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{6c}\u{20}\u{6c}\u{69}\u{62}\u{32}\u{2d}\u{76}\u{32}\u{20}\u{2d}\u{65}\u{20}\u{27}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{6c}\u{69}\u{62}\u{32}\u{2e}\u{69}\u{64}\u{28}\u{29}\u{29}\u{27}\u{20}\u{3e}\u{20}\u{25}\u{73}",out)
checkout("\u{74}\u{72}\u{75}\u{65}\u{a}")
local a = "\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{23}\u{61}\u{72}\u{67}\u{20}\u{3d}\u{3d}\u{20}\u{33}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{61}\u{72}\u{67}\u{5b}\u{31}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{27}\u{61}\u{27}\u{20}\u{61}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{72}\u{67}\u{5b}\u{32}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{27}\u{62}\u{27}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{61}\u{72}\u{67}\u{5b}\u{33}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{27}\u{63}\u{27}\u{29}\u{a}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{72}\u{67}\u{5b}\u{2d}\u{31}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{27}\u{2d}\u{2d}\u{27}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{61}\u{72}\u{67}\u{5b}\u{2d}\u{32}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{2d}\u{65}\u{20}\u{22}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{61}\u{72}\u{67}\u{5b}\u{2d}\u{33}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{27}\u{25}\u{73}\u{27}\u{29}\u{a}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{72}\u{67}\u{5b}\u{34}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{75}\u{6e}\u{64}\u{65}\u{66}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{61}\u{72}\u{67}\u{5b}\u{2d}\u{34}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{75}\u{6e}\u{64}\u{65}\u{66}\u{29}\u{a}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{2c}\u{20}\u{62}\u{2c}\u{20}\u{63}\u{20}\u{3d}\u{20}\u{2e}\u{2e}\u{2e}\u{a}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{2e}\u{2e}\u{2e}\u{20}\u{3d}\u{3d}\u{20}\u{27}\u{61}\u{27}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{61}\u{20}\u{3d}\u{3d}\u{20}\u{27}\u{61}\u{27}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{62}\u{20}\u{3d}\u{3d}\u{20}\u{27}\u{62}\u{27}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{63}\u{20}\u{3d}\u{3d}\u{20}\u{27}\u{63}\u{27}\u{29}\u{a}"
a=string.format(a,progname)
prepfile(a)
RUN("\u{6c}\u{75}\u{61}\u{20}\u{22}\u{2d}\u{65}\u{20}\u{22}\u{20}\u{2d}\u{2d}\u{20}\u{25}\u{73}\u{20}\u{61}\u{20}\u{62}\u{20}\u{63}",prog)
prepfile("\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{72}\u{67}\u{29}")
prepfile("\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{72}\u{67}\u{29}",false,otherprog)
RUN("\u{65}\u{6e}\u{76}\u{20}\u{4c}\u{55}\u{41}\u{5f}\u{50}\u{41}\u{54}\u{48}\u{3d}\u{22}\u{3f}\u{3b}\u{3b}\u{22}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{6c}\u{25}\u{73}\u{20}\u{2d}\u{20}\u{3c}\u{20}\u{25}\u{73}",prog,otherprog)
RUN("\u{65}\u{63}\u{68}\u{6f}\u{20}\u{22}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{2e}\u{2e}\u{2e}\u{29}\u{22}\u{20}\u{7c}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}\u{20}\u{22}\u{61}\u{72}\u{67}\u{5b}\u{31}\u{5d}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{30}\u{22}\u{20}\u{2d}\u{20}\u{3e}\u{20}\u{25}\u{73}",out)
checkout("\u{31}\u{30}\u{30}\u{a}")
NoRun("\u{27}\u{61}\u{72}\u{67}\u{27}\u{20}\u{69}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}","\u{65}\u{63}\u{68}\u{6f}\u{20}\u{22}\u{22}\u{20}\u{7c}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}\u{20}\u{22}\u{61}\u{72}\u{67}\u{20}\u{3d}\u{20}\u{31}\u{22}\u{20}\u{2d}")
RUN("\u{65}\u{63}\u{68}\u{6f}\u{20}\u{31}\u{30}\u{20}\u{7c}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}\u{20}\u{22}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{3d}\u{6e}\u{69}\u{6c}\u{22}\u{20}\u{2d}\u{69}\u{20}\u{3e}\u{20}\u{2f}\u{64}\u{65}\u{76}\u{2f}\u{6e}\u{75}\u{6c}\u{6c}\u{20}\u{32}\u{3e}\u{20}\u{25}\u{73}",out)
assert(string.find(getoutput(),"\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{27}"))
RUN("\u{65}\u{63}\u{68}\u{6f}\u{20}\u{22}\u{69}\u{6f}\u{2e}\u{73}\u{74}\u{64}\u{65}\u{72}\u{72}\u{3a}\u{77}\u{72}\u{69}\u{74}\u{65}\u{28}\u{31}\u{30}\u{30}\u{30}\u{29}\u{a}\u{63}\u{6f}\u{6e}\u{74}\u{22}\u{20}\u{7c}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}\u{20}\u{22}\u{72}\u{65}\u{71}\u{75}\u{69}\u{72}\u{65}\u{27}\u{64}\u{65}\u{62}\u{75}\u{67}\u{27}\u{2e}\u{64}\u{65}\u{62}\u{75}\u{67}\u{28}\u{29}\u{22}\u{20}\u{32}\u{3e}\u{20}\u{25}\u{73}",out)
checkout("\u{6c}\u{75}\u{61}\u{5f}\u{64}\u{65}\u{62}\u{75}\u{67}\u{3e}\u{20}\u{31}\u{30}\u{30}\u{30}\u{6c}\u{75}\u{61}\u{5f}\u{64}\u{65}\u{62}\u{75}\u{67}\u{3e}\u{20}")
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}\u{73}")
RUN("\u{65}\u{63}\u{68}\u{6f}\u{20}\u{22}\u{69}\u{6f}\u{2e}\u{73}\u{74}\u{64}\u{65}\u{72}\u{72}\u{3a}\u{77}\u{72}\u{69}\u{74}\u{65}\u{28}\u{31}\u{29}\u{3b}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{5b}\u{5b}\u{58}\u{58}\u{58}\u{5d}\u{5d}\u{22}\u{20}\u{7c}\u{20}\u{6c}\u{75}\u{61}\u{20}\u{32}\u{3e}\u{20}\u{25}\u{73}",out)
checkout("\u{31}")
prepfile("\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{40}\u{61}\u{6c}\u{6c}\u{6f}\u{77}\u{22}\u{29}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{75}\u{6e}\u{6b}\u{6e}\u{6f}\u{77}\u{6e}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{72}\u{6f}\u{6c}\u{2c}\u{20}\u{69}\u{67}\u{6e}\u{6f}\u{72}\u{65}\u{64}\u{a}\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{40}\u{6f}\u{66}\u{66}\u{22}\u{2c}\u{20}\u{22}\u{58}\u{58}\u{58}\u{22}\u{2c}\u{20}\u{22}\u{40}\u{6f}\u{66}\u{66}\u{22}\u{29}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{74}\u{68}\u{65}\u{73}\u{65}\u{20}\u{61}\u{72}\u{65}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{72}\u{6f}\u{6c}\u{20}\u{6d}\u{65}\u{73}\u{73}\u{61}\u{67}\u{65}\u{73}\u{a}\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{40}\u{6f}\u{66}\u{66}\u{22}\u{29}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{74}\u{68}\u{69}\u{73}\u{20}\u{6f}\u{6e}\u{65}\u{20}\u{69}\u{73}\u{a}\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{40}\u{6f}\u{6e}\u{22}\u{2c}\u{20}\u{22}\u{59}\u{59}\u{59}\u{22}\u{2c}\u{20}\u{22}\u{40}\u{6f}\u{6e}\u{22}\u{29}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{72}\u{6f}\u{6c}\u{2c}\u{20}\u{62}\u{75}\u{74}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{20}\u{69}\u{73}\u{20}\u{6f}\u{66}\u{66}\u{a}\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{40}\u{6f}\u{66}\u{66}\u{22}\u{29}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{6b}\u{65}\u{65}\u{70}\u{20}\u{69}\u{74}\u{20}\u{6f}\u{66}\u{66}\u{a}\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{40}\u{6f}\u{6e}\u{22}\u{29}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}\u{73}\u{a}\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{22}\u{2c}\u{20}\u{22}\u{40}\u{6f}\u{6e}\u{22}\u{29}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{61}\u{67}\u{61}\u{69}\u{6e}\u{2c}\u{20}\u{6e}\u{6f}\u{20}\u{63}\u{6f}\u{6e}\u{74}\u{72}\u{6f}\u{6c}\u{2c}\u{20}\u{72}\u{65}\u{61}\u{6c}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}\u{a}\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{40}\u{6f}\u{6e}\u{22}\u{29}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{6b}\u{65}\u{65}\u{70}\u{20}\u{69}\u{74}\u{20}\u{22}\u{73}\u{74}\u{61}\u{72}\u{74}\u{65}\u{64}\u{22}\u{a}\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{5a}\u{22}\u{2c}\u{20}\u{22}\u{5a}\u{22}\u{2c}\u{20}\u{22}\u{5a}\u{22}\u{29}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{6f}\u{6e}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}\u{a}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{57}\u{20}\u{25}\u{73}\u{20}\u{32}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{4c}\u{75}\u{61}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}\u{3a}\u{20}\u{40}\u{6f}\u{66}\u{66}\u{58}\u{58}\u{58}\u{40}\u{6f}\u{66}\u{66}\u{a}\u{4c}\u{75}\u{61}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}\u{3a}\u{20}\u{40}\u{6f}\u{6e}\u{a}\u{4c}\u{75}\u{61}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}\u{3a}\u{20}\u{5a}\u{5a}\u{5a}\u{a}")
prepfile("\u{77}\u{61}\u{72}\u{6e}\u{28}\u{22}\u{40}\u{61}\u{6c}\u{6c}\u{6f}\u{77}\u{22}\u{29}\u{a}\u{2d}\u{2d}\u{20}\u{63}\u{72}\u{65}\u{61}\u{74}\u{65}\u{20}\u{74}\u{77}\u{6f}\u{20}\u{6f}\u{62}\u{6a}\u{65}\u{63}\u{74}\u{73}\u{20}\u{74}\u{6f}\u{20}\u{62}\u{65}\u{20}\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{69}\u{7a}\u{65}\u{64}\u{20}\u{77}\u{68}\u{65}\u{6e}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{61}\u{74}\u{65}\u{a}\u{2d}\u{2d}\u{20}\u{74}\u{68}\u{65}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{74}\u{68}\u{65}\u{20}\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{69}\u{7a}\u{65}\u{72}\u{73}\u{20}\u{6d}\u{75}\u{73}\u{74}\u{20}\u{67}\u{65}\u{6e}\u{65}\u{72}\u{61}\u{74}\u{65}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}\u{73}\u{a}\u{75}\u{31}\u{20}\u{3d}\u{20}\u{73}\u{65}\u{74}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{28}\u{7b}\u{7d}\u{2c}\u{20}\u{7b}\u{5f}\u{5f}\u{67}\u{63}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{28}\u{22}\u{58}\u{59}\u{5a}\u{22}\u{29}\u{20}\u{65}\u{6e}\u{64}\u{7d}\u{29}\u{a}\u{75}\u{32}\u{20}\u{3d}\u{20}\u{73}\u{65}\u{74}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{28}\u{7b}\u{7d}\u{2c}\u{20}\u{7b}\u{5f}\u{5f}\u{67}\u{63}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{28}\u{22}\u{5a}\u{59}\u{58}\u{22}\u{29}\u{20}\u{65}\u{6e}\u{64}\u{7d}\u{29}\u{a}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{57}\u{20}\u{25}\u{73}\u{20}\u{32}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkprogout("\u{5a}\u{59}\u{58}\u{29}\u{a}\u{58}\u{59}\u{5a}\u{29}\u{a}")
prepfile("\u{2d}\u{2d}\u{20}\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{62}\u{65}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{65}\u{64}\u{20}\u{6c}\u{61}\u{73}\u{74}\u{a}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{22}\u{63}\u{72}\u{65}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{31}\u{22}\u{29}\u{a}\u{73}\u{65}\u{74}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{28}\u{7b}\u{7d}\u{2c}\u{20}\u{7b}\u{5f}\u{5f}\u{67}\u{63}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{31}\u{29}\u{20}\u{65}\u{6e}\u{64}\u{7d}\u{29}\u{a}\u{a}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{22}\u{63}\u{72}\u{65}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{32}\u{22}\u{29}\u{a}\u{73}\u{65}\u{74}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{28}\u{7b}\u{7d}\u{2c}\u{20}\u{7b}\u{5f}\u{5f}\u{67}\u{63}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{a}\u{20}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{22}\u{32}\u{22}\u{29}\u{a}\u{20}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{22}\u{63}\u{72}\u{65}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{33}\u{22}\u{29}\u{a}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{74}\u{68}\u{69}\u{73}\u{20}\u{66}\u{69}\u{6e}\u{61}\u{6c}\u{69}\u{7a}\u{65}\u{72}\u{20}\u{73}\u{68}\u{6f}\u{75}\u{6c}\u{64}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{65}\u{64}\u{2c}\u{20}\u{61}\u{73}\u{20}\u{6f}\u{62}\u{6a}\u{65}\u{63}\u{74}\u{20}\u{77}\u{69}\u{6c}\u{6c}\u{20}\u{62}\u{65}\u{a}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{63}\u{72}\u{65}\u{61}\u{74}\u{65}\u{64}\u{20}\u{61}\u{66}\u{74}\u{65}\u{72}\u{20}\u{27}\u{6c}\u{75}\u{61}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{27}\u{20}\u{68}\u{61}\u{73}\u{20}\u{62}\u{65}\u{65}\u{6e}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{65}\u{64}\u{a}\u{20}\u{20}\u{73}\u{65}\u{74}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{28}\u{7b}\u{7d}\u{2c}\u{20}\u{7b}\u{5f}\u{5f}\u{67}\u{63}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{33}\u{29}\u{20}\u{65}\u{6e}\u{64}\u{7d}\u{29}\u{a}\u{20}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{63}\u{6f}\u{6c}\u{6c}\u{65}\u{63}\u{74}\u{67}\u{61}\u{72}\u{62}\u{61}\u{67}\u{65}\u{28}\u{29}\u{29}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{63}\u{61}\u{6c}\u{6c}\u{20}\u{63}\u{6f}\u{6c}\u{6c}\u{65}\u{63}\u{74}\u{6f}\u{72}\u{20}\u{68}\u{65}\u{72}\u{65}\u{a}\u{20}\u{20}\u{6f}\u{73}\u{2e}\u{65}\u{78}\u{69}\u{74}\u{28}\u{30}\u{2c}\u{20}\u{74}\u{72}\u{75}\u{65}\u{29}\u{a}\u{65}\u{6e}\u{64}\u{7d}\u{29}\u{a}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{57}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{63}\u{72}\u{65}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{31}\u{a}\u{63}\u{72}\u{65}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{32}\u{a}\u{32}\u{a}\u{63}\u{72}\u{65}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{33}\u{a}\u{6e}\u{69}\u{6c}\u{a}\u{31}\u{a}")
prepfile("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{28}\u{7b}\u{2e}\u{2e}\u{2e}\u{7d}\u{29}\u{5b}\u{33}\u{30}\u{5d}\u{29}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,string.rep("\u{20}\u{61}",0x1e),out)
checkout("\u{61}\u{a}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{22}\u{2d}\u{65}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{31}\u{29}\u{22}\u{20}\u{2d}\u{65}\u{61}\u{3d}\u{33}\u{20}\u{2d}\u{65}\u{20}\u{22}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{61}\u{29}\u{22}\u{20}\u{3e}\u{20}\u{25}\u{73}",out)
checkout("\u{31}\u{a}\u{33}\u{a}")
prepfile("\u{28}\u{36}\u{2a}\u{32}\u{2d}\u{36}\u{29}\u{20}\u{2d}\u{2d}\u{20}\u{3d}\u{3d}\u{3d}\u{a}\u{61}\u{20}\u{3d}\u{a}\u{31}\u{30}\u{a}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{61}\u{29}\u{a}\u{61}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}\u{22}\u{5f}\u{50}\u{52}\u{4f}\u{4d}\u{50}\u{54}\u{3d}\u{27}\u{27}\u{20}\u{5f}\u{50}\u{52}\u{4f}\u{4d}\u{50}\u{54}\u{32}\u{3d}\u{27}\u{27}\u{22}\u{20}\u{2d}\u{69}\u{20}\u{3c}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkprogout("\u{36}\u{a}\u{31}\u{30}\u{a}\u{31}\u{30}\u{a}\u{a}")
prepfile("\u{61}\u{20}\u{3d}\u{20}\u{5b}\u{5b}\u{62}\u{a}\u{63}\u{a}\u{64}\u{a}\u{65}\u{5d}\u{5d}\u{a}\u{3d}\u{61}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}\u{22}\u{5f}\u{50}\u{52}\u{4f}\u{4d}\u{50}\u{54}\u{3d}\u{27}\u{27}\u{20}\u{5f}\u{50}\u{52}\u{4f}\u{4d}\u{50}\u{54}\u{32}\u{3d}\u{27}\u{27}\u{22}\u{20}\u{2d}\u{69}\u{20}\u{3c}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkprogout("\u{62}\u{a}\u{63}\u{a}\u{64}\u{a}\u{65}\u{a}\u{a}")
local prompt = "\u{61}\u{6c}\u{6f}"
prepfile("\u{20}\u{2d}\u{2d}\u{a}\u{61}\u{20}\u{3d}\u{20}\u{32}\u{a}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{22}\u{2d}\u{65}\u{5f}\u{50}\u{52}\u{4f}\u{4d}\u{50}\u{54}\u{3d}\u{27}\u{25}\u{73}\u{27}\u{22}\u{20}\u{2d}\u{69}\u{20}\u{3c}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prompt,prog,out)
local t = getoutput()
assert(string.find(t,(prompt .. ("\u{2e}\u{2a}" .. (prompt .. ("\u{2e}\u{2a}" .. prompt))))))
prepfile("\u{20}\u{2d}\u{2d}\u{a}\u{61}\u{20}\u{3d}\u{20}\u{32}\u{a}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{69}\u{20}\u{3c}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
local t = getoutput()
prompt="\u{3e}\u{20}"
assert(string.find(t,(prompt .. ("\u{2e}\u{2a}" .. (prompt .. ("\u{2e}\u{2a}" .. prompt))))))
prompt="\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{43}\u{20}\u{3d}\u{20}\u{30}\u{3b}\u{5f}\u{50}\u{52}\u{4f}\u{4d}\u{50}\u{54}\u{3d}\u{73}\u{65}\u{74}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{28}\u{7b}\u{7d}\u{2c}\u{7b}\u{5f}\u{5f}\u{74}\u{6f}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{43}\u{20}\u{3d}\u{20}\u{43}\u{20}\u{2b}\u{20}\u{31}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{43}\u{20}\u{65}\u{6e}\u{64}\u{7d}\u{29}"
prepfile("\u{20}\u{2d}\u{2d}\u{a}\u{61}\u{20}\u{3d}\u{20}\u{32}\u{a}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}\u{20}\u{22}\u{25}\u{73}\u{22}\u{20}\u{2d}\u{69}\u{20}\u{3c}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prompt,prog,out)
local t = getoutput()
assert(string.find(t,"\u{31}\u{20}\u{2d}\u{2d}\u{a}\u{32}\u{61}\u{20}\u{3d}\u{20}\u{32}\u{a}\u{33}\u{a}",0x1,true))
prepfile("\u{64}\u{65}\u{62}\u{75}\u{67}\u{20}\u{3d}\u{20}\u{72}\u{65}\u{71}\u{75}\u{69}\u{72}\u{65}\u{20}\u{22}\u{64}\u{65}\u{62}\u{75}\u{67}\u{22}\u{a}\u{6d}\u{20}\u{3d}\u{20}\u{7b}\u{78}\u{3d}\u{30}\u{7d}\u{a}\u{73}\u{65}\u{74}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{28}\u{6d}\u{2c}\u{20}\u{7b}\u{5f}\u{5f}\u{74}\u{6f}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{28}\u{78}\u{29}\u{a}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{74}\u{6f}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{28}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{67}\u{65}\u{74}\u{69}\u{6e}\u{66}\u{6f}\u{28}\u{34}\u{29}\u{2e}\u{63}\u{75}\u{72}\u{72}\u{65}\u{6e}\u{74}\u{6c}\u{69}\u{6e}\u{65}\u{20}\u{2b}\u{20}\u{78}\u{2e}\u{78}\u{29}\u{a}\u{65}\u{6e}\u{64}\u{7d}\u{29}\u{a}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{28}\u{6d}\u{29}\u{a}")
NoRun((progname .. "\u{3a}\u{20}\u{36}\u{a}"),"\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile("\u{65}\u{72}\u{72}\u{6f}\u{72}\u{7b}\u{7d}")
NoRun("\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{6f}\u{62}\u{6a}\u{65}\u{63}\u{74}\u{20}\u{69}\u{73}\u{20}\u{61}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}","\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
local s = "\u{20}\u{2d}\u{2d}\u{a}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{20}\u{28}\u{20}\u{78}\u{20}\u{29}\u{a}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{5b}\u{5b}\u{a}\u{78}\u{75}\u{78}\u{75}\u{a}\u{5d}\u{5d}\u{a}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{62}\u{20}\u{3d}\u{20}\u{22}\u{5c}\u{a}\u{78}\u{75}\u{78}\u{75}\u{5c}\u{6e}\u{22}\u{a}\u{20}\u{20}\u{69}\u{66}\u{20}\u{78}\u{20}\u{3d}\u{3d}\u{20}\u{31}\u{31}\u{20}\u{74}\u{68}\u{65}\u{6e}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}\u{20}\u{2b}\u{20}\u{31}\u{32}\u{20}\u{2c}\u{20}\u{32}\u{20}\u{2b}\u{20}\u{32}\u{30}\u{20}\u{65}\u{6e}\u{64}\u{20}\u{20}\u{2d}\u{2d}\u{5b}\u{5b}\u{20}\u{74}\u{65}\u{73}\u{74}\u{20}\u{6d}\u{75}\u{6c}\u{74}\u{69}\u{70}\u{6c}\u{65}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{73}\u{20}\u{5d}\u{5d}\u{a}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}\u{20}\u{2b}\u{20}\u{31}\u{a}\u{20}\u{20}\u{2d}\u{2d}\u{5c}\u{5c}\u{a}\u{65}\u{6e}\u{64}\u{a}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{28}\u{20}\u{66}\u{28}\u{20}\u{31}\u{30}\u{30}\u{20}\u{29}\u{20}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{20}\u{61}\u{20}\u{3d}\u{3d}\u{20}\u{62}\u{20}\u{29}\u{a}\u{64}\u{6f}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{28}\u{20}\u{31}\u{31}\u{20}\u{29}\u{20}\u{65}\u{6e}\u{64}\u{20}\u{20}"
s=string.gsub(s,"\u{20}","\u{a}\u{a}")
prepfile(s)
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}\u{22}\u{5f}\u{50}\u{52}\u{4f}\u{4d}\u{50}\u{54}\u{3d}\u{27}\u{27}\u{20}\u{5f}\u{50}\u{52}\u{4f}\u{4d}\u{50}\u{54}\u{32}\u{3d}\u{27}\u{27}\u{22}\u{20}\u{2d}\u{69}\u{20}\u{3c}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkprogout("\u{31}\u{30}\u{31}\u{a}\u{31}\u{33}\u{9}\u{32}\u{32}\u{a}\u{a}")
prepfile("\u{23}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{20}\u{69}\u{6e}\u{20}\u{31}\u{73}\u{74}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{20}\u{77}\u{69}\u{74}\u{68}\u{6f}\u{75}\u{74}\u{20}\u{5c}\u{6e}\u{20}\u{61}\u{74}\u{20}\u{74}\u{68}\u{65}\u{20}\u{65}\u{6e}\u{64}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile(("\u{23}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{a}" .. string.dump(load("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{33}\u{29}"))),true)
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkout("\u{33}\u{a}")
prepfile(string.format("\u{69}\u{6f}\u{2e}\u{6f}\u{75}\u{74}\u{70}\u{75}\u{74}\u{28}\u{25}\u{71}\u{29}\u{3b}\u{20}\u{69}\u{6f}\u{2e}\u{77}\u{72}\u{69}\u{74}\u{65}\u{28}\u{27}\u{61}\u{6c}\u{6f}\u{27}\u{29}",out))
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
checkout("\u{61}\u{6c}\u{6f}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{76}\u{20}\u{20}\u{2d}\u{65}\u{22}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{27}\u{68}\u{65}\u{6c}\u{6c}\u{6f}\u{27}\u{22}\u{20}\u{3e}\u{20}\u{25}\u{73}",out)
t=getoutput()
assert(string.find(t,"\u{50}\u{55}\u{43}\u{25}\u{2d}\u{52}\u{69}\u{6f}\u{a}\u{68}\u{65}\u{6c}\u{6c}\u{6f}"))
prepfile("\u{6f}\u{73}\u{2e}\u{65}\u{78}\u{69}\u{74}\u{28}\u{6e}\u{69}\u{6c}\u{2c}\u{20}\u{74}\u{72}\u{75}\u{65}\u{29}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile("\u{6f}\u{73}\u{2e}\u{65}\u{78}\u{69}\u{74}\u{28}\u{30}\u{2c}\u{20}\u{74}\u{72}\u{75}\u{65}\u{29}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile("\u{6f}\u{73}\u{2e}\u{65}\u{78}\u{69}\u{74}\u{28}\u{74}\u{72}\u{75}\u{65}\u{2c}\u{20}\u{74}\u{72}\u{75}\u{65}\u{29}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile("\u{6f}\u{73}\u{2e}\u{65}\u{78}\u{69}\u{74}\u{28}\u{31}\u{2c}\u{20}\u{74}\u{72}\u{75}\u{65}\u{29}")
NoRun("","\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile("\u{6f}\u{73}\u{2e}\u{65}\u{78}\u{69}\u{74}\u{28}\u{66}\u{61}\u{6c}\u{73}\u{65}\u{2c}\u{20}\u{74}\u{72}\u{75}\u{65}\u{29}")
NoRun("","\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}",prog)
prepfile("\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3c}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{3e}\u{20}\u{3d}\u{20}\u{73}\u{65}\u{74}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{28}\u{7b}\u{7d}\u{2c}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{7b}\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{73}\u{65}\u{6c}\u{66}\u{2c}\u{20}\u{65}\u{72}\u{72}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{65}\u{72}\u{72}\u{20}\u{3d}\u{3d}\u{20}\u{6e}\u{69}\u{6c}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{22}\u{4f}\u{6b}\u{22}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{7d}\u{29}\u{a}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{65}\u{31}\u{20}\u{3c}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{3e}\u{20}\u{3d}\u{20}\u{73}\u{65}\u{74}\u{6d}\u{65}\u{74}\u{61}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{28}\u{7b}\u{7d}\u{2c}\u{20}\u{7b}\u{5f}\u{5f}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{31}\u{32}\u{30}\u{29}\u{20}\u{65}\u{6e}\u{64}\u{7d}\u{29}\u{a}\u{20}\u{20}\u{6f}\u{73}\u{2e}\u{65}\u{78}\u{69}\u{74}\u{28}\u{74}\u{72}\u{75}\u{65}\u{2c}\u{20}\u{74}\u{72}\u{75}\u{65}\u{29}\u{a}")
RUN("\u{6c}\u{75}\u{61}\u{20}\u{25}\u{73}\u{20}\u{3e}\u{20}\u{25}\u{73}",prog,out)
checkprogout("\u{31}\u{32}\u{30}\u{a}\u{4f}\u{6b}\u{a}")
assert(os.remove(prog))
assert(os.remove(otherprog))
assert((not os.remove(out)))
NoRun("\u{75}\u{6e}\u{72}\u{65}\u{63}\u{6f}\u{67}\u{6e}\u{69}\u{7a}\u{65}\u{64}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{27}\u{2d}\u{68}\u{27}","\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{68}")
NoRun("\u{75}\u{6e}\u{72}\u{65}\u{63}\u{6f}\u{67}\u{6e}\u{69}\u{7a}\u{65}\u{64}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{27}\u{2d}\u{2d}\u{2d}\u{27}","\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{2d}\u{2d}")
NoRun("\u{75}\u{6e}\u{72}\u{65}\u{63}\u{6f}\u{67}\u{6e}\u{69}\u{7a}\u{65}\u{64}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{27}\u{2d}\u{45}\u{78}\u{27}","\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{45}\u{78}")
NoRun("\u{75}\u{6e}\u{72}\u{65}\u{63}\u{6f}\u{67}\u{6e}\u{69}\u{7a}\u{65}\u{64}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{27}\u{2d}\u{76}\u{76}\u{27}","\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{76}\u{76}")
NoRun("\u{75}\u{6e}\u{72}\u{65}\u{63}\u{6f}\u{67}\u{6e}\u{69}\u{7a}\u{65}\u{64}\u{20}\u{6f}\u{70}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{27}\u{2d}\u{69}\u{76}\u{27}","\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{69}\u{76}")
NoRun("\u{27}\u{2d}\u{65}\u{27}\u{20}\u{6e}\u{65}\u{65}\u{64}\u{73}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}","\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}")
NoRun("\u{73}\u{79}\u{6e}\u{74}\u{61}\u{78}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}","\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{65}\u{20}\u{61}")
NoRun("\u{27}\u{2d}\u{6c}\u{27}\u{20}\u{6e}\u{65}\u{65}\u{64}\u{73}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}","\u{6c}\u{75}\u{61}\u{20}\u{2d}\u{6c}")
if T then
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}\u{27}\u{20}\u{74}\u{6f}\u{20}\u{63}\u{72}\u{65}\u{61}\u{74}\u{65}\u{20}\u{61}\u{20}\u{73}\u{74}\u{61}\u{74}\u{65}")
NoRun("\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}","\u{65}\u{6e}\u{76}\u{20}\u{4d}\u{45}\u{4d}\u{4c}\u{49}\u{4d}\u{49}\u{54}\u{3d}\u{31}\u{30}\u{30}\u{20}\u{6c}\u{75}\u{61}")
warn("\u{40}\u{73}\u{74}\u{6f}\u{72}\u{65}")
warn("\u{40}\u{31}\u{32}\u{33}","\u{34}\u{35}\u{36}","\u{37}\u{38}\u{39}")
assert((_WARN == "\u{40}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}"))
;
_WARN=false
warn("\u{7a}\u{69}\u{70}","","\u{20}","\u{7a}\u{61}\u{70}")
assert((_WARN == "\u{7a}\u{69}\u{70}\u{20}\u{7a}\u{61}\u{70}"))
;
_WARN=false
warn("\u{5a}\u{49}\u{50}","","\u{20}","\u{5a}\u{41}\u{50}")
assert((_WARN == "\u{5a}\u{49}\u{50}\u{20}\u{5a}\u{41}\u{50}"))
;
_WARN=false
warn("\u{40}\u{6e}\u{6f}\u{72}\u{6d}\u{61}\u{6c}")
end
do
local st,msg = pcall(warn)
assert(string.find(msg,"\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}"))
st,msg=pcall(warn,"\u{53}\u{48}\u{4f}\u{55}\u{4c}\u{44}\u{20}\u{4e}\u{4f}\u{54}\u{20}\u{41}\u{50}\u{50}\u{45}\u{41}\u{52}",{})
assert(string.find(msg,"\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}"))
end
print("\u{2b}")
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{43}\u{74}\u{72}\u{6c}\u{20}\u{43}")
do
local function kill
(pid)
return os.execute(string.format("\u{6b}\u{69}\u{6c}\u{6c}\u{20}\u{2d}\u{49}\u{4e}\u{54}\u{20}\u{25}\u{73}\u{20}\u{32}\u{3e}\u{20}\u{2f}\u{64}\u{65}\u{76}\u{2f}\u{6e}\u{75}\u{6c}\u{6c}",pid))
end
local function runback
(luaprg)
local shellprg = string.format("\u{25}\u{73}\u{20}\u{2d}\u{65}\u{20}\u{22}\u{25}\u{73}\u{22}\u{20}\u{26}\u{20}\u{65}\u{63}\u{68}\u{6f}\u{20}\u{24}\u{21}",progname,luaprg)
local f = io.popen(shellprg,"\u{72}")
local pid = f:read()
print(("\u{28}\u{69}\u{66}\u{20}\u{74}\u{65}\u{73}\u{74}\u{20}\u{66}\u{61}\u{69}\u{6c}\u{73}\u{20}\u{6e}\u{6f}\u{77}\u{2c}\u{20}\u{69}\u{74}\u{20}\u{6d}\u{61}\u{79}\u{20}\u{6c}\u{65}\u{61}\u{76}\u{65}\u{20}\u{61}\u{20}\u{4c}\u{75}\u{61}\u{20}\u{73}\u{63}\u{72}\u{69}\u{70}\u{74}\u{20}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}\u{20}\u{69}\u{6e}\u{20}\u{62}\u{61}\u{63}\u{6b}\u{67}\u{72}\u{6f}\u{75}\u{6e}\u{64}\u{2c}\u{20}\u{70}\u{69}\u{64}\u{20}" .. (pid .. "\u{29}")))
return f,pid
end
local f,pid = runback("\u{20}\u{20}\u{20}\u{20}\u{70}\u{63}\u{61}\u{6c}\u{6c}\u{28}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{31}\u{32}\u{29}\u{3b}\u{20}\u{77}\u{68}\u{69}\u{6c}\u{65}\u{20}\u{74}\u{72}\u{75}\u{65}\u{20}\u{64}\u{6f}\u{20}\u{65}\u{6e}\u{64}\u{20}\u{65}\u{6e}\u{64}\u{29}\u{3b}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{34}\u{32}\u{29}")
assert((f:read() == "\u{31}\u{32}"))
kill(pid)
assert((f:read() == "\u{34}\u{32}"))
assert(f:close())
print("\u{64}\u{6f}\u{6e}\u{65}")
local f,pid = runback("\u{20}\u{20}\u{20}\u{20}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{31}\u{35}\u{29}\u{3b}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{2e}\u{66}\u{69}\u{6e}\u{64}\u{28}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{2e}\u{72}\u{65}\u{70}\u{28}\u{27}\u{61}\u{27}\u{2c}\u{20}\u{31}\u{30}\u{30}\u{30}\u{30}\u{30}\u{29}\u{2c}\u{20}\u{27}\u{2e}\u{2a}\u{62}\u{27}\u{29}")
assert((f:read() == "\u{31}\u{35}"))
assert(os.execute("\u{73}\u{6c}\u{65}\u{65}\u{70}\u{20}\u{31}"))
local n = 0x64
for i = 0x0, 0x64
do
if (not kill(pid)) then
n=i
break
end
end
assert(f:close())
assert((n >= 0x2))
print(string.format("\u{64}\u{6f}\u{6e}\u{65}\u{20}\u{28}\u{77}\u{69}\u{74}\u{68}\u{20}\u{25}\u{64}\u{20}\u{6b}\u{69}\u{6c}\u{6c}\u{73}\u{29}",n))
end
print("\u{4f}\u{4b}")