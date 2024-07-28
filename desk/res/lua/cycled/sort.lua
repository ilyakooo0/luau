print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{28}\u{70}\u{61}\u{72}\u{74}\u{73}\u{20}\u{6f}\u{66}\u{29}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{6c}\u{69}\u{62}\u{72}\u{61}\u{72}\u{79}")
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{75}\u{6e}\u{70}\u{61}\u{63}\u{6b}")
local unpack = table.unpack
local maxI = math.maxinteger
local minI = math.mininteger
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
checkerror("\u{77}\u{72}\u{6f}\u{6e}\u{67}\u{20}\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{20}\u{6f}\u{66}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}\u{73}",table.insert,{},0x2,0x3,0x4)
local x,y,z,a,n
a={}
;
local lim = _soft and 0xc8 or 0x7d0
for i = 0x1, lim
do
a[i]=i
end
assert(select(lim,unpack(a)) == lim and select("\u{23}",unpack(a)) == lim)
x=unpack(a)
assert(x == 0x1)
x={unpack(a)}
assert(# x == lim and x[0x1] == 0x1 and x[lim] == lim)
x={unpack(a,lim - 0x2)}
assert(# x == 0x3 and x[0x1] == lim - 0x2 and x[0x3] == lim)
x={unpack(a,0xa,0x6)}
assert(next(x) == nil)
x={unpack(a,0xb,0xa)}
assert(next(x) == nil)
x,y=unpack(a,0xa,0xa)
assert(x == 0xa and y == nil)
x,y,z=unpack(a,0xa,0xb)
assert(x == 0xa and y == 0xb and z == nil)
a,x=unpack({0x1})
assert(a == 0x1 and x == nil)
a,x=unpack({0x1,0x2},0x1,0x1)
assert(a == 0x1 and x == nil)
do
local maxi = (0x1 << 0x1f) - 0x1
local mini = - (0x1 << 0x1f)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},0x0,maxi)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},0x1,maxi)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},0x0,maxI)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},0x1,maxI)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},mini,maxi)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},- maxi,maxi)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},minI,maxI)
unpack({},maxi,0x0)
unpack({},maxi,0x1)
unpack({},maxI,minI)
pcall(unpack,{},0x1,maxi + 0x1)
local a,b = unpack({[maxi] = 0x14},maxi,maxi)
assert(a == 0x14 and b == nil)
a,b=unpack({[maxi] = 0x14},maxi - 0x1,maxi)
assert(a == nil and b == 0x14)
local t = {[maxI - 0x1] = 0xc,[maxI] = 0x17}
a,b=unpack(t,maxI - 0x1,maxI)
;
assert(a == 0xc and b == 0x17)
a,b=unpack(t,maxI,maxI)
;
assert(a == 0x17 and b == nil)
a,b=unpack(t,maxI,maxI - 0x1)
;
assert(a == nil and b == nil)
t={[minI] = 12.3,[minI + 0x1] = 23.5}
a,b=unpack(t,minI,minI + 0x1)
;
assert(a == 12.3 and b == 23.5)
a,b=unpack(t,minI,minI)
;
assert(a == 12.3 and b == nil)
a,b=unpack(t,minI + 0x1,minI)
;
assert(a == nil and b == nil)
end
do
local t = setmetatable({},{["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function ()
return "\u{61}\u{62}\u{63}"
end})
assert(# t == "\u{61}\u{62}\u{63}")
checkerror("\u{6f}\u{62}\u{6a}\u{65}\u{63}\u{74}\u{20}\u{6c}\u{65}\u{6e}\u{67}\u{74}\u{68}\u{20}\u{69}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{6e}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}",table.insert,t,0x1)
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{61}\u{63}\u{6b}")
a=table.pack()
assert(a[0x1] == undef and a.n == 0x0)
a=table.pack(table)
assert(a[0x1] == table and a.n == 0x1)
a=table.pack(nil,nil,nil,nil)
assert(a[0x1] == nil and a.n == 0x4)
do
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.move,0x1,0x2,0x3,0x4)
local function eqT
(a,b)
for k,v in pairs(a)
do
assert(b[k] == v)
end
for k,v in pairs(b)
do
assert(a[k] == v)
end
end
local a = table.move({0xa,0x14,0x1e},0x1,0x3,0x2)
eqT(a,{0xa,0xa,0x14,0x1e})
a=table.move({0xa,0x14,0x1e},0x1,0x3,0x3)
eqT(a,{0xa,0x14,0xa,0x14,0x1e})
a={0xa,0x14,0x1e,0x28}
table.move(a,0x1,0x4,0x2,a)
eqT(a,{0xa,0xa,0x14,0x1e,0x28})
a=table.move({0xa,0x14,0x1e},0x2,0x3,0x1)
eqT(a,{0x14,0x1e,0x1e})
a={}
assert(table.move({0xa,0x14,0x1e},0x1,0x3,0x1,a) == a)
eqT(a,{0xa,0x14,0x1e})
a={}
assert(table.move({0xa,0x14,0x1e},0x1,0x0,0x3,a) == a)
eqT(a,{})
a=table.move({0xa,0x14,0x1e},0x1,0xa,0x1)
eqT(a,{0xa,0x14,0x1e})
a=table.move({[maxI - 0x2] = 0x1,[maxI - 0x1] = 0x2,[maxI] = 0x3},maxI - 0x2,maxI,- 0xa,{})
eqT(a,{[- 0xa] = 0x1,[- 0x9] = 0x2,[- 0x8] = 0x3})
a=table.move({[minI] = 0x1,[minI + 0x1] = 0x2,[minI + 0x2] = 0x3},minI,minI + 0x2,- 0xa,{})
eqT(a,{[- 0xa] = 0x1,[- 0x9] = 0x2,[- 0x8] = 0x3})
a=table.move({0x2d},0x1,0x1,maxI)
eqT(a,{0x2d,[maxI] = 0x2d})
a=table.move({[maxI] = 0x64},maxI,maxI,minI)
eqT(a,{[minI] = 0x64,[maxI] = 0x64})
a=table.move({[minI] = 0x64},minI,minI,maxI)
eqT(a,{[minI] = 0x64,[maxI] = 0x64})
a=setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (_,k)
return k * 0xa
end,["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = error})
local b = table.move(a,0x1,0xa,0x3,{})
eqT(a,{})
eqT(b,{nil,nil,0xa,0x14,0x1e,0x28,0x32,0x3c,0x46,0x50,0x5a,0x64})
b=setmetatable({""},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = error,["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,k,v)
t[0x1]=string.format("\u{25}\u{73}\u{28}\u{25}\u{64}\u{2c}\u{25}\u{64}\u{29}",t[0x1],k,v)
end})
table.move(a,0xa,0xd,0x3,b)
assert(b[0x1] == "\u{28}\u{33}\u{2c}\u{31}\u{30}\u{30}\u{29}\u{28}\u{34}\u{2c}\u{31}\u{31}\u{30}\u{29}\u{28}\u{35}\u{2c}\u{31}\u{32}\u{30}\u{29}\u{28}\u{36}\u{2c}\u{31}\u{33}\u{30}\u{29}")
local stat,msg = pcall(table.move,b,0xa,0xd,0x3,b)
assert(not stat and msg == b)
end
do
local function checkmove
(f,e,t,x,y)
local pos1,pos2
local a = setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (_,k)
pos1=k
end,["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (_,k)
pos2=k
;
error()
end})
local st,msg = pcall(table.move,a,f,e,t)
assert(not st and not msg and pos1 == x and pos2 == y)
end
checkmove(0x1,maxI,0x0,0x1,0x0)
checkmove(0x0,maxI - 0x1,0x1,maxI - 0x1,maxI)
checkmove(minI,- 0x2,- 0x5,- 0x2,maxI - 0x6)
checkmove(minI + 0x1,- 0x1,- 0x2,- 0x1,maxI - 0x3)
checkmove(minI,- 0x2,0x0,minI,0x0)
checkmove(minI + 0x1,- 0x1,0x1,minI + 0x1,0x1)
end
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}",table.move,{},0x0,maxI,0x1)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}",table.move,{},- 0x1,maxI - 0x1,0x1)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}",table.move,{},minI,- 0x1,0x1)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}",table.move,{},minI,maxI,0x1)
checkerror("\u{77}\u{72}\u{61}\u{70}\u{20}\u{61}\u{72}\u{6f}\u{75}\u{6e}\u{64}",table.move,{},0x1,maxI,0x2)
checkerror("\u{77}\u{72}\u{61}\u{70}\u{20}\u{61}\u{72}\u{6f}\u{75}\u{6e}\u{64}",table.move,{},0x1,0x2,maxI)
checkerror("\u{77}\u{72}\u{61}\u{70}\u{20}\u{61}\u{72}\u{6f}\u{75}\u{6e}\u{64}",table.move,{},minI,- 0x2,0x2)
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{6f}\u{72}\u{74}")
local a = setmetatable({},{["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function ()
return - 0x1
end})
assert(# a == - 0x1)
table.sort(a,error)
a=setmetatable({},{["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function ()
return maxI
end})
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{62}\u{69}\u{67}",table.sort,a)
local function check
(t)
local function f
(a,b)
assert(a and b)
;
return true
end
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6f}\u{72}\u{64}\u{65}\u{72}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}",table.sort,t,f)
end
check({0x1,0x2,0x3,0x4})
check({0x1,0x2,0x3,0x4,0x5})
check({0x1,0x2,0x3,0x4,0x5,0x6})
function check(a,f)
f=f or function (x,y)
return x < y
end
;
for n = # a, 0x2, - 0x1
do
assert(not f(a[n],a[n - 0x1]))
end
end
a={"\u{4a}\u{61}\u{6e}","\u{46}\u{65}\u{62}","\u{4d}\u{61}\u{72}","\u{41}\u{70}\u{72}","\u{4d}\u{61}\u{79}","\u{4a}\u{75}\u{6e}","\u{4a}\u{75}\u{6c}","\u{41}\u{75}\u{67}","\u{53}\u{65}\u{70}","\u{4f}\u{63}\u{74}","\u{4e}\u{6f}\u{76}","\u{44}\u{65}\u{63}"}
table.sort(a)
check(a)
local function perm
(s,n)
n=n or # s
if n == 0x1 then
local t = {unpack(s)}
table.sort(t)
check(t)
else
for i = 0x1, n
do
s[i],s[n]=s[n],s[i]
perm(s,n - 0x1)
s[i],s[n]=s[n],s[i]
end
end
end
perm({})
perm({0x1})
perm({0x1,0x2})
perm({0x1,0x2,0x3})
perm({0x1,0x2,0x3,0x4})
perm({0x2,0x2,0x3,0x4})
perm({0x1,0x2,0x3,0x4,0x5})
perm({0x1,0x2,0x3,0x3,0x5})
perm({0x1,0x2,0x3,0x4,0x5,0x6})
perm({0x2,0x2,0x3,0x3,0x5,0x6})
local function timesort
(a,n,func,msg,pre)
local x = os.clock()
table.sort(a,func)
x=(os.clock() - x) * 0x3e8
pre=pre or ""
print(string.format("\u{25}\u{73}\u{73}\u{6f}\u{72}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{25}\u{64}\u{20}\u{25}\u{73}\u{20}\u{65}\u{6c}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{25}\u{2e}\u{32}\u{66}\u{20}\u{6d}\u{73}\u{65}\u{63}\u{2e}",pre,n,msg,x))
check(a,func)
end
local limit = 0xc350
if _soft then
limit=0x1388
end
a={}
for i = 0x1, limit
do
a[i]=math.random()
end
timesort(a,limit,nil,"\u{72}\u{61}\u{6e}\u{64}\u{6f}\u{6d}")
timesort(a,limit,nil,"\u{73}\u{6f}\u{72}\u{74}\u{65}\u{64}","\u{72}\u{65}\u{2d}")
a={}
for i = 0x1, limit
do
a[i]=math.random()
end
local x = os.clock()
;
local i = 0x0
table.sort(a,function (x,y)
i=i + 0x1
;
return y < x
end)
x=(os.clock() - x) * 0x3e8
print(string.format("\u{49}\u{6e}\u{76}\u{65}\u{72}\u{74}\u{2d}\u{73}\u{6f}\u{72}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{74}\u{68}\u{65}\u{72}\u{20}\u{25}\u{64}\u{20}\u{65}\u{6c}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{25}\u{2e}\u{32}\u{66}\u{20}\u{6d}\u{73}\u{65}\u{63}\u{2e}\u{2c}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{25}\u{69}\u{20}\u{63}\u{6f}\u{6d}\u{70}\u{61}\u{72}\u{69}\u{73}\u{6f}\u{6e}\u{73}",limit,x,i))
check(a,function (x,y)
return y < x
end)
table.sort({})
for i = 0x1, limit
do
a[i]=false
end
timesort(a,limit,function (x,y)
return nil
end,"\u{65}\u{71}\u{75}\u{61}\u{6c}")
for i,v in pairs(a)
do
assert(v == false)
end
AA={"\u{e1}\u{6c}\u{6f}","\u{0}\u{66}\u{69}\u{72}\u{73}\u{74}\u{20}\u{3a}\u{2d}\u{29}","\u{61}\u{6c}\u{6f}","\u{74}\u{68}\u{65}\u{6e}\u{20}\u{74}\u{68}\u{69}\u{73}\u{20}\u{6f}\u{6e}\u{65}","\u{34}\u{35}","\u{61}\u{6e}\u{64}\u{20}\u{61}\u{20}\u{6e}\u{65}\u{77}"}
table.sort(AA)
check(AA)
table.sort(AA,function (x,y)
load(string.format("\u{41}\u{41}\u{5b}\u{25}\u{71}\u{5d}\u{20}\u{3d}\u{20}\u{27}\u{27}",x),"")()
collectgarbage()
return x < y
end)
_G.AA=nil
local tt = {["\u{5f}\u{5f}\u{6c}\u{74}"] = function (a,b)
return a.val < b.val
end}
a={}
for i = 0x1, 0xa
do
a[i]={["\u{76}\u{61}\u{6c}"] = math.random(0x64)}
;
setmetatable(a[i],tt)
;
end
table.sort(a)
check(a,tt.__lt)
check(a)
print("\u{4f}\u{4b}")