print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{69}\u{6e}\u{63}\u{72}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{61}\u{6c}\u{20}\u{67}\u{61}\u{72}\u{62}\u{61}\u{67}\u{65}\u{20}\u{63}\u{6f}\u{6c}\u{6c}\u{65}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
assert(collectgarbage("\u{69}\u{73}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}"))
collectgarbage()
local oldmode = collectgarbage("\u{69}\u{6e}\u{63}\u{72}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{61}\u{6c}")
assert((collectgarbage("\u{67}\u{65}\u{6e}\u{65}\u{72}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{61}\u{6c}") == "\u{69}\u{6e}\u{63}\u{72}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{61}\u{6c}"))
assert((collectgarbage("\u{67}\u{65}\u{6e}\u{65}\u{72}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{61}\u{6c}") == "\u{67}\u{65}\u{6e}\u{65}\u{72}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{61}\u{6c}"))
assert((collectgarbage("\u{69}\u{6e}\u{63}\u{72}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{61}\u{6c}") == "\u{67}\u{65}\u{6e}\u{65}\u{72}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{61}\u{6c}"))
assert((collectgarbage("\u{69}\u{6e}\u{63}\u{72}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{61}\u{6c}") == "\u{69}\u{6e}\u{63}\u{72}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{61}\u{6c}"))
local function nop
()

end
local function gcinfo
()
return (collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}") * 0x400)
end
do
local a = collectgarbage("\u{73}\u{65}\u{74}\u{70}\u{61}\u{75}\u{73}\u{65}",0xc8)
local b = collectgarbage("\u{73}\u{65}\u{74}\u{73}\u{74}\u{65}\u{70}\u{6d}\u{75}\u{6c}",0xc8)
local t = {0x0,0x2,0xa,0x5a,0x1f4,0x1388,0x7530,0x7ffffffe}
for i = 0x1, (# t)
do
local p = t[i]
for j = 0x1, (# t)
do
local m = t[j]
collectgarbage("\u{73}\u{65}\u{74}\u{70}\u{61}\u{75}\u{73}\u{65}",p)
collectgarbage("\u{73}\u{65}\u{74}\u{73}\u{74}\u{65}\u{70}\u{6d}\u{75}\u{6c}",m)
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x2710)
end
end
collectgarbage("\u{73}\u{65}\u{74}\u{70}\u{61}\u{75}\u{73}\u{65}",a)
collectgarbage("\u{73}\u{65}\u{74}\u{73}\u{74}\u{65}\u{70}\u{6d}\u{75}\u{6c}",b)
collectgarbage()
end
_G["\u{77}\u{68}\u{69}\u{6c}\u{65}"]=0xea
local function GC1
()
local u
local b
local finish = false
u=setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
finish=true
end})
b={0x22}
repeat
u={}
until finish
assert((b[0x1] == 0x22))
finish=false
;
local i = 0x1
u=setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
finish=true
end})
repeat
i=(i + 0x1)
;
u=(tostring(i) .. tostring(i))
until finish
assert((b[0x1] == 0x22))
finish=false
u=setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
finish=true
end})
repeat
local i
;
u=function ()
return i
end
until finish
assert((b[0x1] == 0x22))
end
local function GC2
()
local u
local finish = false
u={setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
finish=true
end})}
local b = {0x22}
repeat
u={{}}
until finish
assert((b[0x1] == 0x22))
finish=false
;
local i = 0x1
u={setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
finish=true
end})}
repeat
i=(i + 0x1)
;
u={(tostring(i) .. tostring(i))}
until finish
assert((b[0x1] == 0x22))
finish=false
u={setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
finish=true
end})}
repeat
local i
;
u={function ()
return i
end}
until finish
assert((b[0x1] == 0x22))
end
local function GC
()
GC1()
;
GC2()
end
do
print("\u{63}\u{72}\u{65}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{6f}\u{62}\u{6a}\u{65}\u{63}\u{74}\u{73}")
local limit = 0x1388
for i = 0x1, limit
do
local a = {}
;
a=nil
end
local a = "\u{61}"
for i = 0x1, limit
do
a=(i .. "\u{62}")
;
a=string.gsub(a,"\u{28}\u{25}\u{64}\u{25}\u{64}\u{2a}\u{29}","\u{25}\u{31}\u{20}\u{25}\u{31}")
a="\u{61}"
end
a={}
function a:test()
for i = 0x1, limit
do
load(string.format("\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{74}\u{65}\u{6d}\u{70}\u{28}\u{61}\u{29}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{27}\u{61}\u{25}\u{64}\u{27}\u{20}\u{65}\u{6e}\u{64}",i),"")()
assert((temp() == string.format("\u{61}\u{25}\u{64}",i)))
end
end
a:test()
_G.temp=nil
end
do
local f = function ()

