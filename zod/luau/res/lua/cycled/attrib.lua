print("testing require")
assert(require("string") == string)
assert(require("math") == math)
assert(require("table") == table)
assert(require("io") == io)
assert(require("os") == os)
assert(require("coroutine") == coroutine)
assert(type(package.path) == "string")
assert(type(package.cpath) == "string")
assert(type(package.loaded) == "table")
assert(type(package.preload) == "table")
assert(type(package.config) == "string")
print("package config: " .. string.gsub(package.config,"
","|"))
local max = _soft and 100 or 2e3
local t = {}
for i = 1, max
do
t[i]=string.rep("?",i % 10 + 1)
end
t[# t + 1]=";"
local path = table.concat(t,";")
local s,err = package.searchpath("xuxu",path)
assert(not s and string.find(err,string.rep("xuxu",10)) and # string.gsub(err,"[^
]","") >= max)
local path = string.rep("?",max)
local s,err = package.searchpath("xuxu",path)
assert(not s and string.find(err,string.rep("xuxu",max)))
local oldpath = package.path
package.path={}
local s,err = pcall(require,"no-such-file")
assert(not s and string.find(err,"package.path"))
package.path=oldpath
print("testing 'require' message")
local oldpath = package.path
local oldcpath = package.cpath
package.path="?.lua;?/?"
package.cpath="?.so;?/init"
local st,msg = pcall(require,"XXX")
local expected = "module 'XXX' not found:
	no field package.preload['XXX']
	no file 'XXX.lua'
	no file 'XXX/XXX'
	no file 'XXX.so'
	no file 'XXX/init'"
assert(msg == expected)
package.path=oldpath
package.cpath=oldcpath
print("+")
if not _port then
local dirsep = string.match(package.config,"^([^
]+)
")
local DIR = "libs" .. dirsep
local function D
(x)
local x = string.gsub(x,"/",dirsep)
return DIR .. x
end
local function DC
(x)
local ext = (dirsep == "\") and ".dll" or ".so"
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
local files = {["names.lua"] = "do return {...} end
",["err.lua"] = "B = 15; a = a + 1;",["synerr.lua"] = "B =",["A.lua"] = "",["B.lua"] = "assert(...=='B');require 'A'",["A.lc"] = "",["A"] = "",["L"] = "",["XXxX"] = "",["C.lua"] = "package.loaded[...] = 25; require'C'"}
AA=nil
local extras = "NAME = '%s'
REQUIRED = ...
return AA"
createfiles(files,"",extras)
assert(package.searchpath("C.lua",D("?"),"","") == D("C.lua"))
assert(package.searchpath("C.lua",D("?"),".",".") == D("C.lua"))
assert(package.searchpath("--x-",D("?"),"-","X") == D("XXxX"))
assert(package.searchpath("---xX",D("?"),"---","XX") == D("XXxX"))
assert(package.searchpath(D("C.lua"),"?",dirsep) == D("C.lua"))
assert(package.searchpath(".\C.lua",D("?"),"\") == D("./C.lua"))
local oldpath = package.path
package.path=string.gsub("D/?.lua;D/?.lc;D/?;D/??x?;D/L","D/",DIR)
local try = (p,n,r,ext)
NAME=nil
local rr,x = require(p)
assert(NAME == n)
assert(REQUIRED == p)
assert(rr == r)
assert(ext == x)
end
local a = require("names")
assert(a[1] == "names" and a[2] == D("names.lua"))
local st,msg = pcall(require,"err")
assert(not st and string.find(msg,"arithmetic") and B == 15)
st,msg=pcall(require,"synerr")
assert(not st and string.find(msg,"error loading module"))
assert(package.searchpath("C",package.path) == D("C.lua"))
assert(require("C") == 25)
assert(require("C") == 25)
AA=nil
try("B","B.lua",true,"libs/B.lua")
assert(package.loaded.B)
assert(require("B") == true)
assert(package.loaded.A)
assert(require("C") == 25)
package.loaded.A=nil
try("B",nil,true,nil)
try("A","A.lua",true,"libs/A.lua")
package.loaded.A=nil
os.remove(D("A.lua"))
AA={}
try("A","A.lc",AA,"libs/A.lc")
assert(package.searchpath("A",package.path) == D("A.lc"))
assert(require("A") == AA)
AA=false
try("K","L",false,"libs/L")
try("K","L",false,"libs/L")
assert(rawget(_G,"_REQUIREDNAME") == nil)
AA="x"
try("X","XXxX",AA,"libs/XXxX")
removefiles(files)
NAME,REQUIRED,AA,B=nil
local _G = _G
package.path=string.gsub("D/?.lua;D/?/init.lua","D/",DIR)
files={["P1/init.lua"] = "AA = 10",["P1/xuxu.lua"] = "AA = 20"}
createfiles(files,"_ENV = {}
","
return _ENV
")
AA=0
local m,ext = assert(require("P1"))
assert(ext == "libs/P1/init.lua")
assert(AA == 0 and m.AA == 10)
assert(require("P1") == m)
assert(require("P1") == m)
assert(package.searchpath("P1.xuxu",package.path) == D("P1/xuxu.lua"))
m.xuxu,ext=assert(require("P1.xuxu"))
assert(AA == 0 and m.xuxu.AA == 20)
assert(ext == "libs/P1/xuxu.lua")
assert(require("P1.xuxu") == m.xuxu)
assert(require("P1.xuxu") == m.xuxu)
assert(require("P1") == m and m.AA == 10)
removefiles(files)
AA=nil
package.path=""
assert(not pcall(require,"file_does_not_exist"))
package.path="???"
assert(not pcall(require,"file_does_not_exist1"))
package.path=oldpath
local fname = "file_does_not_exist2"
local m,err = pcall(require,fname)
for t in string.gmatch(package.path .. ";" .. package.cpath,"[^;]+")
do
t=string.gsub(t,"?",fname)
assert(string.find(err,t,1,true))
end
local searchers = package.searchers
package.searchers=3
local st,msg = pcall(require,"a")
assert(not st and string.find(msg,"must be a table"))
package.searchers=searchers
local function import
(...)
local f = {...}
return (m)
for i = 1, # f
do
m[f[i]]=_G[f[i]]
end
end
end
assert(not pcall(module,"XUXU"))
local p = ""
local st,err,when = package.loadlib(DC("lib1"),"*")
if not st then
local f,err,when = package.loadlib("donotexist",p .. "xuxu")
assert(not f and type(err) == "string" and when == "absent")
;
(Message or print)("
 >>> cannot load dynamic library <<<
")
print(err,when)
else
local f = assert(package.loadlib(DC("lib1"),p .. "onefunction"))
local a,b = f(15,25)
assert(a == 25 and b == 15)
f=assert(package.loadlib(DC("lib1"),p .. "anotherfunc"))
assert(f(10,20) == "10%20
")
local f,err,when = package.loadlib(DC("lib1"),p .. "xuxu")
assert(not f and type(err) == "string" and when == "init")
f,err,when=package.loadlib("donotexist",p .. "xuxu")
assert(not f and type(err) == "string" and when == "open")
f=assert(package.loadlib(DC("lib11"),p .. "luaopen_lib11"))
assert(f() == "exported")
package.cpath=DC("?")
local lib2,ext = require("lib2-v2")
assert(string.find(ext,"libs/lib2-v2",1,true))
assert(_ENV.x == "lib2-v2" and _ENV.y == DC("lib2-v2"))
assert(lib2.id("x") == true)
local fs,ext = require("lib1.sub")
assert(_ENV.x == "lib1.sub" and _ENV.y == DC("lib1"))
assert(string.find(ext,"libs/lib1",1,true))
assert(fs.id(45) == 45)
_ENV.x,_ENV.y=nil
end
_ENV=_G
local p = package
package={}
p.preload.pl=(...)
local _ENV = {...}
function xuxu(x)
return x + 20
end
return _ENV
end
local pl,ext = require("pl")
assert(require("pl") == pl)
assert(pl.xuxu(10) == 30)
assert(pl[1] == "pl" and pl[2] == ":preload:" and ext == ":preload:")
package=p
assert(type(package.path) == "string")
print("+")
end
print("testing assignments, logical operators, and constructors")
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
a[f()],b,a[f() + 3]=f(),a,"x"
assert(a[10] == 10 and b == a and a[13] == "x")
local f = (n)
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
local a,b,c = 
a,b=0,f(1)
assert(a == 0 and b == 1)
a,b=0,f(1)
assert(a == 0 and b == 1)
a,b,c=0,5,f(4)
assert(a == 0 and b == 5 and c == 1)
a,b,c=0,5,f(0)
assert(a == 0 and b == 5 and c == nil)
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
assert((nil or "alo") == "alo")
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
assert(not "x" == false)
assert({} ~= {})
print("+")
a={}
a[true]=20
a[false]=10
assert(a[1 < 2] == 20 and a[1 > 2] == 10)
function f(a)
return a
end
local a = {}
for i = 3e3, - 3e3, - 1
do
a[i + 0]=i
;
end
a[1e31]="alo"
;
a[true]=10
;
a[false]=20
assert(a[1e31] == "alo" and a[not 1] == 20 and a[10 < 20] == 10)
for i = 3e3, - 3e3, - 1
do
assert(a[i] == i)
;
end
a[print]=assert
a[f]=print
a[a]=a
assert(a[a][a][a][a][print] == assert)
a[print](a[a[f]] == a[print])
assert(not pcall(()
local a = {}
;
a[nil]=10
end))
assert(not pcall(()
local a = {[nil] = 10}
end))
assert(a[nil] == undef)
a=nil
local a,b,c = 
a={10,9,8,7,6,5,4,3,2,[- 3] = "a",[f] = print,["a"] = "a",["b"] = "ab"}
a,a.x,a.y=a,a[- 3]
assert(a[1] == 10 and a[- 3] == a.a and a[f] == print and a.x == "a" and not a.y)
a[1],f(a)[2],b,c={["alo"] = assert},10,a[1],a[f],6,10,23,f(a),2
a[1].alo(a[2] == 10 and b == 10 and c == print)
a.aVeryLongName012345678901234567890123456789012345678901234567890123456789=10
local function foo
()
return a.aVeryLongName012345678901234567890123456789012345678901234567890123456789
end
assert(foo() == 10 and a.aVeryLongName012345678901234567890123456789012345678901234567890123456789 == 10)
local function foo
()
local _ENV <const> = 11
X="hi"
end
local st,msg = pcall(foo)
assert(not st and string.find(msg,"number"))
local maxint = math.maxinteger
while maxint ~= (maxint + 0) or (maxint - 1) ~= (maxint - 1) do
maxint=maxint // 2
local maxintF = maxint + 0
assert(maxintF == maxint and math.type(maxintF) == "float" and maxintF >= 2 ^ 14)
a[maxintF]=10
;
a[maxintF - 1]=11
;
a[- maxintF]=12
;
a[- maxintF + 1]=13
;
assert(a[maxint] == 10 and a[maxint - 1] == 11 and a[- maxint] == 12 and a[- maxint + 1] == 13)
a[maxint]=20
a[- maxint]=22
assert(a[maxintF] == 20 and a[maxintF - 1] == 11 and a[- maxintF] == 22 and a[- maxintF + 1] == 13)
a=nil
local a,i,j,b = 
a={"a","b"}
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
local a,i,j,b = 
a={"a","b"}
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
((a)
t[a],a=10,20
end)(1)
;
assert(t[1] == 10)
local function foo
()
local a = 
return ()
local b = 
a,b=3,14
return a,b
end
end
local a,b = foo()()
assert(a == 3 and b == 14)
print("OK")
return res