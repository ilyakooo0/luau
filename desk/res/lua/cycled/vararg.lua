print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{76}\u{61}\u{72}\u{61}\u{72}\u{67}")
local function f
(a, ...)
local x = {["\u{6e}"] = select("\u{23}",...),...}
for i = 0x1, x.n
do
assert((a[i] == x[i]))
end
return x.n
end
local function c12
(...)
assert((arg == _G.arg))
local x = {...}
;
x.n=# x
local res = (((x.n == 0x2) and (x[0x1] == 0x1)) and (x[0x2] == 0x2))
if res then
res=0x37
end
return res,0x2
end
local function vararg
(...)
return {["\u{6e}"] = select("\u{23}",...),...}
end
local call = function (f,args)
return f(table.unpack(args,0x1,args.n))
end
assert((f() == 0x0))
assert((f({0x1,0x2,0x3},0x1,0x2,0x3) == 0x3))
assert((f({"\u{61}\u{6c}\u{6f}",nil,0x2d,f,nil},"\u{61}\u{6c}\u{6f}",nil,0x2d,f,nil) == 0x5))
assert((vararg().n == 0x0))
assert((vararg(nil,nil).n == 0x2))
assert((c12(0x1,0x2) == 0x37))
local a,b = assert(call(c12,{0x1,0x2}))
assert(((a == 0x37) and (b == 0x2)))
a=call(c12,{0x1,0x2,["\u{6e}"] = 0x2})
assert(((a == 0x37) and (b == 0x2)))
a=call(c12,{0x1,0x2,["\u{6e}"] = 0x1})
assert(not a)
assert((c12(0x1,0x2,0x3) == false))
local a = vararg(call(next,{_G,nil,["\u{6e}"] = 0x2}))
local b,c = next(_G)
assert((((a[0x1] == b) and (a[0x2] == c)) and (a.n == 0x2)))
a=vararg(call(call,{c12,{0x1,0x2}}))
assert((((a.n == 0x2) and (a[0x1] == 0x37)) and (a[0x2] == 0x2)))
a=call(print,{"\u{2b}"})
assert((a == nil))
local t = {0x1,0xa}
function t:f(...)
local arg = {...}
;
return (self[...] + # arg)
end
assert(((t:f(0x1,0x4) == 0x3) and (t:f(0x2) == 0xb)))
print("\u{2b}")
local lim = 0x14
local i,a = 0x1,{}
while (i <= lim) do
a[i]=(i + 0.3)
;
i=(i + 0x1)
end
function f(a,b,c,d, ...)
local more = {...}
assert(((((a == 1.3) and (more[0x1] == 5.3)) and (more[(lim - 0x4)] == (lim + 0.3))) and not more[(lim - 0x3)]))
end
local function g
(a,b,c)
assert((((a == 1.3) and (b == 2.3)) and (c == 3.3)))
end
call(f,a)
call(g,a)
a={}
i=0x1
while (i <= lim) do
a[i]=i
;
i=(i + 0x1)
end
assert((call(math.max,a) == lim))
print("\u{2b}")
local function oneless
(a, ...)
return ...
end
function f(n,a, ...)
local b
assert((arg == _G.arg))
if (n == 0x0) then
local b,c,d = ...
return a,b,c,d,oneless(oneless(oneless(...)))
else
n,b,a=(n - 0x1),...,a
assert((b == ...))
return f(n,a,...)
end
end
a,b,c,d,e=assert(f(0xa,0x5,0x4,0x3,0x2,0x1))
assert((((((a == 0x5) and (b == 0x4)) and (c == 0x3)) and (d == 0x2)) and (e == 0x1)))
a,b,c,d,e=f(0x4)
assert((((((a == nil) and (b == nil)) and (c == nil)) and (d == nil)) and (e == nil)))
local f = load("\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{7b}\u{2e}\u{2e}\u{2e}\u{7d}\u{20}")
local x = f(0x2,0x3)
assert((((x[0x1] == 0x2) and (x[0x2] == 0x3)) and (x[0x3] == undef)))
f=load("\u{20}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{78}\u{20}\u{3d}\u{20}\u{7b}\u{2e}\u{2e}\u{2e}\u{7d}\u{a}\u{20}\u{20}\u{66}\u{6f}\u{72}\u{20}\u{69}\u{3d}\u{31}\u{2c}\u{73}\u{65}\u{6c}\u{65}\u{63}\u{74}\u{28}\u{27}\u{23}\u{27}\u{2c}\u{20}\u{2e}\u{2e}\u{2e}\u{29}\u{20}\u{64}\u{6f}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{78}\u{5b}\u{69}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{73}\u{65}\u{6c}\u{65}\u{63}\u{74}\u{28}\u{69}\u{2c}\u{20}\u{2e}\u{2e}\u{2e}\u{29}\u{29}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{20}\u{20}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{78}\u{5b}\u{73}\u{65}\u{6c}\u{65}\u{63}\u{74}\u{28}\u{27}\u{23}\u{27}\u{2c}\u{20}\u{2e}\u{2e}\u{2e}\u{29}\u{2b}\u{31}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{75}\u{6e}\u{64}\u{65}\u{66}\u{29}\u{a}\u{20}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{74}\u{72}\u{75}\u{65}\u{a}")
assert(f("\u{61}","\u{62}",nil,{},assert))
assert(f())
a={select(0x3,table.unpack({0xa,0x14,0x1e,0x28}))}
assert(# (((a == 0x2) and (a[0x1] == 0x1e)) and (a[0x2] == 0x28)))
a={select(0x1)}
assert((next(a) == nil))
a={select(- 0x1,0x3,0x5,0x7)}
assert(((a[0x1] == 0x7) and (a[0x2] == undef)))
a={select(- 0x2,0x3,0x5,0x7)}
assert((((a[0x1] == 0x5) and (a[0x2] == 0x7)) and (a[0x3] == undef)))
pcall(select,0x2710)
pcall(select,- 0x2710)
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
return f(0x1,0x2)
end
local a,b = g()
assert(((a == nil) and (b == 0x2)))
end
print("\u{4f}\u{4b}")