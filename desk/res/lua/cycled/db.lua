local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local function dostring
(s)
return assert(load(s))()
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{20}\u{6c}\u{69}\u{62}\u{72}\u{61}\u{72}\u{79}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{20}\u{69}\u{6e}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}\u{69}\u{6f}\u{6e}")
do
local a = 0x1
end
assert((not debug.gethook()))
local testline = 0x13
local function test
(s,l,p)
collectgarbage()
local function f
(event,line)
assert((event == "\u{6c}\u{69}\u{6e}\u{65}"))
local l = table.remove(l,0x1)
if p then
print(l,line)
end
assert((l == line),"\u{77}\u{72}\u{6f}\u{6e}\u{67}\u{20}\u{74}\u{72}\u{61}\u{63}\u{65}\u{21}\u{21}")
end
debug.sethook(f,"\u{6c}")
;
load(s)()
;
debug.sethook()
assert((# (l == 0x0)))
end
do
assert((not pcall(debug.getinfo,print,"\u{58}")))
assert((not pcall(debug.getinfo,0x0,"\u{3e}")))
assert((not debug.getinfo(0x3e8)))
assert((not debug.getinfo((- 0x1))))
local a = debug.getinfo(print)
assert(((a.what == "\u{43}") and (a.short_src == "\u{5b}\u{43}\u{5d}")))
a=debug.getinfo(print,"\u{4c}")
assert((a.activelines == nil))
local b = debug.getinfo(test,"\u{53}\u{66}\u{4c}")
assert(((((((b.name == nil) and (b.what == "\u{4c}\u{75}\u{61}")) and (b.linedefined == testline)) and (b.lastlinedefined == (b.linedefined + 0xa))) and (b.func == test)) and (not string.find(b.short_src,"\u{25}\u{5b}"))))
assert((b.activelines[(b.linedefined + 0x1)] and b.activelines[b.lastlinedefined]))
assert((not (b.activelines[b.linedefined] and (not b.activelines[(b.lastlinedefined + 0x1)]))))
end
do
local func = load(string.dump(load("\u{70}\u{72}\u{69}\u{6e}\u{74}\u{28}\u{31}\u{30}\u{29}"),true))
local actl = debug.getinfo(func,"\u{4c}").activelines
assert((# (actl == 0x0)))
end
local a = "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{20}\u{28}\u{29}\u{20}\u{65}\u{6e}\u{64}"
local function dostring
(s,x)
return load(s,x)()
end
dostring(a)
assert((debug.getinfo(f).short_src == string.format("\u{5b}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{22}\u{25}\u{73}\u{22}\u{5d}",a)))
dostring((a .. string.format("\u{3b}\u{20}\u{25}\u{73}\u{a}\u{3d}\u{31}",string.rep("\u{70}",0x190))))
assert(string.find(debug.getinfo(f).short_src,"\u{5e}\u{25}\u{5b}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{5b}\u{5e}\u{a}\u{5d}\u{2a}\u{25}\u{2e}\u{25}\u{2e}\u{25}\u{2e}\u{22}\u{25}\u{5d}\u{24}"))
dostring((a .. string.format("\u{3b}\u{20}\u{25}\u{73}\u{3d}\u{31}",string.rep("\u{70}",0x190))))
assert(string.find(debug.getinfo(f).short_src,"\u{5e}\u{25}\u{5b}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{5b}\u{5e}\u{a}\u{5d}\u{2a}\u{25}\u{2e}\u{25}\u{2e}\u{25}\u{2e}\u{22}\u{25}\u{5d}\u{24}"))
dostring(("\u{a}" .. a))
assert((debug.getinfo(f).short_src == "\u{5b}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{22}\u{2e}\u{2e}\u{2e}\u{22}\u{5d}"))
dostring(a,"")
assert((debug.getinfo(f).short_src == "\u{5b}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{22}\u{22}\u{5d}"))
dostring(a,"\u{40}\u{78}\u{75}\u{78}\u{75}")
assert((debug.getinfo(f).short_src == "\u{78}\u{75}\u{78}\u{75}"))
dostring(a,("\u{40}" .. (string.rep("\u{70}",0x3e8) .. "\u{74}")))
assert(string.find(debug.getinfo(f).short_src,"\u{5e}\u{25}\u{2e}\u{25}\u{2e}\u{25}\u{2e}\u{70}\u{2a}\u{74}\u{24}"))
dostring(a,"\u{3d}\u{78}\u{75}\u{78}\u{75}")
assert((debug.getinfo(f).short_src == "\u{78}\u{75}\u{78}\u{75}"))
dostring(a,string.format("\u{3d}\u{25}\u{73}",string.rep("\u{78}",0x1f4)))
assert(string.find(debug.getinfo(f).short_src,"\u{5e}\u{78}\u{2a}\u{24}"))
dostring(a,"\u{3d}")
assert((debug.getinfo(f).short_src == ""))
_G.a=nil
;
_G.f=nil
;
_G[string.rep("\u{70}",0x190)]=nil
repeat
local g = {["\u{78}"] = function ()
local a = debug.getinfo(0x2)
assert(((a.name == "\u{66}") and (a.namewhat == "\u{6c}\u{6f}\u{63}\u{61}\u{6c}")))
a=debug.getinfo(0x1)
assert(((a.name == "\u{78}") and (a.namewhat == "\u{66}\u{69}\u{65}\u{6c}\u{64}")))
return "\u{78}\u{69}\u{78}\u{69}"
end}
local f = function ()
return ((0x1 + 0x1) and (not (0x1 or g.x())))
end
assert((f() == "\u{78}\u{69}\u{78}\u{69}"))
g=debug.getinfo(f)
assert(((((g.what == "\u{4c}\u{75}\u{61}") and (g.func == f)) and (g.namewhat == "")) and (not g.name)))
function f(x,name)
name=(name or "\u{66}")
local a = debug.getinfo(0x1)
assert(((a.name == name) and (a.namewhat == "\u{6c}\u{6f}\u{63}\u{61}\u{6c}")))
return x
end
if (0x3 > 0x4) then
break
end
;
f()
if (0x3 < 0x4) then
a=0x1
else
break
end
;
f()
while 0x1 do
local x = 0xa
;
break
end
;
f()
local b = 0x1
if (0x3 > 0x4) then
return math.sin(0x1)
end
;
f()
a=(0x3 < 0x4)
;
f()
a=((0x3 < 0x4) or 0x1)
;
f()
repeat
local x = 0x14
;
if (0x4 > 0x3) then
f()
else
break
end
;
f()
until 0x1
g={}
f(g).x=(f(0x2) and (f(0xa) + f(0x9)))
assert((g.x == f(0x13)))
function g(x)
if (not x) then
return 0x3
end
return x("\u{61}","\u{78}")
end
assert((g(f) == "\u{61}"))
until 0x1
test("\u{69}\u{66}\u{a}\u{6d}\u{61}\u{74}\u{68}\u{2e}\u{73}\u{69}\u{6e}\u{28}\u{31}\u{29}\u{a}\u{74}\u{68}\u{65}\u{6e}\u{a}\u{20}\u{20}\u{61}\u{3d}\u{31}\u{a}\u{65}\u{6c}\u{73}\u{65}\u{a}\u{20}\u{20}\u{61}\u{3d}\u{32}\u{a}\u{65}\u{6e}\u{64}\u{a}",{0x2,0x3,0x4,0x7})
test("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{6f}\u{6f}\u{28}\u{29}\u{a}\u{65}\u{6e}\u{64}\u{a}\u{66}\u{6f}\u{6f}\u{28}\u{29}\u{a}\u{41}\u{20}\u{3d}\u{20}\u{31}\u{a}\u{41}\u{20}\u{3d}\u{20}\u{32}\u{a}\u{41}\u{20}\u{3d}\u{20}\u{33}\u{a}",{0x2,0x3,0x2,0x4,0x5,0x6})
_G.A=nil
test("\u{2d}\u{2d}\u{a}\u{69}\u{66}\u{20}\u{6e}\u{69}\u{6c}\u{20}\u{74}\u{68}\u{65}\u{6e}\u{a}\u{20}\u{20}\u{61}\u{3d}\u{31}\u{a}\u{65}\u{6c}\u{73}\u{65}\u{a}\u{20}\u{20}\u{61}\u{3d}\u{32}\u{a}\u{65}\u{6e}\u{64}\u{a}",{0x2,0x5,0x6})
test("\u{61}\u{3d}\u{31}\u{a}\u{72}\u{65}\u{70}\u{65}\u{61}\u{74}\u{a}\u{20}\u{20}\u{61}\u{3d}\u{61}\u{2b}\u{31}\u{a}\u{75}\u{6e}\u{74}\u{69}\u{6c}\u{20}\u{61}\u{3d}\u{3d}\u{33}\u{a}",{0x1,0x3,0x4,0x3,0x4})
test("\u{20}\u{64}\u{6f}\u{a}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{a}\u{65}\u{6e}\u{64}\u{a}",{0x2})
test("\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{a}\u{61}\u{3d}\u{31}\u{a}\u{77}\u{68}\u{69}\u{6c}\u{65}\u{20}\u{61}\u{3c}\u{3d}\u{33}\u{20}\u{64}\u{6f}\u{a}\u{20}\u{20}\u{61}\u{3d}\u{61}\u{2b}\u{31}\u{a}\u{65}\u{6e}\u{64}\u{a}",{0x1,0x2,0x3,0x4,0x3,0x4,0x3,0x4,0x3,0x5})
test("\u{77}\u{68}\u{69}\u{6c}\u{65}\u{20}\u{6d}\u{61}\u{74}\u{68}\u{2e}\u{73}\u{69}\u{6e}\u{28}\u{31}\u{29}\u{20}\u{64}\u{6f}\u{a}\u{20}\u{20}\u{69}\u{66}\u{20}\u{6d}\u{61}\u{74}\u{68}\u{2e}\u{73}\u{69}\u{6e}\u{28}\u{31}\u{29}\u{a}\u{20}\u{20}\u{74}\u{68}\u{65}\u{6e}\u{20}\u{62}\u{72}\u{65}\u{61}\u{6b}\u{a}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{65}\u{6e}\u{64}\u{a}\u{61}\u{3d}\u{31}",{0x1,0x2,0x3,0x6})
test("\u{66}\u{6f}\u{72}\u{20}\u{69}\u{3d}\u{31}\u{2c}\u{33}\u{20}\u{64}\u{6f}\u{a}\u{20}\u{20}\u{61}\u{3d}\u{69}\u{a}\u{65}\u{6e}\u{64}\u{a}",{0x1,0x2,0x1,0x2,0x1,0x2,0x1,0x3})
test("\u{66}\u{6f}\u{72}\u{20}\u{69}\u{2c}\u{76}\u{20}\u{69}\u{6e}\u{20}\u{70}\u{61}\u{69}\u{72}\u{73}\u{7b}\u{27}\u{61}\u{27}\u{2c}\u{27}\u{62}\u{27}\u{7d}\u{20}\u{64}\u{6f}\u{a}\u{20}\u{20}\u{61}\u{3d}\u{74}\u{6f}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{28}\u{69}\u{29}\u{20}\u{2e}\u{2e}\u{20}\u{76}\u{a}\u{65}\u{6e}\u{64}\u{a}",{0x1,0x2,0x1,0x2,0x1,0x3})
test("\u{66}\u{6f}\u{72}\u{20}\u{69}\u{3d}\u{31}\u{2c}\u{34}\u{20}\u{64}\u{6f}\u{20}\u{61}\u{3d}\u{31}\u{20}\u{65}\u{6e}\u{64}",{0x1,0x1,0x1,0x1})
_G.a=nil
do
local a = {0x1,0x2,0x3,0xa,0x7c,0x7d,0x7e,0x7f,0x80,0x81,0x82,0xff,0x100,0x101,0x1f4,0x3e8}
local s = "\u{20}\u{20}\u{20}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{62}\u{20}\u{3d}\u{20}\u{7b}\u{31}\u{30}\u{7d}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{62}\u{5b}\u{31}\u{5d}\u{20}\u{58}\u{20}\u{2b}\u{20}\u{59}\u{20}\u{62}\u{5b}\u{31}\u{5d}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{62}\u{20}\u{3d}\u{20}\u{34}\u{a}\u{20}\u{20}"
for _,i in ipairs(a)
do
local subs = {["\u{58}"] = string.rep("\u{a}",i)}
for _,j in ipairs(a)
do
subs.Y=string.rep("\u{a}",j)
local s = string.gsub(s,"\u{5b}\u{58}\u{59}\u{5d}",subs)
test(s,{0x1,(0x2 + i),((0x2 + i) + j),(0x2 + i),((0x2 + i) + j),((0x3 + i) + j)})
end
end
end
_G.a=nil
do
local function checkactivelines
(f,lines)
local t = debug.getinfo(f,"\u{53}\u{4c}")
for _,l in pairs(lines)
do
l=(l + t.linedefined)
assert(t.activelines[l])
t.activelines[l]=undef
end
assert((next(t.activelines) == nil))
end
checkactivelines(function (...)
local a = 0x14
local b = 0x1e
end,{0x4,0x6,0x8})
checkactivelines(function (a)
local a = 0x14
local b = 0x1e
end,{0x3,0x4,0x6})
checkactivelines(function (a,b, ...)

end,{0x0})
checkactivelines(function (a,b)

end,{0x1})
for _,n in pairs({0x0,0x1,0x2,0xa,0x32,0x64,0x3e8,0x2710})
do
checkactivelines(load(string.format("\u{25}\u{73}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}",string.rep("\u{a}",n))),{(n + 0x1)})
end
end
print("\u{2b}")
assert((not pcall(debug.getlocal,0x14,0x1)))
assert((not pcall(debug.setlocal,(- 0x1),0x1,0xa)))
local function foo
(a,b, ...)
local d,e
end
local co = coroutine.create(foo)
assert((debug.getlocal(foo,0x1) == "\u{61}"))
assert((debug.getlocal(foo,0x2) == "\u{62}"))
assert((not debug.getlocal(foo,0x3)))
assert((debug.getlocal(co,foo,0x1) == "\u{61}"))
assert((debug.getlocal(co,foo,0x2) == "\u{62}"))
assert((not debug.getlocal(co,foo,0x3)))
assert((not debug.getlocal(print,0x1)))
local function foo
()
return debug.getlocal(0x1,(- 0x1))
end
assert((not foo(0xa)))
local function foo
(a, ...)
local t = table.pack(...)
for i = 0x1, t.n
do
local n,v = debug.getlocal(0x1,(- i))
assert(((n == "\u{28}\u{76}\u{61}\u{72}\u{61}\u{72}\u{67}\u{29}") and (v == t[i])))
end
assert((not debug.getlocal(0x1,(- (t.n + 0x1)))))
assert((not debug.setlocal(0x1,(- (t.n + 0x1)),0x1e)))
if (t.n > 0x0) then
(function (x)
assert((debug.setlocal(0x2,(- 0x1),x) == "\u{28}\u{76}\u{61}\u{72}\u{61}\u{72}\u{67}\u{29}"))
assert((debug.setlocal(0x2,(- t.n),x) == "\u{28}\u{76}\u{61}\u{72}\u{61}\u{72}\u{67}\u{29}"))
end)(0x1ae)
assert((... == 0x1ae))
end
end
foo()
foo(print)
foo(0xc8,0x3,0x4)
local a = {}
for i = 0x1, ((_soft and 0x64) or 0x3e8)
do
a[i]=i
end
foo(table.unpack(a))
do
assert((not debug.gethook()))
local count = 0x0
local function f
()
assert((debug.getinfo(0x1).namewhat == "\u{68}\u{6f}\u{6f}\u{6b}"))
local sndline = string.match(debug.traceback(),"\u{a}\u{28}\u{2e}\u{2d}\u{29}\u{a}")
assert(string.find(sndline,"\u{68}\u{6f}\u{6f}\u{6b}"))
count=(count + 0x1)
end
debug.sethook(f,"\u{6c}")
local a = 0x0
_ENV.a=a
a=0x1
debug.sethook()
assert((count == 0x4))
end
_ENV.a=nil
assert((getmetatable(debug.getregistry()._HOOKKEY).__mode == "\u{6b}"))
a={}
;
local L = nil
local glob = 0x1
local oldglob = glob
debug.sethook(function (e,l)
collectgarbage()
local f,m,c = debug.gethook()
assert(((m == "\u{63}\u{72}\u{6c}") and (c == 0x0)))
if (e == "\u{6c}\u{69}\u{6e}\u{65}") then
if (glob ~= oldglob) then
L=(l - 0x1)
oldglob=glob
end
elseif (e == "\u{63}\u{61}\u{6c}\u{6c}") then
local f = debug.getinfo(0x2,"\u{66}").func
a[f]=0x1
else
assert((e == "\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}"))
end
end,"\u{63}\u{72}\u{6c}")
function f(a,b)
collectgarbage()
local _,x = debug.getlocal(0x1,0x1)
local _,y = debug.getlocal(0x1,0x2)
assert(((x == a) and (y == b)))
assert((debug.setlocal(0x2,0x3,"\u{70}\u{65}\u{72}\u{61}") == ("\u{41}\u{41}" .. "\u{41}\u{41}")))
assert((debug.setlocal(0x2,0x4,"\u{6d}\u{61}\u{6e}\u{67}\u{61}") == "\u{42}"))
x=debug.getinfo(0x2)
assert((((((x.func == g) and (x.what == "\u{4c}\u{75}\u{61}")) and (x.name == "\u{67}")) and (x.nups == 0x2)) and string.find(x.source,"\u{5e}\u{40}\u{2e}\u{2a}\u{64}\u{62}\u{25}\u{2e}\u{6c}\u{75}\u{61}\u{24}")))
glob=(glob + 0x1)
assert((debug.getinfo(0x1,"\u{6c}").currentline == (L + 0x1)))
assert((debug.getinfo(0x1,"\u{6c}").currentline == (L + 0x2)))
end
function foo()
glob=(glob + 0x1)
assert((debug.getinfo(0x1,"\u{6c}").currentline == (L + 0x1)))
end
;
foo()
local _ = ("\u{61}\u{6c}\u{6f}\u{a}\u{61}\u{6c}\u{6f}" .. "\u{a}")
assert((debug.getinfo(0x1,"\u{6c}").currentline == (L + 0xb)))
function g(...)
local arg = {...}
do
local a,b,c
;
a=math.sin(0x28)
;
end
local feijao
local AAAA,B = "\u{78}\u{75}\u{78}\u{75}","\u{61}\u{62}\u{61}\u{63}\u{61}\u{74}\u{65}"
f(AAAA,B)
assert(((AAAA == "\u{70}\u{65}\u{72}\u{61}") and (B == "\u{6d}\u{61}\u{6e}\u{67}\u{61}")))
do
local B = 0xd
local x,y = debug.getlocal(0x1,0x5)
assert(((x == "\u{42}") and (y == 0xd)))
end
end
g()
assert(((((a[f] and a[g]) and a[assert]) and a[debug.getlocal]) and (not a[print])))
local n,v = debug.getlocal(0x0,0x1)
assert(((v == 0x0) and (n == "\u{28}\u{43}\u{20}\u{74}\u{65}\u{6d}\u{70}\u{6f}\u{72}\u{61}\u{72}\u{79}\u{29}")))
local n,v = debug.getlocal(0x0,0x2)
assert(((v == 0x2) and (n == "\u{28}\u{43}\u{20}\u{74}\u{65}\u{6d}\u{70}\u{6f}\u{72}\u{61}\u{72}\u{79}\u{29}")))
assert((not debug.getlocal(0x0,0x3)))
assert((not debug.getlocal(0x0,0x0)))
function f()
assert((select(0x2,debug.getlocal(0x2,0x3)) == 0x1))
assert((not debug.getlocal(0x2,0x4)))
debug.setlocal(0x2,0x3,0xa)
return 0x14
end
function g(a,b)
return ((a + 0x1) + f())
end
assert((g(0x0,0x0) == 0x1e))
_G.f,_G.g=nil
debug.sethook(nil)
;
assert((not debug.gethook()))
do
assert((not debug.setuservalue(io.stdin,0xa)))
local a,b = debug.getuservalue(io.stdin,0xa)
assert(((a == nil) and (not b)))
end
do
local function f
(...)
return 0x3,...
end
local count = 0x0
local a = {}
for i = 0x1, 0x64
do
a[i]=i
end
debug.sethook(function ()
count=(count + 0x1)
end,"",0x1)
local t = {table.unpack(a)}
assert((# (t == 0x64)))
t={table.unpack(a,0x1,0x3)}
assert((# (t == 0x3)))
t={f(table.unpack(a,0x1,0x1e))}
assert((# (t == 0x1f)))
end
local function collectlocals
(level)
local tab = {}
for i = 0x1, math.huge
do
local n,v = debug.getlocal((level + 0x1),i)
if (not (n and string.find(n,"\u{5e}\u{5b}\u{61}\u{2d}\u{7a}\u{41}\u{2d}\u{5a}\u{30}\u{2d}\u{39}\u{5f}\u{5d}\u{2b}\u{24}"))) then
break
end
tab[n]=v
end
return tab
end
local X = nil
a={}
function a:f(a,b, ...)
local arg = {...}
;
local c = 0xd
end
debug.sethook(function (e)
assert((e == "\u{63}\u{61}\u{6c}\u{6c}"))
dostring("\u{58}\u{58}\u{20}\u{3d}\u{20}\u{31}\u{32}")
assert((not pcall(load("\u{61}\u{3d}\u{27}\u{6a}\u{6f}\u{61}\u{6f}\u{27}\u{2b}\u{31}"))))
debug.sethook(function (e,l)
assert((debug.getinfo(0x2,"\u{6c}").currentline == l))
local f,m,c = debug.gethook()
assert((e == "\u{6c}\u{69}\u{6e}\u{65}"))
assert(((m == "\u{6c}") and (c == 0x0)))
debug.sethook(nil)
assert((not X))
X=collectlocals(0x2)
end,"\u{6c}")
end,"\u{63}")
a:f(0x1,0x2,0x3,0x4,0x5)
assert(((((X.self == a) and (X.a == 0x1)) and (X.b == 0x2)) and (X.c == nil)))
assert((XX == 0xc))
assert((not debug.gethook()))
_G.XX=nil
do
local X = false
local function foo
(a,b, ...)
do
local x,y,z
end
local c,d = 0xa,0x14
return 
end
local function aux
()
if (debug.getinfo(0x2).name == "\u{66}\u{6f}\u{6f}") then
X=true
local tab = {["\u{61}"] = 0x64,["\u{62}"] = 0xc8,["\u{63}"] = 0xa,["\u{64}"] = 0x14}
for n,v in pairs(collectlocals(0x2))
do
assert((tab[n] == v))
tab[n]=undef
end
assert((next(tab) == nil))
end
end
debug.sethook(aux,"\u{72}")
;
foo(0x64,0xc8)
;
debug.sethook()
assert(X)
end
local function eqseq
(t1,t2)
assert((# (t1 == (# t2))))
for i = 0x1, (# t1)
do
assert((t1[i] == t2[i]))
end
end
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{69}\u{6e}\u{73}\u{70}\u{65}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{66}\u{20}\u{70}\u{61}\u{72}\u{61}\u{6d}\u{65}\u{74}\u{65}\u{72}\u{73}\u{2f}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{65}\u{64}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{73}")
local on = false
local inp,out
local function hook
(event)
if (not on) then
return 
end
local ar = debug.getinfo(0x2,"\u{72}\u{75}\u{53}")
local t = {}
for i = ar.ftransfer, ((ar.ftransfer + ar.ntransfer) - 0x1)
do
local _,v = debug.getlocal(0x2,i)
t[(# (t + 0x1))]=v
end
if (event == "\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}") then
out=t
else
inp=t
end
end
debug.sethook(hook,"\u{63}\u{72}")
on=true
;
math.sin(0x3)
;
on=false
eqseq(inp,{0x3})
;
eqseq(out,{math.sin(0x3)})
on=true
;
select(0x2,0xa,0x14,0x1e,0x28)
;
on=false
eqseq(inp,{0x2,0xa,0x14,0x1e,0x28})
;
eqseq(out,{0x14,0x1e,0x28})
local function foo
(a, ...)
return ...
end
local function foo1
()
on=(not on)
;
return foo(0x14,0xa,0x0)
end
foo1()
;
on=false
eqseq(inp,{0x14})
;
eqseq(out,{0xa,0x0})
debug.sethook()
end
local function getupvalues
(f)
local t = {}
local i = 0x1
while true do
local name,value = debug.getupvalue(f,i)
if (not name) then
break
end
assert((not t[name]))
t[name]=value
i=(i + 0x1)
end
return t
end
local a,b,c = 0x1,0x2,0x3
local function foo1
(a)
b=a
;
return c
end
local function foo2
(x)
a=x
;
return (c + b)
end
assert((not debug.getupvalue(foo1,0x3)))
assert((not debug.getupvalue(foo1,0x0)))
assert((not debug.setupvalue(foo1,0x3,"\u{78}\u{75}\u{78}\u{75}")))
local t = getupvalues(foo1)
assert((((t.a == nil) and (t.b == 0x2)) and (t.c == 0x3)))
t=getupvalues(foo2)
assert((((t.a == 0x1) and (t.b == 0x2)) and (t.c == 0x3)))
assert((debug.setupvalue(foo1,0x1,"\u{78}\u{75}\u{78}\u{75}") == "\u{62}"))
assert((({debug.getupvalue(foo2,0x3)})[0x2] == "\u{78}\u{75}\u{78}\u{75}"))
assert((debug.getupvalue(string.gmatch("\u{78}","\u{78}"),0x1) == ""))
local a = 0x0
debug.sethook(function (e)
a=(a + 0x1)
end,"",0x1)
a=0x0
;
for i = 0x1, 0x3e8
do

end
;
assert(((0x3e8 < a) and (a < 0x3f4)))
debug.sethook(function (e)
a=(a + 0x1)
end,"",0x4)
a=0x0
;
for i = 0x1, 0x3e8
do

end
;
assert(((0xfa < a) and (a < 0xff)))
local f,m,c = debug.gethook()
assert(((m == "") and (c == 0x4)))
debug.sethook(function (e)
a=(a + 0x1)
end,"",0xfa0)
a=0x0
;
for i = 0x1, 0x3e8
do

end
;
assert((a == 0x0))
do
debug.sethook(print,"",((0x2 ^ 0x18) - 0x1))
local f,m,c = debug.gethook()
assert((({debug.gethook()})[0x3] == ((0x2 ^ 0x18) - 0x1)))
end
debug.sethook()
local g,g1
local function f
(x)
if x then
assert((debug.getinfo(0x1,"\u{53}").what == "\u{4c}\u{75}\u{61}"))
assert((debug.getinfo(0x1,"\u{74}").istailcall == true))
local tail = debug.getinfo(0x2)
assert(((tail.func == g1) and (tail.istailcall == true)))
assert((debug.getinfo(0x3,"\u{53}").what == "\u{6d}\u{61}\u{69}\u{6e}"))
print("\u{2b}")
end
end
function g(x)
return f(x)
end
function g1(x)
g(x)
end
local function h
(x)
local f = g1
;
return f(x)
end
h(true)
local b = {}
debug.sethook(function (e)
table.insert(b,e)
end,"\u{63}\u{72}")
h(false)
debug.sethook()
local res = {"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}","\u{63}\u{61}\u{6c}\u{6c}","\u{74}\u{61}\u{69}\u{6c}\u{20}\u{63}\u{61}\u{6c}\u{6c}","\u{63}\u{61}\u{6c}\u{6c}","\u{74}\u{61}\u{69}\u{6c}\u{20}\u{63}\u{61}\u{6c}\u{6c}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}","\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}","\u{63}\u{61}\u{6c}\u{6c}"}
for i = 0x1, (# res)
do
assert((res[i] == table.remove(b,0x1)))
end
b=0x0
debug.sethook(function (e)
if (e == "\u{74}\u{61}\u{69}\u{6c}\u{20}\u{63}\u{61}\u{6c}\u{6c}") then
b=(b + 0x1)
assert((debug.getinfo(0x2,"\u{74}").istailcall == true))
else
assert((debug.getinfo(0x2,"\u{74}").istailcall == false))
end
end,"\u{63}")
h(false)
debug.sethook()
assert((b == 0x2))
local lim = ((_soft and 0xbb8) or 0x7530)
local function foo
(x)
if (x == 0x0) then
assert((debug.getinfo(0x2).what == "\u{6d}\u{61}\u{69}\u{6e}"))
local info = debug.getinfo(0x1)
assert(((info.istailcall == true) and (info.func == foo)))
else
return foo((x - 0x1))
end
end
foo(lim)
print("\u{2b}")
co=load("\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{41}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}\u{a}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{a}")
local a = 0x0
debug.sethook(function (e,l)
if (l == 0x3) then
a=(a + 0x1)
;
assert((debug.getlocal(0x2,0x1) == "\u{28}\u{74}\u{65}\u{6d}\u{70}\u{6f}\u{72}\u{61}\u{72}\u{79}\u{29}"))
elseif (l == 0x4) then
a=(a + 0x1)
;
assert((debug.getlocal(0x2,0x1) == "\u{41}"))
end
end,"\u{6c}")
co()
debug.sethook()
assert((a == 0x2))
assert((debug.traceback(print) == print))
assert((debug.traceback(print,0x4) == print))
assert(string.find(debug.traceback("\u{68}\u{69}",0x4),"\u{5e}\u{68}\u{69}\u{a}"))
assert(string.find(debug.traceback("\u{68}\u{69}"),"\u{5e}\u{68}\u{69}\u{a}"))
assert((not string.find(debug.traceback("\u{68}\u{69}"),"\u{27}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{74}\u{72}\u{61}\u{63}\u{65}\u{62}\u{61}\u{63}\u{6b}\u{27}")))
assert(string.find(debug.traceback("\u{68}\u{69}",0x0),"\u{27}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{74}\u{72}\u{61}\u{63}\u{65}\u{62}\u{61}\u{63}\u{6b}\u{27}"))
assert(string.find(debug.traceback(),"\u{5e}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{74}\u{72}\u{61}\u{63}\u{65}\u{62}\u{61}\u{63}\u{6b}\u{3a}\u{a}"))
do
local st,msg = (function ()
return pcall
end)()(debug.traceback)
assert(((st == true) and string.find(msg,"\u{70}\u{63}\u{61}\u{6c}\u{6c}")))
end
local t = debug.getinfo(print,"\u{75}")
assert((((t.isvararg == true) and (t.nparams == 0x0)) and (t.nups == 0x0)))
t=debug.getinfo(function (a,b,c)

end,"\u{75}")
assert((((t.isvararg == false) and (t.nparams == 0x3)) and (t.nups == 0x0)))
t=debug.getinfo(function (a,b, ...)
return t[a]
end,"\u{75}")
assert((((t.isvararg == true) and (t.nparams == 0x2)) and (t.nups == 0x1)))
t=debug.getinfo(0x1)
assert(((((t.isvararg == true) and (t.nparams == 0x0)) and (t.nups == 0x1)) and (debug.getupvalue(t.func,0x1) == "\u{5f}\u{45}\u{4e}\u{56}")))
t=debug.getinfo(math.sin)
assert((((t.isvararg == true) and (t.nparams == 0x0)) and (t.nups == 0x0)))
t=debug.getinfo(string.gmatch("\u{61}\u{62}\u{63}","\u{61}"))
assert((((t.isvararg == true) and (t.nparams == 0x0)) and (t.nups > 0x0)))
local function checktraceback
(co,p,level)
local tb = debug.traceback(co,nil,level)
local i = 0x0
for l in string.gmatch(tb,"\u{5b}\u{5e}\u{a}\u{5d}\u{2b}\u{a}\u{3f}")
do
assert(((i == 0x0) or string.find(l,p[i])))
i=(i + 0x1)
end
assert((p[i] == undef))
end
local function f
(n)
if (n > 0x0) then
f((n - 0x1))
else
coroutine.yield()
end
end
local co = coroutine.create(f)
coroutine.resume(co,0x3)
checktraceback(co,{"\u{79}\u{69}\u{65}\u{6c}\u{64}","\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}","\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}","\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}","\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}"})
checktraceback(co,{"\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}","\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}","\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}","\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}"},0x1)
checktraceback(co,{"\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}","\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}","\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}"},0x2)
checktraceback(co,{"\u{64}\u{62}\u{2e}\u{6c}\u{75}\u{61}"},0x4)
checktraceback(co,{},0x28)
co=coroutine.create(function (x)
local a = 0x1
coroutine.yield(debug.getinfo(0x1,"\u{6c}"))
coroutine.yield(debug.getinfo(0x1,"\u{6c}").currentline)
return a
end)
local tr = {}
local foo = function (e,l)
if l then
table.insert(tr,l)
end
end
debug.sethook(co,foo,"\u{6c}\u{63}\u{72}")
local _,l = coroutine.resume(co,0xa)
local x = debug.getinfo(co,0x1,"\u{6c}\u{66}\u{4c}\u{53}")
assert(((x.currentline == l.currentline) and x.activelines[x.currentline]))
assert((type(x.func) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}"))
for i = (x.linedefined + 0x1), x.lastlinedefined
do
assert(x.activelines[i])
x.activelines[i]=undef
end
assert((next(x.activelines) == nil))
assert((not debug.getinfo(co,0x2)))
local a,b = debug.getlocal(co,0x1,0x1)
assert(((a == "\u{78}") and (b == 0xa)))
a,b=debug.getlocal(co,0x1,0x2)
assert(((a == "\u{61}") and (b == 0x1)))
debug.setlocal(co,0x1,0x2,"\u{68}\u{69}")
assert((debug.gethook(co) == foo))
assert((# (((tr == 0x2) and (tr[0x1] == (l.currentline - 0x1))) and (tr[0x2] == l.currentline))))
a,b,c=pcall(coroutine.resume,co)
assert(((a and b) and (c == (l.currentline + 0x1))))
checktraceback(co,{"\u{79}\u{69}\u{65}\u{6c}\u{64}","\u{69}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{3c}"})
a,b=coroutine.resume(co)
assert((a and (b == "\u{68}\u{69}")))
assert((# ((tr == 0x4) and (tr[0x4] == (l.currentline + 0x2)))))
assert((debug.gethook(co) == foo))
assert((not debug.gethook()))
checktraceback(co,{})
co=coroutine.create(function (x)
local a,b = coroutine.yield(x)
assert(((a == 0x64) and (b == nil)))
return x
end)
a,b=coroutine.resume(co,0xa)
assert((a and (b == 0xa)))
a,b=debug.getlocal(co,0x1,0x1)
assert(((a == "\u{78}") and (b == 0xa)))
assert((not debug.getlocal(co,0x1,0x5)))
assert((debug.setlocal(co,0x1,0x1,0x1e) == "\u{78}"))
assert((not debug.setlocal(co,0x1,0x5,0x28)))
a,b=coroutine.resume(co,0x64)
assert((a and (b == 0x1e)))
function f(i)
if (i == 0x0) then
error(i)
else
coroutine.yield()
;
f((i - 0x1))
end
end
co=coroutine.create(function (x)
f(x)
end)
a,b=coroutine.resume(co,0x3)
t={"\u{27}\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}\u{2e}\u{79}\u{69}\u{65}\u{6c}\u{64}\u{27}","\u{27}\u{66}\u{27}","\u{69}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{3c}"}
while (coroutine.status(co) == "\u{73}\u{75}\u{73}\u{70}\u{65}\u{6e}\u{64}\u{65}\u{64}") do
checktraceback(co,t)
a,b=coroutine.resume(co)
table.insert(t,0x2,"\u{27}\u{66}\u{27}")
end
t[0x1]="\u{27}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{27}"
checktraceback(co,t)
local function g
(x)
coroutine.yield(x)
end
local function f
(i)
debug.sethook(function ()

end,"\u{6c}")
for j = 0x1, 0x3e8
do
g((i + j))
end
end
local co = coroutine.wrap(f)
co(0xa)
pcall(co)
pcall(co)
assert((type(debug.getregistry()) == "\u{74}\u{61}\u{62}\u{6c}\u{65}"))
local a = {}
local function f
(t)
local info = debug.getinfo(0x1)
;
assert((info.namewhat == "\u{6d}\u{65}\u{74}\u{61}\u{6d}\u{65}\u{74}\u{68}\u{6f}\u{64}"))
a.op=info.name
return info.name
end
setmetatable(a,{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = f,["\u{5f}\u{5f}\u{61}\u{64}\u{64}"] = f,["\u{5f}\u{5f}\u{64}\u{69}\u{76}"] = f,["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}"] = f,["\u{5f}\u{5f}\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}"] = f,["\u{5f}\u{5f}\u{70}\u{6f}\u{77}"] = f,["\u{5f}\u{5f}\u{6d}\u{75}\u{6c}"] = f,["\u{5f}\u{5f}\u{69}\u{64}\u{69}\u{76}"] = f,["\u{5f}\u{5f}\u{75}\u{6e}\u{6d}"] = f,["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = f,["\u{5f}\u{5f}\u{73}\u{75}\u{62}"] = f,["\u{5f}\u{5f}\u{73}\u{68}\u{6c}"] = f,["\u{5f}\u{5f}\u{73}\u{68}\u{72}"] = f,["\u{5f}\u{5f}\u{62}\u{6f}\u{72}"] = f,["\u{5f}\u{5f}\u{62}\u{78}\u{6f}\u{72}"] = f,["\u{5f}\u{5f}\u{65}\u{71}"] = f,["\u{5f}\u{5f}\u{6c}\u{65}"] = f,["\u{5f}\u{5f}\u{6c}\u{74}"] = f,["\u{5f}\u{5f}\u{75}\u{6e}\u{6d}"] = f,["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = f,["\u{5f}\u{5f}\u{62}\u{61}\u{6e}\u{64}"] = f,["\u{5f}\u{5f}\u{62}\u{6e}\u{6f}\u{74}"] = f})
local b = setmetatable({},getmetatable(a))
assert((((a[0x3] == "\u{69}\u{6e}\u{64}\u{65}\u{78}") and ((a ^ 0x3) == "\u{70}\u{6f}\u{77}")) and ((a .. a) == "\u{63}\u{6f}\u{6e}\u{63}\u{61}\u{74}")))
assert((((a / 0x3) == "\u{64}\u{69}\u{76}") and ((0x3 % a) == "\u{6d}\u{6f}\u{64}")))
assert((((((a + 0x3) == "\u{61}\u{64}\u{64}") and ((0x3 - a) == "\u{73}\u{75}\u{62}")) and ((a * 0x3) == "\u{6d}\u{75}\u{6c}")) and (- ((a == "\u{75}\u{6e}\u{6d}") and (# ((a == "\u{6c}\u{65}\u{6e}") and ((a & 0x3) == "\u{62}\u{61}\u{6e}\u{64}")))))))
assert((((((a + 0x7530) == "\u{61}\u{64}\u{64}") and ((a - 3.0) == "\u{73}\u{75}\u{62}")) and ((a * 3.0) == "\u{6d}\u{75}\u{6c}")) and (- ((a == "\u{75}\u{6e}\u{6d}") and (# ((a == "\u{6c}\u{65}\u{6e}") and ((a & 0x3) == "\u{62}\u{61}\u{6e}\u{64}")))))))
assert((((((a | 0x3) == "\u{62}\u{6f}\u{72}") and ((0x3 ~ a) == "\u{62}\u{78}\u{6f}\u{72}")) and ((a << 0x3) == "\u{73}\u{68}\u{6c}")) and ((a >> 0x1) == "\u{73}\u{68}\u{72}")))
assert(((a == b) and (a.op == "\u{65}\u{71}")))
assert(((a >= b) and (a.op == "\u{6c}\u{65}")))
assert((("\u{78}" >= a) and (a.op == "\u{6c}\u{65}")))
assert(((a > b) and (a.op == "\u{6c}\u{74}")))
assert(((a > 0xa) and (a.op == "\u{6c}\u{74}")))
assert((~ (a == "\u{62}\u{6e}\u{6f}\u{74}")))
do
local function f
()
assert((debug.getinfo(0x1).name == "\u{66}\u{6f}\u{72}\u{20}\u{69}\u{74}\u{65}\u{72}\u{61}\u{74}\u{6f}\u{72}"))
end
for i in f
do

end
end
do
local name = nil
setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
local t = debug.getinfo(0x1)
assert((t.namewhat == "\u{6d}\u{65}\u{74}\u{61}\u{6d}\u{65}\u{74}\u{68}\u{6f}\u{64}"))
name=t.name
end})
repeat
local a = {}
until name
assert((name == "\u{5f}\u{5f}\u{67}\u{63}"))
end
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{72}\u{61}\u{63}\u{65}\u{62}\u{61}\u{63}\u{6b}\u{20}\u{73}\u{69}\u{7a}\u{65}\u{73}")
local function countlines
(s)
return select(0x2,string.gsub(s,"\u{a}",""))
end
local function deep
(lvl,n)
if (lvl == 0x0) then
return debug.traceback("\u{6d}\u{65}\u{73}\u{73}\u{61}\u{67}\u{65}",n)
else
return deep((lvl - 0x1),n)
end
end
local function checkdeep
(total,start)
local s = deep(total,start)
local rest = string.match(s,"\u{5e}\u{6d}\u{65}\u{73}\u{73}\u{61}\u{67}\u{65}\u{a}\u{73}\u{74}\u{61}\u{63}\u{6b}\u{20}\u{74}\u{72}\u{61}\u{63}\u{65}\u{62}\u{61}\u{63}\u{6b}\u{3a}\u{a}\u{28}\u{2e}\u{2a}\u{29}\u{24}")
local cl = countlines(rest)
assert((cl <= ((0xa + 0xb) + 0x1)))
local brk = string.find(rest,"\u{25}\u{2e}\u{25}\u{2e}\u{25}\u{2e}\u{9}\u{25}\u{28}\u{73}\u{6b}\u{69}\u{70}")
if brk then
local rest1 = string.sub(rest,0x1,brk)
local rest2 = string.sub(rest,brk,(# rest))
assert(((countlines(rest1) == 0xa) and (countlines(rest2) == 0xb)))
else
assert((cl == ((total - start) + 0x2)))
end
end
for d = 0x1, 0x33, 0xa
do
for l = 0x1, d
do
coroutine.wrap(checkdeep)(d,l)
end
end
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{73}\u{20}\u{6f}\u{6e}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}\u{20}\u{77}\u{69}\u{74}\u{68}\u{6f}\u{75}\u{74}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{20}\u{69}\u{6e}\u{66}\u{6f}")
local prog = "\u{2d}\u{2d}\u{20}\u{70}\u{72}\u{6f}\u{67}\u{72}\u{61}\u{6d}\u{20}\u{74}\u{6f}\u{20}\u{62}\u{65}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{65}\u{64}\u{20}\u{77}\u{69}\u{74}\u{68}\u{6f}\u{75}\u{74}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{20}\u{69}\u{6e}\u{66}\u{6f}\u{72}\u{6d}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{73}\u{74}\u{72}\u{69}\u{70}\u{29}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{20}\u{3d}\u{20}\u{72}\u{65}\u{71}\u{75}\u{69}\u{72}\u{65}\u{27}\u{64}\u{65}\u{62}\u{75}\u{67}\u{27}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{31}\u{32}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{61}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{76}\u{61}\u{72}\u{69}\u{61}\u{62}\u{6c}\u{65}\u{a}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{6e}\u{2c}\u{20}\u{76}\u{20}\u{3d}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{67}\u{65}\u{74}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{28}\u{31}\u{2c}\u{20}\u{31}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{6e}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{28}\u{74}\u{65}\u{6d}\u{70}\u{6f}\u{72}\u{61}\u{72}\u{79}\u{29}\u{22}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{76}\u{20}\u{3d}\u{3d}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{29}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{75}\u{6e}\u{6b}\u{6f}\u{77}\u{6e}\u{20}\u{6e}\u{61}\u{6d}\u{65}\u{20}\u{62}\u{75}\u{74}\u{20}\u{6b}\u{6e}\u{6f}\u{77}\u{6e}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{a}\u{6e}\u{2c}\u{20}\u{76}\u{20}\u{3d}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{67}\u{65}\u{74}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{28}\u{31}\u{2c}\u{20}\u{32}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{6e}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{28}\u{74}\u{65}\u{6d}\u{70}\u{6f}\u{72}\u{61}\u{72}\u{79}\u{29}\u{22}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{76}\u{20}\u{3d}\u{3d}\u{20}\u{31}\u{32}\u{29}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{75}\u{6e}\u{6b}\u{6f}\u{77}\u{6e}\u{20}\u{6e}\u{61}\u{6d}\u{65}\u{20}\u{62}\u{75}\u{74}\u{20}\u{6b}\u{6e}\u{6f}\u{77}\u{6e}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{a}\u{a}\u{2d}\u{2d}\u{20}\u{61}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{61}\u{6e}\u{20}\u{75}\u{70}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{66}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{29}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{3b}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{61}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{6e}\u{2c}\u{20}\u{76}\u{20}\u{3d}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{67}\u{65}\u{74}\u{75}\u{70}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{28}\u{66}\u{2c}\u{20}\u{31}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{6e}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{28}\u{6e}\u{6f}\u{20}\u{6e}\u{61}\u{6d}\u{65}\u{29}\u{22}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{76}\u{20}\u{3d}\u{3d}\u{20}\u{31}\u{32}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{73}\u{65}\u{74}\u{75}\u{70}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{28}\u{66}\u{2c}\u{20}\u{31}\u{2c}\u{20}\u{31}\u{33}\u{29}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{28}\u{6e}\u{6f}\u{20}\u{6e}\u{61}\u{6d}\u{65}\u{29}\u{22}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{20}\u{3d}\u{3d}\u{20}\u{31}\u{33}\u{29}\u{a}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{74}\u{20}\u{3d}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{67}\u{65}\u{74}\u{69}\u{6e}\u{66}\u{6f}\u{28}\u{66}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{74}\u{2e}\u{6e}\u{61}\u{6d}\u{65}\u{20}\u{3d}\u{3d}\u{20}\u{6e}\u{69}\u{6c}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{74}\u{2e}\u{6c}\u{69}\u{6e}\u{65}\u{64}\u{65}\u{66}\u{69}\u{6e}\u{65}\u{64}\u{20}\u{3e}\u{20}\u{30}\u{20}\u{61}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{2e}\u{6c}\u{61}\u{73}\u{74}\u{6c}\u{69}\u{6e}\u{65}\u{64}\u{65}\u{66}\u{69}\u{6e}\u{65}\u{64}\u{20}\u{3d}\u{3d}\u{20}\u{74}\u{2e}\u{6c}\u{69}\u{6e}\u{65}\u{64}\u{65}\u{66}\u{69}\u{6e}\u{65}\u{64}\u{20}\u{61}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{2e}\u{73}\u{68}\u{6f}\u{72}\u{74}\u{5f}\u{73}\u{72}\u{63}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{3f}\u{22}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{67}\u{65}\u{74}\u{69}\u{6e}\u{66}\u{6f}\u{28}\u{31}\u{29}\u{2e}\u{63}\u{75}\u{72}\u{72}\u{65}\u{6e}\u{74}\u{6c}\u{69}\u{6e}\u{65}\u{20}\u{3d}\u{3d}\u{20}\u{2d}\u{31}\u{29}\u{a}\u{a}\u{74}\u{20}\u{3d}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{67}\u{65}\u{74}\u{69}\u{6e}\u{66}\u{6f}\u{28}\u{66}\u{2c}\u{20}\u{22}\u{4c}\u{22}\u{29}\u{2e}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{6c}\u{69}\u{6e}\u{65}\u{73}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{6e}\u{65}\u{78}\u{74}\u{28}\u{74}\u{29}\u{20}\u{3d}\u{3d}\u{20}\u{6e}\u{69}\u{6c}\u{29}\u{20}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{73}\u{20}\u{61}\u{72}\u{65}\u{20}\u{65}\u{6d}\u{70}\u{74}\u{79}\u{a}\u{a}\u{2d}\u{2d}\u{20}\u{64}\u{75}\u{6d}\u{70}\u{2f}\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{61}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{77}\u{69}\u{74}\u{68}\u{6f}\u{75}\u{74}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{20}\u{69}\u{6e}\u{66}\u{6f}\u{a}\u{66}\u{20}\u{3d}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{28}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{2e}\u{64}\u{75}\u{6d}\u{70}\u{28}\u{66}\u{29}\u{29}\u{a}\u{a}\u{74}\u{20}\u{3d}\u{20}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{67}\u{65}\u{74}\u{69}\u{6e}\u{66}\u{6f}\u{28}\u{66}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{74}\u{2e}\u{6e}\u{61}\u{6d}\u{65}\u{20}\u{3d}\u{3d}\u{20}\u{6e}\u{69}\u{6c}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{74}\u{2e}\u{6c}\u{69}\u{6e}\u{65}\u{64}\u{65}\u{66}\u{69}\u{6e}\u{65}\u{64}\u{20}\u{3e}\u{20}\u{30}\u{20}\u{61}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{2e}\u{6c}\u{61}\u{73}\u{74}\u{6c}\u{69}\u{6e}\u{65}\u{64}\u{65}\u{66}\u{69}\u{6e}\u{65}\u{64}\u{20}\u{3d}\u{3d}\u{20}\u{74}\u{2e}\u{6c}\u{69}\u{6e}\u{65}\u{64}\u{65}\u{66}\u{69}\u{6e}\u{65}\u{64}\u{20}\u{61}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{74}\u{2e}\u{73}\u{68}\u{6f}\u{72}\u{74}\u{5f}\u{73}\u{72}\u{63}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{3f}\u{22}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{64}\u{65}\u{62}\u{75}\u{67}\u{2e}\u{67}\u{65}\u{74}\u{69}\u{6e}\u{66}\u{6f}\u{28}\u{31}\u{29}\u{2e}\u{63}\u{75}\u{72}\u{72}\u{65}\u{6e}\u{74}\u{6c}\u{69}\u{6e}\u{65}\u{20}\u{3d}\u{3d}\u{20}\u{2d}\u{31}\u{29}\u{a}\u{a}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{61}\u{a}"
local f = assert(load(string.dump(load(prog),true)))
assert((f() == 0xd))
do
local function foo
()
local a = 0x1
local b = 0x2
return b
end
local s = load(string.dump(foo,true))
local line = true
debug.sethook(function (e,l)
assert((e == "\u{6c}\u{69}\u{6e}\u{65}"))
line=l
end,"\u{6c}")
assert((s() == 0x2))
;
debug.sethook(nil)
assert((line == nil))
end
do
local prog = "\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{78}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{79}\u{29}\u{20}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{78}\u{20}\u{2b}\u{20}\u{79}\u{a}\u{20}\u{20}\u{20}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}"
local name = string.rep("\u{78}",0x3e8)
local p = assert(load(prog,name))
local c = string.dump(p)
assert((# ((c > 0x3e8) and (# (c < 0x7d0)))))
local f = assert(load(c))
local g = f()
local h = g(0x3)
assert((h(0x5) == 0x8))
assert((((debug.getinfo(f).source == name) and (debug.getinfo(g).source == name)) and (debug.getinfo(h).source == name)))
local c = string.dump(p,true)
assert((# (c < 0x1f4)))
local f = assert(load(c))
local g = f()
local h = g(0x1e)
assert((h(0x32) == 0x50))
assert((((debug.getinfo(f).source == "\u{3d}\u{3f}") and (debug.getinfo(g).source == "\u{3d}\u{3f}")) and (debug.getinfo(h).source == "\u{3d}\u{3f}")))
end
print("\u{4f}\u{4b}")