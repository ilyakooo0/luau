print("\116\101\115\116\105\110\103\32\114\101\113\117\105\114\101")
assert(require("\115\116\114\105\110\103") == string)
assert(require("\109\97\116\104") == math)
assert(require("\116\97\98\108\101") == table)
assert(require("\105\111") == io)
assert(require("\111\115") == os)
assert(require("\99\111\114\111\117\116\105\110\101") == coroutine)
assert(type(package.path) == "\115\116\114\105\110\103")
assert(type(package.cpath) == "\115\116\114\105\110\103")
assert(type(package.loaded) == "\116\97\98\108\101")
assert(type(package.preload) == "\116\97\98\108\101")
assert(type(package.config) == "\115\116\114\105\110\103")
print("\112\97\99\107\97\103\101\32\99\111\110\102\105\103\58\32" .. string.gsub(package.config,"\10","\124"))
do
local max = _soft and 100 or 2000
local t = {}
for i = 1, max
do
t[i]=string.rep("\63",i % 10 + 1)
end
t[# t + 1]="\59"
local path = table.concat(t,"\59")
local s,err = package.searchpath("\120\117\120\117",path)
assert(not s and string.find(err,string.rep("\120\117\120\117",10)) and # string.gsub(err,"\91\94\10\93","") >= max)
local path = string.rep("\63",max)
local s,err = package.searchpath("\120\117\120\117",path)
assert(not s and string.find(err,string.rep("\120\117\120\117",max)))
end
do
local oldpath = package.path
package.path={}
local s,err = pcall(require,"\110\111\45\115\117\99\104\45\102\105\108\101")
assert(not s and string.find(err,"\112\97\99\107\97\103\101\46\112\97\116\104"))
package.path=oldpath
end
do
print("\116\101\115\116\105\110\103\32\39\114\101\113\117\105\114\101\39\32\109\101\115\115\97\103\101")
local oldpath = package.path
local oldcpath = package.cpath
package.path="\63\46\108\117\97\59\63\47\63"
package.cpath="\63\46\115\111\59\63\47\105\110\105\116"
local st,msg = pcall(require,"\88\88\88")
local expected = "\109\111\100\117\108\101\32\39\88\88\88\39\32\110\111\116\32\102\111\117\110\100\58\10\9\110\111\32\102\105\101\108\100\32\112\97\99\107\97\103\101\46\112\114\101\108\111\97\100\91\39\88\88\88\39\93\10\9\110\111\32\102\105\108\101\32\39\88\88\88\46\108\117\97\39\10\9\110\111\32\102\105\108\101\32\39\88\88\88\47\88\88\88\39\10\9\110\111\32\102\105\108\101\32\39\88\88\88\46\115\111\39\10\9\110\111\32\102\105\108\101\32\39\88\88\88\47\105\110\105\116\39"
assert(msg == expected)
package.path=oldpath
package.cpath=oldcpath
end
print("\43")
if not _port then
local dirsep = string.match(package.config,"\94\40\91\94\10\93\43\41\10")
local DIR = "\108\105\98\115" .. dirsep
local function D
(x)
local x = string.gsub(x,"\47",dirsep)
return DIR .. x
end
local function DC
(x)
local ext = (dirsep == "\92") and "\46\100\108\108" or "\46\115\111"
return D(x .. ext)
end
local function createfiles
(files,preextras,posextras)
for n,c in pairs(files)
do
io.output(D(n))
io.write(string.format(preextras,n))
io.write(c)
io.write(string.format(posextras,n))
io.close(io.output())
end
end
local function removefiles
(files)
for n in pairs(files)
do
os.remove(D(n))
end
end
local files = {["\110\97\109\101\115\46\108\117\97"] = "\100\111\32\114\101\116\117\114\110\32\123\46\46\46\125\32\101\110\100\10",["\101\114\114\46\108\117\97"] = "\66\32\61\32\49\53\59\32\97\32\61\32\97\32\43\32\49\59",["\115\121\110\101\114\114\46\108\117\97"] = "\66\32\61",["\65\46\108\117\97"] = "",["\66\46\108\117\97"] = "\97\115\115\101\114\116\40\46\46\46\61\61\39\66\39\41\59\114\101\113\117\105\114\101\32\39\65\39",["\65\46\108\99"] = "",["\65"] = "",["\76"] = "",["\88\88\120\88"] = "",["\67\46\108\117\97"] = "\112\97\99\107\97\103\101\46\108\111\97\100\101\100\91\46\46\46\93\32\61\32\50\53\59\32\114\101\113\117\105\114\101\39\67\39"}
AA=nil
local extras = "\78\65\77\69\32\61\32\39\37\115\39\10\82\69\81\85\73\82\69\68\32\61\32\46\46\46\10\114\101\116\117\114\110\32\65\65"
createfiles(files,"",extras)
assert(package.searchpath("\67\46\108\117\97",D("\63"),"","") == D("\67\46\108\117\97"))
assert(package.searchpath("\67\46\108\117\97",D("\63"),"\46","\46") == D("\67\46\108\117\97"))
assert(package.searchpath("\45\45\120\45",D("\63"),"\45","\88") == D("\88\88\120\88"))
assert(package.searchpath("\45\45\45\120\88",D("\63"),"\45\45\45","\88\88") == D("\88\88\120\88"))
assert(package.searchpath(D("\67\46\108\117\97"),"\63",dirsep) == D("\67\46\108\117\97"))
assert(package.searchpath("\46\92\67\46\108\117\97",D("\63"),"\92") == D("\46\47\67\46\108\117\97"))
local oldpath = package.path
package.path=string.gsub("\68\47\63\46\108\117\97\59\68\47\63\46\108\99\59\68\47\63\59\68\47\63\63\120\63\59\68\47\76","\68\47",DIR)
local try = function (p,n,r,ext)
NAME=nil
local rr,x = require(p)
assert(NAME == n)
assert(REQUIRED == p)
assert(rr == r)
assert(ext == x)
end
local a = require("\110\97\109\101\115")
assert(a[1] == "\110\97\109\101\115" and a[2] == D("\110\97\109\101\115\46\108\117\97"))
local st,msg = pcall(require,"\101\114\114")
assert(not st and string.find(msg,"\97\114\105\116\104\109\101\116\105\99") and B == 15)
st,msg=pcall(require,"\115\121\110\101\114\114")
assert(not st and string.find(msg,"\101\114\114\111\114\32\108\111\97\100\105\110\103\32\109\111\100\117\108\101"))
assert(package.searchpath("\67",package.path) == D("\67\46\108\117\97"))
assert(require("\67") == 25)
assert(require("\67") == 25)
AA=nil
try("\66","\66\46\108\117\97",true,"\108\105\98\115\47\66\46\108\117\97")
assert(package.loaded.B)
assert(require("\66") == true)
assert(package.loaded.A)
assert(require("\67") == 25)
package.loaded.A=nil
try("\66",nil,true,nil)
try("\65","\65\46\108\117\97",true,"\108\105\98\115\47\65\46\108\117\97")
package.loaded.A=nil
os.remove(D("\65\46\108\117\97"))
AA={}
try("\65","\65\46\108\99",AA,"\108\105\98\115\47\65\46\108\99")
assert(package.searchpath("\65",package.path) == D("\65\46\108\99"))
assert(require("\65") == AA)
AA=false
try("\75","\76",false,"\108\105\98\115\47\76")
try("\75","\76",false,"\108\105\98\115\47\76")
assert(rawget(_G,"\95\82\69\81\85\73\82\69\68\78\65\77\69") == nil)
AA="\120"
try("\88","\88\88\120\88",AA,"\108\105\98\115\47\88\88\120\88")
removefiles(files)
NAME,REQUIRED,AA,B=nil
local _G = _G
package.path=string.gsub("\68\47\63\46\108\117\97\59\68\47\63\47\105\110\105\116\46\108\117\97","\68\47",DIR)
files={["\80\49\47\105\110\105\116\46\108\117\97"] = "\65\65\32\61\32\49\48",["\80\49\47\120\117\120\117\46\108\117\97"] = "\65\65\32\61\32\50\48"}
createfiles(files,"\95\69\78\86\32\61\32\123\125\10","\10\114\101\116\117\114\110\32\95\69\78\86\10")
AA=0
local m,ext = assert(require("\80\49"))
assert(ext == "\108\105\98\115\47\80\49\47\105\110\105\116\46\108\117\97")
assert(AA == 0 and m.AA == 10)
assert(require("\80\49") == m)
assert(require("\80\49") == m)
assert(package.searchpath("\80\49\46\120\117\120\117",package.path) == D("\80\49\47\120\117\120\117\46\108\117\97"))
m.xuxu,ext=assert(require("\80\49\46\120\117\120\117"))
assert(AA == 0 and m.xuxu.AA == 20)
assert(ext == "\108\105\98\115\47\80\49\47\120\117\120\117\46\108\117\97")
assert(require("\80\49\46\120\117\120\117") == m.xuxu)
assert(require("\80\49\46\120\117\120\117") == m.xuxu)
assert(require("\80\49") == m and m.AA == 10)
removefiles(files)
AA=nil
package.path=""
assert(not pcall(require,"\102\105\108\101\95\100\111\101\115\95\110\111\116\95\101\120\105\115\116"))
package.path="\63\63\63"
assert(not pcall(require,"\102\105\108\101\95\100\111\101\115\95\110\111\116\95\101\120\105\115\116\49"))
package.path=oldpath
local fname = "\102\105\108\101\95\100\111\101\115\95\110\111\116\95\101\120\105\115\116\50"
local m,err = pcall(require,fname)
for t in string.gmatch(package.path .. "\59" .. package.cpath,"\91\94\59\93\43")
do
t=string.gsub(t,"\63",fname)
assert(string.find(err,t,1,true))
end
do
local searchers = package.searchers
package.searchers=3
local st,msg = pcall(require,"\97")
assert(not st and string.find(msg,"\109\117\115\116\32\98\101\32\97\32\116\97\98\108\101"))
package.searchers=searchers
end
local function import
(...)
local f = {...}
return function (m)
for i = 1, # f
do
m[f[i]]=_G[f[i]]
end
end
end
assert(not pcall(module,"\88\85\88\85"))
local p = ""
local st,err,when = package.loadlib(DC("\108\105\98\49"),"\42")
if not st then
local f,err,when = package.loadlib("\100\111\110\111\116\101\120\105\115\116",p .. "\120\117\120\117")
assert(not f and type(err) == "\115\116\114\105\110\103" and when == "\97\98\115\101\110\116")
;
(Message or print)("\10\32\62\62\62\32\99\97\110\110\111\116\32\108\111\97\100\32\100\121\110\97\109\105\99\32\108\105\98\114\97\114\121\32\60\60\60\10")
print(err,when)
else
local f = assert(package.loadlib(DC("\108\105\98\49"),p .. "\111\110\101\102\117\110\99\116\105\111\110"))
local a,b = f(15,25)
assert(a == 25 and b == 15)
f=assert(package.loadlib(DC("\108\105\98\49"),p .. "\97\110\111\116\104\101\114\102\117\110\99"))
assert(f(10,20) == "\49\48\37\50\48\10")
local f,err,when = package.loadlib(DC("\108\105\98\49"),p .. "\120\117\120\117")
assert(not f and type(err) == "\115\116\114\105\110\103" and when == "\105\110\105\116")
f,err,when=package.loadlib("\100\111\110\111\116\101\120\105\115\116",p .. "\120\117\120\117")
assert(not f and type(err) == "\115\116\114\105\110\103" and when == "\111\112\101\110")
f=assert(package.loadlib(DC("\108\105\98\49\49"),p .. "\108\117\97\111\112\101\110\95\108\105\98\49\49"))
assert(f() == "\101\120\112\111\114\116\101\100")
package.cpath=DC("\63")
local lib2,ext = require("\108\105\98\50\45\118\50")
assert(string.find(ext,"\108\105\98\115\47\108\105\98\50\45\118\50",1,true))
assert(_ENV.x == "\108\105\98\50\45\118\50" and _ENV.y == DC("\108\105\98\50\45\118\50"))
assert(lib2.id("\120") == true)
local fs,ext = require("\108\105\98\49\46\115\117\98")
assert(_ENV.x == "\108\105\98\49\46\115\117\98" and _ENV.y == DC("\108\105\98\49"))
assert(string.find(ext,"\108\105\98\115\47\108\105\98\49",1,true))
assert(fs.id(45) == 45)
_ENV.x,_ENV.y=nil
end
_ENV=_G
do
local p = package
package={}
p.preload.pl=function (...)
local _ENV = {...}
function xuxu(x)
return x + 20
end
return _ENV
end
local pl,ext = require("\112\108")
assert(require("\112\108") == pl)
assert(pl.xuxu(10) == 30)
assert(pl[1] == "\112\108" and pl[2] == "\58\112\114\101\108\111\97\100\58" and ext == "\58\112\114\101\108\111\97\100\58")
package=p
assert(type(package.path) == "\115\116\114\105\110\103")
end
print("\43")
end
print("\116\101\115\116\105\110\103\32\97\115\115\105\103\110\109\101\110\116\115\44\32\108\111\103\105\99\97\108\32\111\112\101\114\97\116\111\114\115\44\32\97\110\100\32\99\111\110\115\116\114\117\99\116\111\114\115")
local res,res2 = 27
local a,b = 1,2 + 3
assert(a == 1 and b == 5)
a={}
local function f
()
return 10,11,12
end
a.x,b,a[1]=1,2,f()
assert(a.x == 1 and b == 2 and a[1] == 10)
a[f()],b,a[f() + 3]=f(),a,"\120"
assert(a[10] == 10 and b == a and a[13] == "\120")
do
local f = function (n)
local x = {}
;
for i = 1, n
do
x[i]=i
end
;
return table.unpack(x)
end
;
local a,b,c
a,b=0,f(1)
assert(a == 0 and b == 1)
a,b=0,f(1)
assert(a == 0 and b == 1)
a,b,c=0,5,f(4)
assert(a == 0 and b == 5 and c == 1)
a,b,c=0,5,f(0)
assert(a == 0 and b == 5 and c == nil)
end
local a,b,c,d = 1 and nil,1 or nil,(1 and (nil or 1)),6
assert(not a and b and c and d == 6)
d=20
a,b,c,d=f()
assert(a == 10 and b == 11 and c == 12 and d == nil)
a,b=f(),1,2,3,f()
assert(a == 10 and b == 1)
assert(a < b == false and a > b == true)
assert((10 and 2) == 2)
assert((10 or 2) == 10)
assert((10 or assert(nil)) == 10)
assert(not (nil and assert(nil)))
assert((nil or "\97\108\111") == "\97\108\111")
assert((nil and 10) == nil)
assert((false and 10) == false)
assert((true or 10) == true)
assert((false or 10) == 10)
assert(false ~= nil)
assert(nil ~= false)
assert(not nil == true)
assert(not not nil == false)
assert(not not 1 == true)
assert(not not a == true)
assert(not not (6 or nil) == true)
assert(not not (nil and 56) == false)
assert(not not (nil and true) == false)
assert(not 10 == false)
assert(not {} == false)
assert(not 0.5 == false)
assert(not "\120" == false)
assert({} ~= {})
print("\43")
a={}
a[true]=20
a[false]=10
assert(a[1 < 2] == 20 and a[1 > 2] == 10)
function f(a)
return a
end
local a = {}
for i = 3000, - 3000, - 1
do
a[i + 0.0]=i
;
end
a[1e31.0]="\97\108\111"
;
a[true]=10
;
a[false]=20
assert(a[1e31.0] == "\97\108\111" and a[not 1] == 20 and a[10 < 20] == 10)
for i = 3000, - 3000, - 1
do
assert(a[i] == i)
;
end
a[print]=assert
a[f]=print
a[a]=a
assert(a[a][a][a][a][print] == assert)
a[print](a[a[f]] == a[print])
assert(not pcall(function ()
local a = {}
;
a[nil]=10
end))
assert(not pcall(function ()
local a = {[nil] = 10}
end))
assert(a[nil] == undef)
a=nil
local a,b,c
a={10,9,8,7,6,5,4,3,2,[- 3] = "\97",[f] = print,["\97"] = "\97",["\98"] = "\97\98"}
a,a.x,a.y=a,a[- 3]
assert(a[1] == 10 and a[- 3] == a.a and a[f] == print and a.x == "\97" and not a.y)
a[1],f(a)[2],b,c={["\97\108\111"] = assert},10,a[1],a[f],6,10,23,f(a),2
a[1].alo(a[2] == 10 and b == 10 and c == print)
a.aVeryLongName012345678901234567890123456789012345678901234567890123456789=10
local function foo
()
return a.aVeryLongName012345678901234567890123456789012345678901234567890123456789
end
assert(foo() == 10 and a.aVeryLongName012345678901234567890123456789012345678901234567890123456789 == 10)
do
local function foo
()
local _ENV <const> = 11
X="\104\105"
end
local st,msg = pcall(foo)
assert(not st and string.find(msg,"\110\117\109\98\101\114"))
end
local maxint = math.maxinteger
while maxint ~= (maxint + 0.0) or (maxint - 1) ~= (maxint - 1.0) do
maxint=maxint // 2
end
local maxintF = maxint + 0.0
assert(maxintF == maxint and math.type(maxintF) == "\102\108\111\97\116" and maxintF >= 2.0 ^ 14)
a[maxintF]=10
;
a[maxintF - 1.0]=11
;
a[- maxintF]=12
;
a[- maxintF + 1.0]=13
;
assert(a[maxint] == 10 and a[maxint - 1] == 11 and a[- maxint] == 12 and a[- maxint + 1] == 13)
a[maxint]=20
a[- maxint]=22
assert(a[maxintF] == 20 and a[maxintF - 1.0] == 11 and a[- maxintF] == 22 and a[- maxintF + 1.0] == 13)
a=nil
do
local a,i,j,b
a={"\97","\98"}
;
i=1
;
j=2
;
b=a
i,a[i],a,j,a[j],a[i + j]=j,i,i,b,j,i
assert(i == 2 and b[1] == 1 and a == 1 and j == b and b[2] == 2 and b[3] == 1)
a={}
local function foo
()
b,a.x,a=a,10,20
end
foo()
assert(a == 20 and b.x == 10)
end
do
local a,i,j,b
a={"\97","\98"}
;
i=1
;
j=2
;
b=a
local function foo
()
i,a[i],a,j,a[j],a[i + j]=j,i,i,b,j,i
end
foo()
assert(i == 2 and b[1] == 1 and a == 1 and j == b and b[2] == 2 and b[3] == 1)
local t = {}
(function (a)
t[a],a=10,20
end)(1)
;
assert(t[1] == 10)
end
local function foo
()
local a
return function ()
local b
a,b=3,14
return a,b
end
end
local a,b = foo()()
assert(a == 3 and b == 14)
print("\79\75")
return res