print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{73}\u{2c}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{2c}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{66}\u{6f}\u{72}")
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
for i = 0x1, 0x64
do
a[i .. "\u{2b}"]=true
end
for i = 0x1, 0x64
do
a[i .. "\u{2b}"]=undef
end
for i = 0x1, 0x64
do
a[i]=true
assert(# a == i)
end
do
local a = {}
for i = 0x1, 0x64
do
a[i]=i
end
check(a,0x80,0x0)
for i = 0x5, 0x5f
do
a[i]=nil
end
check(a,0x80,0x0)
a.x=0x1
check(a,0x4,0x8)
for i = 0x1, 0x4
do
assert(a[i] == i)
end
for i = 0x5, 0x5f
do
assert(a[i] == nil)
end
for i = 0x60, 0x64
do
assert(a[i] == i)
end
assert(a.x == 0x1)
end
local x = 0x0
for k,v in ipairs({0xa,0x14,0x1e,["\u{78}"] = 0xc})
do
x=x + 0x1
assert(k == x and v == x * 0xa)
end
for _ in ipairs({["\u{78}"] = 0xc,["\u{79}"] = 0x18})
do
assert(nil)
end
x=false
local i = 0x0
for k,v in ipairs({true,false,true,false})
do
i=i + 0x1
x=not x
assert(x == v)
end
assert(i == 0x4)
assert(type(ipairs({})) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}" and ipairs({}) == ipairs({}))
do
local f = ipairs({})
local k,v = f({[math.mininteger] = 0xa},math.maxinteger)
assert(k == math.mininteger and v == 0xa)
k,v=f({[math.mininteger] = 0xa},k)
assert(k == nil)
end
if not T then
(Message or print)("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{3a}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{20}\u{66}\u{6f}\u{72}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{73}\u{69}\u{7a}\u{65}\u{73}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
else
local function mp2
(n)
local mp = 0x2 ^ math.ceil(math.log(n,0x2))
assert(n == 0x0 or (mp / 0x2 < n and n <= mp))
return mp
end
do
local s = 0x0
for _ in pairs(math)
do
s=s + 0x1
end
check(math,0x0,mp2(s))
end
local sizes = {0x0,0x1,0x2,0x3,0x4,0x5,0x7,0x8,0x9,0xf,0x10,0x11,0x1e,0x1f,0x20,0x21,0x22,0xfe,0xff,0x100,0x1f4,0x3e8}
for _,sa in ipairs(sizes)
do
local arr = {"\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{7b}"}
for i = 0x1, sa
do
arr[0x1 + i]="\u{31}\u{2c}"
end
for _,sh in ipairs(sizes)
do
for j = 0x1, sh
do
arr[0x1 + sa + j]=string.format("\u{6b}\u{25}\u{78}\u{3d}\u{25}\u{64}\u{2c}",j,j)
end
arr[0x1 + sa + sh + 0x1]="\u{7d}"
local prog = table.concat(arr)
local f = assert(load(prog))
collectgarbage("\u{73}\u{74}\u{6f}\u{70}")
f()
if sa == 0x0 or sh == 0x0 then
T.alloccount(0x2)
;
else
T.alloccount(0x3)
;
end
local t = f()
T.alloccount()
;
collectgarbage("\u{72}\u{65}\u{73}\u{74}\u{61}\u{72}\u{74}")
assert(# t == sa)
check(t,sa,mp2(sh))
end
end
local a = {}
for i = 0x1, sizes[# sizes]
do
a[i]=i
end
for k in ipairs(sizes)
do
local t = {table.unpack(a,0x1,k)}
assert(# t == k)
check(t,k,0x0)
t={0x1,0x2,0x3,table.unpack(a,0x1,k)}
check(t,k + 0x3,0x0)
assert(# t == k + 0x3)
end
local lim = 0x82
local a = {}
;
a[0x2]=0x1
;
check(a,0x0,0x1)
a={}
;
a[0x0]=0x1
;
check(a,0x0,0x1)
;
a[0x2]=0x1
;
check(a,0x0,0x2)
a={}
;
a[0x0]=0x1
;
a[0x1]=0x1
;
check(a,0x1,0x1)
a={}
for i = 0x1, lim
do
a[i]=0x1
assert(# a == i)
check(a,mp2(i),0x0)
end
a={}
for i = 0x1, lim
do
a["\u{61}" .. i]=0x1
assert(# a == 0x0)
check(a,0x0,mp2(i))
end
a={}
for i = 0x1, 0x10
do
a[i]=i
end
check(a,0x10,0x0)
do
for i = 0x1, 0xb
do
a[i]=undef
end
for i = 0x1e, 0x32
do
a[i]=true
;
a[i]=undef
end
check(a,0x0,0x8)
a[0xa]=0x1
for i = 0x1e, 0x32
do
a[i]=true
;
a[i]=undef
end
check(a,0x0,0x8)
for i = 0x1, 0xe
do
a[i]=true
;
a[i]=undef
end
for i = 0x12, 0x32
do
a[i]=true
;
a[i]=undef
end
check(a,0x0,0x4)
end
for i = 0x1, lim
do
local a = {}
for i = i, 0x1, - 0x1
do
a[i]=i
end
check(a,mp2(i),0x0)
end
lim=0x23
local function foo
(n, ...)
local arg = {...}
check(arg,n,0x0)
assert(select("\u{23}",...) == n)
arg[n + 0x1]=true
check(arg,mp2(n + 0x1),0x0)
arg.x=true
check(arg,mp2(n + 0x1),0x1)
end
local a = {}
for i = 0x1, lim
do
a[i]=true
;
foo(i,table.unpack(a))
end
local a = {}
for i = 0x1, 0x40
do
a[i]=true
end
for i = 0x1, 0x40
do
a[i]=nil
end
assert(T.querytab(a) == 0x40)
a[0x20]=true
;
a[0x30]=true
;
a[0x33]=true
assert(# a == 0x30)
assert(select(0x4,T.querytab(a)) == 0x30)
a[0x32]=true
assert(select(0x4,T.querytab(a)) == 0x32)
assert(# a == 0x33)
end
assert(# {} == 0x0)
assert(# {nil} == 0x0)
assert(# {nil,nil} == 0x0)
assert(# {nil,nil,nil} == 0x0)
assert(# {nil,nil,nil,nil} == 0x0)
assert(# {0x1,0x2,0x3,nil,nil} == 0x3)
print("\u{2b}")
local nofind = {}
a,b,c=0x1,0x2,0x3
a,b,c=nil
assert(next({}) == next({}))
local function find
(name)
local n,v
while 0x1 do
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
assert(print == find("\u{70}\u{72}\u{69}\u{6e}\u{74}") and print == find1("\u{70}\u{72}\u{69}\u{6e}\u{74}"))
assert(_G["\u{70}\u{72}\u{69}\u{6e}\u{74}"] == find("\u{70}\u{72}\u{69}\u{6e}\u{74}"))
assert(assert == find1("\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}"))
assert(nofind == find("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}"))
assert(not find1("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}"))
_G["\u{72}\u{65}\u{74}" .. "\u{75}\u{72}\u{6e}"]=undef
assert(nofind == find("\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}"))
_G["\u{78}\u{78}\u{78}"]=0x1
assert(xxx == find("\u{78}\u{78}\u{78}"))
checkerror("\u{69}\u{6e}\u{76}\u{61}\u{6c}\u{69}\u{64}\u{20}\u{6b}\u{65}\u{79}",next,{0xa,0x14},0x3)
checkerror("\u{62}\u{61}\u{64}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}",pairs)
checkerror("\u{62}\u{61}\u{64}\u{20}\u{61}\u{72}\u{67}\u{75}\u{6d}\u{65}\u{6e}\u{74}",ipairs)
print("\u{2b}")
a={}
for i = 0x0, 0x2710
do
if math.fmod(i,0xa) ~= 0x0 then
a["\u{78}" .. i]=i
end
end
n={["\u{6e}"] = 0x0}
for i,v in pairs(a)
do
n.n=n.n + 0x1
assert(i and v and a[i] == v)
end
assert(n.n == 0x2328)
a=nil
do
local a = {}
for n,v in pairs(_G)
do
a[n]=v
end
for n,v in pairs(a)
do
if not package.loaded[n] and type(v) ~= "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}" and not string.find(n,"\u{5e}\u{5b}\u{25}\u{75}\u{5f}\u{5d}") then
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
checknext({0x1,["\u{78}"] = 0x1,["\u{79}"] = 0x2,["\u{7a}"] = 0x3})
checknext({0x1,0x2,["\u{78}"] = 0x1,["\u{79}"] = 0x2,["\u{7a}"] = 0x3})
checknext({0x1,0x2,0x3,["\u{78}"] = 0x1,["\u{79}"] = 0x2,["\u{7a}"] = 0x3})
checknext({0x1,0x2,0x3,0x4,["\u{78}"] = 0x1,["\u{79}"] = 0x2,["\u{7a}"] = 0x3})
checknext({0x1,0x2,0x3,0x4,0x5,["\u{78}"] = 0x1,["\u{79}"] = 0x2,["\u{7a}"] = 0x3})
assert(# {} == 0x0)
assert(# {[- 0x1] = 0x2} == 0x0)
for i = 0x0, 0x28
do
local a = {}
for j = 0x1, i
do
a[j]=j
end
assert(# a == i)
end
function table.maxn(t)
local max = 0x0
for k in pairs(t)
do
max=(type(k) == "\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}") and math.max(max,k) or max
end
return max
end
assert(table.maxn({}) == 0x0)
assert(table.maxn({["\u{31}\u{30}\u{30}\u{30}"] = true}) == 0x0)
assert(table.maxn({["\u{31}\u{30}\u{30}\u{30}"] = true,[24.5] = 0x3}) == 24.5)
assert(table.maxn({[0x3e8] = true}) == 0x3e8)
assert(table.maxn({[0xa] = true,[0x64 * math.pi] = print}) == 0x64 * math.pi)
table.maxn=nil
a={}
for i = 0x0, 0x32
do
a[0x2 ^ i]=true
end
assert(a[# a])
print("\u{2b}")
do
local a = {[0x1] = 0x1,[1.1] = 0x2,["\u{78}"] = 0x3,[string.rep("\u{78}",0x3e8)] = 0x4,[print] = 0x5,[checkerror] = 0x6,[coroutine.running()] = 0x7,[true] = 0x8,[io.stdin] = 0x9,[{}] = 0xa}
local b = {}
;
for i = 0x1, 0xa
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
local t = {[{0x1}] = 0x1,[{0x2}] = 0x2,[string.rep("\u{78}\u{20}",0x4)] = 0x3,[100.3] = 0x4,[0x4] = 0x5}
local n = 0x0
for k,v in pairs(t)
do
n=n + 0x1
assert(t[k] == v)
t[k]=undef
collectgarbage()
assert(t[k] == undef)
end
assert(n == 0x5)
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6e}\u{65}\u{78}\u{74}\u{20}\u{78}\u{20}\u{47}\u{43}\u{20}\u{6f}\u{66}\u{20}\u{64}\u{65}\u{6c}\u{65}\u{74}\u{65}\u{64}\u{20}\u{6b}\u{65}\u{79}\u{73}")
local co = coroutine.wrap(function (t)
for k,v in pairs(t)
do
local k1 = next(t)
assert(k == k1)
t[k]=nil
local expected = (type(k) == "\u{74}\u{61}\u{62}\u{6c}\u{65}" and k[0x1] or type(k) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}" and k() or string.sub(k,0x1,0x1))
assert(expected == v)
coroutine.yield(v)
end
end)
local t = {}
t[{0x1}]=0x1
t[{0x2}]=0x2
t[string.rep("\u{61}",0x32)]="\u{61}"
t[string.rep("\u{62}",0x32)]="\u{62}"
t[{0x3}]=0x3
t[string.rep("\u{63}",0xa)]="\u{63}"
t[function ()
return 0xa
end]=0xa
local count = 0x7
while co(t) do
collectgarbage("\u{63}\u{6f}\u{6c}\u{6c}\u{65}\u{63}\u{74}")
count=count - 0x1
end
assert(count == 0x0 and next(t) == nil)
end
local function test
(a)
assert(not pcall(table.insert,a,0x2,0x14))
;
table.insert(a,0xa)
;
table.insert(a,0x2,0x14)
;
table.insert(a,0x1,- 0x1)
;
table.insert(a,0x28)
;
table.insert(a,# a + 0x1,0x32)
table.insert(a,0x2,- 0x2)
assert(a[0x2] ~= undef)
assert(a["\u{32}"] == undef)
assert(not pcall(table.insert,a,0x0,0x14))
;
assert(not pcall(table.insert,a,# a + 0x2,0x14))
;
assert(table.remove(a,0x1) == - 0x1)
assert(table.remove(a,0x1) == - 0x2)
assert(table.remove(a,0x1) == 0xa)
assert(table.remove(a,0x1) == 0x14)
assert(table.remove(a,0x1) == 0x28)
assert(table.remove(a,0x1) == 0x32)
assert(table.remove(a,0x1) == nil)
assert(table.remove(a) == nil)
assert(table.remove(a,# a) == nil)
end
a={["\u{6e}"] = 0x0,[- 0x7] = "\u{62}\u{61}\u{6e}"}
test(a)
assert(a.n == 0x0 and a[- 0x7] == "\u{62}\u{61}\u{6e}")
a={[- 0x7] = "\u{62}\u{61}\u{6e}"}
;
test(a)
assert(a.n == nil and # a == 0x0 and a[- 0x7] == "\u{62}\u{61}\u{6e}")
a={[- 0x1] = "\u{62}\u{61}\u{6e}"}
test(a)
assert(# a == 0x0 and table.remove(a) == nil and a[- 0x1] == "\u{62}\u{61}\u{6e}")
a={[0x0] = "\u{62}\u{61}\u{6e}"}
assert(# a == 0x0 and table.remove(a) == "\u{62}\u{61}\u{6e}" and a[0x0] == undef)
table.insert(a,0x1,0xa)
;
table.insert(a,0x1,0x14)
;
table.insert(a,0x1,- 0x1)
assert(table.remove(a) == 0xa)
assert(table.remove(a) == 0x14)
assert(table.remove(a) == - 0x1)
assert(table.remove(a) == nil)
a={"\u{63}","\u{64}"}
table.insert(a,0x3,"\u{61}")
table.insert(a,"\u{62}")
assert(table.remove(a,0x1) == "\u{63}")
assert(table.remove(a,0x1) == "\u{64}")
assert(table.remove(a,0x1) == "\u{61}")
assert(table.remove(a,0x1) == "\u{62}")
assert(table.remove(a,0x1) == nil)
assert(# a == 0x0 and a.n == nil)
a={0xa,0x14,0x1e,0x28}
assert(table.remove(a,# a + 0x1) == nil)
assert(not pcall(table.remove,a,0x0))
assert(a[# a] == 0x28)
assert(table.remove(a,# a) == 0x28)
assert(a[# a] == 0x1e)
assert(table.remove(a,0x2) == 0x14)
assert(a[# a] == 0x1e and # a == 0x2)
do
local function test
(proxy,t)
for i = 0x1, 0xa
do
table.insert(proxy,0x1,i)
end
assert(# proxy == 0xa and # t == 0xa and proxy[0x1] ~= undef)
for i = 0x1, 0xa
do
assert(t[i] == 0xb - i)
end
table.sort(proxy)
for i = 0x1, 0xa
do
assert(t[i] == i and proxy[i] == i)
end
assert(table.concat(proxy,"\u{2c}") == "\u{31}\u{2c}\u{32}\u{2c}\u{33}\u{2c}\u{34}\u{2c}\u{35}\u{2c}\u{36}\u{2c}\u{37}\u{2c}\u{38}\u{2c}\u{39}\u{2c}\u{31}\u{30}")
for i = 0x1, 0x8
do
assert(table.remove(proxy,0x1) == i)
end
assert(# proxy == 0x2 and # t == 0x2)
local a,b,c = table.unpack(proxy)
assert(a == 0x9 and b == 0xa and c == nil)
end
local t = {}
local proxy = setmetatable({},{["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function ()
return # t
end,["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = t,["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = t})
test(proxy,t)
local count = 0x0
t=setmetatable({},{["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,k,v)
count=count + 0x1
;
rawset(t,k,v)
end})
test(t,t)
assert(count == 0xa)
t=setmetatable({},{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (_,k)
return k + 0x1
end,["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function (_)
return 0x5
end})
assert(table.concat(t,"\u{3b}") == "\u{32}\u{3b}\u{33}\u{3b}\u{34}\u{3b}\u{35}\u{3b}\u{36}")
end
do
local t = setmetatable({},{["\u{5f}\u{5f}\u{6c}\u{65}\u{6e}"] = function ()
return math.maxinteger
end})
table.insert(t,0x14)
local k,v = next(t)
assert(k == math.mininteger and v == 0x14)
end
if not T then
(Message or print)("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{3a}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{20}\u{66}\u{6f}\u{72}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{6c}\u{69}\u{62}\u{72}\u{61}\u{72}\u{79}\u{20}\u{6f}\u{6e}\u{20}\u{6e}\u{6f}\u{6e}\u{2d}\u{74}\u{61}\u{62}\u{6c}\u{65}\u{73}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
else
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
local tab = {0xa,0x14,0x1e}
local mt = {}
local u = T.newuserdata(0x0)
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.insert,u,0x28)
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.remove,u)
debug.setmetatable(u,mt)
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.insert,u,0x28)
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.remove,u)
mt.__index=tab
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.insert,u,0x28)
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.remove,u)
mt.__newindex=tab
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.insert,u,0x28)
checkerror("\u{74}\u{61}\u{62}\u{6c}\u{65}\u{20}\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}",table.remove,u)
mt.__len=function ()
return # tab
end
table.insert(u,0x28)
assert(# u == 0x4 and # tab == 0x4 and u[0x4] == 0x28 and tab[0x4] == 0x28)
assert(table.remove(u) == 0x28)
table.insert(u,0x1,0x32)
assert(# u == 0x4 and # tab == 0x4 and u[0x4] == 0x1e and tab[0x1] == 0x32)
mt.__newindex=nil
mt.__len=nil
local tab2 = {}
local u2 = T.newuserdata(0x0)
debug.setmetatable(u2,{["\u{5f}\u{5f}\u{6e}\u{65}\u{77}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (_,k,v)
tab2[k]=v
end})
table.move(u,0x1,0x4,0x1,u2)
assert(# tab2 == 0x4 and tab2[0x1] == tab[0x1] and tab2[0x4] == tab[0x4])
end
print("\u{2b}")
a={}
for i = 0x1, 0x3e8
do
a[i]=i
;
a[i - 0x1]=undef
end
assert(next(a,nil) == 0x3e8 and next(a,0x3e8) == nil)
assert(next({}) == nil)
assert(next({},nil) == nil)
for a,b in pairs({})
do
error("\u{6e}\u{6f}\u{74}\u{20}\u{68}\u{65}\u{72}\u{65}")
end
for i = 0x1, 0x0
do
error("\u{6e}\u{6f}\u{74}\u{20}\u{68}\u{65}\u{72}\u{65}")
end
for i = 0x0, 0x1, - 0x1
do
error("\u{6e}\u{6f}\u{74}\u{20}\u{68}\u{65}\u{72}\u{65}")
end
a=nil
;
for i = 0x1, 0x1
do
assert(not a)
;
a=0x1
end
;
assert(a)
a=nil
;
for i = 0x1, 0x1, - 0x1
do
assert(not a)
;
a=0x1
end
;
assert(a)
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{73}\u{20}\u{69}\u{6e}\u{20}\u{6e}\u{75}\u{6d}\u{65}\u{72}\u{69}\u{63}\u{20}\u{66}\u{6f}\u{72}")
local a
a=0x0
;
for i = 0x1, 0x1, 0x1
do
a=a + 0x1
end
;
assert(a == 0x1)
a=0x0
;
for i = 0x2710, 1e4, - 0x1
do
a=a + 0x1
end
;
assert(a == 0x1)
a=0x0
;
for i = 0x1, 0.99999, 0x1
do
a=a + 0x1
end
;
assert(a == 0x0)
a=0x0
;
for i = 0x270f, 1e4, - 0x1
do
a=a + 0x1
end
;
assert(a == 0x0)
a=0x0
;
for i = 0x1, 0.99999, - 0x1
do
a=a + 0x1
end
;
assert(a == 0x1)
a=0x0
;
for i = 0x0, 0.999999999, 0.1
do
a=a + 0x1
end
;
assert(a == 0xa)
a=0x0
;
for i = 1.0, 0x1, 0x1
do
a=a + 0x1
end
;
assert(a == 0x1)
a=0x0
;
for i = - 1.5, - 1.5, 0x1
do
a=a + 0x1
end
;
assert(a == 0x1)
a=0x0
;
for i = 1e6, 1e6, - 0x1
do
a=a + 0x1
end
;
assert(a == 0x1)
a=0x0
;
for i = 1.0, 0.99999, 0x1
do
a=a + 0x1
end
;
assert(a == 0x0)
a=0x0
;
for i = 0x1869f, 1e5, - 1.0
do
a=a + 0x1
end
;
assert(a == 0x0)
a=0x0
;
for i = 1.0, 0.99999, - 0x1
do
a=a + 0x1
end
;
assert(a == 0x1)
end
do
local a
a=0x0
;
for i = 0x1, 0xa
do
a=a + 0x1
;
i="\u{78}"
end
;
assert(a == 0xa)
a=0x0
;
for i = 10.0, 0x1, - 0x1
do
a=a + 0x1
;
i="\u{78}"
end
;
assert(a == 0xa)
end
a=0x0
;
for i = "\u{31}\u{30}", "\u{31}", "\u{2d}\u{32}"
do
a=a + 0x1
end
;
assert(a == 0x5)
do
local c
local function checkfloat
(i)
assert(math.type(i) == "\u{66}\u{6c}\u{6f}\u{61}\u{74}")
c=c + 0x1
end
c=0x0
;
for i = 1.0, 0xa
do
checkfloat(i)
end
assert(c == 0xa)
c=0x0
;
for i = - 0x1, - 0xa, - 1.0
do
checkfloat(i)
end
assert(c == 0xa)
local function checkint
(i)
assert(math.type(i) == "\u{69}\u{6e}\u{74}\u{65}\u{67}\u{65}\u{72}")
c=c + 0x1
end
local m = math.maxinteger
c=0x0
;
for i = m, m - 0xa, - 0x1
do
checkint(i)
end
assert(c == 0xb)
c=0x0
;
for i = 0x1, 10.9
do
checkint(i)
end
assert(c == 0xa)
c=0x0
;
for i = 0xa, 1e-3, - 0x1
do
checkint(i)
end
assert(c == 0xa)
c=0x0
;
for i = 0x1, "\u{31}\u{30}\u{2e}\u{38}"
do
checkint(i)
end
assert(c == 0xa)
c=0x0
;
for i = 0x9, "\u{33}\u{2e}\u{34}", - 0x1
do
checkint(i)
end
assert(c == 0x6)
c=0x0
;
for i = 0x0, "\u{20}\u{2d}\u{33}\u{2e}\u{34}\u{20}\u{20}", - 0x1
do
checkint(i)
end
assert(c == 0x4)
c=0x0
;
for i = 0x64, "\u{39}\u{36}\u{2e}\u{33}", - 0x2
do
checkint(i)
end
assert(c == 0x2)
c=0x0
;
for i = 0x1, math.huge
do
if i > 0xa then
break
end
;
checkint(i)
end
assert(c == 0xa)
c=0x0
;
for i = - 0x1, - math.huge, - 0x1
do
if i < - 0xa then
break
end
;
checkint(i)
end
assert(c == 0xa)
for i = math.mininteger, - 1e101
do
assert(false)
end
for i = math.maxinteger, 1e101, - 0x1
do
assert(false)
end
end
do
local function checkfor
(from,to,step,t)
local c = 0x0
for i = from, to, step
do
c=c + 0x1
assert(i == t[c])
end
assert(c == # t)
end
local maxi = math.maxinteger
local mini = math.mininteger
checkfor(mini,maxi,maxi,{mini,- 0x1,maxi - 0x1})
checkfor(mini,math.huge,maxi,{mini,- 0x1,maxi - 0x1})
checkfor(maxi,mini,mini,{maxi,- 0x1})
checkfor(maxi,mini,- maxi,{maxi,0x0,- maxi})
checkfor(maxi,- math.huge,mini,{maxi,- 0x1})
checkfor(maxi,mini,0x1,{})
checkfor(mini,maxi,- 0x1,{})
checkfor(maxi - 0x6,maxi,0x3,{maxi - 0x6,maxi - 0x3,maxi})
checkfor(mini + 0x4,mini,- 0x2,{mini + 0x4,mini + 0x2,mini})
local step = maxi // 0xa
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
checkerror("\u{27}\u{66}\u{6f}\u{72}\u{27}\u{20}\u{73}\u{74}\u{65}\u{70}\u{20}\u{69}\u{73}\u{20}\u{7a}\u{65}\u{72}\u{6f}",function ()
for i = 0x1, 0xa, 0x0
do

end
end)
checkerror("\u{27}\u{66}\u{6f}\u{72}\u{27}\u{20}\u{73}\u{74}\u{65}\u{70}\u{20}\u{69}\u{73}\u{20}\u{7a}\u{65}\u{72}\u{6f}",function ()
for i = 0x1, - 0xa, 0x0
do

end
end)
checkerror("\u{27}\u{66}\u{6f}\u{72}\u{27}\u{20}\u{73}\u{74}\u{65}\u{70}\u{20}\u{69}\u{73}\u{20}\u{7a}\u{65}\u{72}\u{6f}",function ()
for i = 1.0, - 0xa, 0.0
do

end
end)
collectgarbage()
local function f
(n,p)
local t = {}
;
for i = 0x1, p
do
t[i]=i * 0xa
end
return function (_,n, ...)
assert(select("\u{23}",...) == 0x0)
if n > 0x0 then
n=n - 0x1
return n,table.unpack(t)
end
end,nil,n
end
local x = 0x0
for n,a,b,c,d in f(0x5,0x3)
do
x=x + 0x1
assert(a == 0xa and b == 0x14 and c == 0x1e and d == nil)
end
assert(x == 0x5)
a={}
do
local x,y,z = pairs(a)
assert(type(x) == "\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}" and y == a and z == nil)
end
local function foo
(e,i)
assert(e == a)
if i <= 0xa then
return i + 0x1,i + 0x2
end
end
local function foo1
(e,i)
i=i + 0x1
assert(e == a)
if i <= e.n then
return i,a[i]
end
end
setmetatable(a,{["\u{5f}\u{5f}\u{70}\u{61}\u{69}\u{72}\u{73}"] = function (x)
return foo,x,0x0
end})
local i = 0x0
for k,v in pairs(a)
do
i=i + 0x1
assert(k == i and v == k + 0x1)
end
a.n=0x5
a[0x3]=0x1e
a={["\u{6e}"] = 0xa}
setmetatable(a,{["\u{5f}\u{5f}\u{69}\u{6e}\u{64}\u{65}\u{78}"] = function (t,k)
if k <= t.n then
return k * 0xa
end
end})
i=0x0
for k,v in ipairs(a)
do
i=i + 0x1
assert(k == i and v == i * 0xa)
end
assert(i == a.n)
do
local t = setmetatable({0xa,0x14,0x1e},{["\u{5f}\u{5f}\u{70}\u{61}\u{69}\u{72}\u{73}"] = function (t)
local inc = coroutine.yield()
return function (t,i)
if i > 0x1 then
return i - inc,t[i - inc]
else
return nil
end
end,t,# t + 0x1
end})
local res = {}
local co = coroutine.wrap(function ()
for i,p in pairs(t)
do
res[# res + 0x1]=p
end
end)
co()
co(0x1)
assert(res[0x1] == 0x1e and res[0x2] == 0x14 and res[0x3] == 0xa and # res == 0x3)
end
print("\u{4f}\u{4b}")