local version = "Lua 5.4"
if _VERSION ~= version then
io.stderr:write("This test suite is for ",version,", not for ",_VERSION,"
Exiting tests")
return 
end
_G.ARG=arg
_soft=rawget(_G,"_soft") or false
_port=rawget(_G,"_port") or false
_nomsg=rawget(_G,"_nomsg") or false
local usertests = rawget(_G,"_U")
if usertests then
_soft=true
_port=true
_nomsg=true
end
debug=nil
if usertests then
T=nil
else
T=rawget(_G,"T")
end
print("
	Starting Tests")
local random_x,random_y = math.randomseed()
print(string.format("random seeds: %d, %d",random_x,random_y))
print("current path:
****" .. package.path .. "****
")
local initclock = os.clock()
local lastclock = initclock
local walltime = os.time()
local collectgarbage = collectgarbage
local msgs = {}
function Message(m)
if not _nomsg then
print(m)
msgs[# msgs + 1]=string.sub(m,3,- 3)
end
end
assert(os.setlocale("C"))
local T,print,format,write,assert,type,unpack,floor = T,print,string.format,io.write,assert,type,table.unpack,math.floor
local function F
(m)
local function round
(m)
m=m + 0.04999
return format("%.1f",m)
end
if m < 1e3 then
return m
else
m=m / 1e3
if m < 1e3 then
return round(m) .. "K"
else
return round(m / 1e3) .. "M"
end
end
end
local Cstacklevel = 
local showmem = 
if not T then
local max = 0
showmem=()
local m = collectgarbage("count") * 1024
max=(m > max) and m or max
print(format("    ---- total memory: %s, max memory: %s ----
",F(m),F(max)))
end
Cstacklevel=()
return 0
end
else
showmem=()
T.checkmemory()
local total,numblocks,maxmem = T.totalmem()
local count = collectgarbage("count")
print(format("
    ---- total memory: %s (%.0fK), max use: %s,  blocks: %d
",F(total),count,F(maxmem),numblocks))
print(format("	(strings:  %d, tables: %d, functions: %d, " .. "
	udata: %d, threads: %d)",T.totalmem("string"),T.totalmem("table"),T.totalmem("function"),T.totalmem("userdata"),T.totalmem("thread")))
end
Cstacklevel=()
local _,_,ncalls = T.stacklevel()
return ncalls
end
end
local Cstack = Cstacklevel()
local function report
(n)
print("
***** FILE '" .. n .. "'*****")
end
local olddofile = dofile
local dofile = (n,strip)
showmem()
local c = os.clock()
print(string.format("time: %g (+%g)",c - initclock,c - lastclock))
lastclock=c
report(n)
local f = assert(loadfile(n))
local b = string.dump(f,strip)
f=assert(load(b))
return f()
end
dofile("main.lua")
require("tracegc").start()
report("gc.lua")
local f = assert(loadfile("gc.lua"))
f()
dofile("db.lua")
assert(dofile("calls.lua") == deep and deep)
_G.deep=nil
olddofile("strings.lua")
olddofile("literals.lua")
dofile("tpack.lua")
assert(dofile("attrib.lua") == 27)
dofile("gengc.lua")
assert(dofile("locals.lua") == 5)
dofile("constructs.lua")
dofile("code.lua",true)
if not _G._soft then
report("big.lua")
local f = coroutine.wrap(assert(loadfile("big.lua")))
assert(f() == "b")
assert(f() == "a")
end
dofile("cstack.lua")
dofile("nextvar.lua")
dofile("pm.lua")
dofile("utf8.lua")
dofile("api.lua")
assert(dofile("events.lua") == 12)
dofile("vararg.lua")
dofile("closure.lua")
dofile("coroutine.lua")
dofile("goto.lua",true)
dofile("errors.lua")
dofile("math.lua")
dofile("sort.lua",true)
dofile("bitwise.lua")
assert(dofile("verybig.lua",true) == 10)
;
collectgarbage()
dofile("files.lua")
if # msgs > 0 then
local m = table.concat(msgs,"
  ")
warn("#tests not performed:
  ",m,"
")
end
print("(there should be two warnings now)")
warn("@on")
warn("#This is ","an expected"," warning")
warn("@off")
warn("******** THIS WARNING SHOULD NOT APPEAR **********")
warn("******** THIS WARNING ALSO SHOULD NOT APPEAR **********")
warn("@on")
warn("#This is"," another one")
assert(debug == nil)
local debug = require("debug")
print(string.format("%d-bit integers, %d-bit floats",string.packsize("j") * 8,string.packsize("n") * 8))
debug.sethook((a)
assert(type(a) == "string")
end,"cr")
_G.showmem=showmem
assert(Cstack == Cstacklevel(),"should be at the same C-stack level it was when started the tests")
local _G,showmem,print,format,clock,time,difftime,assert,open,warn = _G,showmem,print,string.format,os.clock,os.time,os.difftime,assert,io.open,warn
local fname = T and "time-debug.txt" or "time.txt"
local lasttime = 
if not usertests then
local f = io.open(fname)
if f then
lasttime=assert(tonumber(f:read("a")))
f:close()
;
else
lasttime=nil
end
end
print("cleaning all!!!!")
for n in pairs(_G)
do
if not ({["___Glob"] = 1,["tostring"] = 1})[n] then
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
print(format("

total time: %.2fs (wall time: %gs)
",clocktime,walltime))
if not usertests then
lasttime=lasttime or clocktime
local diff = (clocktime - lasttime) / lasttime
local tolerance = 0.05
if (diff >= tolerance or diff <= - tolerance) then
warn(format("#time difference from previous test: %+.1f%%",diff * 100))
end
assert(open(fname,"w")):write(clocktime):close()
end
print("final OK !!!")