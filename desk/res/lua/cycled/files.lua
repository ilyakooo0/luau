local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local maxint = math.maxinteger
assert((type(os.getenv("\u{50}\u{41}\u{54}\u{48}")) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"))
assert((io.input(io.stdin) == io.stdin))
assert(not pcall(io.input,"\u{6e}\u{6f}\u{6e}\u{2d}\u{65}\u{78}\u{69}\u{73}\u{74}\u{65}\u{6e}\u{74}\u{2d}\u{66}\u{69}\u{6c}\u{65}"))
assert((io.output(io.stdout) == io.stdout))
local function testerr
(msg,f, ...)
local stat,err = pcall(f,...)
return (not (stat and string.find(err,msg,0x1,true)))
end
local function checkerr
(msg,f, ...)
assert(testerr(msg,f,...))
end
assert(not (io.close(io.stdin) and not (io.stdout:close() and not io.stderr:close())))
checkerr("\u{67}\u{6f}\u{74}\u{20}\u{6e}\u{6f}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}",io.stdin.close)
assert(((type(io.input()) == "\u{75}\u{73}\u{65}\u{72}\u{64}\u{61}\u{74}\u{61}") and (io.type(io.output()) == "\u{66}\u{69}\u{6c}\u{65}")))
assert(((type(io.stdin) == "\u{75}\u{73}\u{65}\u{72}\u{64}\u{61}\u{74}\u{61}") and (io.type(io.stderr) == "\u{66}\u{69}\u{6c}\u{65}")))
assert(not io.type(0x8))
local a = {}
;
setmetatable(a,{})
assert(not io.type(a))
assert((getmetatable(io.input()).__name == "\u{46}\u{49}\u{4c}\u{45}\u{2a}"))
local a,b,c = io.open("\u{78}\u{75}\u{78}\u{75}\u{5f}\u{6e}\u{61}\u{6f}\u{5f}\u{65}\u{78}\u{69}\u{73}\u{74}\u{65}")
assert(not ((a and (type(b) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (type(c) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}")))
a,b,c=io.open("\u{2f}\u{61}\u{2f}\u{62}\u{2f}\u{63}\u{2f}\u{64}","\u{77}")
assert(not ((a and (type(b) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (type(c) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}")))
local file = os.tmpname()
local f,msg = io.open(file,"\u{77}")
if not f then
((Message or print))("\u{27}\u{6f}\u{73}\u{2e}\u{74}\u{6d}\u{70}\u{6e}\u{61}\u{6d}\u{65}\u{27}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{20}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{6f}\u{70}\u{65}\u{6e}\u{3b}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}")
else
f:close()
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{69}\u{2f}\u{6f}")
local otherfile = os.tmpname()
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6d}\u{6f}\u{64}\u{65}",io.open,file,"\u{72}\u{77}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6d}\u{6f}\u{64}\u{65}",io.open,file,"\u{72}\u{62}\u{2b}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6d}\u{6f}\u{64}\u{65}",io.open,file,"\u{72}\u{2b}\u{62}\u{6b}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6d}\u{6f}\u{64}\u{65}",io.open,file,"")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6d}\u{6f}\u{64}\u{65}",io.open,file,"\u{2b}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6d}\u{6f}\u{64}\u{65}",io.open,file,"\u{62}")
assert(io.open(file,"\u{72}\u{2b}\u{62}")):close()
assert(io.open(file,"\u{72}\u{2b}")):close()
assert(io.open(file,"\u{72}\u{62}")):close()
assert(os.setlocale("\u{43}","\u{61}\u{6c}\u{6c}"))
io.input(io.stdin)
;
io.output(io.stdout)
;
os.remove(file)
assert(not loadfile(file))
checkerr("",dofile,file)
assert(not io.open(file))
io.output(file)
assert((io.output() ~= io.stdout))
if not _port then
local status,msg,code = io.stdin:seek("\u{73}\u{65}\u{74}",0x3e8)
assert(not ((status and (type(msg) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (type(code) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}")))
end
assert((io.output():seek() == 0x0))
assert((io.write("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}"):seek() == string.len("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}")))
assert((io.output():seek("\u{63}\u{75}\u{72}",- 0x3) == (string.len("\u{61}\u{6c}\u{6f}\u{20}\u{61}\u{6c}\u{6f}") - 0x3)))
assert(io.write("\u{6a}\u{6f}\u{61}\u{6f}"))
assert((io.output():seek("\u{65}\u{6e}\u{64}") == string.len("\u{61}\u{6c}\u{6f}\u{20}\u{6a}\u{6f}\u{61}\u{6f}")))
assert((io.output():seek("\u{73}\u{65}\u{74}") == 0x0))
assert(io.write("\u{22}\u{61}\u{6c}\u{6f}\u{22}","\u{7b}\u{61}\u{7d}\u{a}","\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{a}","\u{74}\u{68}\u{69}\u{72}\u{64}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{20}\u{a}"))
assert(io.write("\u{58}\u{66}\u{6f}\u{75}\u{72}\u{74}\u{68}\u{5f}\u{6c}\u{69}\u{6e}\u{65}"))
io.output(io.stdout)
collectgarbage()
assert(((io.input() == io.stdin) and rawequal(io.output(),io.stdout)))
print("\u{2b}")
collectgarbage()
for i = 0x1, 0x78
do
for i = 0x1, 0x5
do
io.input(file)
assert(io.open(file,"\u{72}"))
io.lines(file)
end
collectgarbage()
end
io.input():close()
io.close()
assert(os.rename(file,otherfile))
assert(not os.rename(file,otherfile))
io.output(io.open(otherfile,"\u{61}\u{62}"))
assert(io.write("\u{a}\u{a}\u{9}\u{9}\u{20}\u{20}",0xd7a,"\u{a}"))
;
io.close()
do
local F = nil
do
local f <close> = assert(io.open(file,"\u{77}"))
F=f
end
assert((tostring(F) == "\u{66}\u{69}\u{6c}\u{65}\u{20}\u{28}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{29}"))
end
assert(os.remove(file))
do
local f <close> = assert(io.open(file,"\u{77}"))
f:write(maxint,"\u{a}")
f:write(string.format("\u{30}\u{58}\u{25}\u{78}\u{a}",maxint))
f:write("\u{30}\u{78}\u{41}\u{42}\u{43}\u{70}\u{2d}\u{33}","\u{a}")
f:write(0x0,"\u{a}")
f:write(- maxint,"\u{a}")
f:write(string.format("\u{30}\u{78}\u{25}\u{58}\u{a}",- maxint))
f:write("\u{2d}\u{30}\u{78}\u{41}\u{42}\u{43}\u{70}\u{2d}\u{33}","\u{a}")
assert(f:close())
local f <close> = assert(io.open(file,"\u{72}"))
assert((f:read("\u{6e}") == maxint))
assert((f:read("\u{6e}") == maxint))
assert((f:read("\u{6e}") == 343.5))
assert((f:read("\u{6e}") == 0x0))
assert((f:read("\u{2a}\u{6e}") == - maxint))
assert((f:read("\u{6e}") == - maxint))
assert((f:read("\u{2a}\u{6e}") == - 343.5))
end
assert(os.remove(file))
do
local f <close> = assert(io.open(file,"\u{77}"))
f:write("\u{61}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{a}\u{61}\u{6e}\u{6f}\u{74}\u{68}\u{65}\u{72}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{a}\u{31}\u{32}\u{33}\u{34}\u{a}\u{33}\u{2e}\u{34}\u{35}\u{a}\u{6f}\u{6e}\u{65}\u{a}\u{74}\u{77}\u{6f}\u{a}\u{74}\u{68}\u{72}\u{65}\u{65}\u{a}")
local l1,l2,l3,l4,n1,n2,c,dummy
assert(f:close())
local f <close> = assert(io.open(file,"\u{72}"))
l1,l2,n1,n2,dummy=f:read("\u{6c}","\u{4c}","\u{6e}","\u{6e}")
assert((((((l1 == "\u{61}\u{20}\u{6c}\u{69}\u{6e}\u{65}") and (l2 == "\u{61}\u{6e}\u{6f}\u{74}\u{68}\u{65}\u{72}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{a}")) and (n1 == 0x4d2)) and (n2 == 3.45)) and (dummy == nil)))
assert(f:close())
local f <close> = assert(io.open(file,"\u{72}"))
l1,l2,n1,n2,c,l3,l4,dummy=f:read(0x7,"\u{6c}","\u{6e}","\u{6e}",0x1,"\u{6c}","\u{6c}")
assert(((((((((l1 == "\u{61}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{a}") and (l2 == "\u{61}\u{6e}\u{6f}\u{74}\u{68}\u{65}\u{72}\u{20}\u{6c}\u{69}\u{6e}\u{65}")) and (c == "\u{a}")) and (n1 == 0x4d2)) and (n2 == 3.45)) and (l3 == "\u{6f}\u{6e}\u{65}")) and (l4 == "\u{74}\u{77}\u{6f}")) and (dummy == nil)))
assert(f:close())
local f <close> = assert(io.open(file,"\u{72}"))
l1,n1,n2,dummy=f:read("\u{6c}","\u{6e}","\u{6e}","\u{6c}")
assert(((l1 == "\u{61}\u{20}\u{6c}\u{69}\u{6e}\u{65}") and not n1))
end
assert(os.remove(file))
f=assert(io.open(file,"\u{77}"))
f:write("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{2c}\u{20}\u{7a}\u{20}\u{3d}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{2e}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{28}\u{31}\u{30}\u{29}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{79}\u{20}\u{3d}\u{20}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{2e}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{28}\u{32}\u{30}\u{29}\u{a}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}\u{20}\u{2b}\u{20}\u{79}\u{20}\u{2a}\u{20}\u{7a}\u{a}")
assert(f:close())
f=coroutine.wrap(dofile)
assert((f(file) == 0xa))
assert((f(0x64,0x65) == 0x14))
assert((f(0xc8) == (0x64 + (0xc8 * 0x65))))
assert(os.remove(file))
f=assert(io.open(file,"\u{77}"))
f:write("\u{2d}\u{31}\u{32}\u{2e}\u{33}\u{2d}\u{9}\u{2d}\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{2b}\u{20}\u{20}\u{2e}\u{33}\u{7c}\u{35}\u{2e}\u{45}\u{2d}\u{33}\u{58}\u{20}\u{20}\u{2b}\u{32}\u{33}\u{34}\u{65}\u{2b}\u{31}\u{33}\u{45}\u{20}\u{30}\u{78}\u{44}\u{45}\u{41}\u{44}\u{42}\u{45}\u{45}\u{46}\u{44}\u{45}\u{41}\u{44}\u{42}\u{45}\u{45}\u{46}\u{78}\u{a}\u{30}\u{78}\u{31}\u{2e}\u{31}\u{33}\u{41}\u{70}\u{2b}\u{33}\u{65}\u{a}")
f:write("\u{31}\u{32}\u{33}\u{34}")
;
for i = 0x1, 0x3e8
do
f:write("\u{30}")
end
;
f:write("\u{a}")
f:write("\u{2e}\u{65}\u{2b}\u{9}\u{30}\u{2e}\u{65}\u{3b}\u{9}\u{2d}\u{2d}\u{3b}\u{20}\u{20}\u{30}\u{78}\u{58}\u{3b}\u{a}")
assert(f:close())
f=assert(io.open(file,"\u{72}"))
assert((f:read("\u{6e}") == - 12.3))
;
assert((f:read(0x1) == "\u{2d}"))
assert((f:read("\u{6e}") == - 0xffff))
;
assert((f:read(0x2) == "\u{2b}\u{20}"))
assert((f:read("\u{6e}") == 0.3))
;
assert((f:read(0x1) == "\u{7c}"))
assert((f:read("\u{6e}") == 5e-3))
;
assert((f:read(0x1) == "\u{58}"))
assert((f:read("\u{6e}") == 2.34e15))
;
assert((f:read(0x1) == "\u{45}"))
assert((f:read("\u{6e}") == 0xdeadbeefdeadbeef))
;
assert((f:read(0x2) == "\u{78}\u{a}"))
assert((f:read("\u{6e}") == 8.61328125))
;
assert((f:read(0x1) == "\u{65}"))
do
assert(not f:read("\u{6e}"))
local s = f:read("\u{4c}")
assert(string.find(s,"\u{5e}\u{30}\u{30}\u{2a}\u{a}\u{24}"))
end
assert(not f:read("\u{6e}"))
;
assert((f:read(0x2) == "\u{65}\u{2b}"))
assert(not f:read("\u{6e}"))
;
assert((f:read(0x1) == "\u{3b}"))
assert(not f:read("\u{6e}"))
;
assert((f:read(0x2) == "\u{2d}\u{3b}"))
assert(not f:read("\u{6e}"))
;
assert((f:read(0x1) == "\u{58}"))
assert(not f:read("\u{6e}"))
;
assert((f:read(0x1) == "\u{3b}"))
assert(not f:read("\u{6e}"))
;
assert(not f:read(0x0))
assert(f:close())
assert(os.remove(file))
assert(not pcall(io.lines,"\u{6e}\u{6f}\u{6e}\u{2d}\u{65}\u{78}\u{69}\u{73}\u{74}\u{65}\u{6e}\u{74}\u{2d}\u{66}\u{69}\u{6c}\u{65}"))
assert(os.rename(otherfile,file))
io.output(otherfile)
local n = 0x0
local f = io.lines(file)
while f() do
n=(n + 0x1)
end
;
assert((n == 0x6))
checkerr("\u{66}\u{69}\u{6c}\u{65}\u{20}\u{69}\u{73}\u{20}\u{61}\u{6c}\u{72}\u{65}\u{61}\u{64}\u{79}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}",f)
checkerr("\u{66}\u{69}\u{6c}\u{65}\u{20}\u{69}\u{73}\u{20}\u{61}\u{6c}\u{72}\u{65}\u{61}\u{64}\u{79}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}",f)
n=0x0
for l in io.lines(file)
do
io.write(l,"\u{a}")
;
n=(n + 0x1)
end
io.close()
assert((n == 0x6))
local f = assert(io.open(otherfile))
assert((io.type(f) == "\u{66}\u{69}\u{6c}\u{65}"))
io.output(file)
assert(not io.output():read())
n=0x0
for l in f:lines()
do
io.write(l,"\u{a}")
;
n=(n + 0x1)
end
assert((tostring(f):sub(0x1,0x5) == "\u{66}\u{69}\u{6c}\u{65}\u{20}"))
assert(f:close())
;
io.close()
assert((n == 0x6))
checkerr("\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{66}\u{69}\u{6c}\u{65}",io.close,f)
assert((tostring(f) == "\u{66}\u{69}\u{6c}\u{65}\u{20}\u{28}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{29}"))
assert((io.type(f) == "\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{66}\u{69}\u{6c}\u{65}"))
io.input(file)
f=io.open(otherfile):lines()
n=0x0
for l in io.lines()
do
assert((l == f()))
;
n=(n + 0x1)
end
f=nil
;
collectgarbage()
assert((n == 0x6))
assert(os.remove(otherfile))
do
io.output(otherfile)
io.write(string.rep("\u{61}",0x12c),"\u{a}")
io.close()
local t = {}
;
for i = 0x1, 0xfa
do
t[i]=0x1
end
t={io.lines(otherfile,table.unpack(t))()}
assert(# (((t == 0xfa) and (t[0x1] == "\u{61}")) and (t[# t] == "\u{61}")))
t[# (t + 0x1)]=0x1
checkerr("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}\u{73}",io.lines,otherfile,table.unpack(t))
collectgarbage()
assert(os.remove(otherfile))
end
io.input(file)
do
local a,b,c = io.input():write("\u{78}\u{75}\u{78}\u{75}")
assert(not ((a and (type(b) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (type(c) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}")))
end
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}",io.read,"\u{78}")
assert((io.read(0x0) == ""))
assert((io.read(0x5,"\u{6c}") == "\u{22}\u{61}\u{6c}\u{6f}\u{22}"))
assert((io.read(0x0) == ""))
assert((io.read() == "\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}\u{20}\u{6c}\u{69}\u{6e}\u{65}"))
local x = io.input():seek()
assert((io.read() == "\u{74}\u{68}\u{69}\u{72}\u{64}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{20}"))
assert(io.input():seek("\u{73}\u{65}\u{74}",x))
assert((io.read("\u{4c}") == "\u{74}\u{68}\u{69}\u{72}\u{64}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{20}\u{a}"))
assert((io.read(0x1) == "\u{58}"))
assert((io.read(string.len("\u{66}\u{6f}\u{75}\u{72}\u{74}\u{68}\u{5f}\u{6c}\u{69}\u{6e}\u{65}")) == "\u{66}\u{6f}\u{75}\u{72}\u{74}\u{68}\u{5f}\u{6c}\u{69}\u{6e}\u{65}"))
assert(io.input():seek("\u{63}\u{75}\u{72}",- string.len("\u{66}\u{6f}\u{75}\u{72}\u{74}\u{68}\u{5f}\u{6c}\u{69}\u{6e}\u{65}")))
assert((io.read() == "\u{66}\u{6f}\u{75}\u{72}\u{74}\u{68}\u{5f}\u{6c}\u{69}\u{6e}\u{65}"))
assert((io.read() == ""))
assert((io.read("\u{6e}") == 0xd7a))
assert((io.read(0x1) == "\u{a}"))
assert(not io.read(0x0))
assert(not io.read(0x1))
assert(not io.read(0x7530))
assert((({io.read(0x1)})[0x2] == undef))
assert(not io.read())
assert((({io.read()})[0x2] == undef))
assert(not io.read("\u{6e}"))
assert((({io.read("\u{6e}")})[0x2] == undef))
assert((io.read("\u{61}") == ""))
assert((io.read("\u{61}") == ""))
collectgarbage()
print("\u{2b}")
io.close(io.input())
checkerr("\u{20}\u{69}\u{6e}\u{70}\u{75}\u{74}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{20}\u{69}\u{73}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}",io.read)
assert(os.remove(file))
local t = "\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}"
for i = 0x1, 0xa
do
t=(t .. t)
;
end
assert((string.len(t) == (0xa * (0x2 ^ 0xa))))
io.output(file)
io.write("\u{61}\u{6c}\u{6f}"):write("\u{a}")
io.close()
checkerr("\u{20}\u{6f}\u{75}\u{74}\u{70}\u{75}\u{74}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{20}\u{69}\u{73}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}",io.write)
local f = io.open(file,"\u{61}\u{2b}\u{62}")
io.output(f)
collectgarbage()
assert(io.write(("\u{20}" .. (t .. "\u{20}"))))
assert(io.write("\u{3b}","\u{65}\u{6e}\u{64}\u{20}\u{6f}\u{66}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{a}"))
f:flush()
;
io.flush()
f:close()
print("\u{2b}")
io.input(file)
assert((io.read() == "\u{61}\u{6c}\u{6f}"))
assert((io.read(0x1) == "\u{20}"))
assert((io.read(string.len(t)) == t))
assert((io.read(0x1) == "\u{20}"))
assert(io.read(0x0))
assert((io.read("\u{61}") == "\u{3b}\u{65}\u{6e}\u{64}\u{20}\u{6f}\u{66}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{a}"))
assert(not io.read(0x0))
assert(io.close(io.input()))
do
local function ismsg
(m)
return (((type(m) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}") and not tonumber(m)))
end
local f = io.open(file,"\u{77}")
local r,m,c = f:read()
assert(not ((r and ismsg(m)) and (type(c) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}")))
assert(f:close())
f=io.open(file,"\u{72}")
r,m,c=f:write("\u{77}\u{68}\u{61}\u{74}\u{65}\u{76}\u{65}\u{72}")
assert(not ((r and ismsg(m)) and (type(c) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}")))
assert(f:close())
f=io.open(file,"\u{77}")
r,m=pcall(f:lines())
assert(((r == false) and ismsg(m)))
assert(f:close())
end
assert(os.remove(file))
io.output(file)
;
io.write("\u{a}\u{a}\u{6c}\u{69}\u{6e}\u{65}\u{a}\u{6f}\u{74}\u{68}\u{65}\u{72}"):close()
io.input(file)
assert((io.read("\u{4c}") == "\u{a}"))
assert((io.read("\u{4c}") == "\u{a}"))
assert((io.read("\u{4c}") == "\u{6c}\u{69}\u{6e}\u{65}\u{a}"))
assert((io.read("\u{4c}") == "\u{6f}\u{74}\u{68}\u{65}\u{72}"))
assert(not io.read("\u{4c}"))
io.input():close()
local f = assert(io.open(file))
local s = ""
for l in f:lines("\u{4c}")
do
s=(s .. l)
end
assert((s == "\u{a}\u{a}\u{6c}\u{69}\u{6e}\u{65}\u{a}\u{6f}\u{74}\u{68}\u{65}\u{72}"))
f:close()
io.input(file)
s=""
for l in io.lines(nil,"\u{4c}")
do
s=(s .. l)
end
assert((s == "\u{a}\u{a}\u{6c}\u{69}\u{6e}\u{65}\u{a}\u{6f}\u{74}\u{68}\u{65}\u{72}"))
io.input():close()
s=""
for l in io.lines(file,"\u{4c}")
do
s=(s .. l)
end
assert((s == "\u{a}\u{a}\u{6c}\u{69}\u{6e}\u{65}\u{a}\u{6f}\u{74}\u{68}\u{65}\u{72}"))
s=""
for l in io.lines(file,"\u{6c}")
do
s=(s .. l)
end
assert((s == "\u{6c}\u{69}\u{6e}\u{65}\u{6f}\u{74}\u{68}\u{65}\u{72}"))
io.output(file)
;
io.write("\u{61}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{20}\u{2b}\u{20}\u{33}\u{34}\u{a}\u{61}\u{20}\u{3d}\u{20}\u{32}\u{2a}\u{61}\u{a}\u{61}\u{20}\u{3d}\u{20}\u{2d}\u{61}\u{a}"):close()
local t = {}
assert(load(io.lines(file,"\u{4c}"),nil,nil,t))()
assert((t.a == - ((((0xa + 0x22)) * 0x2))))
do
local function gettoclose
(lv)
lv=(lv + 0x1)
local stvar = 0x0
for i = 0x1, 0x3e8
do
local n,v = debug.getlocal(lv,i)
if (n == "\u{28}\u{66}\u{6f}\u{72}\u{20}\u{73}\u{74}\u{61}\u{74}\u{65}\u{29}") then
stvar=(stvar + 0x1)
if (stvar == 0x4) then
return v
end
end
end
end
local f
for l in io.lines(file)
do
f=gettoclose(0x1)
assert((io.type(f) == "\u{66}\u{69}\u{6c}\u{65}"))
break
end
assert((io.type(f) == "\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{66}\u{69}\u{6c}\u{65}"))
f=nil
local function foo
(name)
for l in io.lines(name)
do
f=gettoclose(0x1)
assert((io.type(f) == "\u{66}\u{69}\u{6c}\u{65}"))
error(f)
end
end
local st,msg = pcall(foo,file)
assert(((st == false) and (io.type(msg) == "\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{64}\u{20}\u{66}\u{69}\u{6c}\u{65}")))
end
io.output(file)
;
io.write("\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{a}"):close()
for a,b in io.lines(file,0x1,0x1)
do
if (a == "\u{a}") then
assert(not b)
else
assert((tonumber(a) == (tonumber(b) - 0x1)))
end
end
for a,b,c in io.lines(file,0x1,0x2,"\u{61}")
do
assert((((a == "\u{30}") and (b == "\u{31}\u{32}")) and (c == "\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{a}")))
end
for a,b,c in io.lines(file,"\u{61}",0x0,0x1)
do
if (a == "") then
break
end
assert(((a == "\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{a}") and not (b and not c)))
end
collectgarbage()
io.output(file)
;
io.write("\u{30}\u{30}\u{a}\u{31}\u{30}\u{a}\u{32}\u{30}\u{a}\u{33}\u{30}\u{a}\u{34}\u{30}\u{a}"):close()
for a,b in io.lines(file,"\u{6e}","\u{6e}")
do
if (a == 0x28) then
assert(not b)
else
assert((a == (b - 0xa)))
end
end
io.output(file)
;
io.write("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{79}\u{a}\u{3d}\u{20}\u{58}\u{a}\u{58}\u{20}\u{3d}\u{a}\u{58}\u{20}\u{2a}\u{a}\u{32}\u{20}\u{2b}\u{a}\u{58}\u{3b}\u{a}\u{58}\u{20}\u{3d}\u{a}\u{58}\u{a}\u{2d}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{79}\u{3b}\u{a}"):close()
_G.X=0x1
assert(not load((io.lines(file))))
collectgarbage()
load((io.lines(file,"\u{4c}")))()
assert((_G.X == 0x2))
load((io.lines(file,0x1)))()
assert((_G.X == 0x4))
load((io.lines(file,0x3)))()
assert((_G.X == 0x8))
_G.X=nil
print("\u{2b}")
local x1 = "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{a}\u{a}\u{5c}\u{63}\u{6f}\u{6d}\u{20}\u{22}\u{22}\u{27}\u{27}\u{63}\u{6f}\u{69}\u{73}\u{61}\u{73}\u{20}\u{5b}\u{5b}\u{65}\u{73}\u{74}\u{72}\u{61}\u{6e}\u{68}\u{61}\u{73}\u{5d}\u{5d}\u{20}\u{5d}\u{5d}\u{27}"
io.output(file)
assert(io.write(string.format("\u{58}\u{32}\u{20}\u{3d}\u{20}\u{25}\u{71}\u{a}\u{2d}\u{2d}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{20}\u{77}\u{69}\u{74}\u{68}\u{6f}\u{75}\u{74}\u{20}\u{65}\u{6e}\u{64}\u{69}\u{6e}\u{67}\u{20}\u{45}\u{4f}\u{53}",x1)))
io.close()
assert(loadfile(file))()
assert((x1 == _G.X2))
_G.X2=nil
print("\u{2b}")
assert(os.remove(file))
assert(not os.remove(file))
assert(not os.remove(otherfile))
local function testloadfile
(s,expres)
io.output(file)
if s then
io.write(s)
end
io.close()
local res = assert(loadfile(file))()
assert(os.remove(file))
assert((res == expres))
end
testloadfile(nil,nil)
testloadfile("\u{23}\u{20}\u{61}\u{20}\u{6e}\u{6f}\u{6e}\u{2d}\u{65}\u{6e}\u{64}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}",nil)
testloadfile("\u{ef}\u{bb}\u{bf}\u{23}\u{20}\u{73}\u{6f}\u{6d}\u{65}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{a}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{32}\u{33}\u{34}",0xea)
testloadfile("\u{ef}\u{bb}\u{bf}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{32}\u{33}\u{39}",0xef)
testloadfile("\u{ef}\u{bb}\u{bf}",nil)
testloadfile("\u{23}\u{20}\u{61}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{a}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{72}\u{65}\u{71}\u{75}\u{69}\u{72}\u{65}\u{27}\u{64}\u{65}\u{62}\u{75}\u{67}\u{27}\u{2e}\u{67}\u{65}\u{74}\u{69}\u{6e}\u{66}\u{6f}\u{28}\u{31}\u{29}\u{2e}\u{63}\u{75}\u{72}\u{72}\u{65}\u{6e}\u{74}\u{6c}\u{69}\u{6e}\u{65}",0x2)
io.output(io.open(file,"\u{77}\u{62}"))
assert(io.write(string.dump(function ()
return 0xa,"\u{0}\u{61}\u{6c}\u{6f}\u{ff}","\u{68}\u{69}"
end)))
io.close()
a,b,c=assert(loadfile(file))()
assert((((a == 0xa) and (b == "\u{0}\u{61}\u{6c}\u{6f}\u{ff}")) and (c == "\u{68}\u{69}")))
assert(os.remove(file))
do
io.output(io.open(file,"\u{77}\u{62}"))
assert(io.write(string.dump(function ()
return 0x1
end)))
io.close()
f=assert(loadfile(file,"\u{62}",{}))
assert(((type(f) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}") and (f() == 0x1)))
assert(os.remove(file))
end
io.output(io.open(file,"\u{77}\u{62}"))
assert(io.write("\u{23}\u{74}\u{68}\u{69}\u{73}\u{20}\u{69}\u{73}\u{20}\u{61}\u{20}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{20}\u{66}\u{6f}\u{72}\u{20}\u{61}\u{20}\u{62}\u{69}\u{6e}\u{61}\u{72}\u{79}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{0}\u{a}",string.dump(function ()
return 0x14,"\u{0}\u{0}\u{0}"
end)))
io.close()
a,b,c=assert(loadfile(file))()
assert((((a == 0x14) and (b == "\u{0}\u{0}\u{0}")) and (c == nil)))
assert(os.remove(file))
do
local f = io.open(file,"\u{77}")
f:write("\u{20}\u{20}\u{20}\u{20}\u{69}\u{66}\u{20}\u{28}\u{2e}\u{2e}\u{2e}\u{29}\u{20}\u{74}\u{68}\u{65}\u{6e}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{31}\u{35}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{62}\u{2c}\u{20}\u{63}\u{2c}\u{20}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{65}\u{6c}\u{73}\u{65}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{5f}\u{45}\u{4e}\u{56}\u{a}\u{20}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}")
f:close()
local t = {["\u{62}"] = 0xc,["\u{63}"] = "\u{78}\u{75}\u{78}\u{75}",["\u{64}"] = print}
local f = assert(loadfile(file,"\u{74}",t))
local b,c,d = f(0x1)
assert(((((t.a == 0xf) and (b == 0xc)) and (c == t.c)) and (d == print)))
assert((f() == t))
f=assert(loadfile(file,"\u{74}",nil))
assert((f() == nil))
f=assert(loadfile(file))
assert((f() == _G))
assert(os.remove(file))
end
do
io.open(file,"\u{77}"):write("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}\u{30}"):close()
local s,m = loadfile(file,"\u{62}")
assert(not (s and string.find(m,"\u{61}\u{20}\u{74}\u{65}\u{78}\u{74}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}")))
io.open(file,"\u{77}"):write("\u{1b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}\u{30}"):close()
local s,m = loadfile(file,"\u{74}")
assert(not (s and string.find(m,"\u{61}\u{20}\u{62}\u{69}\u{6e}\u{61}\u{72}\u{79}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}")))
assert(os.remove(file))
end
io.output(file)
assert(io.write("\u{71}\u{75}\u{61}\u{6c}\u{71}\u{75}\u{65}\u{72}\u{20}\u{63}\u{6f}\u{69}\u{73}\u{61}\u{a}"))
assert(io.write("\u{6d}\u{61}\u{69}\u{73}\u{20}\u{71}\u{75}\u{61}\u{6c}\u{71}\u{75}\u{65}\u{72}\u{20}\u{63}\u{6f}\u{69}\u{73}\u{61}"))
io.close()
assert(io.output(assert(io.open(otherfile,"\u{77}\u{62}"))):write("\u{6f}\u{75}\u{74}\u{72}\u{61}\u{20}\u{63}\u{6f}\u{69}\u{73}\u{61}\u{0}\u{1}\u{3}\u{0}\u{0}\u{0}\u{0}\u{ff}\u{0}"):close())
local filehandle = assert(io.open(file,"\u{72}\u{2b}"))
local otherfilehandle = assert(io.open(otherfile,"\u{72}\u{62}"))
assert((filehandle ~= otherfilehandle))
assert((type(filehandle) == "\u{75}\u{73}\u{65}\u{72}\u{64}\u{61}\u{74}\u{61}"))
assert((filehandle:read("\u{6c}") == "\u{71}\u{75}\u{61}\u{6c}\u{71}\u{75}\u{65}\u{72}\u{20}\u{63}\u{6f}\u{69}\u{73}\u{61}"))
io.input(otherfilehandle)
assert((io.read(string.len("\u{6f}\u{75}\u{74}\u{72}\u{61}\u{20}\u{63}\u{6f}\u{69}\u{73}\u{61}")) == "\u{6f}\u{75}\u{74}\u{72}\u{61}\u{20}\u{63}\u{6f}\u{69}\u{73}\u{61}"))
assert((filehandle:read("\u{6c}") == "\u{6d}\u{61}\u{69}\u{73}\u{20}\u{71}\u{75}\u{61}\u{6c}\u{71}\u{75}\u{65}\u{72}\u{20}\u{63}\u{6f}\u{69}\u{73}\u{61}"))
filehandle:close()
;
assert((type(filehandle) == "\u{75}\u{73}\u{65}\u{72}\u{64}\u{61}\u{74}\u{61}"))
io.input(otherfilehandle)
assert((io.read(0x4) == "\u{0}\u{1}\u{3}\u{0}"))
assert((io.read(0x3) == "\u{0}\u{0}\u{0}"))
assert((io.read(0x0) == ""))
assert((io.read(0x1) == "\u{ff}"))
assert((io.read("\u{61}") == "\u{0}"))
assert(not io.read(0x0))
assert((otherfilehandle == io.input()))
otherfilehandle:close()
assert(os.remove(file))
assert(os.remove(otherfile))
collectgarbage()
io.output(file):write("\u{20}\u{31}\u{32}\u{33}\u{2e}\u{34}\u{9}\u{2d}\u{35}\u{36}\u{65}\u{2d}\u{32}\u{20}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{20}\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{a}\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{a}\u{74}\u{68}\u{69}\u{72}\u{64}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{a}\u{a}\u{61}\u{6e}\u{64}\u{20}\u{74}\u{68}\u{65}\u{20}\u{72}\u{65}\u{73}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{74}\u{68}\u{65}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{a}"):close()
io.input(file)
local _,a,b,c,d,e,h,__ = io.read(0x1,"\u{6e}","\u{6e}","\u{6c}","\u{6c}","\u{6c}","\u{61}",0xa)
assert(io.close(io.input()))
assert(((_ == "\u{20}") and not __))
assert((((type(a) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}") and (a == 123.4)) and (b == - 0.56)))
assert(((d == "\u{73}\u{65}\u{63}\u{6f}\u{6e}\u{64}\u{20}\u{6c}\u{69}\u{6e}\u{65}") and (e == "\u{74}\u{68}\u{69}\u{72}\u{64}\u{20}\u{6c}\u{69}\u{6e}\u{65}")))
assert((h == "\u{a}\u{61}\u{6e}\u{64}\u{20}\u{74}\u{68}\u{65}\u{20}\u{72}\u{65}\u{73}\u{74}\u{20}\u{6f}\u{66}\u{20}\u{74}\u{68}\u{65}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{a}"))
assert(os.remove(file))
collectgarbage()
do
local f = assert(io.open(file,"\u{77}"))
local fr = assert(io.open(file,"\u{72}"))
assert(f:setvbuf("\u{66}\u{75}\u{6c}\u{6c}",0x7d0))
f:write("\u{78}")
assert((fr:read("\u{61}\u{6c}\u{6c}") == ""))
f:close()
fr:seek("\u{73}\u{65}\u{74}")
assert((fr:read("\u{61}\u{6c}\u{6c}") == "\u{78}"))
f=assert(io.open(file),"\u{77}")
assert(f:setvbuf("\u{6e}\u{6f}"))
f:write("\u{78}")
fr:seek("\u{73}\u{65}\u{74}")
assert((fr:read("\u{61}\u{6c}\u{6c}") == "\u{78}"))
f:close()
f=assert(io.open(file,"\u{61}"))
assert(f:setvbuf("\u{6c}\u{69}\u{6e}\u{65}"))
f:write("\u{78}")
fr:seek("\u{73}\u{65}\u{74}",0x1)
assert((fr:read("\u{61}\u{6c}\u{6c}") == ""))
f:write("\u{61}\u{a}"):seek("\u{73}\u{65}\u{74}",0x1)
assert((fr:read("\u{61}\u{6c}\u{6c}") == "\u{78}\u{61}\u{a}"))
f:close()
;
fr:close()
assert(os.remove(file))
end
if not _soft then
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{61}\u{72}\u{67}\u{65}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{73}\u{20}\u{28}\u{3e}\u{20}\u{42}\u{55}\u{46}\u{53}\u{49}\u{5a}\u{29}")
io.output(file)
for i = 0x1, 0x1389
do
io.write("\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{31}\u{32}\u{33}")
end
io.write("\u{a}\u{31}\u{32}\u{33}\u{34}\u{36}"):close()
io.input(file)
local x = io.read("\u{61}")
io.input():seek("\u{73}\u{65}\u{74}",0x0)
local y = (io.read(0x7531) .. (io.read(0x3ed) .. (io.read(0x0) .. (io.read(0x1) .. io.read(0x186a3)))))
assert(((x == y) and (string.len(x) == ((0x1389 * 0xd) + 0x6))))
io.input():seek("\u{73}\u{65}\u{74}",0x0)
y=io.read()
assert((x == (y .. ("\u{a}" .. io.read()))))
assert(not io.read())
io.close(io.input())
assert(os.remove(file))
x=nil
;
y=nil
end
if not _port then
local progname
do
local arg = (arg or ARG)
local i = 0x0
while arg[i] do
i=(i - 0x1)
end
progname=("\u{22}" .. (arg[(i + 0x1)] .. "\u{22}"))
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{6f}\u{70}\u{65}\u{6e}\u{2f}\u{70}\u{63}\u{6c}\u{6f}\u{73}\u{65}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{65}\u{78}\u{65}\u{63}\u{75}\u{74}\u{65}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6d}\u{6f}\u{64}\u{65}",io.popen,"\u{63}\u{61}\u{74}","")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6d}\u{6f}\u{64}\u{65}",io.popen,"\u{63}\u{61}\u{74}","\u{72}\u{2b}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6d}\u{6f}\u{64}\u{65}",io.popen,"\u{63}\u{61}\u{74}","\u{72}\u{77}")
do
local file = os.tmpname()
local f = assert(io.popen(("\u{63}\u{61}\u{74}\u{20}\u{2d}\u{20}\u{3e}\u{20}" .. file),"\u{77}"))
f:write("\u{61}\u{20}\u{6c}\u{69}\u{6e}\u{65}")
assert(f:close())
local f = assert(io.popen(("\u{63}\u{61}\u{74}\u{20}\u{2d}\u{20}\u{3c}\u{20}" .. file),"\u{72}"))
assert((f:read("\u{61}") == "\u{61}\u{20}\u{6c}\u{69}\u{6e}\u{65}"))
assert(f:close())
assert(os.remove(file))
end
local tests = {{"\u{6c}\u{73}\u{20}\u{3e}\u{20}\u{2f}\u{64}\u{65}\u{76}\u{2f}\u{6e}\u{75}\u{6c}\u{6c}","\u{6f}\u{6b}"},{"\u{6e}\u{6f}\u{74}\u{2d}\u{74}\u{6f}\u{2d}\u{62}\u{65}\u{2d}\u{66}\u{6f}\u{75}\u{6e}\u{64}\u{2d}\u{63}\u{6f}\u{6d}\u{6d}\u{61}\u{6e}\u{64}","\u{65}\u{78}\u{69}\u{74}"},{"\u{65}\u{78}\u{69}\u{74}\u{20}\u{33}","\u{65}\u{78}\u{69}\u{74}",0x3},{"\u{65}\u{78}\u{69}\u{74}\u{20}\u{31}\u{32}\u{39}","\u{65}\u{78}\u{69}\u{74}",0x81},{"\u{6b}\u{69}\u{6c}\u{6c}\u{20}\u{2d}\u{73}\u{20}\u{48}\u{55}\u{50}\u{20}\u{24}\u{24}","\u{73}\u{69}\u{67}\u{6e}\u{61}\u{6c}",0x1},{"\u{6b}\u{69}\u{6c}\u{6c}\u{20}\u{2d}\u{73}\u{20}\u{4b}\u{49}\u{4c}\u{4c}\u{20}\u{24}\u{24}","\u{73}\u{69}\u{67}\u{6e}\u{61}\u{6c}",0x9},{"\u{73}\u{68}\u{20}\u{2d}\u{63}\u{20}\u{27}\u{6b}\u{69}\u{6c}\u{6c}\u{20}\u{2d}\u{73}\u{20}\u{48}\u{55}\u{50}\u{20}\u{24}\u{24}\u{27}","\u{65}\u{78}\u{69}\u{74}"},{(progname .. "\u{20}\u{2d}\u{65}\u{20}\u{22}\u{20}\u{22}"),"\u{6f}\u{6b}"},{(progname .. "\u{20}\u{2d}\u{65}\u{20}\u{22}\u{6f}\u{73}\u{2e}\u{65}\u{78}\u{69}\u{74}\u{28}\u{30}\u{2c}\u{20}\u{74}\u{72}\u{75}\u{65}\u{29}\u{22}"),"\u{6f}\u{6b}"},{(progname .. "\u{20}\u{2d}\u{65}\u{20}\u{22}\u{6f}\u{73}\u{2e}\u{65}\u{78}\u{69}\u{74}\u{28}\u{32}\u{30}\u{2c}\u{20}\u{74}\u{72}\u{75}\u{65}\u{29}\u{22}"),"\u{65}\u{78}\u{69}\u{74}",0x14}}
print("\u{a}\u{28}\u{73}\u{6f}\u{6d}\u{65}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{6d}\u{65}\u{73}\u{73}\u{61}\u{67}\u{65}\u{73}\u{20}\u{61}\u{72}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{6e}\u{6f}\u{77}\u{29}")
for _,v in ipairs(tests)
do
local x,y,z = io.popen(v[0x1]):close()
local x1,y1,z1 = os.execute(v[0x1])
assert((((x == x1) and (y == y1)) and (z == z1)))
if (v[0x2] == "\u{6f}\u{6b}") then
assert(((x and (y == "\u{65}\u{78}\u{69}\u{74}")) and (z == 0x0)))
else
assert(not (x and (y == v[0x2])))
assert(((((v[0x3] == nil) and (z > 0x0))) or (v[0x3] == z)))
end
end
end
f=io.tmpfile()
assert((io.type(f) == "\u{66}\u{69}\u{6c}\u{65}"))
f:write("\u{61}\u{6c}\u{6f}")
f:seek("\u{73}\u{65}\u{74}")
assert((f:read("\u{61}") == "\u{61}\u{6c}\u{6f}"))
end
print("\u{2b}")
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{64}\u{61}\u{74}\u{65}\u{2f}\u{74}\u{69}\u{6d}\u{65}")
assert((os.date("") == ""))
assert((os.date("\u{21}") == ""))
assert((os.date("\u{0}\u{0}") == "\u{0}\u{0}"))
assert((os.date("\u{21}\u{0}\u{0}") == "\u{0}\u{0}"))
local x = string.rep("\u{61}",0x2710)
assert((os.date(x) == x))
local t = os.time()
D=os.date("\u{2a}\u{74}",t)
assert((os.date(string.rep("\u{25}\u{64}",0x3e8),t) == string.rep(os.date("\u{25}\u{64}",t),0x3e8)))
assert((os.date(string.rep("\u{25}",0xc8)) == string.rep("\u{25}",0x64)))
local function checkDateTable
(t)
_G.D=os.date("\u{2a}\u{74}",t)
assert((os.time(D) == t))
load(os.date("\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{44}\u{2e}\u{79}\u{65}\u{61}\u{72}\u{3d}\u{3d}\u{25}\u{59}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{44}\u{2e}\u{6d}\u{6f}\u{6e}\u{74}\u{68}\u{3d}\u{3d}\u{25}\u{6d}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{44}\u{2e}\u{64}\u{61}\u{79}\u{3d}\u{3d}\u{25}\u{64}\u{20}\u{61}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{44}\u{2e}\u{68}\u{6f}\u{75}\u{72}\u{3d}\u{3d}\u{25}\u{48}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{44}\u{2e}\u{6d}\u{69}\u{6e}\u{3d}\u{3d}\u{25}\u{4d}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{44}\u{2e}\u{73}\u{65}\u{63}\u{3d}\u{3d}\u{25}\u{53}\u{20}\u{61}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{44}\u{2e}\u{77}\u{64}\u{61}\u{79}\u{3d}\u{3d}\u{25}\u{77}\u{2b}\u{31}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{44}\u{2e}\u{79}\u{64}\u{61}\u{79}\u{3d}\u{3d}\u{25}\u{6a}\u{29}",t))()
_G.D=nil
end
checkDateTable(os.time())
if not _port then
checkDateTable(0x0)
checkDateTable(0x1)
checkDateTable(0x3e8)
checkDateTable(0x7fffffff)
checkDateTable(0x80000000)
end
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}\u{20}\u{73}\u{70}\u{65}\u{63}\u{69}\u{66}\u{69}\u{65}\u{72}",os.date,"\u{25}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}\u{20}\u{73}\u{70}\u{65}\u{63}\u{69}\u{66}\u{69}\u{65}\u{72}",os.date,"\u{25}\u{39}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}\u{20}\u{73}\u{70}\u{65}\u{63}\u{69}\u{66}\u{69}\u{65}\u{72}",os.date,"\u{25}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}\u{20}\u{73}\u{70}\u{65}\u{63}\u{69}\u{66}\u{69}\u{65}\u{72}",os.date,"\u{25}\u{4f}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}\u{20}\u{73}\u{70}\u{65}\u{63}\u{69}\u{66}\u{69}\u{65}\u{72}",os.date,"\u{25}\u{45}")
checkerr("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{76}\u{65}\u{72}\u{73}\u{69}\u{6f}\u{6e}\u{20}\u{73}\u{70}\u{65}\u{63}\u{69}\u{66}\u{69}\u{65}\u{72}",os.date,"\u{25}\u{45}\u{61}")
checkerr("\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{6e}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = 0x3e8,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1,["\u{68}\u{6f}\u{75}\u{72}"] = "\u{78}"})
checkerr("\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{6e}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = 0x3e8,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1,["\u{68}\u{6f}\u{75}\u{72}"] = 1.5})
checkerr("\u{6d}\u{69}\u{73}\u{73}\u{69}\u{6e}\u{67}",os.time,{["\u{68}\u{6f}\u{75}\u{72}"] = 0xc})
if (string.packsize("\u{69}") == 0x4) then
checkerr("\u{66}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{27}\u{79}\u{65}\u{61}\u{72}\u{27}\u{20}\u{69}\u{73}\u{20}\u{6f}\u{75}\u{74}\u{2d}\u{6f}\u{66}\u{2d}\u{62}\u{6f}\u{75}\u{6e}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = - (((0x1 << 0x1f)) + 0x76b),["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1})
checkerr("\u{66}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{27}\u{79}\u{65}\u{61}\u{72}\u{27}\u{20}\u{69}\u{73}\u{20}\u{6f}\u{75}\u{74}\u{2d}\u{6f}\u{66}\u{2d}\u{62}\u{6f}\u{75}\u{6e}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = - ((0x1 << 0x1f)),["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1})
if (math.maxinteger > (0x2 ^ 0x1f)) then
checkerr("\u{66}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{27}\u{79}\u{65}\u{61}\u{72}\u{27}\u{20}\u{69}\u{73}\u{20}\u{6f}\u{75}\u{74}\u{2d}\u{6f}\u{66}\u{2d}\u{62}\u{6f}\u{75}\u{6e}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = (((0x1 << 0x1f)) + 0x76c),["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1})
end
end
if not _port then
assert((type(os.date("\u{25}\u{45}\u{78}")) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"))
assert((type(os.date("\u{25}\u{4f}\u{79}")) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"))
local t0 = os.time({["\u{79}\u{65}\u{61}\u{72}"] = 0x7b2,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x0})
local t1 = os.time({["\u{79}\u{65}\u{61}\u{72}"] = 0x7b2,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x0,["\u{73}\u{65}\u{63}"] = (((0x1 << 0x1f)) - 0x1)})
assert(((t1 - t0) == (((0x1 << 0x1f)) - 0x1)))
t0=os.time({["\u{79}\u{65}\u{61}\u{72}"] = 0x7b2,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1})
t1=os.time({["\u{79}\u{65}\u{61}\u{72}"] = 0x7b2,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1,["\u{73}\u{65}\u{63}"] = - ((0x1 << 0x1f))})
assert(((t1 - t0) == - ((0x1 << 0x1f))))
if (maxint >= (0x2 ^ 0x3e)) then
checkerr("\u{6f}\u{75}\u{74}\u{2d}\u{6f}\u{66}\u{2d}\u{62}\u{6f}\u{75}\u{6e}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = - maxint,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1})
if (string.packsize("\u{69}") == 0x4) then
if testerr("\u{6f}\u{75}\u{74}\u{2d}\u{6f}\u{66}\u{2d}\u{62}\u{6f}\u{75}\u{6e}\u{64}",os.date,"\u{25}\u{59}",(0x2 ^ 0x28)) then
print("\u{20}\u{20}\u{34}\u{2d}\u{62}\u{79}\u{74}\u{65}\u{20}\u{74}\u{69}\u{6d}\u{65}\u{5f}\u{74}")
checkerr("\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{72}\u{65}\u{70}\u{72}\u{65}\u{73}\u{65}\u{6e}\u{74}\u{65}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = 0xfa0,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1})
else
print("\u{20}\u{20}\u{38}\u{2d}\u{62}\u{79}\u{74}\u{65}\u{20}\u{74}\u{69}\u{6d}\u{65}\u{5f}\u{74}")
checkerr("\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{72}\u{65}\u{70}\u{72}\u{65}\u{73}\u{65}\u{6e}\u{74}\u{65}\u{64}",os.date,"\u{25}\u{59}",(0x2 ^ 0x3c))
assert(tonumber(os.time({["\u{79}\u{65}\u{61}\u{72}"] = (((0x1 << 0x1f)) + 0x76b),["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0xc,["\u{64}\u{61}\u{79}"] = 0x1f,["\u{68}\u{6f}\u{75}\u{72}"] = 0x17,["\u{6d}\u{69}\u{6e}"] = 0x3b,["\u{73}\u{65}\u{63}"] = 0x3b})))
checkerr("\u{72}\u{65}\u{70}\u{72}\u{65}\u{73}\u{65}\u{6e}\u{74}\u{65}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = (((0x1 << 0x1f)) + 0x76b),["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0xc,["\u{64}\u{61}\u{79}"] = 0x1f,["\u{68}\u{6f}\u{75}\u{72}"] = 0x17,["\u{6d}\u{69}\u{6e}"] = 0x3b,["\u{73}\u{65}\u{63}"] = 0x3c})
end
checkerr("\u{66}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{27}\u{64}\u{61}\u{79}\u{27}\u{20}\u{69}\u{73}\u{20}\u{6f}\u{75}\u{74}\u{2d}\u{6f}\u{66}\u{2d}\u{62}\u{6f}\u{75}\u{6e}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = 0x0,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = (0x2 ^ 0x20)})
checkerr("\u{66}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{27}\u{6d}\u{6f}\u{6e}\u{74}\u{68}\u{27}\u{20}\u{69}\u{73}\u{20}\u{6f}\u{75}\u{74}\u{2d}\u{6f}\u{66}\u{2d}\u{62}\u{6f}\u{75}\u{6e}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = 0x0,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = - ((((0x1 << 0x1f)) + 0x1)),["\u{64}\u{61}\u{79}"] = 0x1})
checkerr("\u{66}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{27}\u{79}\u{65}\u{61}\u{72}\u{27}\u{20}\u{69}\u{73}\u{20}\u{6f}\u{75}\u{74}\u{2d}\u{6f}\u{66}\u{2d}\u{62}\u{6f}\u{75}\u{6e}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = (((0x1 << 0x1f)) + 0x76c),["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1})
else
print("\u{20}\u{20}\u{38}\u{2d}\u{62}\u{79}\u{74}\u{65}\u{20}\u{74}\u{69}\u{6d}\u{65}\u{5f}\u{74}")
assert(tonumber(os.date("\u{25}\u{59}",(0x2 ^ 0x3c))))
checkerr("\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{72}\u{65}\u{70}\u{72}\u{65}\u{73}\u{65}\u{6e}\u{74}\u{65}\u{64}",os.time,{["\u{79}\u{65}\u{61}\u{72}"] = (0x2 ^ 0x3c),["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1})
end
end
end
do
local D = os.date("\u{2a}\u{74}")
local t = os.time(D)
if (D.isdst == nil) then
print("\u{6e}\u{6f}\u{20}\u{64}\u{61}\u{79}\u{6c}\u{69}\u{67}\u{68}\u{74}\u{20}\u{73}\u{61}\u{76}\u{69}\u{6e}\u{67}\u{20}\u{69}\u{6e}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}\u{69}\u{6f}\u{6e}")
else
assert((type(D.isdst) == "\u{62}\u{6f}\u{6f}\u{6c}\u{65}\u{61}\u{6e}"))
end
D.isdst=nil
local t1 = os.time(D)
assert((t == t1))
end
local D = os.date("\u{2a}\u{74}")
t=os.time(D)
D.year=(D.year - 0x1)
;
local t1 = os.time(D)
assert((math.abs(((os.difftime(t,t1) / ((0x18 * 0xe10))) - 0x16d)) < 0x2))
t=os.time()
t1=os.time(os.date("\u{2a}\u{74}"))
local diff = os.difftime(t1,t)
assert(((0x0 <= diff) and (diff <= 0x1)))
diff=os.difftime(t,t1)
assert(- ((0x1 <= diff) and (diff <= 0x0)))
local t1 = os.time({["\u{79}\u{65}\u{61}\u{72}"] = 0x7d0,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0xa,["\u{64}\u{61}\u{79}"] = 0x1,["\u{68}\u{6f}\u{75}\u{72}"] = 0x17,["\u{6d}\u{69}\u{6e}"] = 0xc})
local t2 = os.time({["\u{79}\u{65}\u{61}\u{72}"] = 0x7d0,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0xa,["\u{64}\u{61}\u{79}"] = 0x1,["\u{68}\u{6f}\u{75}\u{72}"] = 0x17,["\u{6d}\u{69}\u{6e}"] = 0xa,["\u{73}\u{65}\u{63}"] = 0x13})
assert((os.difftime(t1,t2) == ((0x3c * 0x2) - 0x13)))
t1={["\u{79}\u{65}\u{61}\u{72}"] = 0x7d5,["\u{6d}\u{6f}\u{6e}\u{74}\u{68}"] = 0x1,["\u{64}\u{61}\u{79}"] = 0x1,["\u{68}\u{6f}\u{75}\u{72}"] = 0x1,["\u{6d}\u{69}\u{6e}"] = 0x0,["\u{73}\u{65}\u{63}"] = - 0xe12}
os.time(t1)
assert((((((((t1.day == 0x1f) and (t1.month == 0xc)) and (t1.year == 0x7d4)) and (t1.hour == 0x17)) and (t1.min == 0x3b)) and (t1.sec == 0x3a)) and (t1.yday == 0x16e)))
io.output(io.stdout)
local t = os.date("\u{25}\u{64}\u{20}\u{25}\u{6d}\u{20}\u{25}\u{59}\u{20}\u{25}\u{48}\u{20}\u{25}\u{4d}\u{20}\u{25}\u{53}")
local d,m,a,h,min,s = string.match(t,"\u{28}\u{25}\u{64}\u{2b}\u{29}\u{20}\u{28}\u{25}\u{64}\u{2b}\u{29}\u{20}\u{28}\u{25}\u{64}\u{2b}\u{29}\u{20}\u{28}\u{25}\u{64}\u{2b}\u{29}\u{20}\u{28}\u{25}\u{64}\u{2b}\u{29}\u{20}\u{28}\u{25}\u{64}\u{2b}\u{29}")
d=tonumber(d)
m=tonumber(m)
a=tonumber(a)
h=tonumber(h)
min=tonumber(min)
s=tonumber(s)
io.write(string.format("\u{74}\u{65}\u{73}\u{74}\u{20}\u{64}\u{6f}\u{6e}\u{65}\u{20}\u{6f}\u{6e}\u{20}\u{25}\u{32}\u{2e}\u{32}\u{64}\u{2f}\u{25}\u{32}\u{2e}\u{32}\u{64}\u{2f}\u{25}\u{64}",d,m,a))
io.write(string.format("\u{2c}\u{20}\u{61}\u{74}\u{20}\u{25}\u{32}\u{2e}\u{32}\u{64}\u{3a}\u{25}\u{32}\u{2e}\u{32}\u{64}\u{3a}\u{25}\u{32}\u{2e}\u{32}\u{64}\u{a}",h,min,s))
io.write(string.format("\u{25}\u{73}\u{a}",_VERSION))