print("testing coroutines")
local debug = require("debug")
local f = 
local main,ismain = coroutine.running()
assert(type(main) == "thread" and ismain)
assert(not coroutine.resume(main))
assert(not coroutine.isyieldable(main) and not coroutine.isyieldable())
assert(not pcall(coroutine.yield))
assert(not pcall(coroutine.resume,0))
assert(not pcall(coroutine.status,0))
local function eqtab
(t1,t2)
assert(# t1 == # t2)
for i = 1, # t1
do
local v = t1[i]
assert(t2[i] == v)
end
end
_G.x=nil
_G.f=nil
local function foo
(a, ...)
local x,y = coroutine.running()
assert(x == f and y == false)
assert(coroutine.resume(f) == false)
assert(coroutine.status(f) == "running")
local arg = {...}
assert(coroutine.isyieldable(x))
for i = 1, # arg
do
_G.x={coroutine.yield(table.unpack(arg[i]))}
end
return table.unpack(a)
end
f=coroutine.create(foo)
assert(coroutine.isyieldable(f))
assert(type(f) == "thread" and coroutine.status(f) == "suspended")
assert(string.find(tostring(f),"thread"))
local s,a,b,c,d = 
s,a,b,c,d=coroutine.resume(f,{1,2,3},{},{1},{"a","b","c"})
assert(coroutine.isyieldable(f))
assert(s and a == nil and coroutine.status(f) == "suspended")
s,a,b,c,d=coroutine.resume(f)
eqtab(_G.x,{})
assert(s and a == 1 and b == nil)
assert(coroutine.isyieldable(f))
s,a,b,c,d=coroutine.resume(f,1,2,3)
eqtab(_G.x,{1,2,3})
assert(s and a == "a" and b == "b" and c == "c" and d == nil)
s,a,b,c,d=coroutine.resume(f,"xuxu")
eqtab(_G.x,{"xuxu"})
assert(s and a == 1 and b == 2 and c == 3 and d == nil)
assert(coroutine.status(f) == "dead")
s,a=coroutine.resume(f,"xuxu")
assert(not s and string.find(a,"dead") and coroutine.status(f) == "dead")
_G.f=nil
local function foo
(i)
return coroutine.yield(i)
end
local f = coroutine.wrap(()
for i = 1, 10
do
assert(foo(i) == _G.x)
end
return "a"
end)
for i = 1, 10
do
_G.x=i
;
assert(f(i) == i)
end
_G.x="xuxu"
;
assert(f("xuxu") == "a")
_G.x=nil
local function pf
(n,i)
coroutine.yield(n)
pf(n * i,i + 1)
end
f=coroutine.wrap(pf)
local s = 1
for i = 1, 10
do
assert(f(1,1) == s)
s=s * i
end
local function gen
(n)
return coroutine.wrap(()
for i = 2, n
do
coroutine.yield(i)
end
end)
end
local function filter
(p,g)
return coroutine.wrap(()
while 1 do
local n = g()
if n == nil then
return 
end
if math.fmod(n,p) ~= 0 then
coroutine.yield(n)
end
end)
end
local x = gen(80)
local a = {}
while 1 do
local n = x()
if n == nil then
break
end
table.insert(a,n)
x=filter(n,x)
assert(# a == 22 and a[# a] == 79)
x,a=nil
print("to-be-closed variables in coroutines")
local function func2close
(f)
return setmetatable({},{["__close"] = f})
end
local co = coroutine.create(print)
assert(coroutine.resume(co,"testing 'coroutine.close'"))
assert(coroutine.status(co) == "dead")
local st,msg = coroutine.close(co)
assert(st and msg == nil)
st,msg=coroutine.close(co)
assert(st and msg == nil)
local st,msg = pcall(coroutine.close,coroutine.running())
assert(not st and string.find(msg,"running"))
local main = coroutine.running()
;
(coroutine.wrap(()
local st,msg = pcall(coroutine.close,main)
assert(not st and string.find(msg,"normal"))
end))()
local co = 
co=coroutine.create(()
local x <close> = func2close(()
coroutine.close(co)
end)
coroutine.yield(20)
end)
local st,msg = coroutine.resume(co)
assert(st and msg == 20)
st,msg=coroutine.close(co)
assert(not st and string.find(msg,"running coroutine"))
local X = 
local co = coroutine.create(error)
local st,msg = coroutine.resume(co,100)
assert(not st and msg == 100)
st,msg=coroutine.close(co)
assert(not st and msg == 100)
st,msg=coroutine.close(co)
assert(st and msg == nil)
co=coroutine.create(()
local x <close> = func2close((self,err)
assert(err == nil)
;
X=false
end)
X=true
coroutine.yield()
end)
coroutine.resume(co)
assert(X)
assert(coroutine.close(co))
assert(not X and coroutine.status(co) == "dead")
local x = 0
co=coroutine.create(()
local y <close> = func2close((self,err)
assert(err == 111)
x=200
error(200)
end)
local x <close> = func2close((self,err)
assert(err == nil)
;
error(111)
end)
coroutine.yield()
end)
coroutine.resume(co)
assert(x == 0)
local st,msg = coroutine.close(co)
assert(st == false and coroutine.status(co) == "dead" and msg == 200)
assert(x == 200)
st,msg=coroutine.close(co)
assert(st and msg == nil)
local X = false
local Y = false
local function foo
()
local x <close> = func2close((self,err)
Y=debug.getinfo(2)
X=err
end)
error(43)
end
local co = coroutine.create(()
return pcall(foo)
end)
local st1,st2,err = coroutine.resume(co)
assert(st1 and not st2 and err == 43)
assert(X == 43 and Y.what == "C")
local track = {}
local function h
(o)
local hv <close> = o
return 1
end
local function foo
()
local x <close> = func2close((_,msg)
track[# track + 1]=msg or false
error(20)
end)
local y <close> = func2close((_,msg)
track[# track + 1]=msg or false
return 1e3
end)
local z <close> = func2close((_,msg)
track[# track + 1]=msg or false
error(10)
end)
coroutine.yield(1)
h(func2close((_,msg)
track[# track + 1]=msg or false
error(2)
end))
end
local co = coroutine.create(pcall)
local st,res = coroutine.resume(co,foo)
assert(st and res == 1)
local st,res1,res2 = coroutine.resume(co)
assert(coroutine.status(co) == "dead")
assert(st and not res1 and res2 == 20)
assert(track[1] == false and track[2] == 2 and track[3] == 10 and track[4] == 10)
local co = coroutine.wrap(()
assert(not pcall(table.sort,{1,2,3},coroutine.yield))
assert(coroutine.isyieldable())
coroutine.yield(20)
return 30
end)
assert(co() == 20)
assert(co() == 30)
local f = (s,i)
return coroutine.yield(i)
end
local f1 = coroutine.wrap(()
return xpcall(pcall,(...)
return ...
end,()
local s = 0
for i in f,nil,1
do
pcall(()
s=s + i
end)
end
error({s})
end)
end)
f1()
for i = 1, 10
do
assert(f1(i) == i)
end
local r1,r2,v = f1(nil)
assert(r1 and not r2 and v[1] == (10 + 1) * 10 / 2)
local function f
(a,b)
a=coroutine.yield(a)
;
error({a + b})
end
local function g
(x)
return x[1] * 2
end
co=coroutine.wrap(()
coroutine.yield(xpcall(f,g,10,20))
end)
assert(co() == 10)
local r,msg = co(100)
assert(not r and msg == 240)
local function f
(c)
assert(not coroutine.isyieldable())
return c .. c
end
local co = coroutine.wrap((c)
assert(coroutine.isyieldable())
local s = string.gsub("a",".",f)
return s
end)
assert(co() == "aa")
local X = 
local co = coroutine.create(()
coroutine.yield(10)
return 20
end)
local trace = {}
local function dotrace
(event)
trace[# trace + 1]=event
end
debug.sethook(co,dotrace,"clr")
repeat
until not coroutine.resume(co)
local correcttrace = {"call","line","call","return","line","return"}
assert(# trace == # correcttrace)
for k,v in pairs(trace)
do
assert(v == correcttrace[k])
end
function foo()
assert(debug.getinfo(1).currentline == debug.getinfo(foo).linedefined + 1)
assert(debug.getinfo(2).currentline == debug.getinfo(goo).linedefined)
coroutine.yield(3)
error(foo)
end
function goo()
foo()
end
x=coroutine.wrap(goo)
assert(x() == 3)
local a,b = pcall(x)
assert(not a and b == foo)
x=coroutine.create(goo)
a,b=coroutine.resume(x)
assert(a and b == 3)
a,b=coroutine.resume(x)
assert(not a and b == foo and coroutine.status(x) == "dead")
a,b=coroutine.resume(x)
assert(not a and string.find(b,"dead") and coroutine.status(x) == "dead")
goo=nil
local function all
(a,n,k)
if k == 0 then
coroutine.yield(a)
else
for i = 1, n
do
a[k]=i
all(a,n,k - 1)
end
end
end
local a = 0
for t in coroutine.wrap(()
all({},5,4)
end)
do
a=a + 1
end
assert(a == 5 ^ 4)
local C = {}
;
setmetatable(C,{["__mode"] = "kv"})
local x = coroutine.wrap(()
local a = 10
local function f
()
a=a + 10
;
return a
end
while true do
a=a + 1
coroutine.yield(f)
end)
C[1]=x
;
local f = x()
assert(f() == 21 and x()() == 32 and x() == f)
x=nil
collectgarbage()
assert(C[1] == undef)
assert(f() == 43 and f() == 53)
local function co_func
(current_co)
assert(coroutine.running() == current_co)
assert(coroutine.resume(current_co) == false)
coroutine.yield(10,20)
assert(coroutine.resume(current_co) == false)
coroutine.yield(23)
return 10
end
local co = coroutine.create(co_func)
local a,b,c = coroutine.resume(co,co)
assert(a == true and b == 10 and c == 20)
a,b=coroutine.resume(co,co)
assert(a == true and b == 23)
a,b=coroutine.resume(co,co)
assert(a == true and b == 10)
assert(coroutine.resume(co,co) == false)
assert(coroutine.resume(co,co) == false)
local A = coroutine.running()
local B = coroutine.create(()
return coroutine.resume(A)
end)
local st,res = coroutine.resume(B)
assert(st == true and res == false)
local X = false
A=coroutine.wrap(()
local _ <close> = func2close(()
X=true
end)
return pcall(A,1)
end)
st,res=A()
assert(not st and string.find(res,"non%-suspended") and X == true)
local co = 
co=coroutine.wrap(()
local x <close> = func2close(()
return pcall(co)
end)
error(111)
end)
local st,errobj = pcall(co)
assert(not st and errobj == 111)
st,errobj=pcall(co)
assert(not st and string.find(errobj,"dead coroutine"))
local co1,co2 = 
co1=coroutine.create(()
return co2()
end)
co2=coroutine.wrap(()
assert(coroutine.status(co1) == "normal")
assert(not coroutine.resume(co1))
coroutine.yield(3)
end)
a,b=coroutine.resume(co1)
assert(a and b == 3)
assert(coroutine.status(co1) == "dead")
a=(a)
coroutine.wrap(a)(a)
end
assert(not pcall(a,a))
a=nil
local x = coroutine.create(()
local a = 10
_G.F=()
a=a + 1
;
return a
end
error("x")
end)
assert(not coroutine.resume(x))
assert(not coroutine.resume(x,1,1,1,1,1,1,1))
assert(_G.F() == 11)
assert(_G.F() == 12)
_G.F=nil
if not T then
(Message or print)("
 >>> testC not active: skipping coroutine API tests <<<
")
else
print("testing yields inside hooks")
local turn = 
local function fact
(t,x)
assert(turn == t)
if x == 0 then
return 1
else
return x * fact(t,x - 1)
end
end
local A,B = 0,0
local x = coroutine.create(()
T.sethook("yield 0","",2)
A=fact("A",6)
end)
local y = coroutine.create(()
T.sethook("yield 0","",3)
B=fact("B",7)
end)
while A == 0 or B == 0 do
if A == 0 then
turn="A"
;
assert(T.resume(x))
end
if B == 0 then
turn="B"
;
assert(T.resume(y))
end
debug.traceback(x)
debug.traceback(y)
assert(B // A == 7)
local done = 
local function test
(n)
done=false
return coroutine.wrap(()
local a = {}
for i = 1, n
do
a[i]=i
end
T.sethook("pushint 10; yield 0","",1)
local a1 = {table.unpack(a)}
assert(# a1 == n)
for i = 1, n
do
assert(a[i] == i)
end
done=true
end)
end
local co = test(0)
;
while not done do
co(30)
co=test(1)
;
while not done do
co(20,10)
co=test(3)
;
while not done do
co()
co=test(100)
;
while not done do
co()
local line = debug.getinfo(1,"l").currentline + 2
local function foo
()
local x = 10
x=x + 10
_G.XX=x
end
local co = coroutine.wrap(()
T.sethook("setglobal X; yield 0","l",0)
;
foo()
;
return 10
end)
_G.XX=nil
;
_G.X=nil
;
co()
;
assert(_G.X == line)
_G.X=nil
;
co()
;
assert(_G.X == line + 1)
_G.X=nil
;
co()
;
assert(_G.X == line + 2 and _G.XX == nil)
_G.X=nil
;
co()
;
assert(_G.X == line + 3 and _G.XX == 20)
assert(co() == 10)
_G.X=nil
co=coroutine.wrap(()
T.sethook("yield 0","",1)
;
foo()
;
return 10
end)
_G.XX=nil
;
local c = 0
repeat
c=c + 1
;
local a = co()until a == 10
assert(_G.XX == 20 and c >= 5)
co=coroutine.wrap(()
T.sethook("yield 0","",2)
;
foo()
;
return 10
end)
_G.XX=nil
;
local c = 0
repeat
c=c + 1
;
local a = co()until a == 10
assert(_G.XX == 20 and c >= 5)
_G.X=nil
;
_G.XX=nil
c=coroutine.create((a, ...)
T.sethook("yield 0","l")
local b = a
return ...
end)
assert(coroutine.resume(c,1,2,3))
local n,v = debug.getlocal(c,0,1)
assert(n == "a" and v == 1 and debug.getlocal(c,0,2) ~= "b")
assert(debug.setlocal(c,0,1,10))
local t = debug.getinfo(c,0)
assert(t.currentline == t.linedefined + 2)
assert(not debug.getinfo(c,1))
assert(coroutine.resume(c))
local n,v = debug.getlocal(c,0,2)
assert(n == "b" and v == 10)
v={coroutine.resume(c)}
assert(v[1] == true and v[2] == 2 and v[3] == 3 and v[4] == undef)
assert(not coroutine.resume(c))
local c = coroutine.create(()
T.testC("yield 1",10,20)
end)
local a,b = coroutine.resume(c)
assert(a and b == 20)
assert(debug.getinfo(c,0).linedefined == - 1)
a,b=debug.getlocal(c,0,2)
assert(b == 10)
print("testing coroutine API")
assert(T.testC("    newthread      # create thread
    pushvalue 2    # push body
    pushstring 'a a a'  # push argument
    xmove 0 3 2   # move values to new thread
    resume -1, 1    # call it first time
    pushstatus
    xmove 3 0 0   # move results back to stack
    setglobal X    # result
    setglobal Y    # status
    pushvalue 2     # push body (to call it again)
    pushstring 'b b b'
    xmove 0 3 2
    resume -1, 1    # call it again
    pushstatus
    xmove 3 0 0
    return 1        # return result
  ",(...)
return ...
end) == "b b b")
assert(X == "a a a" and Y == "OK")
X,Y=nil
C=coroutine.create(()
return T.testC("                 pushnum 10;
                 pushnum 20;
                 resume -3 2;
                 pushstatus
                 gettop;
                 return 3",C)
end)
local a,b,c,d = coroutine.resume(C)
assert(a == true and string.find(b,"non%-suspended") and c == "ERRRUN" and d == 4)
a,b,c,d=T.testC("    rawgeti R 1    # get main thread
    pushnum 10;
    pushnum 20;
    resume -3 2;
    pushstatus
    gettop;
    return 4")
assert(a == coroutine.running() and string.find(b,"non%-suspended") and c == "ERRRUN" and d == 4)
local state = T.newstate()
assert(T.testC(state,"newthread; isyieldable -1; remove 1; return 1"))
assert(not T.testC(state,"rawgeti R 1; isyieldable -1; remove 1; return 1"))
T.testC(state,"settop 0")
T.loadlib(state)
assert(T.doremote(state,"    coroutine = require'coroutine';
    X = function (x) coroutine.yield(x, 'BB'); return 'CC' end;
    return 'ok'"))
local t = table.pack(T.testC(state,"    rawgeti R 1     # get main thread
    pushstring 'XX'
    getglobal X    # get function for body
    pushstring AA      # arg
    resume 1 1      # 'resume' shadows previous stack!
    gettop
    setglobal T    # top
    setglobal B    # second yielded value
    setglobal A    # fist yielded value
    rawgeti R 1     # get main thread
    pushnum 5       # arg (noise)
    resume 1 1      # after coroutine ends, previous stack is back
    pushstatus
    return *
  "))
assert(t.n == 4 and t[2] == "XX" and t[3] == "CC" and t[4] == "OK")
assert(T.doremote(state,"return T") == "2")
assert(T.doremote(state,"return A") == "AA")
assert(T.doremote(state,"return B") == "BB")
T.closestate(state)
print("+")
end
_G.TO_SURVIVE=coroutine.wrap(()
local a = 10
local x = ()
a=a + 1
end
coroutine.yield()
end)
_G.TO_SURVIVE()
if not _soft then
local lim = 1e6
local t = {lim - 10,lim - 5,lim - 1,lim,lim + 1,lim + 5}
for i = 1, # t
do
local j = t[i]
local co = coroutine.create(()
return table.unpack({},1,j)
end)
local r,msg = coroutine.resume(co)
assert(j < lim or not r)
end
end
assert(coroutine.running() == main)
print("+")
print("testing yields inside metamethods")
local function val
(x)
if type(x) == "table" then
return x.x
else
return x
end
end
local mt = {["__eq"] = (a,b)
coroutine.yield(nil,"eq")
;
return val(a) == val(b)
end,["__lt"] = (a,b)
coroutine.yield(nil,"lt")
;
return val(a) < val(b)
end,["__le"] = (a,b)
coroutine.yield(nil,"le")
;
return a - b <= 0
end,["__add"] = (a,b)
coroutine.yield(nil,"add")
;
return val(a) + val(b)
end,["__sub"] = (a,b)
coroutine.yield(nil,"sub")
;
return val(a) - val(b)
end,["__mul"] = (a,b)
coroutine.yield(nil,"mul")
;
return val(a) * val(b)
end,["__div"] = (a,b)
coroutine.yield(nil,"div")
;
return val(a) / val(b)
end,["__idiv"] = (a,b)
coroutine.yield(nil,"idiv")
;
return val(a) // val(b)
end,["__pow"] = (a,b)
coroutine.yield(nil,"pow")
;
return val(a) ^ val(b)
end,["__mod"] = (a,b)
coroutine.yield(nil,"mod")
;
return val(a) % val(b)
end,["__unm"] = (a,b)
coroutine.yield(nil,"unm")
;
return - val(a)
end,["__bnot"] = (a,b)
coroutine.yield(nil,"bnot")
;
return ~ val(a)
end,["__shl"] = (a,b)
coroutine.yield(nil,"shl")
;
return val(a) << val(b)
end,["__shr"] = (a,b)
coroutine.yield(nil,"shr")
;
return val(a) >> val(b)
end,["__band"] = (a,b)
coroutine.yield(nil,"band")
return val(a) & val(b)
end,["__bor"] = (a,b)
coroutine.yield(nil,"bor")
;
return val(a) | val(b)
end,["__bxor"] = (a,b)
coroutine.yield(nil,"bxor")
;
return val(a) ~ val(b)
end,["__concat"] = (a,b)
coroutine.yield(nil,"concat")
;
return val(a) .. val(b)
end,["__index"] = (t,k)
coroutine.yield(nil,"idx")
;
return t.k[k]
end,["__newindex"] = (t,k,v)
coroutine.yield(nil,"nidx")
;
t.k[k]=v
end}
local function new
(x)
return setmetatable({["x"] = x,["k"] = {}},mt)
end
local a = new(10)
local b = new(12)
local c = new("hello")
local function run
(f,t)
local i = 1
local c = coroutine.wrap(f)
while true do
local res,stat = c()
if res then
assert(t[i] == undef)
;
return res,t
end
assert(stat == t[i])
i=i + 1
end
assert(run(()
if (a >= b) then
return ">="
else
return "<"
end
end,{"le","sub"}) == "<")
assert(run(()
if (a <= b) then
return "<="
else
return ">"
end
end,{"le","sub"}) == "<=")
assert(run(()
if (a == b) then
return "=="
else
return "~="
end
end,{"eq"}) == "~=")
assert(run(()
return a & b + a
end,{"add","band"}) == 2)
assert(run(()
return 1 + a
end,{"add"}) == 11)
assert(run(()
return a - 25
end,{"sub"}) == - 15)
assert(run(()
return 2 * a
end,{"mul"}) == 20)
assert(run(()
return a ^ 2
end,{"pow"}) == 100)
assert(run(()
return a / 2
end,{"div"}) == 5)
assert(run(()
return a % 6
end,{"mod"}) == 4)
assert(run(()
return a // 3
end,{"idiv"}) == 3)
assert(run(()
return a + b
end,{"add"}) == 22)
assert(run(()
return a - b
end,{"sub"}) == - 2)
assert(run(()
return a * b
end,{"mul"}) == 120)
assert(run(()
return a ^ b
end,{"pow"}) == 10 ^ 12)
assert(run(()
return a / b
end,{"div"}) == 10 / 12)
assert(run(()
return a % b
end,{"mod"}) == 10)
assert(run(()
return a // b
end,{"idiv"}) == 0)
local a1000 = new(1e3)
assert(run(()
return a1000 + 1e3
end,{"add"}) == 2e3)
assert(run(()
return a1000 - 2.5e4
end,{"sub"}) == - 2.4e4)
assert(run(()
return 2e3 * a
end,{"mul"}) == 2e4)
assert(run(()
return a1000 / 1e3
end,{"div"}) == 1)
assert(run(()
return a1000 % 600
end,{"mod"}) == 400)
assert(run(()
return a1000 // 500
end,{"idiv"}) == 2)
assert(run(()
return a % b
end,{"mod"}) == 10)
assert(run(()
return ~ a & b
end,{"bnot","band"}) == ~ 10 & 12)
assert(run(()
return a | b
end,{"bor"}) == 10 | 12)
assert(run(()
return a ~ b
end,{"bxor"}) == 10 ~ 12)
assert(run(()
return a << b
end,{"shl"}) == 10 << 12)
assert(run(()
return a >> b
end,{"shr"}) == 10 >> 12)
assert(run(()
return 10 & b
end,{"band"}) == 10 & 12)
assert(run(()
return a | 2
end,{"bor"}) == 10 | 2)
assert(run(()
return a ~ 2
end,{"bxor"}) == 10 ~ 2)
assert(run(()
return a >> 2
end,{"shr"}) == 10 >> 2)
assert(run(()
return 1 >> a
end,{"shr"}) == 1 >> 10)
assert(run(()
return a << 2
end,{"shl"}) == 10 << 2)
assert(run(()
return 1 << a
end,{"shl"}) == 1 << 10)
assert(run(()
return 2 ~ a
end,{"bxor"}) == 2 ~ 10)
assert(run(()
return a .. b
end,{"concat"}) == "1012")
assert(run(()
return a .. b .. c .. a
end,{"concat","concat","concat"}) == "1012hello10")
assert(run(()
return "a" .. "b" .. a .. "c" .. c .. b .. "x"
end,{"concat","concat","concat"}) == "ab10chello12x")
local mt1 = {["__le"] = (a,b)
coroutine.yield(10)
return (val(a) <= val(b))
end,["__lt"] = (a,b)
coroutine.yield(10)
return val(a) < val(b)
end}
local mt2 = {["__lt"] = mt1.__lt,["__le"] = mt1.__le}
local function run
(f)
local co = coroutine.wrap(f)
local res = 
repeat
res=co()until res ~= 10
return res
end
local function test
()
local a1 = setmetatable({["x"] = 1},mt1)
local a2 = setmetatable({["x"] = 2},mt2)
assert(a1 < a2)
assert(a1 <= a2)
assert(1 < a2)
assert(1 <= a2)
assert(2 > a1)
assert(2 >= a2)
return true
end
run(test)
assert(run(()
a.BB=print
return a.BB
end,{"nidx","idx"}) == print)
local _ENV = _ENV
f=()
AAA=BBB + 1
;
return AAA
end
local g = new(10)
;
g.k.BBB=10
;
debug.setupvalue(f,1,g)
assert(run(f,{"idx","nidx","idx"}) == 11)
assert(g.k.AAA == 11)
print("+")
print("testing yields inside 'for' iterators")
local f = (s,i)
if i % 2 == 0 then
coroutine.yield(nil,"for")
end
if i < s then
return i + 1
end
end
assert(run(()
local s = 0
for i in f,4,0
do
s=s + i
end
return s
end,{"for","for","for"}) == 10)
if T == nil then
(Message or print)("
 >>> testC not active: skipping coroutine API tests <<<
")
print("OK")
;
return 
end
print("testing coroutine API")
local function apico
(...)
local x = {...}
return coroutine.wrap(()
return T.testC(table.unpack(x))
end)
end
local a = {apico("  pushstring errorcode
  pcallk 1 0 2;
  invalid command (should not arrive here)
","return *","stackmark",error)()}
assert(# a == 4 and a[3] == "stackmark" and a[4] == "errorcode" and _G.status == "ERRRUN" and _G.ctx == 2)
local co = apico("pushvalue 2; pushnum 10; pcallk 1 2 3; invalid command;",coroutine.yield,"getglobal status; getglobal ctx; pushvalue 2; pushstring a; pcallk 1 0 4; invalid command","getglobal status; getglobal ctx; return *")
assert(co() == 10)
assert(co(20,30) == "a")
a={co()}
assert(# a == 10 and a[2] == coroutine.yield and a[5] == 20 and a[6] == 30 and a[7] == "YIELD" and a[8] == 3 and a[9] == "YIELD" and a[10] == 4)
assert(not pcall(co))
f=T.makeCfunc("pushnum 3; pushnum 5; yield 1;")
co=coroutine.wrap(()
assert(f() == 23)
;
assert(f() == 23)
;
return 10
end)
assert(co(23,16) == 5)
assert(co(23,16) == 5)
assert(co(23,16) == 10)
f=T.makeCfunc("        pushnum 102
	yieldk	1 U2
	cannot be here!
","      # continuation
	pushvalue U3   # accessing upvalues inside a continuation
        pushvalue U4
	return *
",23,"huu")
x=coroutine.wrap(f)
assert(x() == 102)
eqtab({x()},{23,"huu"})
f=T.makeCfunc("pushstring 'a'; pushnum 102; yield 2; ")
a,b,c,d=T.testC("newthread; pushvalue 2; xmove 0 3 1; resume 3 0;
                       pushstatus; xmove 3 0 0;  resume 3 0; pushstatus;
                       return 4; ",f)
assert(a == "YIELD" and b == "a" and c == 102 and d == "OK")
local count = 3
f=T.makeCfunc("  remove 1;             # remove argument
  pushvalue U3;         # get selection function
  call 0 1;             # call it  (result is 'f' or 'yield')
  pushstring hello      # single argument for selected function
  pushupvalueindex 2;   # index of continuation program
  callk 1 -1 .;		# call selected function
  errorerror		# should never arrive here
","  # continuation program
  pushnum 34	# return value
  return *     # return all results
",()
count=count - 1
if count == 0 then
return coroutine.yield
else
return f
end
end)
co=coroutine.wrap(()
return f(nil)
end)
assert(co() == "hello")
a={co()}
assert(# a == 3 and a[1] == a[2] and a[2] == a[3] and a[3] == 34)
local y = 
co=coroutine.wrap((...)
return T.testC(" # initial function
          yieldk 1 2
          cannot be here!
       ","  # 1st continuation
         yieldk 0 3 
         cannot be here!
       ","  # 2nd continuation
         yieldk 0 4 
         cannot be here!
       ","  # 3th continuation
          pushvalue 6   # function which is last arg. to 'testC' here
          pushnum 10; pushnum 20;
          pcall 2 0 0   # call should throw an error and return to next line
          pop 1		# remove error message
          pushvalue 6
          getglobal status; getglobal ctx
          pcallk 2 2 5  # call should throw an error and jump to continuation
          cannot be here!
       ","  # 4th (and last) continuation
         return *
       ",(a,b)
x=a
;
y=b
;
error("errmsg")
end,...)
end)
local a = {co(3,4,6)}
assert(a[1] == 6 and a[2] == undef)
a={co()}
;
assert(a[1] == undef and _G.status == "YIELD" and _G.ctx == 2)
a={co()}
;
assert(a[1] == undef and _G.status == "YIELD" and _G.ctx == 3)
a={co(7,8)}
;
assert(type(a[1]) == "string" and type(a[2]) == "string" and type(a[3]) == "string" and type(a[4]) == "string" and type(a[5]) == "string" and type(a[6]) == "function")
assert(a[7] == 3 and a[8] == 4)
assert(a[9] == 7 and a[10] == 8)
assert(a[11]:find("errmsg") and # a == 11)
assert(x == "YIELD" and y == 4)
assert(not pcall(co))
_G.ctx=nil
_G.status=nil
local co = coroutine.wrap(()
local a = {pcall(pcall,pcall,pcall,pcall,pcall,pcall,pcall,error,"hi")}
return pcall(assert,table.unpack(a))
end)
local a = {co()}
assert(a[10] == "hi")
print("OK")