print("\116\101\115\116\105\110\103\32\118\97\114\97\114\103")
local function f
(a, ...)
local x = {["\110"] = select("\35",...),...}
for i = 1, x.n
do
assert(a[i] == x[i])
end
return x.n
end
local function c12
(...)
assert(arg == _G.arg)
local x = {...}
;
x.n=# x
local res = (x.n == 2 and x[1] == 1 and x[2] == 2)
if res then
res=55
end
return res,2
end
local function vararg
(...)
return {["\110"] = select("\35",...),...}
end
local call = function (f,args)
return f(table.unpack(args,1,args.n))
end
assert(f() == 0)
assert(f({1,2,3},1,2,3) == 3)
assert(f({"\97\108\111",nil,45,f,nil},"\97\108\111",nil,45,f,nil) == 5)
assert(vararg().n == 0)
assert(vararg(nil,nil).n == 2)
assert(c12(1,2) == 55)
local a,b = assert(call(c12,{1,2}))
assert(a == 55 and b == 2)
a=call(c12,{1,2,["\110"] = 2})
assert(a == 55 and b == 2)
a=call(c12,{1,2,["\110"] = 1})
assert(not a)
assert(c12(1,2,3) == false)
local a = vararg(call(next,{_G,nil,["\110"] = 2}))
local b,c = next(_G)
assert(a[1] == b and a[2] == c and a.n == 2)
a=vararg(call(call,{c12,{1,2}}))
assert(a.n == 2 and a[1] == 55 and a[2] == 2)
a=call(print,{"\43"})
assert(a == nil)
local t = {1,10}
function t:f(...)
local arg = {...}
;
return self[...] + # arg
end
assert(t:f(1,4) == 3 and t:f(2) == 11)
print("\43")
local lim = 20
local i,a = 1,{}
while i <= lim do
a[i]=i + 0.3
;
i=i + 1
end
function f(a,b,c,d, ...)
local more = {...}
assert(a == 1.3 and more[1] == 5.3 and more[lim - 4] == lim + 0.3 and not more[lim - 3])
end
local function g
(a,b,c)
assert(a == 1.3 and b == 2.3 and c == 3.3)
end
call(f,a)
call(g,a)
a={}
i=1
while i <= lim do
a[i]=i
;
i=i + 1
end
assert(call(math.max,a) == lim)
print("\43")
local function oneless
(a, ...)
return ...
end
function f(n,a, ...)
local b
assert(arg == _G.arg)
if n == 0 then
local b,c,d = ...
return a,b,c,d,oneless(oneless(oneless(...)))
else
n,b,a=n - 1,...,a
assert(b == ...)
return f(n,a,...)
end
end
a,b,c,d,e=assert(f(10,5,4,3,2,1))
assert(a == 5 and b == 4 and c == 3 and d == 2 and e == 1)
a,b,c,d,e=f(4)
assert(a == nil and b == nil and c == nil and d == nil and e == nil)
local f = load("\32\114\101\116\117\114\110\32\123\46\46\46\125\32")
local x = f(2,3)
assert(x[1] == 2 and x[2] == 3 and x[3] == undef)
f=load("\32\32\108\111\99\97\108\32\120\32\61\32\123\46\46\46\125\10\32\32\102\111\114\32\105\61\49\44\115\101\108\101\99\116\40\39\35\39\44\32\46\46\46\41\32\100\111\32\97\115\115\101\114\116\40\120\91\105\93\32\61\61\32\115\101\108\101\99\116\40\105\44\32\46\46\46\41\41\32\101\110\100\10\32\32\97\115\115\101\114\116\40\120\91\115\101\108\101\99\116\40\39\35\39\44\32\46\46\46\41\43\49\93\32\61\61\32\117\110\100\101\102\41\10\32\32\114\101\116\117\114\110\32\116\114\117\101\10")
assert(f("\97","\98",nil,{},assert))
assert(f())
a={select(3,table.unpack({10,20,30,40}))}
assert(# a == 2 and a[1] == 30 and a[2] == 40)
a={select(1)}
assert(next(a) == nil)
a={select(- 1,3,5,7)}
assert(a[1] == 7 and a[2] == undef)
a={select(- 2,3,5,7)}
assert(a[1] == 5 and a[2] == 7 and a[3] == undef)
pcall(select,10000)
pcall(select,- 10000)
function f(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p40,p41,p42,p43,p44,p45,p46,p48,p49,p50, ...)
local a1,a2,a3,a4,a5,a6,a7
local a8,a9,a10,a11,a12,a13,a14
end
f()
do
local function f
(a,b,c)
return c,b
end
local function g
()
return f(1,2)
end
local a,b = g()
assert(a == nil and b == 2)
end
print("\79\75")