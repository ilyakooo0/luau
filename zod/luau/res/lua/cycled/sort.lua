print("\116\101\115\116\105\110\103\32\40\112\97\114\116\115\32\111\102\41\32\116\97\98\108\101\32\108\105\98\114\97\114\121")
print("\116\101\115\116\105\110\103\32\117\110\112\97\99\107")
local unpack = table.unpack
local maxI = math.maxinteger
local minI = math.mininteger
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
checkerror("\119\114\111\110\103\32\110\117\109\98\101\114\32\111\102\32\97\114\103\117\109\101\110\116\115",table.insert,{},2,3,4)
local x,y,z,a,n
a={}
;
local lim = _soft and 200 or 2000
for i = 1, lim
do
a[i]=i
end
assert(select(lim,unpack(a)) == lim and select("\35",unpack(a)) == lim)
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
checkerror("\116\111\111\32\109\97\110\121\32\114\101\115\117\108\116\115",unpack,{},0,maxi)
checkerror("\116\111\111\32\109\97\110\121\32\114\101\115\117\108\116\115",unpack,{},1,maxi)
checkerror("\116\111\111\32\109\97\110\121\32\114\101\115\117\108\116\115",unpack,{},0,maxI)
checkerror("\116\111\111\32\109\97\110\121\32\114\101\115\117\108\116\115",unpack,{},1,maxI)
checkerror("\116\111\111\32\109\97\110\121\32\114\101\115\117\108\116\115",unpack,{},mini,maxi)
checkerror("\116\111\111\32\109\97\110\121\32\114\101\115\117\108\116\115",unpack,{},- maxi,maxi)
checkerror("\116\111\111\32\109\97\110\121\32\114\101\115\117\108\116\115",unpack,{},minI,maxI)
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
local t = setmetatable({},{["\95\95\108\101\110"] = function ()
return "\97\98\99"
end})
assert(# t == "\97\98\99")
checkerror("\111\98\106\101\99\116\32\108\101\110\103\116\104\32\105\115\32\110\111\116\32\97\110\32\105\110\116\101\103\101\114",table.insert,t,1)
end
print("\116\101\115\116\105\110\103\32\112\97\99\107")
a=table.pack()
assert(a[1] == undef and a.n == 0)
a=table.pack(table)
assert(a[1] == table and a.n == 1)
a=table.pack(nil,nil,nil,nil)
assert(a[1] == nil and a.n == 4)
do
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.move,1,2,3,4)
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
a=setmetatable({},{["\95\95\105\110\100\101\120"] = function (_,k)
return k * 10
end,["\95\95\110\101\119\105\110\100\101\120"] = error})
local b = table.move(a,1,10,3,{})
eqT(a,{})
eqT(b,{nil,nil,10,20,30,40,50,60,70,80,90,100})
b=setmetatable({""},{["\95\95\105\110\100\101\120"] = error,["\95\95\110\101\119\105\110\100\101\120"] = function (t,k,v)
t[1]=string.format("\37\115\40\37\100\44\37\100\41",t[1],k,v)
end})
table.move(a,10,13,3,b)
assert(b[1] == "\40\51\44\49\48\48\41\40\52\44\49\49\48\41\40\53\44\49\50\48\41\40\54\44\49\51\48\41")
local stat,msg = pcall(table.move,b,10,13,3,b)
assert(not stat and msg == b)
end
do
local function checkmove
(f,e,t,x,y)
local pos1,pos2
local a = setmetatable({},{["\95\95\105\110\100\101\120"] = function (_,k)
pos1=k
end,["\95\95\110\101\119\105\110\100\101\120"] = function (_,k)
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
checkerror("\116\111\111\32\109\97\110\121",table.move,{},0,maxI,1)
checkerror("\116\111\111\32\109\97\110\121",table.move,{},- 1,maxI - 1,1)
checkerror("\116\111\111\32\109\97\110\121",table.move,{},minI,- 1,1)
checkerror("\116\111\111\32\109\97\110\121",table.move,{},minI,maxI,1)
checkerror("\119\114\97\112\32\97\114\111\117\110\100",table.move,{},1,maxI,2)
checkerror("\119\114\97\112\32\97\114\111\117\110\100",table.move,{},1,2,maxI)
checkerror("\119\114\97\112\32\97\114\111\117\110\100",table.move,{},minI,- 2,2)
print("\116\101\115\116\105\110\103\32\115\111\114\116")
local a = setmetatable({},{["\95\95\108\101\110"] = function ()
return - 1
end})
assert(# a == - 1)
table.sort(a,error)
a=setmetatable({},{["\95\95\108\101\110"] = function ()
return maxI
end})
checkerror("\116\111\111\32\98\105\103",table.sort,a)
local function check
(t)
local function f
(a,b)
assert(a and b)
;
return true
end
checkerror("\105\110\118\97\108\105\100\32\111\114\100\101\114\32\102\117\110\99\116\105\111\110",table.sort,t,f)
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
a={"\74\97\110","\70\101\98","\77\97\114","\65\112\114","\77\97\121","\74\117\110","\74\117\108","\65\117\103","\83\101\112","\79\99\116","\78\111\118","\68\101\99"}
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
print(string.format("\37\115\115\111\114\116\105\110\103\32\37\100\32\37\115\32\101\108\101\109\101\110\116\115\32\105\110\32\37\46\50\102\32\109\115\101\99\46",pre,n,msg,x))
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
timesort(a,limit,nil,"\114\97\110\100\111\109")
timesort(a,limit,nil,"\115\111\114\116\101\100","\114\101\45")
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
print(string.format("\73\110\118\101\114\116\45\115\111\114\116\105\110\103\32\111\116\104\101\114\32\37\100\32\101\108\101\109\101\110\116\115\32\105\110\32\37\46\50\102\32\109\115\101\99\46\44\32\119\105\116\104\32\37\105\32\99\111\109\112\97\114\105\115\111\110\115",limit,x,i))
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
end,"\101\113\117\97\108")
for i,v in pairs(a)
do
assert(v == false)
end
AA={"\225\108\111","\102\105\114\115\116\32\58\45\41","\97\108\111","\116\104\101\110\32\116\104\105\115\32\111\110\101","\52\53","\97\110\100\32\97\32\110\101\119"}
table.sort(AA)
check(AA)
table.sort(AA,function (x,y)
load(string.format("\65\65\91\37\113\93\32\61\32\39\39",x),"")()
collectgarbage()
return x < y
end)
_G.AA=nil
local tt = {["\95\95\108\116"] = function (a,b)
return a.val < b.val
end}
a={}
for i = 1, 10
do
a[i]={["\118\97\108"] = math.random(100)}
;
setmetatable(a[i],tt)
;
end
table.sort(a)
check(a,tt.__lt)
check(a)
print("\79\75")