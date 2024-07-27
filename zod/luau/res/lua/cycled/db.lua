local debug = require("\100\101\98\117\103")
local function dostring
(s)
return assert(load(s))()
end
print("\116\101\115\116\105\110\103\32\100\101\98\117\103\32\108\105\98\114\97\114\121\32\97\110\100\32\100\101\98\117\103\32\105\110\102\111\114\109\97\116\105\111\110")
do
local a = 1
end
assert(not debug.gethook())
local testline = 19
local function test
(s,l,p)
collectgarbage()
local function f
(event,line)
assert(event == "\108\105\110\101")
local l = table.remove(l,1)
if p then
print(l,line)
end
assert(l == line,"\119\114\111\110\103\32\116\114\97\99\101\33\33")
end
debug.sethook(f,"\108")
;
load(s)()
;
debug.sethook()
assert(# l == 0)
end
do
assert(not pcall(debug.getinfo,print,"\88"))
assert(not pcall(debug.getinfo,0,"\62"))
assert(not debug.getinfo(1000))
assert(not debug.getinfo(- 1))
local a = debug.getinfo(print)
assert(a.what == "\67" and a.short_src == "\91\67\93")
a=debug.getinfo(print,"\76")
assert(a.activelines == nil)
local b = debug.getinfo(test,"\83\102\76")
assert(b.name == nil and b.what == "\76\117\97" and b.linedefined == testline and b.lastlinedefined == b.linedefined + 10 and b.func == test and not string.find(b.short_src,"\37\91"))
assert(b.activelines[b.linedefined + 1] and b.activelines[b.lastlinedefined])
assert(not b.activelines[b.linedefined] and not b.activelines[b.lastlinedefined + 1])
end
do
local func = load(string.dump(load("\112\114\105\110\116\40\49\48\41"),true))
local actl = debug.getinfo(func,"\76").activelines
assert(# actl == 0)
end
local a = "\102\117\110\99\116\105\111\110\32\102\32\40\41\32\101\110\100"
local function dostring
(s,x)
return load(s,x)()
end
dostring(a)
assert(debug.getinfo(f).short_src == string.format("\91\115\116\114\105\110\103\32\34\37\115\34\93",a))
dostring(a .. string.format("\59\32\37\115\10\61\49",string.rep("\112",400)))
assert(string.find(debug.getinfo(f).short_src,"\94\37\91\115\116\114\105\110\103\32\91\94\10\93\42\37\46\37\46\37\46\34\37\93\36"))
dostring(a .. string.format("\59\32\37\115\61\49",string.rep("\112",400)))
assert(string.find(debug.getinfo(f).short_src,"\94\37\91\115\116\114\105\110\103\32\91\94\10\93\42\37\46\37\46\37\46\34\37\93\36"))
dostring("\10" .. a)
assert(debug.getinfo(f).short_src == "\91\115\116\114\105\110\103\32\34\46\46\46\34\93")
dostring(a,"")
assert(debug.getinfo(f).short_src == "\91\115\116\114\105\110\103\32\34\34\93")
dostring(a,"\64\120\117\120\117")
assert(debug.getinfo(f).short_src == "\120\117\120\117")
dostring(a,"\64" .. string.rep("\112",1000) .. "\116")
assert(string.find(debug.getinfo(f).short_src,"\94\37\46\37\46\37\46\112\42\116\36"))
dostring(a,"\61\120\117\120\117")
assert(debug.getinfo(f).short_src == "\120\117\120\117")
dostring(a,string.format("\61\37\115",string.rep("\120",500)))
assert(string.find(debug.getinfo(f).short_src,"\94\120\42\36"))
dostring(a,"\61")
assert(debug.getinfo(f).short_src == "")
_G.a=nil
;
_G.f=nil
;
_G[string.rep("\112",400)]=nil
repeat
local g = {["\120"] = function ()
local a = debug.getinfo(2)
assert(a.name == "\102" and a.namewhat == "\108\111\99\97\108")
a=debug.getinfo(1)
assert(a.name == "\120" and a.namewhat == "\102\105\101\108\100")
return "\120\105\120\105"
end}
local f = function ()
return 1 + 1 and (not 1 or g.x())
end
assert(f() == "\120\105\120\105")
g=debug.getinfo(f)
assert(g.what == "\76\117\97" and g.func == f and g.namewhat == "" and not g.name)
function f(x,name)
name=name or "\102"
local a = debug.getinfo(1)
assert(a.name == name and a.namewhat == "\108\111\99\97\108")
return x
end
if 3 > 4 then
break
end
;
f()
if 3 < 4 then
a=1
else
break
end
;
f()
while 1 do
local x = 10
;
break
end
;
f()
local b = 1
if 3 > 4 then
return math.sin(1)
end
;
f()
a=3 < 4
;
f()
a=3 < 4 or 1
;
f()
repeat
local x = 20
;
if 4 > 3 then
f()
else
break
end
;
f()
until 1
g={}
f(g).x=f(2) and f(10) + f(9)
assert(g.x == f(19))
function g(x)
if not x then
return 3
end
return (x("\97","\120"))
end
assert(g(f) == "\97")
until 1
test("\105\102\10\109\97\116\104\46\115\105\110\40\49\41\10\116\104\101\110\10\32\32\97\61\49\10\101\108\115\101\10\32\32\97\61\50\10\101\110\100\10",{2,3,4,7})
test("\108\111\99\97\108\32\102\117\110\99\116\105\111\110\32\102\111\111\40\41\10\101\110\100\10\102\111\111\40\41\10\65\32\61\32\49\10\65\32\61\32\50\10\65\32\61\32\51\10",{2,3,2,4,5,6})
_G.A=nil
test("\45\45\10\105\102\32\110\105\108\32\116\104\101\110\10\32\32\97\61\49\10\101\108\115\101\10\32\32\97\61\50\10\101\110\100\10",{2,5,6})
test("\97\61\49\10\114\101\112\101\97\116\10\32\32\97\61\97\43\49\10\117\110\116\105\108\32\97\61\61\51\10",{1,3,4,3,4})
test("\32\100\111\10\32\32\114\101\116\117\114\110\10\101\110\100\10",{2})
test("\108\111\99\97\108\32\97\10\97\61\49\10\119\104\105\108\101\32\97\60\61\51\32\100\111\10\32\32\97\61\97\43\49\10\101\110\100\10",{1,2,3,4,3,4,3,4,3,5})
test("\119\104\105\108\101\32\109\97\116\104\46\115\105\110\40\49\41\32\100\111\10\32\32\105\102\32\109\97\116\104\46\115\105\110\40\49\41\10\32\32\116\104\101\110\32\98\114\101\97\107\10\32\32\101\110\100\10\101\110\100\10\97\61\49",{1,2,3,6})
test("\102\111\114\32\105\61\49\44\51\32\100\111\10\32\32\97\61\105\10\101\110\100\10",{1,2,1,2,1,2,1,3})
test("\102\111\114\32\105\44\118\32\105\110\32\112\97\105\114\115\123\39\97\39\44\39\98\39\125\32\100\111\10\32\32\97\61\116\111\115\116\114\105\110\103\40\105\41\32\46\46\32\118\10\101\110\100\10",{1,2,1,2,1,3})
test("\102\111\114\32\105\61\49\44\52\32\100\111\32\97\61\49\32\101\110\100",{1,1,1,1})
_G.a=nil
do
local a = {1,2,3,10,124,125,126,127,128,129,130,255,256,257,500,1000}
local s = "\32\32\32\32\32\108\111\99\97\108\32\98\32\61\32\123\49\48\125\10\32\32\32\32\32\97\32\61\32\98\91\49\93\32\88\32\43\32\89\32\98\91\49\93\10\32\32\32\32\32\98\32\61\32\52\10\32\32"
for _,i in ipairs(a)
do
local subs = {["\88"] = string.rep("\10",i)}
for _,j in ipairs(a)
do
subs.Y=string.rep("\10",j)
local s = string.gsub(s,"\91\88\89\93",subs)
test(s,{1,2 + i,2 + i + j,2 + i,2 + i + j,3 + i + j})
end
end
end
_G.a=nil
do
local function checkactivelines
(f,lines)
local t = debug.getinfo(f,"\83\76")
for _,l in pairs(lines)
do
l=l + t.linedefined
assert(t.activelines[l])
t.activelines[l]=undef
end
assert(next(t.activelines) == nil)
end
checkactivelines(function (...)
local a = 20
local b = 30
end,{4,6,8})
checkactivelines(function (a)
local a = 20
local b = 30
end,{3,4,6})
checkactivelines(function (a,b, ...)

end,{0})
checkactivelines(function (a,b)

end,{1})
for _,n in pairs({0,1,2,10,50,100,1000,10000})
do
checkactivelines(load(string.format("\37\115\32\114\101\116\117\114\110\32\49",string.rep("\10",n))),{n + 1})
end
end
print("\43")
assert(not pcall(debug.getlocal,20,1))
assert(not pcall(debug.setlocal,- 1,1,10))
local function foo
(a,b, ...)
local d,e
end
local co = coroutine.create(foo)
assert(debug.getlocal(foo,1) == "\97")
assert(debug.getlocal(foo,2) == "\98")
assert(not debug.getlocal(foo,3))
assert(debug.getlocal(co,foo,1) == "\97")
assert(debug.getlocal(co,foo,2) == "\98")
assert(not debug.getlocal(co,foo,3))
assert(not debug.getlocal(print,1))
local function foo
()
return (debug.getlocal(1,- 1))
end
assert(not foo(10))
local function foo
(a, ...)
local t = table.pack(...)
for i = 1, t.n
do
local n,v = debug.getlocal(1,- i)
assert(n == "\40\118\97\114\97\114\103\41" and v == t[i])
end
assert(not debug.getlocal(1,- (t.n + 1)))
assert(not debug.setlocal(1,- (t.n + 1),30))
if t.n > 0 then
(function (x)
assert(debug.setlocal(2,- 1,x) == "\40\118\97\114\97\114\103\41")
assert(debug.setlocal(2,- t.n,x) == "\40\118\97\114\97\114\103\41")
end)(430)
assert(... == 430)
end
end
foo()
foo(print)
foo(200,3,4)
local a = {}
for i = 1, (_soft and 100 or 1000)
do
a[i]=i
end
foo(table.unpack(a))
do
assert(not debug.gethook())
local count = 0
local function f
()
assert(debug.getinfo(1).namewhat == "\104\111\111\107")
local sndline = string.match(debug.traceback(),"\10\40\46\45\41\10")
assert(string.find(sndline,"\104\111\111\107"))
count=count + 1
end
debug.sethook(f,"\108")
local a = 0
_ENV.a=a
a=1
debug.sethook()
assert(count == 4)
end
_ENV.a=nil
assert(getmetatable(debug.getregistry()._HOOKKEY).__mode == "\107")
a={}
;
local L = nil
local glob = 1
local oldglob = glob
debug.sethook(function (e,l)
collectgarbage()
local f,m,c = debug.gethook()
assert(m == "\99\114\108" and c == 0)
if e == "\108\105\110\101" then
if glob ~= oldglob then
L=l - 1
oldglob=glob
end
elseif e == "\99\97\108\108" then
local f = debug.getinfo(2,"\102").func
a[f]=1
else
assert(e == "\114\101\116\117\114\110")
end
end,"\99\114\108")
function f(a,b)
collectgarbage()
local _,x = debug.getlocal(1,1)
local _,y = debug.getlocal(1,2)
assert(x == a and y == b)
assert(debug.setlocal(2,3,"\112\101\114\97") == "\65\65" .. "\65\65")
assert(debug.setlocal(2,4,"\109\97\110\103\97") == "\66")
x=debug.getinfo(2)
assert(x.func == g and x.what == "\76\117\97" and x.name == "\103" and x.nups == 2 and string.find(x.source,"\94\64\46\42\100\98\37\46\108\117\97\36"))
glob=glob + 1
assert(debug.getinfo(1,"\108").currentline == L + 1)
assert(debug.getinfo(1,"\108").currentline == L + 2)
end
function foo()
glob=glob + 1
assert(debug.getinfo(1,"\108").currentline == L + 1)
end
;
foo()
local _ = "\97\108\111\10\97\108\111" .. "\10"
assert(debug.getinfo(1,"\108").currentline == L + 11)
function g(...)
local arg = {...}
do
local a,b,c
;
a=math.sin(40)
;
end
local feijao
local AAAA,B = "\120\117\120\117","\97\98\97\99\97\116\101"
f(AAAA,B)
assert(AAAA == "\112\101\114\97" and B == "\109\97\110\103\97")
do
local B = 13
local x,y = debug.getlocal(1,5)
assert(x == "\66" and y == 13)
end
end
g()
assert(a[f] and a[g] and a[assert] and a[debug.getlocal] and not a[print])
local n,v = debug.getlocal(0,1)
assert(v == 0 and n == "\40\67\32\116\101\109\112\111\114\97\114\121\41")
local n,v = debug.getlocal(0,2)
assert(v == 2 and n == "\40\67\32\116\101\109\112\111\114\97\114\121\41")
assert(not debug.getlocal(0,3))
assert(not debug.getlocal(0,0))
function f()
assert(select(2,debug.getlocal(2,3)) == 1)
assert(not debug.getlocal(2,4))
debug.setlocal(2,3,10)
return 20
end
function g(a,b)
return (a + 1) + f()
end
assert(g(0,0) == 30)
_G.f,_G.g=nil
debug.sethook(nil)
;
assert(not debug.gethook())
do
assert(not debug.setuservalue(io.stdin,10))
local a,b = debug.getuservalue(io.stdin,10)
assert(a == nil and not b)
end
do
local function f
(...)
return 3,...
end
local count = 0
local a = {}
for i = 1, 100
do
a[i]=i
end
debug.sethook(function ()
count=count + 1
end,"",1)
local t = {table.unpack(a)}
assert(# t == 100)
t={table.unpack(a,1,3)}
assert(# t == 3)
t={f(table.unpack(a,1,30))}
assert(# t == 31)
end
local function collectlocals
(level)
local tab = {}
for i = 1, math.huge
do
local n,v = debug.getlocal(level + 1,i)
if not (n and string.find(n,"\94\91\97\45\122\65\45\90\48\45\57\95\93\43\36")) then
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
local c = 13
end
debug.sethook(function (e)
assert(e == "\99\97\108\108")
dostring("\88\88\32\61\32\49\50")
assert(not pcall(load("\97\61\39\106\111\97\111\39\43\49")))
debug.sethook(function (e,l)
assert(debug.getinfo(2,"\108").currentline == l)
local f,m,c = debug.gethook()
assert(e == "\108\105\110\101")
assert(m == "\108" and c == 0)
debug.sethook(nil)
assert(not X)
X=collectlocals(2)
end,"\108")
end,"\99")
a:f(1,2,3,4,5)
assert(X.self == a and X.a == 1 and X.b == 2 and X.c == nil)
assert(XX == 12)
assert(not debug.gethook())
_G.XX=nil
do
local X = false
local function foo
(a,b, ...)
do
local x,y,z
end
local c,d = 10,20
return 
end
local function aux
()
if debug.getinfo(2).name == "\102\111\111" then
X=true
local tab = {["\97"] = 100,["\98"] = 200,["\99"] = 10,["\100"] = 20}
for n,v in pairs(collectlocals(2))
do
assert(tab[n] == v)
tab[n]=undef
end
assert(next(tab) == nil)
end
end
debug.sethook(aux,"\114")
;
foo(100,200)
;
debug.sethook()
assert(X)
end
local function eqseq
(t1,t2)
assert(# t1 == # t2)
for i = 1, # t1
do
assert(t1[i] == t2[i])
end
end
do
print("\116\101\115\116\105\110\103\32\105\110\115\112\101\99\116\105\111\110\32\111\102\32\112\97\114\97\109\101\116\101\114\115\47\114\101\116\117\114\110\101\100\32\118\97\108\117\101\115")
local on = false
local inp,out
local function hook
(event)
if not on then
return 
end
local ar = debug.getinfo(2,"\114\117\83")
local t = {}
for i = ar.ftransfer, ar.ftransfer + ar.ntransfer - 1
do
local _,v = debug.getlocal(2,i)
t[# t + 1]=v
end
if event == "\114\101\116\117\114\110" then
out=t
else
inp=t
end
end
debug.sethook(hook,"\99\114")
on=true
;
math.sin(3)
;
on=false
eqseq(inp,{3})
;
eqseq(out,{math.sin(3)})
on=true
;
select(2,10,20,30,40)
;
on=false
eqseq(inp,{2,10,20,30,40})
;
eqseq(out,{20,30,40})
local function foo
(a, ...)
return ...
end
local function foo1
()
on=not on
;
return foo(20,10,0)
end
foo1()
;
on=false
eqseq(inp,{20})
;
eqseq(out,{10,0})
debug.sethook()
end
local function getupvalues
(f)
local t = {}
local i = 1
while true do
local name,value = debug.getupvalue(f,i)
if not name then
break
end
assert(not t[name])
t[name]=value
i=i + 1
end
return t
end
local a,b,c = 1,2,3
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
return c + b
end
assert(not debug.getupvalue(foo1,3))
assert(not debug.getupvalue(foo1,0))
assert(not debug.setupvalue(foo1,3,"\120\117\120\117"))
local t = getupvalues(foo1)
assert(t.a == nil and t.b == 2 and t.c == 3)
t=getupvalues(foo2)
assert(t.a == 1 and t.b == 2 and t.c == 3)
assert(debug.setupvalue(foo1,1,"\120\117\120\117") == "\98")
assert(({debug.getupvalue(foo2,3)})[2] == "\120\117\120\117")
assert(debug.getupvalue(string.gmatch("\120","\120"),1) == "")
local a = 0
debug.sethook(function (e)
a=a + 1
end,"",1)
a=0
;
for i = 1, 1000
do

end
;
assert(1000 < a and a < 1012)
debug.sethook(function (e)
a=a + 1
end,"",4)
a=0
;
for i = 1, 1000
do

end
;
assert(250 < a and a < 255)
local f,m,c = debug.gethook()
assert(m == "" and c == 4)
debug.sethook(function (e)
a=a + 1
end,"",4000)
a=0
;
for i = 1, 1000
do

end
;
assert(a == 0)
do
debug.sethook(print,"",2 ^ 24 - 1)
local f,m,c = debug.gethook()
assert(({debug.gethook()})[3] == 2 ^ 24 - 1)
end
debug.sethook()
local g,g1
local function f
(x)
if x then
assert(debug.getinfo(1,"\83").what == "\76\117\97")
assert(debug.getinfo(1,"\116").istailcall == true)
local tail = debug.getinfo(2)
assert(tail.func == g1 and tail.istailcall == true)
assert(debug.getinfo(3,"\83").what == "\109\97\105\110")
print("\43")
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
end,"\99\114")
h(false)
debug.sethook()
local res = {"\114\101\116\117\114\110","\99\97\108\108","\116\97\105\108\32\99\97\108\108","\99\97\108\108","\116\97\105\108\32\99\97\108\108","\114\101\116\117\114\110","\114\101\116\117\114\110","\99\97\108\108"}
for i = 1, # res
do
assert(res[i] == table.remove(b,1))
end
b=0
debug.sethook(function (e)
if e == "\116\97\105\108\32\99\97\108\108" then
b=b + 1
assert(debug.getinfo(2,"\116").istailcall == true)
else
assert(debug.getinfo(2,"\116").istailcall == false)
end
end,"\99")
h(false)
debug.sethook()
assert(b == 2)
local lim = _soft and 3000 or 30000
local function foo
(x)
if x == 0 then
assert(debug.getinfo(2).what == "\109\97\105\110")
local info = debug.getinfo(1)
assert(info.istailcall == true and info.func == foo)
else
return foo(x - 1)
end
end
foo(lim)
print("\43")
co=load("\32\32\108\111\99\97\108\32\65\32\61\32\102\117\110\99\116\105\111\110\32\40\41\10\32\32\32\32\114\101\116\117\114\110\32\120\10\32\32\101\110\100\10\32\32\114\101\116\117\114\110\10")
local a = 0
debug.sethook(function (e,l)
if l == 3 then
a=a + 1
;
assert(debug.getlocal(2,1) == "\40\116\101\109\112\111\114\97\114\121\41")
elseif l == 4 then
a=a + 1
;
assert(debug.getlocal(2,1) == "\65")
end
end,"\108")
co()
debug.sethook()
assert(a == 2)
assert(debug.traceback(print) == print)
assert(debug.traceback(print,4) == print)
assert(string.find(debug.traceback("\104\105",4),"\94\104\105\10"))
assert(string.find(debug.traceback("\104\105"),"\94\104\105\10"))
assert(not string.find(debug.traceback("\104\105"),"\39\100\101\98\117\103\46\116\114\97\99\101\98\97\99\107\39"))
assert(string.find(debug.traceback("\104\105",0),"\39\100\101\98\117\103\46\116\114\97\99\101\98\97\99\107\39"))
assert(string.find(debug.traceback(),"\94\115\116\97\99\107\32\116\114\97\99\101\98\97\99\107\58\10"))
do
local st,msg = (function ()
return pcall
end)()(debug.traceback)
assert(st == true and string.find(msg,"\112\99\97\108\108"))
end
local t = debug.getinfo(print,"\117")
assert(t.isvararg == true and t.nparams == 0 and t.nups == 0)
t=debug.getinfo(function (a,b,c)

end,"\117")
assert(t.isvararg == false and t.nparams == 3 and t.nups == 0)
t=debug.getinfo(function (a,b, ...)
return t[a]
end,"\117")
assert(t.isvararg == true and t.nparams == 2 and t.nups == 1)
t=debug.getinfo(1)
assert(t.isvararg == true and t.nparams == 0 and t.nups == 1 and debug.getupvalue(t.func,1) == "\95\69\78\86")
t=debug.getinfo(math.sin)
assert(t.isvararg == true and t.nparams == 0 and t.nups == 0)
t=debug.getinfo(string.gmatch("\97\98\99","\97"))
assert(t.isvararg == true and t.nparams == 0 and t.nups > 0)
local function checktraceback
(co,p,level)
local tb = debug.traceback(co,nil,level)
local i = 0
for l in string.gmatch(tb,"\91\94\10\93\43\10\63")
do
assert(i == 0 or string.find(l,p[i]))
i=i + 1
end
assert(p[i] == undef)
end
local function f
(n)
if n > 0 then
f(n - 1)
else
coroutine.yield()
end
end
local co = coroutine.create(f)
coroutine.resume(co,3)
checktraceback(co,{"\121\105\101\108\100","\100\98\46\108\117\97","\100\98\46\108\117\97","\100\98\46\108\117\97","\100\98\46\108\117\97"})
checktraceback(co,{"\100\98\46\108\117\97","\100\98\46\108\117\97","\100\98\46\108\117\97","\100\98\46\108\117\97"},1)
checktraceback(co,{"\100\98\46\108\117\97","\100\98\46\108\117\97","\100\98\46\108\117\97"},2)
checktraceback(co,{"\100\98\46\108\117\97"},4)
checktraceback(co,{},40)
co=coroutine.create(function (x)
local a = 1
coroutine.yield(debug.getinfo(1,"\108"))
coroutine.yield(debug.getinfo(1,"\108").currentline)
return a
end)
local tr = {}
local foo = function (e,l)
if l then
table.insert(tr,l)
end
end
debug.sethook(co,foo,"\108\99\114")
local _,l = coroutine.resume(co,10)
local x = debug.getinfo(co,1,"\108\102\76\83")
assert(x.currentline == l.currentline and x.activelines[x.currentline])
assert(type(x.func) == "\102\117\110\99\116\105\111\110")
for i = x.linedefined + 1, x.lastlinedefined
do
assert(x.activelines[i])
x.activelines[i]=undef
end
assert(next(x.activelines) == nil)
assert(not debug.getinfo(co,2))
local a,b = debug.getlocal(co,1,1)
assert(a == "\120" and b == 10)
a,b=debug.getlocal(co,1,2)
assert(a == "\97" and b == 1)
debug.setlocal(co,1,2,"\104\105")
assert(debug.gethook(co) == foo)
assert(# tr == 2 and tr[1] == l.currentline - 1 and tr[2] == l.currentline)
a,b,c=pcall(coroutine.resume,co)
assert(a and b and c == l.currentline + 1)
checktraceback(co,{"\121\105\101\108\100","\105\110\32\102\117\110\99\116\105\111\110\32\60"})
a,b=coroutine.resume(co)
assert(a and b == "\104\105")
assert(# tr == 4 and tr[4] == l.currentline + 2)
assert(debug.gethook(co) == foo)
assert(not debug.gethook())
checktraceback(co,{})
co=coroutine.create(function (x)
local a,b = coroutine.yield(x)
assert(a == 100 and b == nil)
return x
end)
a,b=coroutine.resume(co,10)
assert(a and b == 10)
a,b=debug.getlocal(co,1,1)
assert(a == "\120" and b == 10)
assert(not debug.getlocal(co,1,5))
assert(debug.setlocal(co,1,1,30) == "\120")
assert(not debug.setlocal(co,1,5,40))
a,b=coroutine.resume(co,100)
assert(a and b == 30)
function f(i)
if i == 0 then
error(i)
else
coroutine.yield()
;
f(i - 1)
end
end
co=coroutine.create(function (x)
f(x)
end)
a,b=coroutine.resume(co,3)
t={"\39\99\111\114\111\117\116\105\110\101\46\121\105\101\108\100\39","\39\102\39","\105\110\32\102\117\110\99\116\105\111\110\32\60"}
while coroutine.status(co) == "\115\117\115\112\101\110\100\101\100" do
checktraceback(co,t)
a,b=coroutine.resume(co)
table.insert(t,2,"\39\102\39")
end
t[1]="\39\101\114\114\111\114\39"
checktraceback(co,t)
local function g
(x)
coroutine.yield(x)
end
local function f
(i)
debug.sethook(function ()

end,"\108")
for j = 1, 1000
do
g(i + j)
end
end
local co = coroutine.wrap(f)
co(10)
pcall(co)
pcall(co)
assert(type(debug.getregistry()) == "\116\97\98\108\101")
local a = {}
local function f
(t)
local info = debug.getinfo(1)
;
assert(info.namewhat == "\109\101\116\97\109\101\116\104\111\100")
a.op=info.name
return info.name
end
setmetatable(a,{["\95\95\105\110\100\101\120"] = f,["\95\95\97\100\100"] = f,["\95\95\100\105\118"] = f,["\95\95\109\111\100"] = f,["\95\95\99\111\110\99\97\116"] = f,["\95\95\112\111\119"] = f,["\95\95\109\117\108"] = f,["\95\95\105\100\105\118"] = f,["\95\95\117\110\109"] = f,["\95\95\108\101\110"] = f,["\95\95\115\117\98"] = f,["\95\95\115\104\108"] = f,["\95\95\115\104\114"] = f,["\95\95\98\111\114"] = f,["\95\95\98\120\111\114"] = f,["\95\95\101\113"] = f,["\95\95\108\101"] = f,["\95\95\108\116"] = f,["\95\95\117\110\109"] = f,["\95\95\108\101\110"] = f,["\95\95\98\97\110\100"] = f,["\95\95\98\110\111\116"] = f})
local b = setmetatable({},getmetatable(a))
assert(a[3] == "\105\110\100\101\120" and a ^ 3 == "\112\111\119" and a .. a == "\99\111\110\99\97\116")
assert(a / 3 == "\100\105\118" and 3 % a == "\109\111\100")
assert(a + 3 == "\97\100\100" and 3 - a == "\115\117\98" and a * 3 == "\109\117\108" and - a == "\117\110\109" and # a == "\108\101\110" and a & 3 == "\98\97\110\100")
assert(a + 30000 == "\97\100\100" and a - 3.0 == "\115\117\98" and a * 3.0 == "\109\117\108" and - a == "\117\110\109" and # a == "\108\101\110" and a & 3 == "\98\97\110\100")
assert(a | 3 == "\98\111\114" and 3 ~ a == "\98\120\111\114" and a << 3 == "\115\104\108" and a >> 1 == "\115\104\114")
assert(a == b and a.op == "\101\113")
assert(a >= b and a.op == "\108\101")
assert("\120" >= a and a.op == "\108\101")
assert(a > b and a.op == "\108\116")
assert(a > 10 and a.op == "\108\116")
assert(~ a == "\98\110\111\116")
do
local function f
()
assert(debug.getinfo(1).name == "\102\111\114\32\105\116\101\114\97\116\111\114")
end
for i in f
do

end
end
do
local name = nil
setmetatable({},{["\95\95\103\99"] = function ()
local t = debug.getinfo(1)
assert(t.namewhat == "\109\101\116\97\109\101\116\104\111\100")
name=t.name
end})
repeat
local a = {}
until name
assert(name == "\95\95\103\99")
end
do
print("\116\101\115\116\105\110\103\32\116\114\97\99\101\98\97\99\107\32\115\105\122\101\115")
local function countlines
(s)
return select(2,string.gsub(s,"\10",""))
end
local function deep
(lvl,n)
if lvl == 0 then
return (debug.traceback("\109\101\115\115\97\103\101",n))
else
return (deep(lvl - 1,n))
end
end
local function checkdeep
(total,start)
local s = deep(total,start)
local rest = string.match(s,"\94\109\101\115\115\97\103\101\10\115\116\97\99\107\32\116\114\97\99\101\98\97\99\107\58\10\40\46\42\41\36")
local cl = countlines(rest)
assert(cl <= 10 + 11 + 1)
local brk = string.find(rest,"\37\46\37\46\37\46\9\37\40\115\107\105\112")
if brk then
local rest1 = string.sub(rest,1,brk)
local rest2 = string.sub(rest,brk,# rest)
assert(countlines(rest1) == 10 and countlines(rest2) == 11)
else
assert(cl == total - start + 2)
end
end
for d = 1, 51, 10
do
for l = 1, d
do
coroutine.wrap(checkdeep)(d,l)
end
end
end
print("\116\101\115\116\105\110\103\32\100\101\98\117\103\32\102\117\110\99\116\105\111\110\115\32\111\110\32\99\104\117\110\107\32\119\105\116\104\111\117\116\32\100\101\98\117\103\32\105\110\102\111")
local prog = "\45\45\32\112\114\111\103\114\97\109\32\116\111\32\98\101\32\108\111\97\100\101\100\32\119\105\116\104\111\117\116\32\100\101\98\117\103\32\105\110\102\111\114\109\97\116\105\111\110\32\40\115\116\114\105\112\41\10\108\111\99\97\108\32\100\101\98\117\103\32\61\32\114\101\113\117\105\114\101\39\100\101\98\117\103\39\10\108\111\99\97\108\32\97\32\61\32\49\50\32\32\45\45\32\97\32\108\111\99\97\108\32\118\97\114\105\97\98\108\101\10\10\108\111\99\97\108\32\110\44\32\118\32\61\32\100\101\98\117\103\46\103\101\116\108\111\99\97\108\40\49\44\32\49\41\10\97\115\115\101\114\116\40\110\32\61\61\32\34\40\116\101\109\112\111\114\97\114\121\41\34\32\97\110\100\32\118\32\61\61\32\100\101\98\117\103\41\32\32\32\45\45\32\117\110\107\111\119\110\32\110\97\109\101\32\98\117\116\32\107\110\111\119\110\32\118\97\108\117\101\10\110\44\32\118\32\61\32\100\101\98\117\103\46\103\101\116\108\111\99\97\108\40\49\44\32\50\41\10\97\115\115\101\114\116\40\110\32\61\61\32\34\40\116\101\109\112\111\114\97\114\121\41\34\32\97\110\100\32\118\32\61\61\32\49\50\41\32\32\32\45\45\32\117\110\107\111\119\110\32\110\97\109\101\32\98\117\116\32\107\110\111\119\110\32\118\97\108\117\101\10\10\45\45\32\97\32\102\117\110\99\116\105\111\110\32\119\105\116\104\32\97\110\32\117\112\118\97\108\117\101\10\108\111\99\97\108\32\102\32\61\32\102\117\110\99\116\105\111\110\32\40\41\32\108\111\99\97\108\32\120\59\32\114\101\116\117\114\110\32\97\32\101\110\100\10\110\44\32\118\32\61\32\100\101\98\117\103\46\103\101\116\117\112\118\97\108\117\101\40\102\44\32\49\41\10\97\115\115\101\114\116\40\110\32\61\61\32\34\40\110\111\32\110\97\109\101\41\34\32\97\110\100\32\118\32\61\61\32\49\50\41\10\97\115\115\101\114\116\40\100\101\98\117\103\46\115\101\116\117\112\118\97\108\117\101\40\102\44\32\49\44\32\49\51\41\32\61\61\32\34\40\110\111\32\110\97\109\101\41\34\41\10\97\115\115\101\114\116\40\97\32\61\61\32\49\51\41\10\10\108\111\99\97\108\32\116\32\61\32\100\101\98\117\103\46\103\101\116\105\110\102\111\40\102\41\10\97\115\115\101\114\116\40\116\46\110\97\109\101\32\61\61\32\110\105\108\32\97\110\100\32\116\46\108\105\110\101\100\101\102\105\110\101\100\32\62\32\48\32\97\110\100\10\32\32\32\32\32\32\32\116\46\108\97\115\116\108\105\110\101\100\101\102\105\110\101\100\32\61\61\32\116\46\108\105\110\101\100\101\102\105\110\101\100\32\97\110\100\10\32\32\32\32\32\32\32\116\46\115\104\111\114\116\95\115\114\99\32\61\61\32\34\63\34\41\10\97\115\115\101\114\116\40\100\101\98\117\103\46\103\101\116\105\110\102\111\40\49\41\46\99\117\114\114\101\110\116\108\105\110\101\32\61\61\32\45\49\41\10\10\116\32\61\32\100\101\98\117\103\46\103\101\116\105\110\102\111\40\102\44\32\34\76\34\41\46\97\99\116\105\118\101\108\105\110\101\115\10\97\115\115\101\114\116\40\110\101\120\116\40\116\41\32\61\61\32\110\105\108\41\32\32\32\32\45\45\32\97\99\116\105\118\101\32\108\105\110\101\115\32\97\114\101\32\101\109\112\116\121\10\10\45\45\32\100\117\109\112\47\108\111\97\100\32\97\32\102\117\110\99\116\105\111\110\32\119\105\116\104\111\117\116\32\100\101\98\117\103\32\105\110\102\111\10\102\32\61\32\108\111\97\100\40\115\116\114\105\110\103\46\100\117\109\112\40\102\41\41\10\10\116\32\61\32\100\101\98\117\103\46\103\101\116\105\110\102\111\40\102\41\10\97\115\115\101\114\116\40\116\46\110\97\109\101\32\61\61\32\110\105\108\32\97\110\100\32\116\46\108\105\110\101\100\101\102\105\110\101\100\32\62\32\48\32\97\110\100\10\32\32\32\32\32\32\32\116\46\108\97\115\116\108\105\110\101\100\101\102\105\110\101\100\32\61\61\32\116\46\108\105\110\101\100\101\102\105\110\101\100\32\97\110\100\10\32\32\32\32\32\32\32\116\46\115\104\111\114\116\95\115\114\99\32\61\61\32\34\63\34\41\10\97\115\115\101\114\116\40\100\101\98\117\103\46\103\101\116\105\110\102\111\40\49\41\46\99\117\114\114\101\110\116\108\105\110\101\32\61\61\32\45\49\41\10\10\114\101\116\117\114\110\32\97\10"
local f = assert(load(string.dump(load(prog),true)))
assert(f() == 13)
do
local function foo
()
local a = 1
local b = 2
return b
end
local s = load(string.dump(foo,true))
local line = true
debug.sethook(function (e,l)
assert(e == "\108\105\110\101")
line=l
end,"\108")
assert(s() == 2)
;
debug.sethook(nil)
assert(line == nil)
end
do
local prog = "\32\32\32\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\120\41\10\32\32\32\32\32\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\121\41\32\10\32\32\32\32\32\32\32\32\114\101\116\117\114\110\32\120\32\43\32\121\10\32\32\32\32\32\32\101\110\100\10\32\32\32\32\101\110\100\10\32\32"
local name = string.rep("\120",1000)
local p = assert(load(prog,name))
local c = string.dump(p)
assert(# c > 1000 and # c < 2000)
local f = assert(load(c))
local g = f()
local h = g(3)
assert(h(5) == 8)
assert(debug.getinfo(f).source == name and debug.getinfo(g).source == name and debug.getinfo(h).source == name)
local c = string.dump(p,true)
assert(# c < 500)
local f = assert(load(c))
local g = f()
local h = g(30)
assert(h(50) == 80)
assert(debug.getinfo(f).source == "\61\63" and debug.getinfo(g).source == "\61\63" and debug.getinfo(h).source == "\61\63")
end
print("\79\75")