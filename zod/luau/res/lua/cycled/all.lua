local version = "\76\117\97\32\53\46\52"
if _VERSION ~= version then
io.stderr:write("\84\104\105\115\32\116\101\115\116\32\115\117\105\116\101\32\105\115\32\102\111\114\32",version,"\44\32\110\111\116\32\102\111\114\32",_VERSION,"\10\69\120\105\116\105\110\103\32\116\101\115\116\115")
return 
end
_G.ARG=arg
_soft=rawget(_G,"\95\115\111\102\116") or false
_port=rawget(_G,"\95\112\111\114\116") or false
_nomsg=rawget(_G,"\95\110\111\109\115\103") or false
local usertests = rawget(_G,"\95\85")
if usertests then
_soft=true
_port=true
_nomsg=true
end
debug=nil
if usertests then
T=nil
else
T=rawget(_G,"\84")
end
print("\10\9\83\116\97\114\116\105\110\103\32\84\101\115\116\115")
do
local random_x,random_y = math.randomseed()
print(string.format("\114\97\110\100\111\109\32\115\101\101\100\115\58\32\37\100\44\32\37\100",random_x,random_y))
end
print("\99\117\114\114\101\110\116\32\112\97\116\104\58\10\42\42\42\42" .. package.path .. "\42\42\42\42\10")
local initclock = os.clock()
local lastclock = initclock
local walltime = os.time()
local collectgarbage = collectgarbage
do
local msgs = {}
function Message(m)
if not _nomsg then
print(m)
msgs[# msgs + 1]=string.sub(m,3,- 3)
end
end
assert(os.setlocale("\67"))
local T,print,format,write,assert,type,unpack,floor = T,print,string.format,io.write,assert,type,table.unpack,math.floor
local function F
(m)
local function round
(m)
m=m + 0.04999
return format("\37\46\49\102",m)
end
if m < 1000 then
return m
else
m=m / 1000
if m < 1000 then
return round(m) .. "\75"
else
return round(m / 1000) .. "\77"
end
end
end
local Cstacklevel
local showmem
if not T then
local max = 0
showmem=function ()
local m = collectgarbage("\99\111\117\110\116") * 1024
max=(m > max) and m or max
print(format("\32\32\32\32\45\45\45\45\32\116\111\116\97\108\32\109\101\109\111\114\121\58\32\37\115\44\32\109\97\120\32\109\101\109\111\114\121\58\32\37\115\32\45\45\45\45\10",F(m),F(max)))
end
Cstacklevel=function ()
return 0
end
else
showmem=function ()
T.checkmemory()
local total,numblocks,maxmem = T.totalmem()
local count = collectgarbage("\99\111\117\110\116")
print(format("\10\32\32\32\32\45\45\45\45\32\116\111\116\97\108\32\109\101\109\111\114\121\58\32\37\115\32\40\37\46\48\102\75\41\44\32\109\97\120\32\117\115\101\58\32\37\115\44\32\32\98\108\111\99\107\115\58\32\37\100\10",F(total),count,F(maxmem),numblocks))
print(format("\9\40\115\116\114\105\110\103\115\58\32\32\37\100\44\32\116\97\98\108\101\115\58\32\37\100\44\32\102\117\110\99\116\105\111\110\115\58\32\37\100\44\32" .. "\10\9\117\100\97\116\97\58\32\37\100\44\32\116\104\114\101\97\100\115\58\32\37\100\41",T.totalmem("\115\116\114\105\110\103"),T.totalmem("\116\97\98\108\101"),T.totalmem("\102\117\110\99\116\105\111\110"),T.totalmem("\117\115\101\114\100\97\116\97"),T.totalmem("\116\104\114\101\97\100")))
end
Cstacklevel=function ()
local _,_,ncalls = T.stacklevel()
return ncalls
end
end
local Cstack = Cstacklevel()
local function report
(n)
print("\10\42\42\42\42\42\32\70\73\76\69\32\39" .. n .. "\39\42\42\42\42\42")
end
local olddofile = dofile
local dofile = function (n,strip)
showmem()
local c = os.clock()
print(string.format("\116\105\109\101\58\32\37\103\32\40\43\37\103\41",c - initclock,c - lastclock))
lastclock=c
report(n)
local f = assert(loadfile(n))
local b = string.dump(f,strip)
f=assert(load(b))
return f()
end
dofile("\109\97\105\110\46\108\117\97")
require("\116\114\97\99\101\103\99").start()
report("\103\99\46\108\117\97")
local f = assert(loadfile("\103\99\46\108\117\97"))
f()
dofile("\100\98\46\108\117\97")
assert(dofile("\99\97\108\108\115\46\108\117\97") == deep and deep)
_G.deep=nil
olddofile("\115\116\114\105\110\103\115\46\108\117\97")
olddofile("\108\105\116\101\114\97\108\115\46\108\117\97")
dofile("\116\112\97\99\107\46\108\117\97")
assert(dofile("\97\116\116\114\105\98\46\108\117\97") == 27)
dofile("\103\101\110\103\99\46\108\117\97")
assert(dofile("\108\111\99\97\108\115\46\108\117\97") == 5)
dofile("\99\111\110\115\116\114\117\99\116\115\46\108\117\97")
dofile("\99\111\100\101\46\108\117\97",true)
if not _G._soft then
report("\98\105\103\46\108\117\97")
local f = coroutine.wrap(assert(loadfile("\98\105\103\46\108\117\97")))
assert(f() == "\98")
assert(f() == "\97")
end
dofile("\99\115\116\97\99\107\46\108\117\97")
dofile("\110\101\120\116\118\97\114\46\108\117\97")
dofile("\112\109\46\108\117\97")
dofile("\117\116\102\56\46\108\117\97")
dofile("\97\112\105\46\108\117\97")
assert(dofile("\101\118\101\110\116\115\46\108\117\97") == 12)
dofile("\118\97\114\97\114\103\46\108\117\97")
dofile("\99\108\111\115\117\114\101\46\108\117\97")
dofile("\99\111\114\111\117\116\105\110\101\46\108\117\97")
dofile("\103\111\116\111\46\108\117\97",true)
dofile("\101\114\114\111\114\115\46\108\117\97")
dofile("\109\97\116\104\46\108\117\97")
dofile("\115\111\114\116\46\108\117\97",true)
dofile("\98\105\116\119\105\115\101\46\108\117\97")
assert(dofile("\118\101\114\121\98\105\103\46\108\117\97",true) == 10)
;
collectgarbage()
dofile("\102\105\108\101\115\46\108\117\97")
if # msgs > 0 then
local m = table.concat(msgs,"\10\32\32")
warn("\35\116\101\115\116\115\32\110\111\116\32\112\101\114\102\111\114\109\101\100\58\10\32\32",m,"\10")
end
print("\40\116\104\101\114\101\32\115\104\111\117\108\100\32\98\101\32\116\119\111\32\119\97\114\110\105\110\103\115\32\110\111\119\41")
warn("\64\111\110")
warn("\35\84\104\105\115\32\105\115\32","\97\110\32\101\120\112\101\99\116\101\100","\32\119\97\114\110\105\110\103")
warn("\64\111\102\102")
warn("\42\42\42\42\42\42\42\42\32\84\72\73\83\32\87\65\82\78\73\78\71\32\83\72\79\85\76\68\32\78\79\84\32\65\80\80\69\65\82\32\42\42\42\42\42\42\42\42\42\42")
warn("\42\42\42\42\42\42\42\42\32\84\72\73\83\32\87\65\82\78\73\78\71\32\65\76\83\79\32\83\72\79\85\76\68\32\78\79\84\32\65\80\80\69\65\82\32\42\42\42\42\42\42\42\42\42\42")
warn("\64\111\110")
warn("\35\84\104\105\115\32\105\115","\32\97\110\111\116\104\101\114\32\111\110\101")
assert(debug == nil)
local debug = require("\100\101\98\117\103")
print(string.format("\37\100\45\98\105\116\32\105\110\116\101\103\101\114\115\44\32\37\100\45\98\105\116\32\102\108\111\97\116\115",string.packsize("\106") * 8,string.packsize("\110") * 8))
debug.sethook(function (a)
assert(type(a) == "\115\116\114\105\110\103")
end,"\99\114")
_G.showmem=showmem
assert(Cstack == Cstacklevel(),"\115\104\111\117\108\100\32\98\101\32\97\116\32\116\104\101\32\115\97\109\101\32\67\45\115\116\97\99\107\32\108\101\118\101\108\32\105\116\32\119\97\115\32\119\104\101\110\32\115\116\97\114\116\101\100\32\116\104\101\32\116\101\115\116\115")
end
local _G,showmem,print,format,clock,time,difftime,assert,open,warn = _G,showmem,print,string.format,os.clock,os.time,os.difftime,assert,io.open,warn
local fname = T and "\116\105\109\101\45\100\101\98\117\103\46\116\120\116" or "\116\105\109\101\46\116\120\116"
local lasttime
if not usertests then
local f = io.open(fname)
if f then
lasttime=assert(tonumber(f:read("\97")))
f:close()
;
else
lasttime=nil
end
end
print("\99\108\101\97\110\105\110\103\32\97\108\108\33\33\33\33")
for n in pairs(_G)
do
if not ({["\95\95\95\71\108\111\98"] = 1,["\116\111\115\116\114\105\110\103"] = 1})[n] then
_G[n]=undef
end
end
collectgarbage()
collectgarbage()
collectgarbage()
collectgarbage()
collectgarbage()
collectgarbage()
;
showmem()
local clocktime = clock() - initclock
walltime=difftime(time(),walltime)
print(format("\10\10\116\111\116\97\108\32\116\105\109\101\58\32\37\46\50\102\115\32\40\119\97\108\108\32\116\105\109\101\58\32\37\103\115\41\10",clocktime,walltime))
if not usertests then
lasttime=lasttime or clocktime
local diff = (clocktime - lasttime) / lasttime
local tolerance = 0.05
if (diff >= tolerance or diff <= - tolerance) then
warn(format("\35\116\105\109\101\32\100\105\102\102\101\114\101\110\99\101\32\102\114\111\109\32\112\114\101\118\105\111\117\115\32\116\101\115\116\58\32\37\43\46\49\102\37\37",diff * 100))
end
assert(open(fname,"\119")):write(clocktime):close()
end
print("\102\105\110\97\108\32\79\75\32\33\33\33")