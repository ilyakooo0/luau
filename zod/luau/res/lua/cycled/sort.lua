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
checkerror("\u{77}\u{72}\u{6f}\u{6e}\u{67}\u{20}\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}\u{20}\u{6f}\u{66}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}\u{73}",table.insert,{},2,3,4)
local x,y,z,a,n
a={}
;
local lim = _soft and 200 or 2000
for i = 1, lim
do
a[i]=i
end
assert(select(lim,unpack(a)) == lim and select("\u{23}",unpack(a)) == lim)
x=unpack(a)
assert(x == 1)
x={unpack(a)}
assert(# x == lim and x[1] == 1 and x[lim] == lim)
x={unpack(a,lim - 2)}
assert(# x == 3 and x[1] == lim - 2 and x[3] == lim)
x={unpack(a,10,6)}
assert(next(x) == nil)
x={unpack(a,11,10)}
assert(next(x) == nil)
x,y=unpack(a,10,10)
assert(x == 10 and y == nil)
x,y,z=unpack(a,10,11)
assert(x == 10 and y == 11 and z == nil)
a,x=unpack({1})
assert(a == 1 and x == nil)
a,x=unpack({1,2},1,1)
assert(a == 1 and x == nil)
do
local maxi = (1 << 31) - 1
local mini = - (1 << 31)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},0,maxi)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},1,maxi)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},0,maxI)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},1,maxI)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},mini,maxi)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},- maxi,maxi)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{72}\u{65}\u{73}\u{75}\u{6c}\u{74}\u{73}",unpack,{},minI,maxI)
unpack({},maxi,0)
unpack({},maxi,1)
unpack({},maxI,minI)
pcall(unpack,{},1,maxi + 1)
local a,b = unpack({[maxi] = 20},maxi,maxi)
assert(a == 20 and b == nil)
a,b=unpack({[maxi] = 20},maxi - 1,maxi)
assert(a == nil and b == 20)
local t = {[maxI - 1] = 12,[maxI] = 23}
a,b=unpack(t,maxI - 1,maxI)
;
assert(a == 12 and b == 23)
a,b=unpack(t,maxI,maxI)
;
assert(a == 23 and b == nil)
a,b=unpack(t,maxI,maxI - 1)
;
assert(a == nil and b == nil)
t={[minI] = 12.3,[minI + 1] = 23.5}
a,b=unpack(t,minI,minI + 1)
;
assert(a == 12.3 and b == 23.5)
a,b=unpack(t,minI,minI)
;
assert(a == 12.3 and b == nil)
a,b=unpack(t,minI + 1,minI)
;
assert(a == nil and b == nil)
end
do
local t = setmetatable({},{["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function ()
return "\u{61}\u{62}\u{63}"
end})
assert(# t == "\u{61}\u{62}\u{63}")
checkerror("\u{6f}\u{62}\u{6a}\u{65}\u{63}\u{74}\u{20}\u{6c}\u{65}\u{6e}\u{67}\u{74}\u{68}\u{20}\u{69}\u{73}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{6e}\u{20}\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}",table.insert,t,1)
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{70}\u{61}\u{63}\u{6b}")
a=table.pack()
assert(a[1] == undef and a.n == 0)
a=table.pack(table)
assert(a[1] == table and a.n == 1)
a=table.pack(nil,nil,nil,nil)
assert(a[1] == nil and a.n == 4)
do
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.move,1,2,3,4)
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
local a = table.move({10,20,30},1,3,2)
eqT(a,{10,10,20,30})
a=table.move({10,20,30},1,3,3)
eqT(a,{10,20,10,20,30})
a={10,20,30,40}
table.move(a,1,4,2,a)
eqT(a,{10,10,20,30,40})
a=table.move({10,20,30},2,3,1)
eqT(a,{20,30,30})
a={}
assert(table.move({10,20,30},1,3,1,a) == a)
eqT(a,{10,20,30})
a={}
assert(table.move({10,20,30},1,0,3,a) == a)
eqT(a,{})
a=table.move({10,20,30},1,10,1)
eqT(a,{10,20,30})
a=table.move({[maxI - 2] = 1,[maxI - 1] = 2,[maxI] = 3},maxI - 2,maxI,- 10,{})
eqT(a,{[- 10] = 1,[- 9] = 2,[- 8] = 3})
a=table.move({[minI] = 1,[minI + 1] = 2,[minI + 2] = 3},minI,minI + 2,- 10,{})
eqT(a,{[- 10] = 1,[- 9] = 2,[- 8] = 3})
a=table.move({45},1,1,maxI)
eqT(a,{45,[maxI] = 45})
a=table.move({[maxI] = 100},maxI,maxI,minI)
eqT(a,{[minI] = 100,[maxI] = 100})
a=table.move({[minI] = 100},minI,minI,maxI)
eqT(a,{[minI] = 100,[maxI] = 100})
a=setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (_,k)
return k * 10
end,["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = error})
local b = table.move(a,1,10,3,{})
eqT(a,{})
eqT(b,{nil,nil,10,20,30,40,50,60,70,80,90,100})
b=setmetatable({""},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = error,["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,k,v)
t[1]=string.format("\u{25}\u{73}\u{28}\u{25}\u{64}\u{2c}\u{25}\u{64}\u{29}",t[1],k,v)
end})
table.move(a,10,13,3,b)
assert(b[1] == "\u{28}\u{33}\u{2c}\u{31}\u{30}\u{30}\u{29}\u{28}\u{34}\u{2c}\u{31}\u{31}\u{30}\u{29}\u{28}\u{35}\u{2c}\u{31}\u{32}\u{30}\u{29}\u{28}\u{36}\u{2c}\u{31}\u{33}\u{30}\u{29}")
local stat,msg = pcall(table.move,b,10,13,3,b)
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
checkmove(1,maxI,0,1,0)
checkmove(0,maxI - 1,1,maxI - 1,maxI)
checkmove(minI,- 2,- 5,- 2,maxI - 6)
checkmove(minI + 1,- 1,- 2,- 1,maxI - 3)
checkmove(minI,- 2,0,minI,0)
checkmove(minI + 1,- 1,1,minI + 1,1)
end
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}",table.move,{},0,maxI,1)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}",table.move,{},- 1,maxI - 1,1)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}",table.move,{},minI,- 1,1)
checkerror("\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}",table.move,{},minI,maxI,1)
checkerror("\u{77}\u{72}\u{61}\u{70}\u{20}\u{61}\u{72}\u{6f}\u{75}\u{6e}\u{64}",table.move,{},1,maxI,2)
checkerror("\u{77}\u{72}\u{61}\u{70}\u{20}\u{61}\u{72}\u{6f}\u{75}\u{6e}\u{64}",table.move,{},1,2,maxI)
checkerror("\u{77}\u{72}\u{61}\u{70}\u{20}\u{61}\u{72}\u{6f}\u{75}\u{6e}\u{64}",table.move,{},minI,- 2,2)
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{6f}\u{72}\u{74}")
local a = setmetatable({},{["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function ()
return - 1
end})
assert(# a == - 1)
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
check({1,2,3,4})
check({1,2,3,4,5})
check({1,2,3,4,5,6})
function check(a,f)
f=f or function (x,y)
return x < y
end
;
for n = # a, 2, - 1
do
assert(not f(a[n],a[n - 1]))
end
end
a={"\u{4a}\u{61}\u{6e}","\u{46}\u{65}\u{62}","\u{4d}\u{61}\u{72}","\u{41}\u{70}\u{72}","\u{4d}\u{61}\u{79}","\u{4a}\u{75}\u{6e}","\u{4a}\u{75}\u{6c}","\u{41}\u{75}\u{67}","\u{53}\u{65}\u{70}","\u{4f}\u{63}\u{74}","\u{4e}\u{6f}\u{76}","\u{44}\u{65}\u{63}"}
table.sort(a)
check(a)
local function perm
(s,n)
n=n or # s
if n == 1 then
local t = {unpack(s)}
table.sort(t)
check(t)
else
for i = 1, n
do
s[i],s[n]=s[n],s[i]
perm(s,n - 1)
s[i],s[n]=s[n],s[i]
end
end
end
perm({})
perm({1})
perm({1,2})
perm({1,2,3})
perm({1,2,3,4})
perm({2,2,3,4})
perm({1,2,3,4,5})
perm({1,2,3,3,5})
perm({1,2,3,4,5,6})
perm({2,2,3,3,5,6})
local function timesort
(a,n,func,msg,pre)
local x = os.clock()
table.sort(a,func)
x=(os.clock() - x) * 1000
pre=pre or ""
print(string.format("\u{25}\u{73}\u{73}\u{6f}\u{72}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{25}\u{64}\u{20}\u{25}\u{73}\u{20}\u{65}\u{6c}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{25}\u{2e}\u{32}\u{66}\u{20}\u{6d}\u{73}\u{65}\u{63}\u{2e}",pre,n,msg,x))
check(a,func)
end
local limit = 50000
if _soft then
limit=5000
end
a={}
for i = 1, limit
do
a[i]=math.random()
end
timesort(a,limit,nil,"\u{72}\u{61}\u{6e}\u{64}\u{6f}\u{6d}")
timesort(a,limit,nil,"\u{73}\u{6f}\u{72}\u{74}\u{65}\u{64}","\u{72}\u{65}\u{2d}")
a={}
for i = 1, limit
do
a[i]=math.random()
end
local x = os.clock()
;
local i = 0
table.sort(a,function (x,y)
i=i + 1
;
return y < x
end)
x=(os.clock() - x) * 1000
print(string.format("\u{49}\u{6e}\u{76}\u{65}\u{72}\u{74}\u{2d}\u{73}\u{6f}\u{72}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6f}\u{74}\u{68}\u{65}\u{72}\u{20}\u{25}\u{64}\u{20}\u{65}\u{6c}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{25}\u{2e}\u{32}\u{66}\u{20}\u{6d}\u{73}\u{65}\u{63}\u{2e}\u{2c}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{25}\u{69}\u{20}\u{63}\u{6f}\u{6d}\u{70}\u{61}\u{72}\u{69}\u{73}\u{6f}\u{6e}\u{73}",limit,x,i))
check(a,function (x,y)
return y < x
end)
table.sort({})
for i = 1, limit
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
for i = 1, 10
do
a[i]={["\u{76}\u{61}\u{6c}"] = math.random(100)}
;
setmetatable(a[i],tt)
;
end
table.sort(a)
check(a,tt.__lt)
check(a)
print("\u{4f}\u{4b}")