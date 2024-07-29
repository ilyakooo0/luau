print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{72}\u{65}\u{71}\u{75}\u{69}\u{72}\u{65}")
assert((require("\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}") == string))
assert((require("\u{6d}\u{61}\u{74}\u{68}") == math))
assert((require("\u{74}\u{61}\u{62}\u{6c}\u{65}") == table))
assert((require("\u{69}\u{6f}") == io))
assert((require("\u{6f}\u{73}") == os))
assert((require("\u{63}\u{6f}\u{72}\u{6f}\u{75}\u{74}\u{69}\u{6e}\u{65}") == coroutine))
assert((type(package.path) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"))
assert((type(package.cpath) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"))
assert((type(package.loaded) == "\u{74}\u{61}\u{62}\u{6c}\u{65}"))
assert((type(package.preload) == "\u{74}\u{61}\u{62}\u{6c}\u{65}"))
assert((type(package.config) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"))
print(("\u{70}\u{61}\u{63}\u{6b}\u{61}\u{67}\u{65}\u{20}\u{63}\u{6f}\u{6e}\u{66}\u{69}\u{67}\u{3a}\u{20}" .. string.gsub(package.config,"\u{a}","\u{7c}")))
do
local max = ((_soft and 0x64) or 0x7d0)
local t = {}
for i = 0x1, max
do
t[i]=string.rep("\u{3f}",((i % 0xa) + 0x1))
end
t[# (t + 0x1)]="\u{3b}"
local path = table.concat(t,"\u{3b}")
local s,err = package.searchpath("\u{78}\u{75}\u{78}\u{75}",path)
assert(not ((s and string.find(err,string.rep("\u{78}\u{75}\u{78}\u{75}",0xa))) and # (string.gsub(err,"\u{5b}\u{5e}\u{a}\u{5d}","") >= max)))
local path = string.rep("\u{3f}",max)
local s,err = package.searchpath("\u{78}\u{75}\u{78}\u{75}",path)
assert(not (s and string.find(err,string.rep("\u{78}\u{75}\u{78}\u{75}",max))))
end
do
local oldpath = package.path
package.path={}
local s,err = pcall(require,"\u{6e}\u{6f}\u{2d}\u{73}\u{75}\u{63}\u{68}\u{2d}\u{66}\u{69}\u{6c}\u{65}")
assert(not (s and string.find(err,"\u{70}\u{61}\u{63}\u{6b}\u{61}\u{67}\u{65}\u{2e}\u{70}\u{61}\u{74}\u{68}")))
package.path=oldpath
end
do
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{27}\u{72}\u{65}\u{71}\u{75}\u{69}\u{72}\u{65}\u{27}\u{20}\u{6d}\u{65}\u{73}\u{73}\u{61}\u{67}\u{65}")
local oldpath = package.path
local oldcpath = package.cpath
package.path="\u{3f}\u{2e}\u{6c}\u{75}\u{61}\u{3b}\u{3f}\u{2f}\u{3f}"
package.cpath="\u{3f}\u{2e}\u{73}\u{6f}\u{3b}\u{3f}\u{2f}\u{69}\u{6e}\u{69}\u{74}"
local st,msg = pcall(require,"\u{58}\u{58}\u{58}")
local expected = "\u{6d}\u{6f}\u{64}\u{75}\u{6c}\u{65}\u{20}\u{27}\u{58}\u{58}\u{58}\u{27}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{66}\u{6f}\u{75}\u{6e}\u{64}\u{3a}\u{a}\u{9}\u{6e}\u{6f}\u{20}\u{66}\u{69}\u{65}\u{6c}\u{64}\u{20}\u{70}\u{61}\u{63}\u{6b}\u{61}\u{67}\u{65}\u{2e}\u{70}\u{72}\u{65}\u{6c}\u{6f}\u{61}\u{64}\u{5b}\u{27}\u{58}\u{58}\u{58}\u{27}\u{5d}\u{a}\u{9}\u{6e}\u{6f}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{20}\u{27}\u{58}\u{58}\u{58}\u{2e}\u{6c}\u{75}\u{61}\u{27}\u{a}\u{9}\u{6e}\u{6f}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{20}\u{27}\u{58}\u{58}\u{58}\u{2f}\u{58}\u{58}\u{58}\u{27}\u{a}\u{9}\u{6e}\u{6f}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{20}\u{27}\u{58}\u{58}\u{58}\u{2e}\u{73}\u{6f}\u{27}\u{a}\u{9}\u{6e}\u{6f}\u{20}\u{66}\u{69}\u{6c}\u{65}\u{20}\u{27}\u{58}\u{58}\u{58}\u{2f}\u{69}\u{6e}\u{69}\u{74}\u{27}"
assert((msg == expected))
package.path=oldpath
package.cpath=oldcpath
end
print("\u{2b}")
if not _port then
local dirsep = string.match(package.config,"\u{5e}\u{28}\u{5b}\u{5e}\u{a}\u{5d}\u{2b}\u{29}\u{a}")
local DIR = ("\u{6c}\u{69}\u{62}\u{73}" .. dirsep)
local function D
(x)
local x = string.gsub(x,"\u{2f}",dirsep)
return (DIR .. x)
end
local function DC
(x)
local ext = ((((dirsep == "\u{5c}")) and "\u{2e}\u{64}\u{6c}\u{6c}") or "\u{2e}\u{73}\u{6f}")
return D((x .. ext))
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
local files = {["\u{6e}\u{61}\u{6d}\u{65}\u{73}\u{2e}\u{6c}\u{75}\u{61}"] = "\u{64}\u{6f}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{7b}\u{2e}\u{2e}\u{2e}\u{7d}\u{20}\u{65}\u{6e}\u{64}\u{a}",["\u{65}\u{72}\u{72}\u{2e}\u{6c}\u{75}\u{61}"] = "\u{42}\u{20}\u{3d}\u{20}\u{31}\u{35}\u{3b}\u{20}\u{61}\u{20}\u{3d}\u{20}\u{61}\u{20}\u{2b}\u{20}\u{31}\u{3b}",["\u{73}\u{79}\u{6e}\u{65}\u{72}\u{72}\u{2e}\u{6c}\u{75}\u{61}"] = "\u{42}\u{20}\u{3d}",["\u{41}\u{2e}\u{6c}\u{75}\u{61}"] = "",["\u{42}\u{2e}\u{6c}\u{75}\u{61}"] = "\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{2e}\u{2e}\u{2e}\u{3d}\u{3d}\u{27}\u{42}\u{27}\u{29}\u{3b}\u{72}\u{65}\u{71}\u{75}\u{69}\u{72}\u{65}\u{20}\u{27}\u{41}\u{27}",["\u{41}\u{2e}\u{6c}\u{63}"] = "",["\u{41}"] = "",["\u{4c}"] = "",["\u{58}\u{58}\u{78}\u{58}"] = "",["\u{43}\u{2e}\u{6c}\u{75}\u{61}"] = "\u{70}\u{61}\u{63}\u{6b}\u{61}\u{67}\u{65}\u{2e}\u{6c}\u{6f}\u{61}\u{64}\u{65}\u{64}\u{5b}\u{2e}\u{2e}\u{2e}\u{5d}\u{20}\u{3d}\u{20}\u{32}\u{35}\u{3b}\u{20}\u{72}\u{65}\u{71}\u{75}\u{69}\u{72}\u{65}\u{27}\u{43}\u{27}"}
AA=nil
local extras = "\u{4e}\u{41}\u{4d}\u{45}\u{20}\u{3d}\u{20}\u{27}\u{25}\u{73}\u{27}\u{a}\u{52}\u{45}\u{51}\u{55}\u{49}\u{52}\u{45}\u{44}\u{20}\u{3d}\u{20}\u{2e}\u{2e}\u{2e}\u{a}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{41}\u{41}"
createfiles(files,"",extras)
assert((package.searchpath("\u{43}\u{2e}\u{6c}\u{75}\u{61}",D("\u{3f}"),"","") == D("\u{43}\u{2e}\u{6c}\u{75}\u{61}")))
assert((package.searchpath("\u{43}\u{2e}\u{6c}\u{75}\u{61}",D("\u{3f}"),"\u{2e}","\u{2e}") == D("\u{43}\u{2e}\u{6c}\u{75}\u{61}")))
assert((package.searchpath("\u{2d}\u{2d}\u{78}\u{2d}",D("\u{3f}"),"\u{2d}","\u{58}") == D("\u{58}\u{58}\u{78}\u{58}")))
assert((package.searchpath("\u{2d}\u{2d}\u{2d}\u{78}\u{58}",D("\u{3f}"),"\u{2d}\u{2d}\u{2d}","\u{58}\u{58}") == D("\u{58}\u{58}\u{78}\u{58}")))
assert((package.searchpath(D("\u{43}\u{2e}\u{6c}\u{75}\u{61}"),"\u{3f}",dirsep) == D("\u{43}\u{2e}\u{6c}\u{75}\u{61}")))
assert((package.searchpath("\u{2e}\u{5c}\u{43}\u{2e}\u{6c}\u{75}\u{61}",D("\u{3f}"),"\u{5c}") == D("\u{2e}\u{2f}\u{43}\u{2e}\u{6c}\u{75}\u{61}")))
local oldpath = package.path
package.path=string.gsub("\u{44}\u{2f}\u{3f}\u{2e}\u{6c}\u{75}\u{61}\u{3b}\u{44}\u{2f}\u{3f}\u{2e}\u{6c}\u{63}\u{3b}\u{44}\u{2f}\u{3f}\u{3b}\u{44}\u{2f}\u{3f}\u{3f}\u{78}\u{3f}\u{3b}\u{44}\u{2f}\u{4c}","\u{44}\u{2f}",DIR)
local try = function (p,n,r,ext)
NAME=nil
local rr,x = require(p)
assert((NAME == n))
assert((REQUIRED == p))
assert((rr == r))
assert((ext == x))
end
local a = require("\u{6e}\u{61}\u{6d}\u{65}\u{73}")
assert(((a[0x1] == "\u{6e}\u{61}\u{6d}\u{65}\u{73}") and (a[0x2] == D("\u{6e}\u{61}\u{6d}\u{65}\u{73}\u{2e}\u{6c}\u{75}\u{61}"))))
local st,msg = pcall(require,"\u{65}\u{72}\u{72}")
assert(not ((st and string.find(msg,"\u{61}\u{72}\u{69}\u{74}\u{68}\u{6d}\u{65}\u{74}\u{69}\u{63}")) and (B == 0xf)))
st,msg=pcall(require,"\u{73}\u{79}\u{6e}\u{65}\u{72}\u{72}")
assert(not (st and string.find(msg,"\u{65}\u{72}\u{72}\u{6f}\u{72}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{69}\u{6e}\u{67}\u{20}\u{6d}\u{6f}\u{64}\u{75}\u{6c}\u{65}")))
assert((package.searchpath("\u{43}",package.path) == D("\u{43}\u{2e}\u{6c}\u{75}\u{61}")))
assert((require("\u{43}") == 0x19))
assert((require("\u{43}") == 0x19))
AA=nil
try("\u{42}","\u{42}\u{2e}\u{6c}\u{75}\u{61}",true,"\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{42}\u{2e}\u{6c}\u{75}\u{61}")
assert(package.loaded.B)
assert((require("\u{42}") == true))
assert(package.loaded.A)
assert((require("\u{43}") == 0x19))
package.loaded.A=nil
try("\u{42}",nil,true,nil)
try("\u{41}","\u{41}\u{2e}\u{6c}\u{75}\u{61}",true,"\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{41}\u{2e}\u{6c}\u{75}\u{61}")
package.loaded.A=nil
os.remove(D("\u{41}\u{2e}\u{6c}\u{75}\u{61}"))
AA={}
try("\u{41}","\u{41}\u{2e}\u{6c}\u{63}",AA,"\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{41}\u{2e}\u{6c}\u{63}")
assert((package.searchpath("\u{41}",package.path) == D("\u{41}\u{2e}\u{6c}\u{63}")))
assert((require("\u{41}") == AA))
AA=false
try("\u{4b}","\u{4c}",false,"\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{4c}")
try("\u{4b}","\u{4c}",false,"\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{4c}")
assert((rawget(_G,"\u{5f}\u{52}\u{45}\u{51}\u{55}\u{49}\u{52}\u{45}\u{44}\u{4e}\u{41}\u{4d}\u{45}") == nil))
AA="\u{78}"
try("\u{58}","\u{58}\u{58}\u{78}\u{58}",AA,"\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{58}\u{58}\u{78}\u{58}")
removefiles(files)
NAME,REQUIRED,AA,B=nil
local _G = _G
package.path=string.gsub("\u{44}\u{2f}\u{3f}\u{2e}\u{6c}\u{75}\u{61}\u{3b}\u{44}\u{2f}\u{3f}\u{2f}\u{69}\u{6e}\u{69}\u{74}\u{2e}\u{6c}\u{75}\u{61}","\u{44}\u{2f}",DIR)
files={["\u{50}\u{31}\u{2f}\u{69}\u{6e}\u{69}\u{74}\u{2e}\u{6c}\u{75}\u{61}"] = "\u{41}\u{41}\u{20}\u{3d}\u{20}\u{31}\u{30}",["\u{50}\u{31}\u{2f}\u{78}\u{75}\u{78}\u{75}\u{2e}\u{6c}\u{75}\u{61}"] = "\u{41}\u{41}\u{20}\u{3d}\u{20}\u{32}\u{30}"}
createfiles(files,"\u{5f}\u{45}\u{4e}\u{56}\u{20}\u{3d}\u{20}\u{7b}\u{7d}\u{a}","\u{a}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{5f}\u{45}\u{4e}\u{56}\u{a}")
AA=0x0
local m,ext = assert(require("\u{50}\u{31}"))
assert((ext == "\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{50}\u{31}\u{2f}\u{69}\u{6e}\u{69}\u{74}\u{2e}\u{6c}\u{75}\u{61}"))
assert(((AA == 0x0) and (m.AA == 0xa)))
assert((require("\u{50}\u{31}") == m))
assert((require("\u{50}\u{31}") == m))
assert((package.searchpath("\u{50}\u{31}\u{2e}\u{78}\u{75}\u{78}\u{75}",package.path) == D("\u{50}\u{31}\u{2f}\u{78}\u{75}\u{78}\u{75}\u{2e}\u{6c}\u{75}\u{61}")))
m.xuxu,ext=assert(require("\u{50}\u{31}\u{2e}\u{78}\u{75}\u{78}\u{75}"))
assert(((AA == 0x0) and (m.xuxu.AA == 0x14)))
assert((ext == "\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{50}\u{31}\u{2f}\u{78}\u{75}\u{78}\u{75}\u{2e}\u{6c}\u{75}\u{61}"))
assert((require("\u{50}\u{31}\u{2e}\u{78}\u{75}\u{78}\u{75}") == m.xuxu))
assert((require("\u{50}\u{31}\u{2e}\u{78}\u{75}\u{78}\u{75}") == m.xuxu))
assert(((require("\u{50}\u{31}") == m) and (m.AA == 0xa)))
removefiles(files)
AA=nil
package.path=""
assert(not pcall(require,"\u{66}\u{69}\u{6c}\u{65}\u{5f}\u{64}\u{6f}\u{65}\u{73}\u{5f}\u{6e}\u{6f}\u{74}\u{5f}\u{65}\u{78}\u{69}\u{73}\u{74}"))
package.path="\u{3f}\u{3f}\u{0}\u{3f}"
assert(not pcall(require,"\u{66}\u{69}\u{6c}\u{65}\u{5f}\u{64}\u{6f}\u{65}\u{73}\u{5f}\u{6e}\u{6f}\u{74}\u{5f}\u{65}\u{78}\u{69}\u{73}\u{74}\u{31}"))
package.path=oldpath
local fname = "\u{66}\u{69}\u{6c}\u{65}\u{5f}\u{64}\u{6f}\u{65}\u{73}\u{5f}\u{6e}\u{6f}\u{74}\u{5f}\u{65}\u{78}\u{69}\u{73}\u{74}\u{32}"
local m,err = pcall(require,fname)
for t in string.gmatch((package.path .. ("\u{3b}" .. package.cpath)),"\u{5b}\u{5e}\u{3b}\u{5d}\u{2b}")
do
t=string.gsub(t,"\u{3f}",fname)
assert(string.find(err,t,0x1,true))
end
do
local searchers = package.searchers
package.searchers=0x3
local st,msg = pcall(require,"\u{61}")
assert(not (st and string.find(msg,"\u{6d}\u{75}\u{73}\u{74}\u{20}\u{62}\u{65}\u{20}\u{61}\u{20}\u{74}\u{61}\u{62}\u{6c}\u{65}")))
package.searchers=searchers
end
local function import
(...)
local f = {...}
return function (m)
for i = 0x1, # f
do
m[f[i]]=_G[f[i]]
end
end
end
assert(not pcall(module,"\u{58}\u{55}\u{58}\u{55}"))
local p = ""
local st,err,when = package.loadlib(DC("\u{6c}\u{69}\u{62}\u{31}"),"\u{2a}")
if not st then
local f,err,when = package.loadlib("\u{64}\u{6f}\u{6e}\u{6f}\u{74}\u{65}\u{78}\u{69}\u{73}\u{74}",(p .. "\u{78}\u{75}\u{78}\u{75}"))
assert(not ((f and (type(err) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (when == "\u{61}\u{62}\u{73}\u{65}\u{6e}\u{74}")))
;
((Message or print))("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{63}\u{61}\u{6e}\u{6e}\u{6f}\u{74}\u{20}\u{6c}\u{6f}\u{61}\u{64}\u{20}\u{64}\u{79}\u{6e}\u{61}\u{6d}\u{69}\u{63}\u{20}\u{6c}\u{69}\u{62}\u{72}\u{61}\u{72}\u{79}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
print(err,when)
else
local f = assert(package.loadlib(DC("\u{6c}\u{69}\u{62}\u{31}"),(p .. "\u{6f}\u{6e}\u{65}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}")))
local a,b = f(0xf,0x19)
assert(((a == 0x19) and (b == 0xf)))
f=assert(package.loadlib(DC("\u{6c}\u{69}\u{62}\u{31}"),(p .. "\u{61}\u{6e}\u{6f}\u{74}\u{68}\u{65}\u{72}\u{66}\u{75}\u{6e}\u{63}")))
assert((f(0xa,0x14) == "\u{31}\u{30}\u{25}\u{32}\u{30}\u{a}"))
local f,err,when = package.loadlib(DC("\u{6c}\u{69}\u{62}\u{31}"),(p .. "\u{78}\u{75}\u{78}\u{75}"))
assert(not ((f and (type(err) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (when == "\u{69}\u{6e}\u{69}\u{74}")))
f,err,when=package.loadlib("\u{64}\u{6f}\u{6e}\u{6f}\u{74}\u{65}\u{78}\u{69}\u{73}\u{74}",(p .. "\u{78}\u{75}\u{78}\u{75}"))
assert(not ((f and (type(err) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}")) and (when == "\u{6f}\u{70}\u{65}\u{6e}")))
f=assert(package.loadlib(DC("\u{6c}\u{69}\u{62}\u{31}\u{31}"),(p .. "\u{6c}\u{75}\u{61}\u{6f}\u{70}\u{65}\u{6e}\u{5f}\u{6c}\u{69}\u{62}\u{31}\u{31}")))
assert((f() == "\u{65}\u{78}\u{70}\u{6f}\u{72}\u{74}\u{65}\u{64}"))
package.cpath=DC("\u{3f}")
local lib2,ext = require("\u{6c}\u{69}\u{62}\u{32}\u{2d}\u{76}\u{32}")
assert(string.find(ext,"\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{6c}\u{69}\u{62}\u{32}\u{2d}\u{76}\u{32}",0x1,true))
assert(((_ENV.x == "\u{6c}\u{69}\u{62}\u{32}\u{2d}\u{76}\u{32}") and (_ENV.y == DC("\u{6c}\u{69}\u{62}\u{32}\u{2d}\u{76}\u{32}"))))
assert((lib2.id("\u{78}") == true))
local fs,ext = require("\u{6c}\u{69}\u{62}\u{31}\u{2e}\u{73}\u{75}\u{62}")
assert(((_ENV.x == "\u{6c}\u{69}\u{62}\u{31}\u{2e}\u{73}\u{75}\u{62}") and (_ENV.y == DC("\u{6c}\u{69}\u{62}\u{31}"))))
assert(string.find(ext,"\u{6c}\u{69}\u{62}\u{73}\u{2f}\u{6c}\u{69}\u{62}\u{31}",0x1,true))
assert((fs.id(0x2d) == 0x2d))
_ENV.x,_ENV.y=nil
end
_ENV=_G
do
local p = package
package={}
p.preload.pl=function (...)
local _ENV = {...}
function xuxu(x)
return (x + 0x14)
end
return _ENV
end
local pl,ext = require("\u{70}\u{6c}")
assert((require("\u{70}\u{6c}") == pl))
assert((pl.xuxu(0xa) == 0x1e))
assert((((pl[0x1] == "\u{70}\u{6c}") and (pl[0x2] == "\u{3a}\u{70}\u{72}\u{65}\u{6c}\u{6f}\u{61}\u{64}\u{3a}")) and (ext == "\u{3a}\u{70}\u{72}\u{65}\u{6c}\u{6f}\u{61}\u{64}\u{3a}")))
package=p
assert((type(package.path) == "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}"))
end
print("\u{2b}")
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{61}\u{73}\u{73}\u{69}\u{67}\u{6e}\u{6d}\u{65}\u{6e}\u{74}\u{73}\u{2c}\u{20}\u{6c}\u{6f}\u{67}\u{69}\u{63}\u{61}\u{6c}\u{20}\u{6f}\u{70}\u{65}\u{72}\u{61}\u{74}\u{6f}\u{72}\u{73}\u{2c}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{72}\u{75}\u{63}\u{74}\u{6f}\u{72}\u{73}")
local res,res2 = 0x1b
local a,b = 0x1,(0x2 + 0x3)
assert(((a == 0x1) and (b == 0x5)))
a={}
local function f
()
return 0xa,0xb,0xc
end
a.x,b,a[0x1]=0x1,0x2,f()
assert((((a.x == 0x1) and (b == 0x2)) and (a[0x1] == 0xa)))
a[f()],b,a[(f() + 0x3)]=f(),a,"\u{78}"
assert((((a[0xa] == 0xa) and (b == a)) and (a[0xd] == "\u{78}")))
do
local f = function (n)
local x = {}
;
for i = 0x1, n
do
x[i]=i
end
;
return table.unpack(x)
end
;
local a,b,c
a,b=0x0,f(0x1)
assert(((a == 0x0) and (b == 0x1)))
a,b=0x0,f(0x1)
assert(((a == 0x0) and (b == 0x1)))
a,b,c=0x0,0x5,f(0x4)
assert((((a == 0x0) and (b == 0x5)) and (c == 0x1)))
a,b,c=0x0,0x5,f(0x0)
assert((((a == 0x0) and (b == 0x5)) and (c == nil)))
end
local a,b,c,d = (0x1 and nil),(0x1 or nil),((0x1 and ((nil or 0x1)))),0x6
assert(not (((a and b) and c) and (d == 0x6)))
d=0x14
a,b,c,d=f()
assert(((((a == 0xa) and (b == 0xb)) and (c == 0xc)) and (d == nil)))
a,b=f(),0x1,0x2,0x3,f()
assert(((a == 0xa) and (b == 0x1)))
assert((((a < b) == false) and ((a > b) == true)))
assert((((0xa and 0x2)) == 0x2))
assert((((0xa or 0x2)) == 0xa))
assert((((0xa or assert(nil))) == 0xa))
assert(not ((nil and assert(nil))))
assert((((nil or "\u{61}\u{6c}\u{6f}")) == "\u{61}\u{6c}\u{6f}"))
assert((((nil and 0xa)) == nil))
assert((((false and 0xa)) == false))
assert((((true or 0xa)) == true))
assert((((false or 0xa)) == 0xa))
assert((false ~= nil))
assert((nil ~= false))
assert(not (nil == true))
assert(not not (nil == false))
assert(not not (0x1 == true))
assert(not not (a == true))
assert(not not (((0x6 or nil)) == true))
assert(not not (((nil and 0x38)) == false))
assert(not not (((nil and true)) == false))
assert(not (0xa == false))
assert(not ({} == false))
assert(not (0.5 == false))
assert(not ("\u{78}" == false))
assert(({} ~= {}))
print("\u{2b}")
a={}
a[true]=0x14
a[false]=0xa
assert(((a[(0x1 < 0x2)] == 0x14) and (a[(0x1 > 0x2)] == 0xa)))
function f(a)
return a
end
local a = {}
for i = 0xbb8, - 0xbb8, - 0x1
do
a[(i + 0.0)]=i
;
end
a[1e31]="\u{61}\u{6c}\u{6f}"
;
a[true]=0xa
;
a[false]=0x14
assert((((a[1e31] == "\u{61}\u{6c}\u{6f}") and (a[not 0x1] == 0x14)) and (a[(0xa < 0x14)] == 0xa)))
for i = 0xbb8, - 0xbb8, - 0x1
do
assert((a[i] == i))
;
end
a[print]=assert
a[f]=print
a[a]=a
assert((a[a][a][a][a][print] == assert))
a[print]((a[a[f]] == a[print]))
assert(not pcall(function ()
local a = {}
;
a[nil]=0xa
end))
assert(not pcall(function ()
local a = {[nil] = 0xa}
end))
assert((a[nil] == undef))
a=nil
local a,b,c
a={0xa,0x9,0x8,0x7,0x6,0x5,0x4,0x3,0x2,[- 0x3] = "\u{61}",[f] = print,["\u{61}"] = "\u{61}",["\u{62}"] = "\u{61}\u{62}"}
a,a.x,a.y=a,a[- 0x3]
assert((((((a[0x1] == 0xa) and (a[- 0x3] == a.a)) and (a[f] == print)) and (a.x == "\u{61}")) and not a.y))
a[0x1],f(a)[0x2],b,c={["\u{61}\u{6c}\u{6f}"] = assert},0xa,a[0x1],a[f],0x6,0xa,0x17,f(a),0x2
a[0x1].alo((((a[0x2] == 0xa) and (b == 0xa)) and (c == print)))
a.aVeryLongName012345678901234567890123456789012345678901234567890123456789=0xa
local function foo
()
return a.aVeryLongName012345678901234567890123456789012345678901234567890123456789
end
assert(((foo() == 0xa) and (a.aVeryLongName012345678901234567890123456789012345678901234567890123456789 == 0xa)))
do
local function foo
()
local _ENV <const> = 0xb
X="\u{68}\u{69}"
end
local st,msg = pcall(foo)
assert(not (st and string.find(msg,"\u{6e}\u{75}\u{6d}\u{62}\u{65}\u{72}")))
end
local maxint = math.maxinteger
while ((maxint ~= ((maxint + 0.0))) or (((maxint - 0x1)) ~= ((maxint - 1.0)))) do
maxint=(maxint // 0x2)
end
local maxintF = (maxint + 0.0)
assert((((maxintF == maxint) and (math.type(maxintF) == "\u{66}\u{6c}\u{6f}\u{61}\u{74}")) and (maxintF >= (2.0 ^ 0xe))))
a[maxintF]=0xa
;
a[(maxintF - 1.0)]=0xb
;
a[- maxintF]=0xc
;
a[- (maxintF + 1.0)]=0xd
;
assert(((((a[maxint] == 0xa) and (a[(maxint - 0x1)] == 0xb)) and (a[- maxint] == 0xc)) and (a[- (maxint + 0x1)] == 0xd)))
a[maxint]=0x14
a[- maxint]=0x16
assert(((((a[maxintF] == 0x14) and (a[(maxintF - 1.0)] == 0xb)) and (a[- maxintF] == 0x16)) and (a[- (maxintF + 1.0)] == 0xd)))
a=nil
do
local a,i,j,b
a={"\u{61}","\u{62}"}
;
i=0x1
;
j=0x2
;
b=a
i,a[i],a,j,a[j],a[(i + j)]=j,i,i,b,j,i
assert(((((((i == 0x2) and (b[0x1] == 0x1)) and (a == 0x1)) and (j == b)) and (b[0x2] == 0x2)) and (b[0x3] == 0x1)))
a={}
local function foo
()
b,a.x,a=a,0xa,0x14
end
foo()
assert(((a == 0x14) and (b.x == 0xa)))
end
do
local a,i,j,b
a={"\u{61}","\u{62}"}
;
i=0x1
;
j=0x2
;
b=a
local function foo
()
i,a[i],a,j,a[j],a[(i + j)]=j,i,i,b,j,i
end
foo()
assert(((((((i == 0x2) and (b[0x1] == 0x1)) and (a == 0x1)) and (j == b)) and (b[0x2] == 0x2)) and (b[0x3] == 0x1)))
local t = {}
(function (a)
t[a],a=0xa,0x14
end)(0x1)
;
assert((t[0x1] == 0xa))
end
local function foo
()
local a
return function ()
local b
a,b=0x3,0xe
return a,b
end
end
local a,b = foo()()
assert(((a == 0x3) and (b == 0xe)))
print("\u{4f}\u{4b}")
return res