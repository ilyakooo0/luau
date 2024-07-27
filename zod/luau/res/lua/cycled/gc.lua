print("\116\101\115\116\105\110\103\32\105\110\99\114\101\109\101\110\116\97\108\32\103\97\114\98\97\103\101\32\99\111\108\108\101\99\116\105\111\110")
local debug = require("\100\101\98\117\103")
assert(collectgarbage("\105\115\114\117\110\110\105\110\103"))
collectgarbage()
local oldmode = collectgarbage("\105\110\99\114\101\109\101\110\116\97\108")
assert(collectgarbage("\103\101\110\101\114\97\116\105\111\110\97\108") == "\105\110\99\114\101\109\101\110\116\97\108")
assert(collectgarbage("\103\101\110\101\114\97\116\105\111\110\97\108") == "\103\101\110\101\114\97\116\105\111\110\97\108")
assert(collectgarbage("\105\110\99\114\101\109\101\110\116\97\108") == "\103\101\110\101\114\97\116\105\111\110\97\108")
assert(collectgarbage("\105\110\99\114\101\109\101\110\116\97\108") == "\105\110\99\114\101\109\101\110\116\97\108")
local function nop
()

end
local function gcinfo
()
return collectgarbage("\99\111\117\110\116") * 1024
end
do
local a = collectgarbage("\115\101\116\112\97\117\115\101",200)
local b = collectgarbage("\115\101\116\115\116\101\112\109\117\108",200)
local t = {0,2,10,90,500,5000,30000,2147483646}
for i = 1, # t
do
local p = t[i]
for j = 1, # t
do
local m = t[j]
collectgarbage("\115\101\116\112\97\117\115\101",p)
collectgarbage("\115\101\116\115\116\101\112\109\117\108",m)
collectgarbage("\115\116\101\112",0)
collectgarbage("\115\116\101\112",10000)
end
end
collectgarbage("\115\101\116\112\97\117\115\101",a)
collectgarbage("\115\101\116\115\116\101\112\109\117\108",b)
collectgarbage()
end
_G["\119\104\105\108\101"]=234
local function GC1
()
local u
local b
local finish = false
u=setmetatable({},{["\95\95\103\99"] = function ()
finish=true
end})
b={34}
repeat
u={}
until finish
assert(b[1] == 34)
finish=false
;
local i = 1
u=setmetatable({},{["\95\95\103\99"] = function ()
finish=true
end})
repeat
i=i + 1
;
u=tostring(i) .. tostring(i)
until finish
assert(b[1] == 34)
finish=false
u=setmetatable({},{["\95\95\103\99"] = function ()
finish=true
end})
repeat
local i
;
u=function ()
return i
end
until finish
assert(b[1] == 34)
end
local function GC2
()
local u
local finish = false
u={setmetatable({},{["\95\95\103\99"] = function ()
finish=true
end})}
local b = {34}
repeat
u={{}}
until finish
assert(b[1] == 34)
finish=false
;
local i = 1
u={setmetatable({},{["\95\95\103\99"] = function ()
finish=true
end})}
repeat
i=i + 1
;
u={tostring(i) .. tostring(i)}
until finish
assert(b[1] == 34)
finish=false
u={setmetatable({},{["\95\95\103\99"] = function ()
finish=true
end})}
repeat
local i
;
u={function ()
return i
end}
until finish
assert(b[1] == 34)
end
local function GC
()
GC1()
;
GC2()
end
do
print("\99\114\101\97\116\105\110\103\32\109\97\110\121\32\111\98\106\101\99\116\115")
local limit = 5000
for i = 1, limit
do
local a = {}
;
a=nil
end
local a = "\97"
for i = 1, limit
do
a=i .. "\98"
;
a=string.gsub(a,"\40\37\100\37\100\42\41","\37\49\32\37\49")
a="\97"
end
a={}
function a:test()
for i = 1, limit
do
load(string.format("\102\117\110\99\116\105\111\110\32\116\101\109\112\40\97\41\32\114\101\116\117\114\110\32\39\97\37\100\39\32\101\110\100",i),"")()
assert(temp() == string.format("\97\37\100",i))
end
end
a:test()
_G.temp=nil
end
do
local f = function ()

