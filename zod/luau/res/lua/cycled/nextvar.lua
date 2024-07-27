print("\116\101\115\116\105\110\103\32\116\97\98\108\101\115\44\32\110\101\120\116\44\32\97\110\100\32\102\111\114")
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
local function check
(t,na,nh)
if not T then
return 
end
local a,h = T.querytab(t)
if a ~= na or h ~= nh then
print(na,nh,a,h)
assert(nil)
end
end
local a = {}
for i = 1, 100
do
a[i .. "\43"]=true
end
for i = 1, 100
do
a[i .. "\43"]=undef
end
for i = 1, 100
do
a[i]=true
assert(# a == i)
end
do
local a = {}
for i = 1, 100
do
a[i]=i
end
check(a,128,0)
for i = 5, 95
do
a[i]=nil
end
check(a,128,0)
a.x=1
check(a,4,8)
for i = 1, 4
do
assert(a[i] == i)
end
for i = 5, 95
do
assert(a[i] == nil)
end
for i = 96, 100
do
assert(a[i] == i)
end
assert(a.x == 1)
end
local x = 0
for k,v in ipairs({10,20,30,["\120"] = 12})
do
x=x + 1
assert(k == x and v == x * 10)
end
for _ in ipairs({["\120"] = 12,["\121"] = 24})
do
assert(nil)
end
x=false
local i = 0
for k,v in ipairs({true,false,true,false})
do
i=i + 1
x=not x
assert(x == v)
end
assert(i == 4)
assert(type(ipairs({})) == "\102\117\110\99\116\105\111\110" and ipairs({}) == ipairs({}))
do
local f = ipairs({})
local k,v = f({[math.mininteger] = 10},math.maxinteger)
assert(k == math.mininteger and v == 10)
k,v=f({[math.mininteger] = 10},k)
assert(k == nil)
end
if not T then
(Message or print)("\10\32\62\62\62\32\116\101\115\116\67\32\110\111\116\32\97\99\116\105\118\101\58\32\115\107\105\112\112\105\110\103\32\116\101\115\116\115\32\102\111\114\32\116\97\98\108\101\32\115\105\122\101\115\32\60\60\60\10")
else
local function mp2
(n)
local mp = 2 ^ math.ceil(math.log(n,2))
assert(n == 0 or (mp / 2 < n and n <= mp))
return mp
end
do
local s = 0
for _ in pairs(math)
do
s=s + 1
end
check(math,0,mp2(s))
end
local sizes = {0,1,2,3,4,5,7,8,9,15,16,17,30,31,32,33,34,254,255,256,500,1000}
for _,sa in ipairs(sizes)
do
local arr = {"\114\101\116\117\114\110\32\123"}
for i = 1, sa
do
arr[1 + i]="\49\44"
end
for _,sh in ipairs(sizes)
do
for j = 1, sh
do
arr[1 + sa + j]=string.format("\107\37\120\61\37\100\44",j,j)
end
arr[1 + sa + sh + 1]="\125"
local prog = table.concat(arr)
local f = assert(load(prog))
collectgarbage("\115\116\111\112")
f()
if sa == 0 or sh == 0 then
T.alloccount(2)
;
else
T.alloccount(3)
;
end
local t = f()
T.alloccount()
;
collectgarbage("\114\101\115\116\97\114\116")
assert(# t == sa)
check(t,sa,mp2(sh))
end
end
local a = {}
for i = 1, sizes[# sizes]
do
a[i]=i
end
for k in ipairs(sizes)
do
local t = {table.unpack(a,1,k)}
assert(# t == k)
check(t,k,0)
t={1,2,3,table.unpack(a,1,k)}
check(t,k + 3,0)
assert(# t == k + 3)
end
local lim = 130
local a = {}
;
a[2]=1
;
check(a,0,1)
a={}
;
a[0]=1
;
check(a,0,1)
;
a[2]=1
;
check(a,0,2)
a={}
;
a[0]=1
;
a[1]=1
;
check(a,1,1)
a={}
for i = 1, lim
do
a[i]=1
assert(# a == i)
check(a,mp2(i),0)
end
a={}
for i = 1, lim
do
a["\97" .. i]=1
assert(# a == 0)
check(a,0,mp2(i))
end
a={}
for i = 1, 16
do
a[i]=i
end
check(a,16,0)
do
for i = 1, 11
do
a[i]=undef
end
for i = 30, 50
do
a[i]=true
;
a[i]=undef
end
check(a,0,8)
a[10]=1
for i = 30, 50
do
a[i]=true
;
a[i]=undef
end
check(a,0,8)
for i = 1, 14
do
a[i]=true
;
a[i]=undef
end
for i = 18, 50
do
a[i]=true
;
a[i]=undef
end
check(a,0,4)
end
for i = 1, lim
do
local a = {}
for i = i, 1, - 1
do
a[i]=i
end
check(a,mp2(i),0)
end
lim=35
local function foo
(n, ...)
local arg = {...}
check(arg,n,0)
assert(select("\35",...) == n)
arg[n + 1]=true
check(arg,mp2(n + 1),0)
arg.x=true
check(arg,mp2(n + 1),1)
end
local a = {}
for i = 1, lim
do
a[i]=true
;
foo(i,table.unpack(a))
end
local a = {}
for i = 1, 64
do
a[i]=true
end
for i = 1, 64
do
a[i]=nil
end
assert(T.querytab(a) == 64)
a[32]=true
;
a[48]=true
;
a[51]=true
assert(# a == 48)
assert(select(4,T.querytab(a)) == 48)
a[50]=true
assert(select(4,T.querytab(a)) == 50)
assert(# a == 51)
end
assert(# {} == 0)
assert(# {nil} == 0)
assert(# {nil,nil} == 0)
assert(# {nil,nil,nil} == 0)
assert(# {nil,nil,nil,nil} == 0)
assert(# {1,2,3,nil,nil} == 3)
print("\43")
local nofind = {}
a,b,c=1,2,3
a,b,c=nil
assert(next({}) == next({}))
local function find
(name)
local n,v
while 1 do
n,v=next(_G,n)
if not n then
return nofind
end
assert(_G[n] ~= undef)
if n == name then
return v
end
end
end
local function find1
(name)
for n,v in pairs(_G)
do
if n == name then
return v
end
end
return nil
end
assert(print == find("\112\114\105\110\116") and print == find1("\112\114\105\110\116"))
assert(_G["\112\114\105\110\116"] == find("\112\114\105\110\116"))
assert(assert == find1("\97\115\115\101\114\116"))
assert(nofind == find("\114\101\116\117\114\110"))
assert(not find1("\114\101\116\117\114\110"))
_G["\114\101\116" .. "\117\114\110"]=undef
assert(nofind == find("\114\101\116\117\114\110"))
_G["\120\120\120"]=1
assert(xxx == find("\120\120\120"))
checkerror("\105\110\118\97\108\105\100\32\107\101\121",next,{10,20},3)
checkerror("\98\97\100\32\97\114\103\117\109\101\110\116",pairs)
checkerror("\98\97\100\32\97\114\103\117\109\101\110\116",ipairs)
print("\43")
a={}
for i = 0, 10000
do
if math.fmod(i,10) ~= 0 then
a["\120" .. i]=i
end
end
n={["\110"] = 0}
for i,v in pairs(a)
do
n.n=n.n + 1
assert(i and v and a[i] == v)
end
assert(n.n == 9000)
a=nil
do
local a = {}
for n,v in pairs(_G)
do
a[n]=v
end
for n,v in pairs(a)
do
if not package.loaded[n] and type(v) ~= "\102\117\110\99\116\105\111\110" and not string.find(n,"\94\91\37\117\95\93") then
_G[n]=undef
end
collectgarbage()
end
end
local function checknext
(a)
local b = {}
do
local k,v = next(a)
;
while k do
b[k]=v
;
k,v=next(a,k)
end
end
for k,v in pairs(b)
do
assert(a[k] == v)
end
for k,v in pairs(a)
do
assert(b[k] == v)
end
end
checknext({1,["\120"] = 1,["\121"] = 2,["\122"] = 3})
checknext({1,2,["\120"] = 1,["\121"] = 2,["\122"] = 3})
checknext({1,2,3,["\120"] = 1,["\121"] = 2,["\122"] = 3})
checknext({1,2,3,4,["\120"] = 1,["\121"] = 2,["\122"] = 3})
checknext({1,2,3,4,5,["\120"] = 1,["\121"] = 2,["\122"] = 3})
assert(# {} == 0)
assert(# {[- 1] = 2} == 0)
for i = 0, 40
do
local a = {}
for j = 1, i
do
a[j]=j
end
assert(# a == i)
end
function table.maxn(t)
local max = 0
for k in pairs(t)
do
max=(type(k) == "\110\117\109\98\101\114") and math.max(max,k) or max
end
return max
end
assert(table.maxn({}) == 0)
assert(table.maxn({["\49\48\48\48"] = true}) == 0)
assert(table.maxn({["\49\48\48\48"] = true,[24.5] = 3}) == 24.5)
assert(table.maxn({[1000] = true}) == 1000)
assert(table.maxn({[10] = true,[100 * math.pi] = print}) == 100 * math.pi)
table.maxn=nil
a={}
for i = 0, 50
do
a[2 ^ i]=true
end
assert(a[# a])
print("\43")
do
local a = {[1] = 1,[1.1] = 2,["\120"] = 3,[string.rep("\120",1000)] = 4,[print] = 5,[checkerror] = 6,[coroutine.running()] = 7,[true] = 8,[io.stdin] = 9,[{}] = 10}
local b = {}
;
for i = 1, 10
do
b[i]=true
end
for k,v in pairs(a)
do
assert(b[v])
;
b[v]=undef
end
assert(next(b) == nil)
end
local t = {[{1}] = 1,[{2}] = 2,[string.rep("\120\32",4)] = 3,[100.3] = 4,[4] = 5}
local n = 0
for k,v in pairs(t)
do
n=n + 1
assert(t[k] == v)
t[k]=undef
collectgarbage()
assert(t[k] == undef)
end
assert(n == 5)
do
print("\116\101\115\116\105\110\103\32\110\101\120\116\32\120\32\71\67\32\111\102\32\100\101\108\101\116\101\100\32\107\101\121\115")
local co = coroutine.wrap(function (t)
for k,v in pairs(t)
do
local k1 = next(t)
assert(k == k1)
t[k]=nil
local expected = (type(k) == "\116\97\98\108\101" and k[1] or type(k) == "\102\117\110\99\116\105\111\110" and k() or string.sub(k,1,1))
assert(expected == v)
coroutine.yield(v)
end
end)
local t = {}
t[{1}]=1
t[{2}]=2
t[string.rep("\97",50)]="\97"
t[string.rep("\98",50)]="\98"
t[{3}]=3
t[string.rep("\99",10)]="\99"
t[function ()
return 10
end]=10
local count = 7
while co(t) do
collectgarbage("\99\111\108\108\101\99\116")
count=count - 1
end
assert(count == 0 and next(t) == nil)
end
local function test
(a)
assert(not pcall(table.insert,a,2,20))
;
table.insert(a,10)
;
table.insert(a,2,20)
;
table.insert(a,1,- 1)
;
table.insert(a,40)
;
table.insert(a,# a + 1,50)
table.insert(a,2,- 2)
assert(a[2] ~= undef)
assert(a["\50"] == undef)
assert(not pcall(table.insert,a,0,20))
;
assert(not pcall(table.insert,a,# a + 2,20))
;
assert(table.remove(a,1) == - 1)
assert(table.remove(a,1) == - 2)
assert(table.remove(a,1) == 10)
assert(table.remove(a,1) == 20)
assert(table.remove(a,1) == 40)
assert(table.remove(a,1) == 50)
assert(table.remove(a,1) == nil)
assert(table.remove(a) == nil)
assert(table.remove(a,# a) == nil)
end
a={["\110"] = 0,[- 7] = "\98\97\110"}
test(a)
assert(a.n == 0 and a[- 7] == "\98\97\110")
a={[- 7] = "\98\97\110"}
;
test(a)
assert(a.n == nil and # a == 0 and a[- 7] == "\98\97\110")
a={[- 1] = "\98\97\110"}
test(a)
assert(# a == 0 and table.remove(a) == nil and a[- 1] == "\98\97\110")
a={[0] = "\98\97\110"}
assert(# a == 0 and table.remove(a) == "\98\97\110" and a[0] == undef)
table.insert(a,1,10)
;
table.insert(a,1,20)
;
table.insert(a,1,- 1)
assert(table.remove(a) == 10)
assert(table.remove(a) == 20)
assert(table.remove(a) == - 1)
assert(table.remove(a) == nil)
a={"\99","\100"}
table.insert(a,3,"\97")
table.insert(a,"\98")
assert(table.remove(a,1) == "\99")
assert(table.remove(a,1) == "\100")
assert(table.remove(a,1) == "\97")
assert(table.remove(a,1) == "\98")
assert(table.remove(a,1) == nil)
assert(# a == 0 and a.n == nil)
a={10,20,30,40}
assert(table.remove(a,# a + 1) == nil)
assert(not pcall(table.remove,a,0))
assert(a[# a] == 40)
assert(table.remove(a,# a) == 40)
assert(a[# a] == 30)
assert(table.remove(a,2) == 20)
assert(a[# a] == 30 and # a == 2)
do
local function test
(proxy,t)
for i = 1, 10
do
table.insert(proxy,1,i)
end
assert(# proxy == 10 and # t == 10 and proxy[1] ~= undef)
for i = 1, 10
do
assert(t[i] == 11 - i)
end
table.sort(proxy)
for i = 1, 10
do
assert(t[i] == i and proxy[i] == i)
end
assert(table.concat(proxy,"\44") == "\49\44\50\44\51\44\52\44\53\44\54\44\55\44\56\44\57\44\49\48")
for i = 1, 8
do
assert(table.remove(proxy,1) == i)
end
assert(# proxy == 2 and # t == 2)
local a,b,c = table.unpack(proxy)
assert(a == 9 and b == 10 and c == nil)
end
local t = {}
local proxy = setmetatable({},{["\95\95\108\101\110"] = function ()
return # t
end,["\95\95\105\110\100\101\120"] = t,["\95\95\110\101\119\105\110\100\101\120"] = t})
test(proxy,t)
local count = 0
t=setmetatable({},{["\95\95\110\101\119\105\110\100\101\120"] = function (t,k,v)
count=count + 1
;
rawset(t,k,v)
end})
test(t,t)
assert(count == 10)
t=setmetatable({},{["\95\95\105\110\100\101\120"] = function (_,k)
return k + 1
end,["\95\95\108\101\110"] = function (_)
return 5
end})
assert(table.concat(t,"\59") == "\50\59\51\59\52\59\53\59\54")
end
do
local t = setmetatable({},{["\95\95\108\101\110"] = function ()
return math.maxinteger
end})
table.insert(t,20)
local k,v = next(t)
assert(k == math.mininteger and v == 20)
end
if not T then
(Message or print)("\10\32\62\62\62\32\116\101\115\116\67\32\110\111\116\32\97\99\116\105\118\101\58\32\115\107\105\112\112\105\110\103\32\116\101\115\116\115\32\102\111\114\32\116\97\98\108\101\32\108\105\98\114\97\114\121\32\111\110\32\110\111\110\45\116\97\98\108\101\115\32\60\60\60\10")
else
local debug = require("\100\101\98\117\103")
local tab = {10,20,30}
local mt = {}
local u = T.newuserdata(0)
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.insert,u,40)
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.remove,u)
debug.setmetatable(u,mt)
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.insert,u,40)
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.remove,u)
mt.__index=tab
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.insert,u,40)
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.remove,u)
mt.__newindex=tab
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.insert,u,40)
checkerror("\116\97\98\108\101\32\101\120\112\101\99\116\101\100",table.remove,u)
mt.__len=function ()
return # tab
end
table.insert(u,40)
assert(# u == 4 and # tab == 4 and u[4] == 40 and tab[4] == 40)
assert(table.remove(u) == 40)
table.insert(u,1,50)
assert(# u == 4 and # tab == 4 and u[4] == 30 and tab[1] == 50)
mt.__newindex=nil
mt.__len=nil
local tab2 = {}
local u2 = T.newuserdata(0)
debug.setmetatable(u2,{["\95\95\110\101\119\105\110\100\101\120"] = function (_,k,v)
tab2[k]=v
end})
table.move(u,1,4,1,u2)
assert(# tab2 == 4 and tab2[1] == tab[1] and tab2[4] == tab[4])
end
print("\43")
a={}
for i = 1, 1000
do
a[i]=i
;
a[i - 1]=undef
end
assert(next(a,nil) == 1000 and next(a,1000) == nil)
assert(next({}) == nil)
assert(next({},nil) == nil)
for a,b in pairs({})
do
error("\110\111\116\32\104\101\114\101")
end
for i = 1, 0
do
error("\110\111\116\32\104\101\114\101")
end
for i = 0, 1, - 1
do
error("\110\111\116\32\104\101\114\101")
end
a=nil
;
for i = 1, 1
do
assert(not a)
;
a=1
end
;
assert(a)
a=nil
;
for i = 1, 1, - 1
do
assert(not a)
;
a=1
end
;
assert(a)
do
print("\116\101\115\116\105\110\103\32\102\108\111\97\116\115\32\105\110\32\110\117\109\101\114\105\99\32\102\111\114")
local a
a=0
;
for i = 1, 1, 1
do
a=a + 1
end
;
assert(a == 1)
a=0
;
for i = 10000, 1e4, - 1
do
a=a + 1
end
;
assert(a == 1)
a=0
;
for i = 1, 0.99999, 1
do
a=a + 1
end
;
assert(a == 0)
a=0
;
for i = 9999, 1e4, - 1
do
a=a + 1
end
;
assert(a == 0)
a=0
;
for i = 1, 0.99999, - 1
do
a=a + 1
end
;
assert(a == 1)
a=0
;
for i = 0, 0.999999999, 0.1
do
a=a + 1
end
;
assert(a == 10)
a=0
;
for i = 1.0, 1, 1
do
a=a + 1
end
;
assert(a == 1)
a=0
;
for i = - 1.5, - 1.5, 1
do
a=a + 1
end
;
assert(a == 1)
a=0
;
for i = 1e6, 1e6, - 1
do
a=a + 1
end
;
assert(a == 1)
a=0
;
for i = 1.0, 0.99999, 1
do
a=a + 1
end
;
assert(a == 0)
a=0
;
for i = 99999, 1e5, - 1.0
do
a=a + 1
end
;
assert(a == 0)
a=0
;
for i = 1.0, 0.99999, - 1
do
a=a + 1
end
;
assert(a == 1)
end
do
local a
a=0
;
for i = 1, 10
do
a=a + 1
;
i="\120"
end
;
assert(a == 10)
a=0
;
for i = 10.0, 1, - 1
do
a=a + 1
;
i="\120"
end
;
assert(a == 10)
end
a=0
;
for i = "\49\48", "\49", "\45\50"
do
a=a + 1
end
;
assert(a == 5)
do
local c
local function checkfloat
(i)
assert(math.type(i) == "\102\108\111\97\116")
c=c + 1
end
c=0
;
for i = 1.0, 10
do
checkfloat(i)
end
assert(c == 10)
c=0
;
for i = - 1, - 10, - 1.0
do
checkfloat(i)
end
assert(c == 10)
local function checkint
(i)
assert(math.type(i) == "\105\110\116\101\103\101\114")
c=c + 1
end
local m = math.maxinteger
c=0
;
for i = m, m - 10, - 1
do
checkint(i)
end
assert(c == 11)
c=0
;
for i = 1, 10.9
do
checkint(i)
end
assert(c == 10)
c=0
;
for i = 10, 1e-3, - 1
do
checkint(i)
end
assert(c == 10)
c=0
;
for i = 1, "\49\48\46\56"
do
checkint(i)
end
assert(c == 10)
c=0
;
for i = 9, "\51\46\52", - 1
do
checkint(i)
end
assert(c == 6)
c=0
;
for i = 0, "\32\45\51\46\52\32\32", - 1
do
checkint(i)
end
assert(c == 4)
c=0
;
for i = 100, "\57\54\46\51", - 2
do
checkint(i)
end
assert(c == 2)
c=0
;
for i = 1, math.huge
do
if i > 10 then
break
end
;
checkint(i)
end
assert(c == 10)
c=0
;
for i = - 1, - math.huge, - 1
do
if i < - 10 then
break
end
;
checkint(i)
end
assert(c == 10)
for i = math.mininteger, - 1e101
do
assert(false)
end
for i = math.maxinteger, 1e101, - 1
do
assert(false)
end
end
do
local function checkfor
(from,to,step,t)
local c = 0
for i = from, to, step
do
c=c + 1
assert(i == t[c])
end
assert(c == # t)
end
local maxi = math.maxinteger
local mini = math.mininteger
checkfor(mini,maxi,maxi,{mini,- 1,maxi - 1})
checkfor(mini,math.huge,maxi,{mini,- 1,maxi - 1})
checkfor(maxi,mini,mini,{maxi,- 1})
checkfor(maxi,mini,- maxi,{maxi,0,- maxi})
checkfor(maxi,- math.huge,mini,{maxi,- 1})
checkfor(maxi,mini,1,{})
checkfor(mini,maxi,- 1,{})
checkfor(maxi - 6,maxi,3,{maxi - 6,maxi - 3,maxi})
checkfor(mini + 4,mini,- 2,{mini + 4,mini + 2,mini})
local step = maxi // 10
local c = mini
for i = mini, maxi, step
do
assert(i == c)
c=c + step
end
c=maxi
for i = maxi, mini, - step
do
assert(i == c)
c=c - step
end
checkfor(maxi,maxi,maxi,{maxi})
checkfor(maxi,maxi,mini,{maxi})
checkfor(mini,mini,maxi,{mini})
checkfor(mini,mini,mini,{mini})
end
checkerror("\39\102\111\114\39\32\115\116\101\112\32\105\115\32\122\101\114\111",function ()
for i = 1, 10, 0
do

end
end)
checkerror("\39\102\111\114\39\32\115\116\101\112\32\105\115\32\122\101\114\111",function ()
for i = 1, - 10, 0
do

end
end)
checkerror("\39\102\111\114\39\32\115\116\101\112\32\105\115\32\122\101\114\111",function ()
for i = 1.0, - 10, 0.0
do

end
end)
collectgarbage()
local function f
(n,p)
local t = {}
;
for i = 1, p
do
t[i]=i * 10
end
return function (_,n, ...)
assert(select("\35",...) == 0)
if n > 0 then
n=n - 1
return n,table.unpack(t)
end
end,nil,n
end
local x = 0
for n,a,b,c,d in f(5,3)
do
x=x + 1
assert(a == 10 and b == 20 and c == 30 and d == nil)
end
assert(x == 5)
a={}
do
local x,y,z = pairs(a)
assert(type(x) == "\102\117\110\99\116\105\111\110" and y == a and z == nil)
end
local function foo
(e,i)
assert(e == a)
if i <= 10 then
return i + 1,i + 2
end
end
local function foo1
(e,i)
i=i + 1
assert(e == a)
if i <= e.n then
return i,a[i]
end
end
setmetatable(a,{["\95\95\112\97\105\114\115"] = function (x)
return foo,x,0
end})
local i = 0
for k,v in pairs(a)
do
i=i + 1
assert(k == i and v == k + 1)
end
a.n=5
a[3]=30
a={["\110"] = 10}
setmetatable(a,{["\95\95\105\110\100\101\120"] = function (t,k)
if k <= t.n then
return k * 10
end
end})
i=0
for k,v in ipairs(a)
do
i=i + 1
assert(k == i and v == i * 10)
end
assert(i == a.n)
do
local t = setmetatable({10,20,30},{["\95\95\112\97\105\114\115"] = function (t)
local inc = coroutine.yield()
return function (t,i)
if i > 1 then
return i - inc,t[i - inc]
else
return nil
end
end,t,# t + 1
end})
local res = {}
local co = coroutine.wrap(function ()
for i,p in pairs(t)
do
res[# res + 1]=p
end
end)
co()
co(1)
assert(res[1] == 30 and res[2] == 20 and res[3] == 10 and # res == 3)
end
print("\79\75")