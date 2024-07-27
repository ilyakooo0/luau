print("\116\101\115\116\105\110\103\32\112\97\116\116\101\114\110\32\109\97\116\99\104\105\110\103")
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
local function f
(s,p)
local i,e = string.find(s,p)
if i then
return string.sub(s,i,e)
end
end
local a,b = string.find("","")
assert(a == 1 and b == 0)
;
a,b=string.find("\97\108\111","")
assert(a == 1 and b == 0)
a,b=string.find("\97\111\32\97\111\32\97\111","\97",1)
assert(a == 1 and b == 1)
a,b=string.find("\97\111\32\97\111\32\97\111","\97\111",2)
assert(a == 5 and b == 7)
a,b=string.find("\97\111\32\97\111\32\97\111","\97\111",9)
assert(a == 9 and b == 11)
a,b=string.find("\97\97\97\97\97\98","\97\98",2)
;
assert(a == 9 and b == 11)
;
a,b=string.find("\97\97\97\97\97\98","\98")
assert(a == 11 and b == 11)
assert(not string.find("\97\97\97\97\97\98","\98"))
assert(not string.find("",""))
assert(string.find("\97\108\111\49\50\51\97\108\111","\49\50") == 4)
assert(not string.find("\97\108\111\49\50\51\97\108\111","\94\49\50"))
assert(string.match("\97\97\97\98","\46\42\98") == "\97\97\97\98")
assert(string.match("\97\97\97","\46\42\97") == "\97\97\97")
assert(string.match("\98","\46\42\98") == "\98")
assert(string.match("\97\97\97\98","\46\43\98") == "\97\97\97\98")
assert(string.match("\97\97\97","\46\43\97") == "\97\97\97")
assert(not string.match("\98","\46\43\98"))
assert(string.match("\97\97\97\98","\46\63\98") == "\97\98")
assert(string.match("\97\97\97","\46\63\97") == "\97\97")
assert(string.match("\98","\46\63\98") == "\98")
assert(f("\97\108\111\65\76\79","\37\108\42") == "\97\108\111")
assert(f("\97\76\111\95\65\76\79","\37\97\42") == "\97\76\111")
assert(f("\32\32\10\13\42\38\10\13\32\32\32\120\117\120\117\32\32\10\10","\37\103\37\103\37\103\43") == "\120\117\120\117")
local function PU
(p)
p=string.gsub(p,"\40" .. utf8.charpattern .. "\41\37\63",function (c)
return string.gsub(c,"\46","\37\48\63")
end)
p=string.gsub(p,"\37\46",utf8.charpattern)
return p
end
assert(f("\97\97\97\98","\97\42") == "\97\97\97")
;
assert(f("\97\97\97","\94\46\42\36") == "\97\97\97")
;
assert(f("\97\97\97","\98\42") == "")
;
assert(f("\97\97\97","\97\98\42\97") == "\97\97")
assert(f("\97\98\97","\97\98\42\97") == "\97\98\97")
assert(f("\97\97\97\98","\97\43") == "\97\97\97")
assert(f("\97\97\97","\94\46\43\36") == "\97\97\97")
assert(not f("\97\97\97","\98\43"))
assert(not f("\97\97\97","\97\98\43\97"))
assert(f("\97\98\97","\97\98\43\97") == "\97\98\97")
assert(f("\97\36\97","\46\36") == "\97")
assert(f("\97\36\97","\46\37\36") == "\97\36")
assert(f("\97\36\97","\46\36\46") == "\97\36\97")
assert(not f("\97\36\97","\36\36"))
assert(not f("\97\36\98","\97\36"))
assert(f("\97\36\97","\36") == "")
assert(f("","\98\42") == "")
assert(not f("\97\97\97","\98\98\42"))
assert(f("\97\97\97\98","\97\45") == "")
assert(f("\97\97\97","\94\46\45\36") == "\97\97\97")
assert(f("\97\97\98\97\97\97\98\97\97\97\98\97\97\97\98\97","\98\46\42\98") == "\98\97\97\97\98\97\97\97\98\97\97\97\98")
assert(f("\97\97\98\97\97\97\98\97\97\97\98\97\97\97\98\97","\98\46\45\98") == "\98\97\97\97\98")
assert(f("\97\108\111\32\120\111","\46\111\36") == "\120\111")
assert(f("\32\10\32\105\115\116\111\32\195\169\32\97\115\115\105\109","\37\83\37\83\42") == "\105\115\116\111")
assert(f("\32\10\32\105\115\116\111\32\195\169\32\97\115\115\105\109","\37\83\42\36") == "\97\115\115\105\109")
assert(f("\32\10\32\105\115\116\111\32\195\169\32\97\115\115\105\109","\91\97\45\122\93\42\36") == "\97\115\115\105\109")
assert(f("\117\109\32\99\97\114\97\99\116\101\114\32\63\32\101\120\116\114\97","\91\94\37\115\97\45\122\93") == "\63")
assert(f("","\97\63") == "")
assert(f("\195\161",PU("\195\161\63")) == "\195\161")
assert(f("\195\161\98\108",PU("\195\161\63\98\63\108\63")) == "\195\161\98\108")
assert(f("\32\32\195\161\98\108",PU("\195\161\63\98\63\108\63")) == "")
assert(f("\97\97","\94\97\97\63\97\63\97") == "\97\97")
assert(f("\93\93\93\195\161\98","\91\94\93\93\43") == "\195\161\98")
assert(f("\48\97\108\111\32\97\108\111","\37\120\42") == "\48\97")
assert(f("\97\108\111\32\97\108\111","\37\67\43") == "\97\108\111\32\97\108\111")
print("\43")
local function f1
(s,p)
p=string.gsub(p,"\37\37\40\91\48\45\57\93\41",function (s)
return "\37" .. (tonumber(s) + 1)
end)
p=string.gsub(p,"\94\40\94\63\41","\37\49\40\41",1)
p=string.gsub(p,"\40\36\63\41\36","\40\41\37\49",1)
local t = {string.match(s,p)}
return string.sub(s,t[1],t[# t] - 1)
end
assert(f1("\97\108\111\32\97\108\120\32\49\50\51\32\98\111\32\98\111","\40\46\46\42\41\32\37\49") == "\98\111\32\98\111")
assert(f1("\97\120\122\49\50\51\61\32\52\61\32\52\32\51\52","\40\46\43\41\61\40\46\42\41\61\37\50\32\37\49") == "\51\61\32\52\61\32\52\32\51")
assert(f1("\61\61\61\61\61\61\61","\94\40\61\42\41\61\37\49\36") == "\61\61\61\61\61\61\61")
assert(not string.match("\61\61\61\61\61\61\61\61\61\61","\94\40\91\61\93\42\41\61\37\49\36"))
local function range
(i,j)
if i <= j then
return i,range(i + 1,j)
end
end
local abc = string.char(range(0,127)) .. string.char(range(128,255))
;
assert(string.len(abc) == 256)
local function strset
(p)
local res = {["\115"] = ""}
string.gsub(abc,p,function (c)
res.s=res.s .. c
end)
return res.s
end
;
assert(string.len(strset("\91\200\45\210\93")) == 11)
assert(strset("\91\97\45\122\93") == "\97\98\99\100\101\102\103\104\105\106\107\108\109\110\111\112\113\114\115\116\117\118\119\120\121\122")
assert(strset("\91\97\45\122\37\100\93") == strset("\91\37\100\97\45\117\117\45\122\93"))
assert(strset("\91\97\45\93") == "\45\97")
assert(strset("\91\94\37\87\93") == strset("\91\37\119\93"))
assert(strset("\91\93\37\37\93") == "\37\93")
assert(strset("\91\97\37\45\122\93") == "\45\97\122")
assert(strset("\91\37\94\37\91\37\45\97\37\93\37\45\98\93") == "\45\91\93\94\97\98")
assert(strset("\37\90") == strset("\91\1\45\255\93"))
assert(strset("\46") == strset("\91\1\45\255\37\122\93"))
print("\43")
;
assert(string.match("\97\108\111\32\120\121\122\75","\40\37\119\43\41\75") == "\120\121\122")
assert(string.match("\50\53\52\32\75","\40\37\100\42\41\75") == "")
assert(string.match("\97\108\111\32","\40\37\119\42\41\36") == "")
assert(not string.match("\97\108\111\32","\40\37\119\43\41\36"))
assert(string.find("\40\195\161\108\111\41","\37\40\195\161") == 1)
local a,b,c,d,e = string.match("\195\162\108\111\32\97\108\111",PU("\94\40\40\40\46\41\46\41\46\32\40\37\119\42\41\41\36"))
assert(a == "\195\162\108\111\32\97\108\111" and b == "\195\162\108" and c == "\195\162" and d == "\97\108\111" and e == nil)
a,b,c,d=string.match("\48\49\50\51\52\53\54\55\56\57","\40\46\43\40\46\63\41\40\41\41")
assert(a == "\48\49\50\51\52\53\54\55\56\57" and b == "" and c == 11 and d == nil)
print("\43")
assert(string.gsub("\195\188\108\111\32\195\188\108\111","\195\188","\120") == "\120\108\111\32\120\108\111")
assert(string.gsub("\97\108\111\32\195\186\108\111\32\32","\32\43\36","") == "\97\108\111\32\195\186\108\111")
assert(string.gsub("\32\32\97\108\111\32\97\108\111\32\32","\94\37\115\42\40\46\45\41\37\115\42\36","\37\49") == "\97\108\111\32\97\108\111")
assert(string.gsub("\97\108\111\32\32\97\108\111\32\32\10\32\49\50\51\10\32","\37\115\43","\32") == "\97\108\111\32\97\108\111\32\49\50\51\32")
local t = "\97\98\195\167\32\100"
a,b=string.gsub(t,PU("\40\46\41"),"\37\49\64")
assert(a == "\97\64\98\64\195\167\64\32\64\100\64" and b == 5)
a,b=string.gsub("\97\98\195\167\100",PU("\40\46\41"),"\37\48\64",2)
assert(a == "\97\64\98\64\195\167\100" and b == 2)
assert(string.gsub("\97\108\111\32\97\108\111","\40\41\91\97\108\93","\37\49") == "\49\50\111\32\53\54\111")
assert(string.gsub("\97\98\99\61\120\121\122","\40\37\119\42\41\40\37\112\41\40\37\119\43\41","\37\51\37\50\37\49\45\37\48") == "\120\121\122\61\97\98\99\45\97\98\99\61\120\121\122")
assert(string.gsub("\97\98\99","\37\119","\37\49\37\48") == "\97\97\98\98\99\99")
assert(string.gsub("\97\98\99","\37\119\43","\37\48\37\49") == "\97\98\99\97\98\99")
assert(string.gsub("\195\161\195\169\195\173","\36","\195\179\195\186") == "\195\161\195\169\195\173\195\179\195\186")
assert(string.gsub("","\94","\114") == "\114")
assert(string.gsub("","\36","\114") == "\114")
print("\43")
do
assert(string.gsub("\97\32\98\32\99\100","\32\42","\45") == "\45\97\45\98\45\99\45\100\45")
local res = ""
local sub = "\97\32\32\10\98\99\9\9\100"
local i = 1
for p,e in string.gmatch(sub,"\40\41\37\115\42\40\41")
do
res=res .. string.sub(sub,i,p - 1) .. "\45"
i=e
end
assert(res == "\45\97\45\98\45\99\45\100\45")
end
assert(string.gsub("\117\109\32\40\100\111\105\115\41\32\116\114\101\115\32\40\113\117\97\116\114\111\41","\40\37\40\37\119\43\37\41\41",string.upper) == "\117\109\32\40\68\79\73\83\41\32\116\114\101\115\32\40\81\85\65\84\82\79\41")
do
local function setglobal
(n,v)
rawset(_G,n,v)
end
string.gsub("\97\61\114\111\98\101\114\116\111\44\114\111\98\101\114\116\111\61\97","\40\37\119\43\41\61\40\37\119\37\119\42\41",setglobal)
assert(_G.a == "\114\111\98\101\114\116\111" and _G.roberto == "\97")
_G.a=nil
;
_G.roberto=nil
end
function f(a,b)
return string.gsub(a,"\46",b)
end
assert(string.gsub("\116\114\111\99\97\114\32\116\117\100\111\32\101\109\32\124\116\101\115\116\101\124\98\124\32\195\169\32\124\98\101\108\101\122\97\124\97\108\124","\124\40\91\94\124\93\42\41\124\40\91\94\124\93\42\41\124",f) == "\116\114\111\99\97\114\32\116\117\100\111\32\101\109\32\98\98\98\98\98\32\195\169\32\97\108\97\108\97\108\97\108\97\108\97\108")
local function dostring
(s)
return load(s,"")() or ""
end
assert(string.gsub("\97\108\111\32\36\97\61\39\120\39\36\32\110\111\118\97\109\101\110\116\101\32\36\114\101\116\117\114\110\32\97\36","\36\40\91\94\36\93\42\41\37\36",dostring) == "\97\108\111\32\32\110\111\118\97\109\101\110\116\101\32\120")
local x = string.gsub("\36\120\61\115\116\114\105\110\103\46\103\115\117\98\40\39\97\108\111\39\44\32\39\46\39\44\32\115\116\114\105\110\103\46\117\112\112\101\114\41\36\32\97\115\115\105\109\32\118\97\105\32\112\97\114\97\32\36\114\101\116\117\114\110\32\120\36","\36\40\91\94\36\93\42\41\37\36",dostring)
assert(x == "\32\97\115\115\105\109\32\118\97\105\32\112\97\114\97\32\65\76\79")
_G.a,_G.x=nil
local t = {}
local s = "\97\32\97\108\111\32\106\111\115\101\32\32\106\111\97\111"
local r = string.gsub(s,"\40\41\40\37\119\43\41\40\41",function (a,w,b)
assert(string.len(w) == b - a)
;
t[a]=b - a
;
end)
assert(s == r and t[1] == 1 and t[3] == 3 and t[7] == 4 and t[13] == 4)
local function isbalanced
(s)
return not string.find(string.gsub(s,"\37\98\40\41",""),"\91\40\41\93")
end
assert(isbalanced("\40\57\32\40\40\56\41\41\40\41\32\55\41\32\32\97\32\98\32\40\41\40\99\41\40\41\32\97"))
assert(not isbalanced("\40\57\32\40\40\56\41\32\55\41\32\97\32\98\32\40\32\99\41\32\97"))
assert(string.gsub("\97\108\111\32\39\111\105\39\32\97\108\111","\37\98\39\39","\34") == "\97\108\111\32\34\32\97\108\111")
local t = {"\97\112\112\108\101","\111\114\97\110\103\101","\108\105\109\101",["\110"] = 0}
assert(string.gsub("\120\32\97\110\100\32\120\32\97\110\100\32\120","\120",function ()
t.n=t.n + 1
;
return t[t.n]
end) == "\97\112\112\108\101\32\97\110\100\32\111\114\97\110\103\101\32\97\110\100\32\108\105\109\101")
t={["\110"] = 0}
string.gsub("\102\105\114\115\116\32\115\101\99\111\110\100\32\119\111\114\100","\37\119\37\119\42",function (w)
t.n=t.n + 1
;
t[t.n]=w
end)
assert(t[1] == "\102\105\114\115\116" and t[2] == "\115\101\99\111\110\100" and t[3] == "\119\111\114\100" and t.n == 3)
t={["\110"] = 0}
assert(string.gsub("\102\105\114\115\116\32\115\101\99\111\110\100\32\119\111\114\100","\37\119\43",function (w)
t.n=t.n + 1
;
t[t.n]=w
end,2) == "\102\105\114\115\116\32\115\101\99\111\110\100\32\119\111\114\100")
assert(t[1] == "\102\105\114\115\116" and t[2] == "\115\101\99\111\110\100" and t[3] == undef)
checkerror("\105\110\118\97\108\105\100\32\114\101\112\108\97\99\101\109\101\110\116\32\118\97\108\117\101\32\37\40\97\32\116\97\98\108\101\37\41",string.gsub,"\97\108\111","\46",{["\97"] = {}})
checkerror("\105\110\118\97\108\105\100\32\99\97\112\116\117\114\101\32\105\110\100\101\120\32\37\37\50",string.gsub,"\97\108\111","\46","\37\50")
checkerror("\105\110\118\97\108\105\100\32\99\97\112\116\117\114\101\32\105\110\100\101\120\32\37\37\48",string.gsub,"\97\108\111","\40\37\48\41","\97")
checkerror("\105\110\118\97\108\105\100\32\99\97\112\116\117\114\101\32\105\110\100\101\120\32\37\37\49",string.gsub,"\97\108\111","\40\37\49\41","\97")
checkerror("\105\110\118\97\108\105\100\32\117\115\101\32\111\102\32\39\37\37\39",string.gsub,"\97\108\111","\46","\37\120")
if not _soft then
print("\98\105\103\32\115\116\114\105\110\103\115")
local a = string.rep("\97",300000)
assert(string.find(a,"\94\97\42\46\63\36"))
assert(not string.find(a,"\94\97\42\46\63\98\36"))
assert(string.find(a,"\94\97\45\46\63\36"))
a=string.rep("\97",10000) .. string.rep("\98",10000)
assert(not pcall(string.gsub,a,"\98"))
end
local function rev
(s)
return string.gsub(s,"\40\46\41\40\46\43\41",function (c,s1)
return rev(s1) .. c
end)
end
local x = "\97\98\99\100\101\102"
assert(rev(rev(x)) == x)
assert(string.gsub("\97\108\111\32\97\108\111","\46",{}) == "\97\108\111\32\97\108\111")
assert(string.gsub("\97\108\111\32\97\108\111","\40\46\41",{["\97"] = "\65\65",["\108"] = ""}) == "\65\65\111\32\65\65\111")
assert(string.gsub("\97\108\111\32\97\108\111","\40\46\41\46",{["\97"] = "\65\65",["\108"] = "\75"}) == "\65\65\111\32\65\65\111")
assert(string.gsub("\97\108\111\32\97\108\111","\40\40\46\41\40\46\63\41\41",{["\97\108"] = "\65\65",["\111"] = false}) == "\65\65\111\32\65\65\111")
assert(string.gsub("\97\108\111\32\97\108\111","\40\41\46",{"\120","\121\121","\122\122\122"}) == "\120\121\121\122\122\122\32\97\108\111")
t={}
;
setmetatable(t,{["\95\95\105\110\100\101\120"] = function (t,s)
return string.upper(s)
end})
assert(string.gsub("\97\32\97\108\111\32\98\32\104\105","\37\119\37\119\43",t) == "\97\32\65\76\79\32\98\32\72\73")
local a = 0
for i in string.gmatch("\97\98\99\100\101","\40\41")
do
assert(i == a + 1)
;
a=i
end
assert(a == 6)
t={["\110"] = 0}
for w in string.gmatch("\102\105\114\115\116\32\115\101\99\111\110\100\32\119\111\114\100","\37\119\43")
do
t.n=t.n + 1
;
t[t.n]=w
end
assert(t[1] == "\102\105\114\115\116" and t[2] == "\115\101\99\111\110\100" and t[3] == "\119\111\114\100")
t={3,6,9}
for i in string.gmatch("\120\117\120\120\32\117\117\32\112\112\97\114\32\114","\40\41\40\46\41\37\50")
do
assert(i == table.remove(t,1))
end
assert(# t == 0)
t={}
for i,j in string.gmatch("\49\51\32\49\52\32\49\48\32\61\32\49\49\44\32\49\53\61\32\49\54\44\32\50\50\61\50\51","\40\37\100\43\41\37\115\42\61\37\115\42\40\37\100\43\41")
do
t[tonumber(i)]=tonumber(j)
end
a=0
for k,v in pairs(t)
do
assert(k + 1 == v + 0)
;
a=a + 1
end
assert(a == 3)
do
local s = 0
for k in string.gmatch("\49\48\32\50\48\32\51\48","\37\100\43",3)
do
s=s + tonumber(k)
end
assert(s == 50)
s=0
for k in string.gmatch("\49\49\32\50\49\32\51\49","\37\100\43",- 4)
do
s=s + tonumber(k)
end
assert(s == 32)
s=0
for k in string.gmatch("\49\49\32\50\49\32\51\49","\37\119\42",9)
do
s=s + 1
end
assert(s == 1)
s=0
for k in string.gmatch("\49\49\32\50\49\32\51\49","\37\119\42",10)
do
s=s + 1
end
assert(s == 0)
end
assert(string.gsub("\97\97\97\32\97\97\32\97\32\97\97\97\32\97","\37\102\91\37\119\93\97","\120") == "\120\97\97\32\120\97\32\120\32\120\97\97\32\120")
assert(string.gsub("\91\91\93\93\32\91\93\91\93\32\91\91\91\91","\37\102\91\91\93\46","\120") == "\120\91\93\93\32\120\93\120\93\32\120\91\91\91")
assert(string.gsub("\48\49\97\98\99\52\53\100\101\51","\37\102\91\37\100\93","\46") == "\46\48\49\97\98\99\46\52\53\100\101\46\51")
assert(string.gsub("\48\49\97\98\99\52\53\32\100\101\51\120","\37\102\91\37\68\93\37\119","\46") == "\48\49\46\98\99\52\53\32\100\101\51\46")
assert(string.gsub("\102\117\110\99\116\105\111\110","\37\102\91\1\45\255\93\37\119","\46") == "\46\117\110\99\116\105\111\110")
assert(string.gsub("\102\117\110\99\116\105\111\110","\37\102\91\94\1\45\255\93","\46") == "\102\117\110\99\116\105\111\110\46")
assert(string.find("\97","\37\102\91\97\93") == 1)
assert(string.find("\97","\37\102\91\94\37\122\93") == 1)
assert(string.find("\97","\37\102\91\94\37\108\93") == 2)
assert(string.find("\97\98\97","\37\102\91\97\37\122\93") == 3)
assert(string.find("\97\98\97","\37\102\91\37\122\93") == 4)
assert(not string.find("\97\98\97","\37\102\91\37\108\37\122\93"))
assert(not string.find("\97\98\97","\37\102\91\94\37\108\37\122\93"))
local i,e = string.find("\32\97\108\111\32\97\97\108\111\32\97\108\108\111","\37\102\91\37\83\93\46\45\37\102\91\37\115\93\46\45\37\102\91\37\83\93")
assert(i == 2 and e == 5)
local k = string.match("\32\97\108\111\32\97\97\108\111\32\97\108\108\111","\37\102\91\37\83\93\40\46\45\37\102\91\37\115\93\46\45\37\102\91\37\83\93\41")
assert(k == "\97\108\111\32")
local a = {1,5,9,14,17}
for k in string.gmatch("\97\108\111\32\97\108\111\32\116\104\48\50\32\105\115\32\49\104\97\116","\40\41\37\102\91\37\119\37\100\93")
do
assert(table.remove(a,1) == k)
end
assert(# a == 0)
local function malform
(p,m)
m=m or "\109\97\108\102\111\114\109\101\100"
local r,msg = pcall(string.find,"\97",p)
assert(not r and string.find(msg,m))
end
malform("\40\46","\117\110\102\105\110\105\115\104\101\100\32\99\97\112\116\117\114\101")
malform("\46\41","\105\110\118\97\108\105\100\32\112\97\116\116\101\114\110\32\99\97\112\116\117\114\101")
malform("\91\97")
malform("\91\93")
malform("\91\94\93")
malform("\91\97\37\93")
malform("\91\97\37")
malform("\37\98")
malform("\37\98\97")
malform("\37")
malform("\37\102","\109\105\115\115\105\110\103")
assert(string.match("\97\98\1\2\99","\91\45\2\93\43") == "\1\2")
assert(string.match("\97\98\1\2\99","\91\45\93\43") == "")
assert(string.find("\98\36\97","\36\63") == 2)
assert(string.find("\97\98\99\101\102\103","\37") == 4)
assert(string.match("\97\98\99\101\102\103\1\101\1\103","\37\98\1") == "\101\102\103\1\101\1")
assert(string.match("\97\98\99","\37\43") == "")
assert(string.match("\97\98\99","\37\37\63") == "")
assert(string.find("\97\98\99","\46") == 4)
assert(string.find("\97\98\99\120\97\98\99\97\98\99","\120\97\98\99\97\46") == 4)
do
local s = string.rep("\97",100)
local r = string.gsub(s,"\98","\99")
assert(string.format("\37\112",s) == string.format("\37\112",r))
r=string.gsub(s,"\46",{["\120"] = "\121"})
assert(string.format("\37\112",s) == string.format("\37\112",r))
local count = 0
r=string.gsub(s,"\46",function (x)
assert(x == "\97")
count=count + 1
return nil
end)
r=string.gsub(r,"\46",{["\98"] = "\120"})
assert(count == 100)
assert(string.format("\37\112",s) == string.format("\37\112",r))
count=0
r=string.gsub(s,"\46",function (x)
assert(x == "\97")
count=count + 1
return x
end)
assert(count == 100)
assert(r == s and string.format("\37\112",s) ~= string.format("\37\112",r))
end
print("\79\75")