end
end
print("\102\117\110\99\116\105\111\110\115\32\119\105\116\104\32\101\114\114\111\114\115")
local prog = "\100\111\10\32\32\97\32\61\32\49\48\59\10\32\32\102\117\110\99\116\105\111\110\32\102\111\111\40\120\44\121\41\10\32\32\32\32\97\32\61\32\115\105\110\40\97\43\48\46\52\53\54\45\48\46\50\51\101\45\49\50\41\59\10\32\32\32\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\122\41\32\114\101\116\117\114\110\32\115\105\110\40\37\120\43\122\41\32\101\110\100\10\32\32\101\110\100\10\32\32\108\111\99\97\108\32\120\32\61\32\102\117\110\99\116\105\111\110\32\40\119\41\32\97\61\97\43\119\59\32\101\110\100\10\101\110\100\10"
do
local step = 1
if _soft then
step=13
end
for i = 1, string.len(prog), step
do
for j = i, string.len(prog), step
do
pcall(load(string.sub(prog,i,j),""))
end
end
end
rawset(_G,"\97",nil)
_G.x=nil
do
foo=nil
print("\108\111\110\103\32\115\116\114\105\110\103\115")
local x = "\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57"
assert(string.len(x) == 80)
local s = ""
local k = math.min(300,(math.maxinteger // 80) // 2)
for n = 1, k
do
s=s .. x
;
local j = tostring(n)
end
assert(string.len(s) == k * 80)
s=string.sub(s,1,10000)
local s,i = string.gsub(s,"\40\37\100\37\100\37\100\37\100\41","")
assert(i == 10000 // 4)
assert(_G["\119\104\105\108\101"] == 234)
_G["\119\104\105\108\101"]=nil
end
do
print("\115\116\101\112\115")
print("\115\116\101\112\115\32\40\50\41")
local function dosteps
(siz)
collectgarbage()
local a = {}
for i = 1, 100
do
a[i]={{}}
;
local b = {}
end
local x = gcinfo()
local i = 0
repeat
i=i + 1
until collectgarbage("\115\116\101\112",siz)
assert(gcinfo() < x)
return i
end
collectgarbage("\115\116\111\112")
if not _port then
assert(dosteps(10) < dosteps(2))
end
assert(dosteps(20000) == 1)
assert(collectgarbage("\115\116\101\112",20000) == true)
assert(collectgarbage("\115\116\101\112",20000) == true)
assert(not collectgarbage("\105\115\114\117\110\110\105\110\103"))
collectgarbage("\114\101\115\116\97\114\116")
assert(collectgarbage("\105\115\114\117\110\110\105\110\103"))
end
if not _port then
collectgarbage()
;
collectgarbage()
local x = gcinfo()
collectgarbage("\115\116\111\112")
repeat
local a = {}
until gcinfo() > 3 * x
collectgarbage("\114\101\115\116\97\114\116")
assert(collectgarbage("\105\115\114\117\110\110\105\110\103"))
repeat
local a = {}
until gcinfo() <= x * 2
end
print("\99\108\101\97\114\105\110\103\32\116\97\98\108\101\115")
local lim = 15
local a = {}
for i = 1, lim
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
assert(type(n) == "\116\97\98\108\101" and next(n) == nil)
collectgarbage()
end
b=nil
collectgarbage()
for n in pairs(a)
do
error("\99\97\110\110\111\116\32\98\101\32\104\101\114\101")
end
for i = 1, lim
do
a[i]=i
end
for i = 1, lim
do
assert(a[i] == i)
end
print("\119\101\97\107\32\116\97\98\108\101\115")
a={}
;
setmetatable(a,{["\95\95\109\111\100\101"] = "\107"})
;
for i = 1, lim
do
a[{}]=i
end
for i = 1, lim
do
a[i]=i
end
for i = 1, lim
do
local s = string.rep("\64",i)
;
a[s]=s .. "\35"
end
collectgarbage()
local i = 0
for k,v in pairs(a)
do
assert(k == v or k .. "\35" == v)
;
i=i + 1
end
assert(i == 2 * lim)
a={}
;
setmetatable(a,{["\95\95\109\111\100\101"] = "\118"})
;
a[1]=string.rep("\98",21)
collectgarbage()
assert(a[1])
a[1]=undef
for i = 1, lim
do
a[i]={}
end
for i = 1, lim
do
a[i .. "\120"]={}
end
for i = 1, lim
do
local t = {}
;
a[t]=t
end
for i = 1, lim
do
a[i + lim]=i .. "\120"
end
collectgarbage()
local i = 0
for k,v in pairs(a)
do
assert(k == v or k - lim .. "\120" == v)
;
i=i + 1
end
assert(i == 2 * lim)
a={}
;
setmetatable(a,{["\95\95\109\111\100\101"] = "\107\118"})
;
local x,y,z = {},{},{}
a[1],a[2],a[3]=x,y,z
a[string.rep("\36",11)]=string.rep("\36",11)
for i = 4, lim
do
a[i]={}
end
for i = 1, lim
do
a[{}]=i
end
for i = 1, lim
do
local t = {}
;
a[t]=t
end
collectgarbage()
assert(next(a) ~= nil)
local i = 0
for k,v in pairs(a)
do
assert((k == 1 and v == x) or (k == 2 and v == y) or (k == 3 and v == z) or k == v)
;
i=i + 1
end
assert(i == 4)
x,y,z=nil
collectgarbage()
assert(next(a) == string.rep("\36",11))
a={}
local t = {["\120"] = 10}
local C = setmetatable({["\107\101\121"] = t},{["\95\95\109\111\100\101"] = "\118"})
local C1 = setmetatable({[t] = 1},{["\95\95\109\111\100\101"] = "\107"})
a.x=t
setmetatable(a,{["\95\95\103\99"] = function (u)
assert(C.key == nil)
assert(type(next(C1)) == "\116\97\98\108\101")
end})
a,t=nil
collectgarbage()
collectgarbage()
assert(next(C) == nil and next(C1) == nil)
C,C1=nil
local mt = {["\95\95\109\111\100\101"] = "\107"}
a={{10},{20},{30},{40}}
;
setmetatable(a,mt)
x=nil
for i = 1, 100
do
local n = {}
;
a[n]={["\107"] = {x}}
;
x=n
end
GC()
local n = x
local i = 0
while n do
n=a[n].k[1]
;
i=i + 1
end
assert(i == 100)
x=nil
GC()
for i = 1, 4
do
assert(a[i][1] == i * 10)
;
a[i]=undef
end
assert(next(a) == nil)
local K = {}
a[K]={}
for i = 1, 10
do
a[K][i]={}
;
a[a[K][i]]=setmetatable({},mt)
end
x=nil
local k = 1
for j = 1, 100
do
local n = {}
;
local nk = k % 10 + 1
a[a[K][nk]][n]={x,["\107"] = k}
;
x=n
;
k=nk
end
GC()
local n = x
local i = 0
while n do
local t = a[a[K][k]][n]
;
n=t[1]
;
k=t.k
;
i=i + 1
end
assert(i == 100)
K=nil
GC()
if T then
collectgarbage("\115\116\111\112")
local u = {}
local s = {}
;
setmetatable(s,{["\95\95\109\111\100\101"] = "\107"})
setmetatable(u,{["\95\95\103\99"] = function (o)
local i = s[o]
s[i]=true
assert(not s[i - 1])
if i == 8 then
error("\64\101\120\112\101\99\116\101\100\64")
end
end})
for i = 6, 10
do
local n = setmetatable({},getmetatable(u))
s[n]=i
end
warn("\64\111\110")
;
warn("\64\115\116\111\114\101")
collectgarbage()
assert(string.find(_WARN,"\101\114\114\111\114\32\105\110\32\95\95\103\99"))
assert(string.match(_WARN,"\64\40\46\45\41\64") == "\101\120\112\101\99\116\101\100")
;
_WARN=false
for i = 8, 10
do
assert(s[i])
end
for i = 1, 5
do
local n = setmetatable({},getmetatable(u))
s[n]=i
end
collectgarbage()
for i = 1, 10
do
assert(s[i])
end
getmetatable(u).__gc=nil
warn("\64\110\111\114\109\97\108")
end
print("\43")
if T == nil then
(Message or print)("\10\32\62\62\62\32\116\101\115\116\67\32\110\111\116\32\97\99\116\105\118\101\58\32\115\107\105\112\112\105\110\103\32\117\115\101\114\100\97\116\97\32\71\67\32\116\101\115\116\115\32\60\60\60\10")
else
local function newproxy
(u)
return debug.setmetatable(T.newuserdata(0),debug.getmetatable(u))
end
collectgarbage("\115\116\111\112")
local u = newproxy(nil)
debug.setmetatable(u,{["\95\95\103\99"] = true})
local s = 0
local a = {[u] = 0}
;
setmetatable(a,{["\95\95\109\111\100\101"] = "\118\107"})
for i = 1, 10
do
a[newproxy(u)]=i
end
for k in pairs(a)
do
assert(getmetatable(k) == getmetatable(u))
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
for i = 1, 10
do
assert(a[i])
end
getmetatable(u).a=a1
getmetatable(u).u=u
do
local u = u
getmetatable(u).__gc=function (o)
assert(a[o] == 10 - s)
assert(a[10 - s] == undef)
assert(getmetatable(o) == getmetatable(u))
assert(getmetatable(o).a[o] == 10 - s)
s=s + 1
end
end
a1,u=nil
assert(next(a) ~= nil)
collectgarbage()
assert(s == 11)
collectgarbage()
assert(next(a) == nil)
end
local u = setmetatable({},{["\95\95\103\99"] = true})
setmetatable(getmetatable(u),{["\95\95\109\111\100\101"] = "\118"})
getmetatable(u).__gc=function (o)
os.exit(1)
end
u=nil
collectgarbage()
local u = setmetatable({},{["\95\95\103\99"] = true})
local m = getmetatable(u)
m.x={[{0}] = 1,[0] = {1}}
;
setmetatable(m.x,{["\95\95\109\111\100\101"] = "\107\118"})
;
m.__gc=function (o)
assert(next(getmetatable(o).x) == nil)
m=10
end
u,m=nil
collectgarbage()
assert(m == 10)
do
collectgarbage()
;
collectgarbage()
local m = collectgarbage("\99\111\117\110\116")
local a = setmetatable({},{["\95\95\109\111\100\101"] = "\107\118"})
a[string.rep("\97",2 ^ 22)]=25
a[string.rep("\98",2 ^ 22)]={}
a[{}]=14
assert(collectgarbage("\99\111\117\110\116") > m + 2 ^ 13)
collectgarbage()
assert(collectgarbage("\99\111\117\110\116") >= m + 2 ^ 12 and collectgarbage("\99\111\117\110\116") < m + 2 ^ 13)
local k,v = next(a)
assert(k == string.rep("\97",2 ^ 22) and v == 25)
assert(next(a,k) == nil)
assert(a[string.rep("\98",2 ^ 22)] == undef)
a[k]=undef
k=nil
collectgarbage()
assert(next(a) == nil)
assert(a[string.rep("\98",100)] == undef)
assert(collectgarbage("\99\111\117\110\116") <= m + 1)
end
if T then
warn("\64\115\116\111\114\101")
u=setmetatable({},{["\95\95\103\99"] = function ()
error("\64\101\120\112\101\99\116\101\100\32\101\114\114\111\114")
end})
u=nil
collectgarbage()
assert(string.find(_WARN,"\64\101\120\112\101\99\116\101\100\32\101\114\114\111\114"))
;
_WARN=false
warn("\64\110\111\114\109\97\108")
end
if not _soft then
print("\108\111\110\103\32\108\105\115\116")
local a = {}
for i = 1, 200000
do
a={["\110\101\120\116"] = a}
end
a=nil
collectgarbage()
end
print("\115\101\108\102\45\114\101\102\101\114\101\110\99\101\100\32\116\104\114\101\97\100\115")
local thread_id = 0
local threads = {}
local function fn
(thread)
local x = {}
threads[thread_id]=function ()
thread=x
end
coroutine.yield()
end
while thread_id < 1000 do
local thread = coroutine.create(fn)
coroutine.resume(thread,thread)
thread_id=thread_id + 1
end
do
local collected = false
collectgarbage()
;
collectgarbage("\115\116\111\112")
do
local function f
(param)
;
(function ()
assert(type(f) == "\102\117\110\99\116\105\111\110" and type(param) == "\116\104\114\101\97\100")
param={param,f}
setmetatable(param,{["\95\95\103\99"] = function ()
collected=true
end})
coroutine.yield(100)
end)()
end
local co = coroutine.create(f)
assert(coroutine.resume(co,co))
end
collectgarbage()
assert(collected)
collectgarbage("\114\101\115\116\97\114\116")
end
do
collectgarbage()
collectgarbage("\115\116\111\112")
collectgarbage("\115\116\101\112",0)
local x = gcinfo()
repeat
for i = 1, 1000
do
_ENV.a={}
end
until gcinfo() > 2 * x
collectgarbage("\114\101\115\116\97\114\116")
_ENV.a=nil
end
if T then
local function foo
()
local a = {["\120"] = 20}
coroutine.yield(function ()
return a.x
end)
assert(a.x == 20)
a={["\120"] = 30}
assert(T.gccolor(a) == "\119\104\105\116\101")
coroutine.yield(100)
end
local t = setmetatable({},{["\95\95\109\111\100\101"] = "\107\118"})
collectgarbage()
;
collectgarbage("\115\116\111\112")
t.co=coroutine.wrap(foo)
local f = t.co()
T.gcstate("\97\116\111\109\105\99")
assert(T.gcstate() == "\97\116\111\109\105\99")
assert(t.co() == 100)
assert(T.gccolor(t.co) == "\119\104\105\116\101")
T.gcstate("\112\97\117\115\101")
assert(t.co == nil and f() == 30)
collectgarbage("\114\101\115\116\97\114\116")
local u = T.newuserdata(0,1)
collectgarbage()
collectgarbage("\115\116\111\112")
local a = {}
T.gcstate("\97\116\111\109\105\99")
T.gcstate("\115\119\101\101\112\97\108\108\103\99")
local x = {}
assert(T.gccolor(u) == "\98\108\97\99\107")
assert(T.gccolor(x) == "\119\104\105\116\101")
debug.setuservalue(u,x)
assert(T.gccolor(u) == "\103\114\97\121")
collectgarbage("\114\101\115\116\97\114\116")
print("\43")
end
if T then
local debug = require("\100\101\98\117\103")
collectgarbage("\115\116\111\112")
local x = T.newuserdata(0)
local y = T.newuserdata(0)
debug.setmetatable(y,{["\95\95\103\99"] = nop})
debug.setmetatable(x,{["\95\95\103\99"] = nop})
assert(T.gccolor(y) == "\119\104\105\116\101")
T.checkmemory()
collectgarbage("\114\101\115\116\97\114\116")
end
if T then
print("\101\109\101\114\103\101\110\99\121\32\99\111\108\108\101\99\116\105\111\110\115")
collectgarbage()
collectgarbage()
T.totalmem(T.totalmem() + 200)
for i = 1, 200
do
local a = {}
end
T.totalmem(0)
collectgarbage()
local t = T.totalmem("\116\97\98\108\101")
local a = {{},{},{}}
assert(T.totalmem("\116\97\98\108\101") == t + 4)
t=T.totalmem("\102\117\110\99\116\105\111\110")
a=function ()

end
assert(T.totalmem("\102\117\110\99\116\105\111\110") == t + 1)
t=T.totalmem("\116\104\114\101\97\100")
a=coroutine.create(function ()

end)
assert(T.totalmem("\116\104\114\101\97\100") == t + 1)
end
do
local setmetatable,assert,type,print,getmetatable = setmetatable,assert,type,print,getmetatable
local tt = {}
tt.__gc=function (o)
assert(getmetatable(o) == tt)
local a = "\120\117\120\117" .. (10 + 3) .. "\106\111\97\111",{}
___Glob=o
setmetatable({},tt)
print("\62\62\62\32\99\108\111\115\105\110\103\32\115\116\97\116\101\32" .. "\60\60\60\10")
end
local u = setmetatable({},tt)
___Glob={u}
end
if T then
local error,assert,find,warn = error,assert,string.find,warn
local n = 0
local lastmsg
local mt = {["\95\95\103\99"] = function (o)
n=n + 1
assert(n == o[1])
if n == 1 then
_WARN=false
elseif n == 2 then
assert(find(_WARN,"\64\101\120\112\101\99\116\101\100\32\119\97\114\110\105\110\103"))
lastmsg=_WARN
else
assert(lastmsg == _WARN)
end
warn("\64\115\116\111\114\101")
;
_WARN=false
error("\64\101\120\112\101\99\116\101\100\32\119\97\114\110\105\110\103")
end}
for i = 10, 1, - 1
do
table.insert(___Glob,setmetatable({i},mt))
end
end
assert(collectgarbage("\105\115\114\117\110\110\105\110\103"))
do
local res = true
setmetatable({},{["\95\95\103\99"] = function ()
res=collectgarbage()
end})
collectgarbage()
assert(not res)
end
collectgarbage(oldmode)
print("\79\75")