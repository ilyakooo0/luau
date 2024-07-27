local debug = require("\100\101\98\117\103")
local maxint = math.maxinteger
assert(type(os.getenv("\80\65\84\72")) == "\115\116\114\105\110\103")
assert(io.input(io.stdin) == io.stdin)
assert(not pcall(io.input,"\110\111\110\45\101\120\105\115\116\101\110\116\45\102\105\108\101"))
assert(io.output(io.stdout) == io.stdout)
local function testerr
(msg,f, ...)
local stat,err = pcall(f,...)
return (not stat and string.find(err,msg,1,true))
end
local function checkerr
(msg,f, ...)
assert(testerr(msg,f,...))
end
assert(not io.close(io.stdin) and not io.stdout:close() and not io.stderr:close())
checkerr("\103\111\116\32\110\111\32\118\97\108\117\101",io.stdin.close)
assert(type(io.input()) == "\117\115\101\114\100\97\116\97" and io.type(io.output()) == "\102\105\108\101")
assert(type(io.stdin) == "\117\115\101\114\100\97\116\97" and io.type(io.stderr) == "\102\105\108\101")
assert(not io.type(8))
local a = {}
;
setmetatable(a,{})
assert(not io.type(a))
assert(getmetatable(io.input()).__name == "\70\73\76\69\42")
local a,b,c = io.open("\120\117\120\117\95\110\97\111\95\101\120\105\115\116\101")
assert(not a and type(b) == "\115\116\114\105\110\103" and type(c) == "\110\117\109\98\101\114")
a,b,c=io.open("\47\97\47\98\47\99\47\100","\119")
assert(not a and type(b) == "\115\116\114\105\110\103" and type(c) == "\110\117\109\98\101\114")
local file = os.tmpname()
local f,msg = io.open(file,"\119")
if not f then
(Message or print)("\39\111\115\46\116\109\112\110\97\109\101\39\32\102\105\108\101\32\99\97\110\110\111\116\32\98\101\32\111\112\101\110\59\32\115\107\105\112\112\105\110\103\32\102\105\108\101\32\116\101\115\116\115")
else
f:close()
print("\116\101\115\116\105\110\103\32\105\47\111")
local otherfile = os.tmpname()
checkerr("\105\110\118\97\108\105\100\32\109\111\100\101",io.open,file,"\114\119")
checkerr("\105\110\118\97\108\105\100\32\109\111\100\101",io.open,file,"\114\98\43")
checkerr("\105\110\118\97\108\105\100\32\109\111\100\101",io.open,file,"\114\43\98\107")
checkerr("\105\110\118\97\108\105\100\32\109\111\100\101",io.open,file,"")
checkerr("\105\110\118\97\108\105\100\32\109\111\100\101",io.open,file,"\43")
checkerr("\105\110\118\97\108\105\100\32\109\111\100\101",io.open,file,"\98")
assert(io.open(file,"\114\43\98")):close()
assert(io.open(file,"\114\43")):close()
assert(io.open(file,"\114\98")):close()
assert(os.setlocale("\67","\97\108\108"))
io.input(io.stdin)
;
io.output(io.stdout)
;
os.remove(file)
assert(not loadfile(file))
checkerr("",dofile,file)
assert(not io.open(file))
io.output(file)
assert(io.output() ~= io.stdout)
if not _port then
local status,msg,code = io.stdin:seek("\115\101\116",1000)
assert(not status and type(msg) == "\115\116\114\105\110\103" and type(code) == "\110\117\109\98\101\114")
end
assert(io.output():seek() == 0)
assert(io.write("\97\108\111\32\97\108\111"):seek() == string.len("\97\108\111\32\97\108\111"))
assert(io.output():seek("\99\117\114",- 3) == string.len("\97\108\111\32\97\108\111") - 3)
assert(io.write("\106\111\97\111"))
assert(io.output():seek("\101\110\100") == string.len("\97\108\111\32\106\111\97\111"))
assert(io.output():seek("\115\101\116") == 0)
assert(io.write("\34\97\108\111\34","\123\97\125\10","\115\101\99\111\110\100\32\108\105\110\101\10","\116\104\105\114\100\32\108\105\110\101\32\10"))
assert(io.write("\88\102\111\117\114\116\104\95\108\105\110\101"))
io.output(io.stdout)
collectgarbage()
assert(io.input() == io.stdin and rawequal(io.output(),io.stdout))
print("\43")
collectgarbage()
for i = 1, 120
do
for i = 1, 5
do
io.input(file)
assert(io.open(file,"\114"))
io.lines(file)
end
collectgarbage()
end
io.input():close()
io.close()
assert(os.rename(file,otherfile))
assert(not os.rename(file,otherfile))
io.output(io.open(otherfile,"\97\98"))
assert(io.write("\10\10\9\9\32\32",3450,"\10"))
;
io.close()
do
local F = nil
do
local f <close> = assert(io.open(file,"\119"))
F=f
end
assert(tostring(F) == "\102\105\108\101\32\40\99\108\111\115\101\100\41")
end
assert(os.remove(file))
do
local f <close> = assert(io.open(file,"\119"))
f:write(maxint,"\10")
f:write(string.format("\48\88\37\120\10",maxint))
f:write("\48\120\65\66\67\112\45\51","\10")
f:write(0,"\10")
f:write(- maxint,"\10")
f:write(string.format("\48\120\37\88\10",- maxint))
f:write("\45\48\120\65\66\67\112\45\51","\10")
assert(f:close())
local f <close> = assert(io.open(file,"\114"))
assert(f:read("\110") == maxint)
assert(f:read("\110") == maxint)
assert(f:read("\110") == 343.5)
assert(f:read("\110") == 0)
assert(f:read("\42\110") == - maxint)
assert(f:read("\110") == - maxint)
assert(f:read("\42\110") == - 343.5)
end
assert(os.remove(file))
do
local f <close> = assert(io.open(file,"\119"))
f:write("\97\32\108\105\110\101\10\97\110\111\116\104\101\114\32\108\105\110\101\10\49\50\51\52\10\51\46\52\53\10\111\110\101\10\116\119\111\10\116\104\114\101\101\10")
local l1,l2,l3,l4,n1,n2,c,dummy
assert(f:close())
local f <close> = assert(io.open(file,"\114"))
l1,l2,n1,n2,dummy=f:read("\108","\76","\110","\110")
assert(l1 == "\97\32\108\105\110\101" and l2 == "\97\110\111\116\104\101\114\32\108\105\110\101\10" and n1 == 1234 and n2 == 3.45 and dummy == nil)
assert(f:close())
local f <close> = assert(io.open(file,"\114"))
l1,l2,n1,n2,c,l3,l4,dummy=f:read(7,"\108","\110","\110",1,"\108","\108")
assert(l1 == "\97\32\108\105\110\101\10" and l2 == "\97\110\111\116\104\101\114\32\108\105\110\101" and c == "\10" and n1 == 1234 and n2 == 3.45 and l3 == "\111\110\101" and l4 == "\116\119\111" and dummy == nil)
assert(f:close())
local f <close> = assert(io.open(file,"\114"))
l1,n1,n2,dummy=f:read("\108","\110","\110","\108")
assert(l1 == "\97\32\108\105\110\101" and not n1)
end
assert(os.remove(file))
f=assert(io.open(file,"\119"))
f:write("\108\111\99\97\108\32\120\44\32\122\32\61\32\99\111\114\111\117\116\105\110\101\46\121\105\101\108\100\40\49\48\41\10\108\111\99\97\108\32\121\32\61\32\99\111\114\111\117\116\105\110\101\46\121\105\101\108\100\40\50\48\41\10\114\101\116\117\114\110\32\120\32\43\32\121\32\42\32\122\10")
assert(f:close())
f=coroutine.wrap(dofile)
assert(f(file) == 10)
assert(f(100,101) == 20)
assert(f(200) == 100 + 200 * 101)
assert(os.remove(file))
f=assert(io.open(file,"\119"))
f:write("\45\49\50\46\51\45\9\45\48\120\102\102\102\102\43\32\32\46\51\124\53\46\69\45\51\88\32\32\43\50\51\52\101\43\49\51\69\32\48\120\68\69\65\68\66\69\69\70\68\69\65\68\66\69\69\70\120\10\48\120\49\46\49\51\65\112\43\51\101\10")
f:write("\49\50\51\52")
;
for i = 1, 1000
do
f:write("\48")
end
;
f:write("\10")
f:write("\46\101\43\9\48\46\101\59\9\45\45\59\32\32\48\120\88\59\10")
assert(f:close())
f=assert(io.open(file,"\114"))
assert(f:read("\110") == - 12.3)
;
assert(f:read(1) == "\45")
assert(f:read("\110") == - 65535)
;
assert(f:read(2) == "\43\32")
assert(f:read("\110") == 0.3)
;
assert(f:read(1) == "\124")
assert(f:read("\110") == 5e-3)
;
assert(f:read(1) == "\88")
assert(f:read("\110") == 2.34e15)
;
assert(f:read(1) == "\69")
assert(f:read("\110") == 16045690984833335023)
;
assert(f:read(2) == "\120\10")
assert(f:read("\110") == 8.61328125)
;
assert(f:read(1) == "\101")
do
assert(not f:read("\110"))
local s = f:read("\76")
assert(string.find(s,"\94\48\48\42\10\36"))
end
assert(not f:read("\110"))
;
assert(f:read(2) == "\101\43")
assert(not f:read("\110"))
;
assert(f:read(1) == "\59")
assert(not f:read("\110"))
;
assert(f:read(2) == "\45\59")
assert(not f:read("\110"))
;
assert(f:read(1) == "\88")
assert(not f:read("\110"))
;
assert(f:read(1) == "\59")
assert(not f:read("\110"))
;
assert(not f:read(0))
assert(f:close())
assert(os.remove(file))
assert(not pcall(io.lines,"\110\111\110\45\101\120\105\115\116\101\110\116\45\102\105\108\101"))
assert(os.rename(otherfile,file))
io.output(otherfile)
local n = 0
local f = io.lines(file)
while f() do
n=n + 1
end
;
assert(n == 6)
checkerr("\102\105\108\101\32\105\115\32\97\108\114\101\97\100\121\32\99\108\111\115\101\100",f)
checkerr("\102\105\108\101\32\105\115\32\97\108\114\101\97\100\121\32\99\108\111\115\101\100",f)
n=0
for l in io.lines(file)
do
io.write(l,"\10")
;
n=n + 1
end
io.close()
assert(n == 6)
local f = assert(io.open(otherfile))
assert(io.type(f) == "\102\105\108\101")
io.output(file)
assert(not io.output():read())
n=0
for l in f:lines()
do
io.write(l,"\10")
;
n=n + 1
end
assert(tostring(f):sub(1,5) == "\102\105\108\101\32")
assert(f:close())
;
io.close()
assert(n == 6)
checkerr("\99\108\111\115\101\100\32\102\105\108\101",io.close,f)
assert(tostring(f) == "\102\105\108\101\32\40\99\108\111\115\101\100\41")
assert(io.type(f) == "\99\108\111\115\101\100\32\102\105\108\101")
io.input(file)
f=io.open(otherfile):lines()
n=0
for l in io.lines()
do
assert(l == f())
;
n=n + 1
end
f=nil
;
collectgarbage()
assert(n == 6)
assert(os.remove(otherfile))
do
io.output(otherfile)
io.write(string.rep("\97",300),"\10")
io.close()
local t = {}
;
for i = 1, 250
do
t[i]=1
end
t={io.lines(otherfile,table.unpack(t))()}
assert(# t == 250 and t[1] == "\97" and t[# t] == "\97")
t[# t + 1]=1
checkerr("\116\111\111\32\109\97\110\121\32\97\114\103\117\109\101\110\116\115",io.lines,otherfile,table.unpack(t))
collectgarbage()
assert(os.remove(otherfile))
end
io.input(file)
do
local a,b,c = io.input():write("\120\117\120\117")
assert(not a and type(b) == "\115\116\114\105\110\103" and type(c) == "\110\117\109\98\101\114")
end
checkerr("\105\110\118\97\108\105\100\32\102\111\114\109\97\116",io.read,"\120")
assert(io.read(0) == "")
assert(io.read(5,"\108") == "\34\97\108\111\34")
assert(io.read(0) == "")
assert(io.read() == "\115\101\99\111\110\100\32\108\105\110\101")
local x = io.input():seek()
assert(io.read() == "\116\104\105\114\100\32\108\105\110\101\32")
assert(io.input():seek("\115\101\116",x))
assert(io.read("\76") == "\116\104\105\114\100\32\108\105\110\101\32\10")
assert(io.read(1) == "\88")
assert(io.read(string.len("\102\111\117\114\116\104\95\108\105\110\101")) == "\102\111\117\114\116\104\95\108\105\110\101")
assert(io.input():seek("\99\117\114",- string.len("\102\111\117\114\116\104\95\108\105\110\101")))
assert(io.read() == "\102\111\117\114\116\104\95\108\105\110\101")
assert(io.read() == "")
assert(io.read("\110") == 3450)
assert(io.read(1) == "\10")
assert(not io.read(0))
assert(not io.read(1))
assert(not io.read(30000))
assert(({io.read(1)})[2] == undef)
assert(not io.read())
assert(({io.read()})[2] == undef)
assert(not io.read("\110"))
assert(({io.read("\110")})[2] == undef)
assert(io.read("\97") == "")
assert(io.read("\97") == "")
collectgarbage()
print("\43")
io.close(io.input())
checkerr("\32\105\110\112\117\116\32\102\105\108\101\32\105\115\32\99\108\111\115\101\100",io.read)
assert(os.remove(file))
local t = "\48\49\50\51\52\53\54\55\56\57"
for i = 1, 10
do
t=t .. t
;
end
assert(string.len(t) == 10 * 2 ^ 10)
io.output(file)
io.write("\97\108\111"):write("\10")
io.close()
checkerr("\32\111\117\116\112\117\116\32\102\105\108\101\32\105\115\32\99\108\111\115\101\100",io.write)
local f = io.open(file,"\97\43\98")
io.output(f)
collectgarbage()
assert(io.write("\32" .. t .. "\32"))
assert(io.write("\59","\101\110\100\32\111\102\32\102\105\108\101\10"))
f:flush()
;
io.flush()
f:close()
print("\43")
io.input(file)
assert(io.read() == "\97\108\111")
assert(io.read(1) == "\32")
assert(io.read(string.len(t)) == t)
assert(io.read(1) == "\32")
assert(io.read(0))
assert(io.read("\97") == "\59\101\110\100\32\111\102\32\102\105\108\101\10")
assert(not io.read(0))
assert(io.close(io.input()))
do
local function ismsg
(m)
return (type(m) == "\115\116\114\105\110\103" and not tonumber(m))
end
local f = io.open(file,"\119")
local r,m,c = f:read()
assert(not r and ismsg(m) and type(c) == "\110\117\109\98\101\114")
assert(f:close())
f=io.open(file,"\114")
r,m,c=f:write("\119\104\97\116\101\118\101\114")
assert(not r and ismsg(m) and type(c) == "\110\117\109\98\101\114")
assert(f:close())
f=io.open(file,"\119")
r,m=pcall(f:lines())
assert(r == false and ismsg(m))
assert(f:close())
end
assert(os.remove(file))
io.output(file)
;
io.write("\10\10\108\105\110\101\10\111\116\104\101\114"):close()
io.input(file)
assert(io.read("\76") == "\10")
assert(io.read("\76") == "\10")
assert(io.read("\76") == "\108\105\110\101\10")
assert(io.read("\76") == "\111\116\104\101\114")
assert(not io.read("\76"))
io.input():close()
local f = assert(io.open(file))
local s = ""
for l in f:lines("\76")
do
s=s .. l
end
assert(s == "\10\10\108\105\110\101\10\111\116\104\101\114")
f:close()
io.input(file)
s=""
for l in io.lines(nil,"\76")
do
s=s .. l
end
assert(s == "\10\10\108\105\110\101\10\111\116\104\101\114")
io.input():close()
s=""
for l in io.lines(file,"\76")
do
s=s .. l
end
assert(s == "\10\10\108\105\110\101\10\111\116\104\101\114")
s=""
for l in io.lines(file,"\108")
do
s=s .. l
end
assert(s == "\108\105\110\101\111\116\104\101\114")
io.output(file)
;
io.write("\97\32\61\32\49\48\32\43\32\51\52\10\97\32\61\32\50\42\97\10\97\32\61\32\45\97\10"):close()
local t = {}
assert(load(io.lines(file,"\76"),nil,nil,t))()
assert(t.a == - ((10 + 34) * 2))
do
local function gettoclose
(lv)
lv=lv + 1
local stvar = 0
for i = 1, 1000
do
local n,v = debug.getlocal(lv,i)
if n == "\40\102\111\114\32\115\116\97\116\101\41" then
stvar=stvar + 1
if stvar == 4 then
return v
end
end
end
end
local f
for l in io.lines(file)
do
f=gettoclose(1)
assert(io.type(f) == "\102\105\108\101")
break
end
assert(io.type(f) == "\99\108\111\115\101\100\32\102\105\108\101")
f=nil
local function foo
(name)
for l in io.lines(name)
do
f=gettoclose(1)
assert(io.type(f) == "\102\105\108\101")
error(f)
end
end
local st,msg = pcall(foo,file)
assert(st == false and io.type(msg) == "\99\108\111\115\101\100\32\102\105\108\101")
end
io.output(file)
;
io.write("\48\49\50\51\52\53\54\55\56\57\10"):close()
for a,b in io.lines(file,1,1)
do
if a == "\10" then
assert(not b)
else
assert(tonumber(a) == tonumber(b) - 1)
end
end
for a,b,c in io.lines(file,1,2,"\97")
do
assert(a == "\48" and b == "\49\50" and c == "\51\52\53\54\55\56\57\10")
end
for a,b,c in io.lines(file,"\97",0,1)
do
if a == "" then
break
end
assert(a == "\48\49\50\51\52\53\54\55\56\57\10" and not b and not c)
end
collectgarbage()
io.output(file)
;
io.write("\48\48\10\49\48\10\50\48\10\51\48\10\52\48\10"):close()
for a,b in io.lines(file,"\110","\110")
do
if a == 40 then
assert(not b)
else
assert(a == b - 10)
end
end
io.output(file)
;
io.write("\108\111\99\97\108\32\121\10\61\32\88\10\88\32\61\10\88\32\42\10\50\32\43\10\88\59\10\88\32\61\10\88\10\45\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\121\59\10"):close()
_G.X=1
assert(not load((io.lines(file))))
collectgarbage()
load((io.lines(file,"\76")))()
assert(_G.X == 2)
load((io.lines(file,1)))()
assert(_G.X == 4)
load((io.lines(file,3)))()
assert(_G.X == 8)
_G.X=nil
print("\43")
local x1 = "\115\116\114\105\110\103\10\10\92\99\111\109\32\34\34\39\39\99\111\105\115\97\115\32\91\91\101\115\116\114\97\110\104\97\115\93\93\32\93\93\39"
io.output(file)
assert(io.write(string.format("\88\50\32\61\32\37\113\10\45\45\32\99\111\109\109\101\110\116\32\119\105\116\104\111\117\116\32\101\110\100\105\110\103\32\69\79\83",x1)))
io.close()
assert(loadfile(file))()
assert(x1 == _G.X2)
_G.X2=nil
print("\43")
assert(os.remove(file))
assert(not os.remove(file))
assert(not os.remove(otherfile))
local function testloadfile
(s,expres)
io.output(file)
if s then
io.write(s)
end
io.close()
local res = assert(loadfile(file))()
assert(os.remove(file))
assert(res == expres)
end
testloadfile(nil,nil)
testloadfile("\35\32\97\32\110\111\110\45\101\110\100\105\110\103\32\99\111\109\109\101\110\116",nil)
testloadfile("\239\187\191\35\32\115\111\109\101\32\99\111\109\109\101\110\116\10\114\101\116\117\114\110\32\50\51\52",234)
testloadfile("\239\187\191\114\101\116\117\114\110\32\50\51\57",239)
testloadfile("\239\187\191",nil)
testloadfile("\35\32\97\32\99\111\109\109\101\110\116\10\114\101\116\117\114\110\32\114\101\113\117\105\114\101\39\100\101\98\117\103\39\46\103\101\116\105\110\102\111\40\49\41\46\99\117\114\114\101\110\116\108\105\110\101",2)
io.output(io.open(file,"\119\98"))
assert(io.write(string.dump(function ()
return 10,"\97\108\111\255","\104\105"
end)))
io.close()
a,b,c=assert(loadfile(file))()
assert(a == 10 and b == "\97\108\111\255" and c == "\104\105")
assert(os.remove(file))
do
io.output(io.open(file,"\119\98"))
assert(io.write(string.dump(function ()
return 1
end)))
io.close()
f=assert(loadfile(file,"\98",{}))
assert(type(f) == "\102\117\110\99\116\105\111\110" and f() == 1)
assert(os.remove(file))
end
io.output(io.open(file,"\119\98"))
assert(io.write("\35\116\104\105\115\32\105\115\32\97\32\99\111\109\109\101\110\116\32\102\111\114\32\97\32\98\105\110\97\114\121\32\102\105\108\101\10",string.dump(function ()
return 20,""
end)))
io.close()
a,b,c=assert(loadfile(file))()
assert(a == 20 and b == "" and c == nil)
assert(os.remove(file))
do
local f = io.open(file,"\119")
f:write("\32\32\32\32\105\102\32\40\46\46\46\41\32\116\104\101\110\32\97\32\61\32\49\53\59\32\114\101\116\117\114\110\32\98\44\32\99\44\32\100\10\32\32\32\32\101\108\115\101\32\114\101\116\117\114\110\32\95\69\78\86\10\32\32\32\32\101\110\100\10\32\32")
f:close()
local t = {["\98"] = 12,["\99"] = "\120\117\120\117",["\100"] = print}
local f = assert(loadfile(file,"\116",t))
local b,c,d = f(1)
assert(t.a == 15 and b == 12 and c == t.c and d == print)
assert(f() == t)
f=assert(loadfile(file,"\116",nil))
assert(f() == nil)
f=assert(loadfile(file))
assert(f() == _G)
assert(os.remove(file))
end
do
io.open(file,"\119"):write("\114\101\116\117\114\110\32\49\48"):close()
local s,m = loadfile(file,"\98")
assert(not s and string.find(m,"\97\32\116\101\120\116\32\99\104\117\110\107"))
io.open(file,"\119"):write("\27\32\114\101\116\117\114\110\32\49\48"):close()
local s,m = loadfile(file,"\116")
assert(not s and string.find(m,"\97\32\98\105\110\97\114\121\32\99\104\117\110\107"))
assert(os.remove(file))
end
io.output(file)
assert(io.write("\113\117\97\108\113\117\101\114\32\99\111\105\115\97\10"))
assert(io.write("\109\97\105\115\32\113\117\97\108\113\117\101\114\32\99\111\105\115\97"))
io.close()
assert(io.output(assert(io.open(otherfile,"\119\98"))):write("\111\117\116\114\97\32\99\111\105\115\97\1\3\255"):close())
local filehandle = assert(io.open(file,"\114\43"))
local otherfilehandle = assert(io.open(otherfile,"\114\98"))
assert(filehandle ~= otherfilehandle)
assert(type(filehandle) == "\117\115\101\114\100\97\116\97")
assert(filehandle:read("\108") == "\113\117\97\108\113\117\101\114\32\99\111\105\115\97")
io.input(otherfilehandle)
assert(io.read(string.len("\111\117\116\114\97\32\99\111\105\115\97")) == "\111\117\116\114\97\32\99\111\105\115\97")
assert(filehandle:read("\108") == "\109\97\105\115\32\113\117\97\108\113\117\101\114\32\99\111\105\115\97")
filehandle:close()
;
assert(type(filehandle) == "\117\115\101\114\100\97\116\97")
io.input(otherfilehandle)
assert(io.read(4) == "\1\3")
assert(io.read(3) == "")
assert(io.read(0) == "")
assert(io.read(1) == "\255")
assert(io.read("\97") == "")
assert(not io.read(0))
assert(otherfilehandle == io.input())
otherfilehandle:close()
assert(os.remove(file))
assert(os.remove(otherfile))
collectgarbage()
io.output(file):write("\32\49\50\51\46\52\9\45\53\54\101\45\50\32\32\110\111\116\32\97\32\110\117\109\98\101\114\10\115\101\99\111\110\100\32\108\105\110\101\10\116\104\105\114\100\32\108\105\110\101\10\10\97\110\100\32\116\104\101\32\114\101\115\116\32\111\102\32\116\104\101\32\102\105\108\101\10"):close()
io.input(file)
local _,a,b,c,d,e,h,__ = io.read(1,"\110","\110","\108","\108","\108","\97",10)
assert(io.close(io.input()))
assert(_ == "\32" and not __)
assert(type(a) == "\110\117\109\98\101\114" and a == 123.4 and b == - 0.56)
assert(d == "\115\101\99\111\110\100\32\108\105\110\101" and e == "\116\104\105\114\100\32\108\105\110\101")
assert(h == "\10\97\110\100\32\116\104\101\32\114\101\115\116\32\111\102\32\116\104\101\32\102\105\108\101\10")
assert(os.remove(file))
collectgarbage()
do
local f = assert(io.open(file,"\119"))
local fr = assert(io.open(file,"\114"))
assert(f:setvbuf("\102\117\108\108",2000))
f:write("\120")
assert(fr:read("\97\108\108") == "")
f:close()
fr:seek("\115\101\116")
assert(fr:read("\97\108\108") == "\120")
f=assert(io.open(file),"\119")
assert(f:setvbuf("\110\111"))
f:write("\120")
fr:seek("\115\101\116")
assert(fr:read("\97\108\108") == "\120")
f:close()
f=assert(io.open(file,"\97"))
assert(f:setvbuf("\108\105\110\101"))
f:write("\120")
fr:seek("\115\101\116",1)
assert(fr:read("\97\108\108") == "")
f:write("\97\10"):seek("\115\101\116",1)
assert(fr:read("\97\108\108") == "\120\97\10")
f:close()
;
fr:close()
assert(os.remove(file))
end
if not _soft then
print("\116\101\115\116\105\110\103\32\108\97\114\103\101\32\102\105\108\101\115\32\40\62\32\66\85\70\83\73\90\41")
io.output(file)
for i = 1, 5001
do
io.write("\48\49\50\51\52\53\54\55\56\57\49\50\51")
end
io.write("\10\49\50\51\52\54"):close()
io.input(file)
local x = io.read("\97")
io.input():seek("\115\101\116",0)
local y = io.read(30001) .. io.read(1005) .. io.read(0) .. io.read(1) .. io.read(100003)
assert(x == y and string.len(x) == 5001 * 13 + 6)
io.input():seek("\115\101\116",0)
y=io.read()
assert(x == y .. "\10" .. io.read())
assert(not io.read())
io.close(io.input())
assert(os.remove(file))
x=nil
;
y=nil
end
if not _port then
local progname
do
local arg = arg or ARG
local i = 0
while arg[i] do
i=i - 1
end
progname="\34" .. arg[i + 1] .. "\34"
end
print("\116\101\115\116\105\110\103\32\112\111\112\101\110\47\112\99\108\111\115\101\32\97\110\100\32\101\120\101\99\117\116\101")
checkerr("\105\110\118\97\108\105\100\32\109\111\100\101",io.popen,"\99\97\116","")
checkerr("\105\110\118\97\108\105\100\32\109\111\100\101",io.popen,"\99\97\116","\114\43")
checkerr("\105\110\118\97\108\105\100\32\109\111\100\101",io.popen,"\99\97\116","\114\119")
do
local file = os.tmpname()
local f = assert(io.popen("\99\97\116\32\45\32\62\32" .. file,"\119"))
f:write("\97\32\108\105\110\101")
assert(f:close())
local f = assert(io.popen("\99\97\116\32\45\32\60\32" .. file,"\114"))
assert(f:read("\97") == "\97\32\108\105\110\101")
assert(f:close())
assert(os.remove(file))
end
local tests = {{"\108\115\32\62\32\47\100\101\118\47\110\117\108\108","\111\107"},{"\110\111\116\45\116\111\45\98\101\45\102\111\117\110\100\45\99\111\109\109\97\110\100","\101\120\105\116"},{"\101\120\105\116\32\51","\101\120\105\116",3},{"\101\120\105\116\32\49\50\57","\101\120\105\116",129},{"\107\105\108\108\32\45\115\32\72\85\80\32\36\36","\115\105\103\110\97\108",1},{"\107\105\108\108\32\45\115\32\75\73\76\76\32\36\36","\115\105\103\110\97\108",9},{"\115\104\32\45\99\32\39\107\105\108\108\32\45\115\32\72\85\80\32\36\36\39","\101\120\105\116"},{progname .. "\32\45\101\32\34\32\34","\111\107"},{progname .. "\32\45\101\32\34\111\115\46\101\120\105\116\40\48\44\32\116\114\117\101\41\34","\111\107"},{progname .. "\32\45\101\32\34\111\115\46\101\120\105\116\40\50\48\44\32\116\114\117\101\41\34","\101\120\105\116",20}}
print("\10\40\115\111\109\101\32\101\114\114\111\114\32\109\101\115\115\97\103\101\115\32\97\114\101\32\101\120\112\101\99\116\101\100\32\110\111\119\41")
for _,v in ipairs(tests)
do
local x,y,z = io.popen(v[1]):close()
local x1,y1,z1 = os.execute(v[1])
assert(x == x1 and y == y1 and z == z1)
if v[2] == "\111\107" then
assert(x and y == "\101\120\105\116" and z == 0)
else
assert(not x and y == v[2])
assert((v[3] == nil and z > 0) or v[3] == z)
end
end
end
f=io.tmpfile()
assert(io.type(f) == "\102\105\108\101")
f:write("\97\108\111")
f:seek("\115\101\116")
assert(f:read("\97") == "\97\108\111")
end
print("\43")
print("\116\101\115\116\105\110\103\32\100\97\116\101\47\116\105\109\101")
assert(os.date("") == "")
assert(os.date("\33") == "")
assert(os.date("") == "")
assert(os.date("\33") == "")
local x = string.rep("\97",10000)
assert(os.date(x) == x)
local t = os.time()
D=os.date("\42\116",t)
assert(os.date(string.rep("\37\100",1000),t) == string.rep(os.date("\37\100",t),1000))
assert(os.date(string.rep("\37",200)) == string.rep("\37",100))
local function checkDateTable
(t)
_G.D=os.date("\42\116",t)
assert(os.time(D) == t)
load(os.date("\97\115\115\101\114\116\40\68\46\121\101\97\114\61\61\37\89\32\97\110\100\32\68\46\109\111\110\116\104\61\61\37\109\32\97\110\100\32\68\46\100\97\121\61\61\37\100\32\97\110\100\10\32\32\32\32\68\46\104\111\117\114\61\61\37\72\32\97\110\100\32\68\46\109\105\110\61\61\37\77\32\97\110\100\32\68\46\115\101\99\61\61\37\83\32\97\110\100\10\32\32\32\32\68\46\119\100\97\121\61\61\37\119\43\49\32\97\110\100\32\68\46\121\100\97\121\61\61\37\106\41",t))()
_G.D=nil
end
checkDateTable(os.time())
if not _port then
checkDateTable(0)
checkDateTable(1)
checkDateTable(1000)
checkDateTable(2147483647)
checkDateTable(2147483648)
end
checkerr("\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110\32\115\112\101\99\105\102\105\101\114",os.date,"\37")
checkerr("\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110\32\115\112\101\99\105\102\105\101\114",os.date,"\37\57")
checkerr("\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110\32\115\112\101\99\105\102\105\101\114",os.date,"\37")
checkerr("\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110\32\115\112\101\99\105\102\105\101\114",os.date,"\37\79")
checkerr("\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110\32\115\112\101\99\105\102\105\101\114",os.date,"\37\69")
checkerr("\105\110\118\97\108\105\100\32\99\111\110\118\101\114\115\105\111\110\32\115\112\101\99\105\102\105\101\114",os.date,"\37\69\97")
checkerr("\110\111\116\32\97\110\32\105\110\116\101\103\101\114",os.time,{["\121\101\97\114"] = 1000,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1,["\104\111\117\114"] = "\120"})
checkerr("\110\111\116\32\97\110\32\105\110\116\101\103\101\114",os.time,{["\121\101\97\114"] = 1000,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1,["\104\111\117\114"] = 1.5})
checkerr("\109\105\115\115\105\110\103",os.time,{["\104\111\117\114"] = 12})
if string.packsize("\105") == 4 then
checkerr("\102\105\101\108\100\32\39\121\101\97\114\39\32\105\115\32\111\117\116\45\111\102\45\98\111\117\110\100",os.time,{["\121\101\97\114"] = - (1 << 31) + 1899,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1})
checkerr("\102\105\101\108\100\32\39\121\101\97\114\39\32\105\115\32\111\117\116\45\111\102\45\98\111\117\110\100",os.time,{["\121\101\97\114"] = - (1 << 31),["\109\111\110\116\104"] = 1,["\100\97\121"] = 1})
if math.maxinteger > 2 ^ 31 then
checkerr("\102\105\101\108\100\32\39\121\101\97\114\39\32\105\115\32\111\117\116\45\111\102\45\98\111\117\110\100",os.time,{["\121\101\97\114"] = (1 << 31) + 1900,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1})
end
end
if not _port then
assert(type(os.date("\37\69\120")) == "\115\116\114\105\110\103")
assert(type(os.date("\37\79\121")) == "\115\116\114\105\110\103")
local t0 = os.time({["\121\101\97\114"] = 1970,["\109\111\110\116\104"] = 1,["\100\97\121"] = 0})
local t1 = os.time({["\121\101\97\114"] = 1970,["\109\111\110\116\104"] = 1,["\100\97\121"] = 0,["\115\101\99"] = (1 << 31) - 1})
assert(t1 - t0 == (1 << 31) - 1)
t0=os.time({["\121\101\97\114"] = 1970,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1})
t1=os.time({["\121\101\97\114"] = 1970,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1,["\115\101\99"] = - (1 << 31)})
assert(t1 - t0 == - (1 << 31))
if maxint >= 2 ^ 62 then
checkerr("\111\117\116\45\111\102\45\98\111\117\110\100",os.time,{["\121\101\97\114"] = - maxint,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1})
if string.packsize("\105") == 4 then
if testerr("\111\117\116\45\111\102\45\98\111\117\110\100",os.date,"\37\89",2 ^ 40) then
print("\32\32\52\45\98\121\116\101\32\116\105\109\101\95\116")
checkerr("\99\97\110\110\111\116\32\98\101\32\114\101\112\114\101\115\101\110\116\101\100",os.time,{["\121\101\97\114"] = 4000,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1})
else
print("\32\32\56\45\98\121\116\101\32\116\105\109\101\95\116")
checkerr("\99\97\110\110\111\116\32\98\101\32\114\101\112\114\101\115\101\110\116\101\100",os.date,"\37\89",2 ^ 60)
assert(tonumber(os.time({["\121\101\97\114"] = (1 << 31) + 1899,["\109\111\110\116\104"] = 12,["\100\97\121"] = 31,["\104\111\117\114"] = 23,["\109\105\110"] = 59,["\115\101\99"] = 59})))
checkerr("\114\101\112\114\101\115\101\110\116\101\100",os.time,{["\121\101\97\114"] = (1 << 31) + 1899,["\109\111\110\116\104"] = 12,["\100\97\121"] = 31,["\104\111\117\114"] = 23,["\109\105\110"] = 59,["\115\101\99"] = 60})
end
checkerr("\102\105\101\108\100\32\39\100\97\121\39\32\105\115\32\111\117\116\45\111\102\45\98\111\117\110\100",os.time,{["\121\101\97\114"] = 0,["\109\111\110\116\104"] = 1,["\100\97\121"] = 2 ^ 32})
checkerr("\102\105\101\108\100\32\39\109\111\110\116\104\39\32\105\115\32\111\117\116\45\111\102\45\98\111\117\110\100",os.time,{["\121\101\97\114"] = 0,["\109\111\110\116\104"] = - ((1 << 31) + 1),["\100\97\121"] = 1})
checkerr("\102\105\101\108\100\32\39\121\101\97\114\39\32\105\115\32\111\117\116\45\111\102\45\98\111\117\110\100",os.time,{["\121\101\97\114"] = (1 << 31) + 1900,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1})
else
print("\32\32\56\45\98\121\116\101\32\116\105\109\101\95\116")
assert(tonumber(os.date("\37\89",2 ^ 60)))
checkerr("\99\97\110\110\111\116\32\98\101\32\114\101\112\114\101\115\101\110\116\101\100",os.time,{["\121\101\97\114"] = 2 ^ 60,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1})
end
end
end
do
local D = os.date("\42\116")
local t = os.time(D)
if D.isdst == nil then
print("\110\111\32\100\97\121\108\105\103\104\116\32\115\97\118\105\110\103\32\105\110\102\111\114\109\97\116\105\111\110")
else
assert(type(D.isdst) == "\98\111\111\108\101\97\110")
end
D.isdst=nil
local t1 = os.time(D)
assert(t == t1)
end
local D = os.date("\42\116")
t=os.time(D)
D.year=D.year - 1
;
local t1 = os.time(D)
assert(math.abs(os.difftime(t,t1) / (24 * 3600) - 365) < 2)
t=os.time()
t1=os.time(os.date("\42\116"))
local diff = os.difftime(t1,t)
assert(0 <= diff and diff <= 1)
diff=os.difftime(t,t1)
assert(- 1 <= diff and diff <= 0)
local t1 = os.time({["\121\101\97\114"] = 2000,["\109\111\110\116\104"] = 10,["\100\97\121"] = 1,["\104\111\117\114"] = 23,["\109\105\110"] = 12})
local t2 = os.time({["\121\101\97\114"] = 2000,["\109\111\110\116\104"] = 10,["\100\97\121"] = 1,["\104\111\117\114"] = 23,["\109\105\110"] = 10,["\115\101\99"] = 19})
assert(os.difftime(t1,t2) == 60 * 2 - 19)
t1={["\121\101\97\114"] = 2005,["\109\111\110\116\104"] = 1,["\100\97\121"] = 1,["\104\111\117\114"] = 1,["\109\105\110"] = 0,["\115\101\99"] = - 3602}
os.time(t1)
assert(t1.day == 31 and t1.month == 12 and t1.year == 2004 and t1.hour == 23 and t1.min == 59 and t1.sec == 58 and t1.yday == 366)
io.output(io.stdout)
local t = os.date("\37\100\32\37\109\32\37\89\32\37\72\32\37\77\32\37\83")
local d,m,a,h,min,s = string.match(t,"\40\37\100\43\41\32\40\37\100\43\41\32\40\37\100\43\41\32\40\37\100\43\41\32\40\37\100\43\41\32\40\37\100\43\41")
d=tonumber(d)
m=tonumber(m)
a=tonumber(a)
h=tonumber(h)
min=tonumber(min)
s=tonumber(s)
io.write(string.format("\116\101\115\116\32\100\111\110\101\32\111\110\32\37\50\46\50\100\47\37\50\46\50\100\47\37\100",d,m,a))
io.write(string.format("\44\32\97\116\32\37\50\46\50\100\58\37\50\46\50\100\58\37\50\46\50\100\10",h,min,s))
io.write(string.format("\37\115\10",_VERSION))