end
end
print("\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{73}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{73}")
local prog = "\u{64}\u{6f}\u{a}\u{20}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{3b}\u{a}\u{20}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{6f}\u{6f}\u{28}\u{78}\u{2c}\u{79}\u{29}\u{a}\u{20}\u{20}\u{20}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{73}\u{69}\u{6e}\u{28}\u{61}\u{2b}\u{30}\u{2e}\u{34}\u{35}\u{36}\u{2d}\u{30}\u{2e}\u{32}\u{33}\u{65}\u{2d}\u{31}\u{32}\u{29}\u{3b}\u{a}\u{20}\u{20}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{7a}\u{29}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{73}\u{69}\u{6e}\u{28}\u{25}\u{78}\u{2b}\u{7a}\u{29}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{28}\u{77}\u{29}\u{20}\u{61}\u{3d}\u{61}\u{2b}\u{77}\u{3b}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{65}\u{6e}\u{64}\u{a}"
do
local step = 0x1
if _soft then
step=0xd
end
for i = 0x1, string.len(prog), step
do
for j = i, string.len(prog), step
do
pcall(load(string.sub(prog,i,j),""))
end
end
end
rawset(_G,"\u{61}",nil)
_G.x=nil
do
foo=nil
print("\u{6c}\u{6f}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{73}")
local x = "\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}\u{30}\u{31}\u{32}\u{33}\u{34}\u{35}\u{36}\u{37}\u{38}\u{39}"
assert((string.len(x) == 0x50))
local s = ""
local k = math.min(0x12c,((math.maxinteger // 0x50) // 0x2))
for n = 0x1, k
do
s=(s .. x)
;
local j = tostring(n)
end
assert((string.len(s) == (k * 0x50)))
s=string.sub(s,0x1,0x2710)
local s,i = string.gsub(s,"\u{28}\u{25}\u{64}\u{25}\u{64}\u{25}\u{64}\u{25}\u{64}\u{29}","")
assert((i == (0x2710 // 0x4)))
assert((_G["\u{77}\u{68}\u{69}\u{6c}\u{65}"] == 0xea))
_G["\u{77}\u{68}\u{69}\u{6c}\u{65}"]=nil
end
do
print("\u{73}\u{74}\u{65}\u{70}\u{73}")
print("\u{73}\u{74}\u{65}\u{70}\u{73}\u{20}\u{28}\u{32}\u{29}")
local function dosteps
(siz)
collectgarbage()
local a = {}
for i = 0x1, 0x64
do
a[i]={{}}
;
local b = {}
end
local x = gcinfo()
local i = 0x0
repeat
i=(i + 0x1)
until collectgarbage("\u{73}\u{74}\u{65}\u{70}",siz)
assert((gcinfo() < x))
return i
end
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
if (not _port) then
assert((dosteps(0xa) < dosteps(0x2)))
end
assert((dosteps(0x4e20) == 0x1))
assert((collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x4e20) == true))
assert((collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x4e20) == true))
assert((not collectgarbage("\u{69}\u{73}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}")))
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
assert(collectgarbage("\u{69}\u{73}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}"))
end
if (not _port) then
collectgarbage()
;
collectgarbage()
local x = gcinfo()
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
repeat
local a = {}
until (gcinfo() > (0x3 * x))
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
assert(collectgarbage("\u{69}\u{73}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}"))
repeat
local a = {}
until (gcinfo() <= (x * 0x2))
end
print("\u{63}\u{6c}\u{65}\u{61}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{73}")
local lim = 0xf
local a = {}
for i = 0x1, lim
do
a[{}]=i
end
b={}
for k,v in pairs(a)
do
b[k]=v
end
for n in pairs(b)
do
a[n]=undef
assert(((type(n) == "\u{74}\u{61}\u{62}\u{6c}\u{65}") and (next(n) == nil)))
collectgarbage()
end
b=nil
collectgarbage()
for n in pairs(a)
do
error("\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{62}\u{65}\u{20}\u{68}\u{65}\u{72}\u{65}")
end
for i = 0x1, lim
do
a[i]=i
end
for i = 0x1, lim
do
assert((a[i] == i))
end
print("\u{77}\u{65}\u{61}\u{6b}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{73}")
a={}
;
setmetatable(a,{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}"})
;
for i = 0x1, lim
do
a[{}]=i
end
for i = 0x1, lim
do
a[i]=i
end
for i = 0x1, lim
do
local s = string.rep("\u{40}",i)
;
a[s]=(s .. "\u{23}")
end
collectgarbage()
local i = 0x0
for k,v in pairs(a)
do
assert(((k == v) or ((k .. "\u{23}") == v)))
;
i=(i + 0x1)
end
assert((i == (0x2 * lim)))
a={}
;
setmetatable(a,{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{76}"})
;
a[0x1]=string.rep("\u{62}",0x15)
collectgarbage()
assert(a[0x1])
a[0x1]=undef
for i = 0x1, lim
do
a[i]={}
end
for i = 0x1, lim
do
a[(i .. "\u{78}")]={}
end
for i = 0x1, lim
do
local t = {}
;
a[t]=t
end
for i = 0x1, lim
do
a[(i + lim)]=(i .. "\u{78}")
end
collectgarbage()
local i = 0x0
for k,v in pairs(a)
do
assert(((k == v) or (((k - lim) .. "\u{78}") == v)))
;
i=(i + 0x1)
end
assert((i == (0x2 * lim)))
a={}
;
setmetatable(a,{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}\u{76}"})
;
local x,y,z = {},{},{}
a[0x1],a[0x2],a[0x3]=x,y,z
a[string.rep("\u{24}",0xb)]=string.rep("\u{24}",0xb)
for i = 0x4, lim
do
a[i]={}
end
for i = 0x1, lim
do
a[{}]=i
end
for i = 0x1, lim
do
local t = {}
;
a[t]=t
end
collectgarbage()
assert((next(a) ~= nil))
local i = 0x0
for k,v in pairs(a)
do
assert((((((k == 0x1) and (v == x)) or ((k == 0x2) and (v == y))) or ((k == 0x3) and (v == z))) or (k == v)))
;
i=(i + 0x1)
end
assert((i == 0x4))
x,y,z=nil
collectgarbage()
assert((next(a) == string.rep("\u{24}",0xb)))
a={}
local t = {["\u{78}"] = 0xa}
local C = setmetatable({["\u{6b}\u{65}\u{79}"] = t},{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{76}"})
local C1 = setmetatable({[t] = 0x1},{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}"})
a.x=t
setmetatable(a,{["\u{5f}\u{5f}\u{67}\u{63}"] = function (u)
assert((C.key == nil))
assert((type(next(C1)) == "\u{74}\u{61}\u{62}\u{6c}\u{65}"))
end})
a,t=nil
collectgarbage()
collectgarbage()
assert(((next(C) == nil) and (next(C1) == nil)))
C,C1=nil
local mt = {["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}"}
a={{0xa},{0x14},{0x1e},{0x28}}
;
setmetatable(a,mt)
x=nil
for i = 0x1, 0x64
do
local n = {}
;
a[n]={["\u{6b}"] = {x}}
;
x=n
end
GC()
local n = x
local i = 0x0
while n do
n=a[n].k[0x1]
;
i=(i + 0x1)
end
assert((i == 0x64))
x=nil
GC()
for i = 0x1, 0x4
do
assert((a[i][0x1] == (i * 0xa)))
;
a[i]=undef
end
assert((next(a) == nil))
local K = {}
a[K]={}
for i = 0x1, 0xa
do
a[K][i]={}
;
a[a[K][i]]=setmetatable({},mt)
end
x=nil
local k = 0x1
for j = 0x1, 0x64
do
local n = {}
;
local nk = ((k % 0xa) + 0x1)
a[a[K][nk]][n]={x,["\u{6b}"] = k}
;
x=n
;
k=nk
end
GC()
local n = x
local i = 0x0
while n do
local t = a[a[K][k]][n]
;
n=t[0x1]
;
k=t.k
;
i=(i + 0x1)
end
assert((i == 0x64))
K=nil
GC()
if T then
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
local u = {}
local s = {}
;
setmetatable(s,{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}"})
setmetatable(u,{["\u{5f}\u{5f}\u{67}\u{63}"] = function (o)
local i = s[o]
s[i]=true
assert((not s[(i - 0x1)]))
if (i == 0x8) then
error("\u{40}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{40}")
end
end})
for i = 0x6, 0xa
do
local n = setmetatable({},getmetatable(u))
s[n]=i
end
warn("\u{40}\u{6f}\u{6e}")
;
warn("\u{40}\u{73}\u{74}\u{6f}\u{72}\u{65}")
collectgarbage()
assert(string.find(_WARN,"\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{69}\u{6e}\u{20}\u{5f}\u{5f}\u{67}\u{63}"))
assert((string.match(_WARN,"\u{40}\u{28}\u{2e}\u{2d}\u{29}\u{40}") == "\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}"))
;
_WARN=false
for i = 0x8, 0xa
do
assert(s[i])
end
for i = 0x1, 0x5
do
local n = setmetatable({},getmetatable(u))
s[n]=i
end
collectgarbage()
for i = 0x1, 0xa
do
assert(s[i])
end
getmetatable(u).__gc=nil
warn("\u{40}\u{6e}\u{6f}\u{72}\u{6d}\u{61}\u{6c}")
end
print("\u{2b}")
if (T == nil) then
(Message or print)("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{3a}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{75}\u{73}\u{65}\u{72}\u{64}\u{61}\u{74}\u{61}\u{20}\u{47}\u{43}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
else
local function newproxy
(u)
return debug.setmetatable(T.newuserdata(0x0),debug.getmetatable(u))
end
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
local u = newproxy(nil)
debug.setmetatable(u,{["\u{5f}\u{5f}\u{67}\u{63}"] = true})
local s = 0x0
local a = {[u] = 0x0}
;
setmetatable(a,{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{76}\u{6b}"})
for i = 0x1, 0xa
do
a[newproxy(u)]=i
end
for k in pairs(a)
do
assert((getmetatable(k) == getmetatable(u)))
end
local a1 = {}
;
for k,v in pairs(a)
do
a1[k]=v
end
for k,v in pairs(a1)
do
a[v]=k
end
for i = 0x1, 0xa
do
assert(a[i])
end
getmetatable(u).a=a1
getmetatable(u).u=u
do
local u = u
getmetatable(u).__gc=function (o)
assert((a[o] == (0xa - s)))
assert((a[(0xa - s)] == undef))
assert((getmetatable(o) == getmetatable(u)))
assert((getmetatable(o).a[o] == (0xa - s)))
s=(s + 0x1)
end
end
a1,u=nil
assert((next(a) ~= nil))
collectgarbage()
assert((s == 0xb))
collectgarbage()
assert((next(a) == nil))
end
local u = setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = true})
setmetatable(getmetatable(u),{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{76}"})
getmetatable(u).__gc=function (o)
os.exit(0x1)
end
u=nil
collectgarbage()
local u = setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = true})
local m = getmetatable(u)
m.x={[{0x0}] = 0x1,[0x0] = {0x1}}
;
setmetatable(m.x,{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}\u{76}"})
;
m.__gc=function (o)
assert((next(getmetatable(o).x) == nil))
m=0xa
end
u,m=nil
collectgarbage()
assert((m == 0xa))
do
collectgarbage()
;
collectgarbage()
local m = collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}")
local a = setmetatable({},{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}\u{76}"})
a[string.rep("\u{61}",(0x2 ^ 0x16))]=0x19
a[string.rep("\u{62}",(0x2 ^ 0x16))]={}
a[{}]=0xe
assert((collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}") > (m + (0x2 ^ 0xd))))
collectgarbage()
assert(((collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}") >= (m + (0x2 ^ 0xc))) and (collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}") < (m + (0x2 ^ 0xd)))))
local k,v = next(a)
assert(((k == string.rep("\u{61}",(0x2 ^ 0x16))) and (v == 0x19)))
assert((next(a,k) == nil))
assert((a[string.rep("\u{62}",(0x2 ^ 0x16))] == undef))
a[k]=undef
k=nil
collectgarbage()
assert((next(a) == nil))
assert((a[string.rep("\u{62}",0x64)] == undef))
assert((collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}") <= (m + 0x1)))
end
if T then
warn("\u{40}\u{73}\u{74}\u{6f}\u{72}\u{65}")
u=setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
error("\u{40}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}")
end})
u=nil
collectgarbage()
assert(string.find(_WARN,"\u{40}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}"))
;
_WARN=false
warn("\u{40}\u{6e}\u{6f}\u{72}\u{6d}\u{61}\u{6c}")
end
if (not _soft) then
print("\u{6c}\u{6f}\u{6e}\u{67}\u{20}\u{6c}\u{69}\u{73}\u{74}")
local a = {}
for i = 0x1, 0x30d40
do
a={["\u{6e}\u{65}\u{78}\u{74}"] = a}
end
a=nil
collectgarbage()
end
print("\u{73}\u{65}\u{6c}\u{66}\u{2d}\u{72}\u{65}\u{66}\u{65}\u{72}\u{65}\u{6e}\u{63}\u{65}\u{64}\u{20}\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}\u{73}")
local thread_id = 0x0
local threads = {}
local function fn
(thread)
local x = {}
threads[thread_id]=function ()
thread=x
end
coroutine.yield()
end
while (thread_id < 0x3e8) do
local thread = coroutine.create(fn)
coroutine.resume(thread,thread)
thread_id=(thread_id + 0x1)
end
do
local collected = false
collectgarbage()
;
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
do
local function f
(param)
;
(function ()
assert(((type(f) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}") and (type(param) == "\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}")))
param={param,f}
setmetatable(param,{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
collected=true
end})
coroutine.yield(0x64)
end)()
end
local co = coroutine.create(f)
assert(coroutine.resume(co,co))
end
collectgarbage()
assert(collected)
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
end
do
collectgarbage()
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
local x = gcinfo()
repeat
for i = 0x1, 0x3e8
do
_ENV.a={}
end
until (gcinfo() > (0x2 * x))
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
_ENV.a=nil
end
if T then
local function foo
()
local a = {["\u{78}"] = 0x14}
coroutine.yield(function ()
return a.x
end)
assert((a.x == 0x14))
a={["\u{78}"] = 0x1e}
assert((T.gccolor(a) == "\u{77}\u{68}\u{69}\u{74}\u{65}"))
coroutine.yield(0x64)
end
local t = setmetatable({},{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}\u{76}"})
collectgarbage()
;
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
t.co=coroutine.wrap(foo)
local f = t.co()
T.gcstate("\u{61}\u{74}\u{6f}\u{6d}\u{69}\u{63}")
assert((T.gcstate() == "\u{61}\u{74}\u{6f}\u{6d}\u{69}\u{63}"))
assert((t.co() == 0x64))
assert((T.gccolor(t.co) == "\u{77}\u{68}\u{69}\u{74}\u{65}"))
T.gcstate("\u{70}\u{61}\u{75}\u{73}\u{65}")
assert(((t.co == nil) and (f() == 0x1e)))
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
local u = T.newuserdata(0x0,0x1)
collectgarbage()
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
local a = {}
T.gcstate("\u{61}\u{74}\u{6f}\u{6d}\u{69}\u{63}")
T.gcstate("\u{73}\u{77}\u{65}\u{65}\u{70}\u{61}\u{6c}\u{6c}\u{67}\u{63}")
local x = {}
assert((T.gccolor(u) == "\u{62}\u{6c}\u{61}\u{63}\u{6b}"))
assert((T.gccolor(x) == "\u{77}\u{68}\u{69}\u{74}\u{65}"))
debug.setuservalue(u,x)
assert((T.gccolor(u) == "\u{67}\u{72}\u{61}\u{79}"))
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
print("\u{2b}")
end
if T then
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
local x = T.newuserdata(0x0)
local y = T.newuserdata(0x0)
debug.setmetatable(y,{["\u{5f}\u{5f}\u{67}\u{63}"] = nop})
debug.setmetatable(x,{["\u{5f}\u{5f}\u{67}\u{63}"] = nop})
assert((T.gccolor(y) == "\u{77}\u{68}\u{69}\u{74}\u{65}"))
T.checkmemory()
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
end
if T then
print("\u{65}\u{6d}\u{65}\u{72}\u{67}\u{65}\u{6e}\u{63}\u{79}\u{20}\u{63}\u{6f}\u{6c}\u{6c}\u{65}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{73}")
collectgarbage()
collectgarbage()
T.totalmem((T.totalmem() + 0xc8))
for i = 0x1, 0xc8
do
local a = {}
end
T.totalmem(0x0)
collectgarbage()
local t = T.totalmem("\u{74}\u{61}\u{62}\u{6c}\u{65}")
local a = {{},{},{}}
assert((T.totalmem("\u{74}\u{61}\u{62}\u{6c}\u{65}") == (t + 0x4)))
t=T.totalmem("\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
a=function ()

end
assert((T.totalmem("\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}") == (t + 0x1)))
t=T.totalmem("\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}")
a=coroutine.create(function ()

end)
assert((T.totalmem("\u{74}\u{68}\u{72}\u{65}\u{61}\u{64}") == (t + 0x1)))
end
do
local setmetatable,assert,type,print,getmetatable = setmetatable,assert,type,print,getmetatable
local tt = {}
tt.__gc=function (o)
assert((getmetatable(o) == tt))
local a = ("\u{78}\u{75}\u{78}\u{75}" .. ((0xa + 0x3) .. "\u{6a}\u{6f}\u{61}\u{6f}")),{}
___Glob=o
setmetatable({},tt)
print(("\u{3e}\u{3e}\u{3e}\u{20}\u{63}\u{6c}\u{6f}\u{73}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{74}\u{61}\u{74}\u{65}\u{20}" .. "\u{3c}\u{3c}\u{3c}\u{a}"))
end
local u = setmetatable({},tt)
___Glob={u}
end
if T then
local error,assert,find,warn = error,assert,string.find,warn
local n = 0x0
local lastmsg
local mt = {["\u{5f}\u{5f}\u{67}\u{63}"] = function (o)
n=(n + 0x1)
assert((n == o[0x1]))
if (n == 0x1) then
_WARN=false
elseif (n == 0x2) then
assert(find(_WARN,"\u{40}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}"))
lastmsg=_WARN
else
assert((lastmsg == _WARN))
end
warn("\u{40}\u{73}\u{74}\u{6f}\u{72}\u{65}")
;
_WARN=false
error("\u{40}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{77}\u{61}\u{72}\u{6e}\u{69}\u{6e}\u{67}")
end}
for i = 0xa, 0x1, (- 0x1)
do
table.insert(___Glob,setmetatable({i},mt))
end
end
assert(collectgarbage("\u{69}\u{73}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}"))
do
local res = true
setmetatable({},{["\u{5f}\u{5f}\u{67}\u{63}"] = function ()
res=collectgarbage()
end})
collectgarbage()
assert((not res))
end
collectgarbage(oldmode)
print("\u{4f}\u{4b}")