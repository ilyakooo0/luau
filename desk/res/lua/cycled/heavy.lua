local function teststring
()
print("\u{63}\u{72}\u{65}\u{61}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{61}\u{20}\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{6f}\u{6e}\u{67}")
do
local a = "\u{78}"
local st,msg = pcall(function ()
while true do
a=(a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. (a .. a)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
print(string.format("\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{25}\u{64}\u{20}\u{62}\u{79}\u{74}\u{65}\u{73}",(# a)))
end
end)
assert((not (st and (string.find(msg,"\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{65}\u{6e}\u{67}\u{74}\u{68}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}") or string.find(msg,"\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}")))))
print(("\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{65}\u{6e}\u{67}\u{74}\u{68}\u{20}\u{6f}\u{76}\u{65}\u{72}\u{66}\u{6c}\u{6f}\u{77}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}" .. (# (a * 0x64))))
end
print("\u{2b}")
end
local function loadrep
(x,what)
local p = (0x1 << 0x14)
local s = string.rep(x,p)
local count = 0x0
local function f
()
count=(count + p)
if ((count % (0x80 * p)) == 0x0) then
io.stderr:write("\u{28}",(count // (0x2 ^ 0x14)),"\u{20}\u{4d}\u{29}")
end
return s
end
local st,msg = load(f,"\u{3d}\u{62}\u{69}\u{67}")
print("\u{a}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}\u{3a}\u{20}",(collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}") * 0x400))
msg=string.match(msg,"\u{5e}\u{5b}\u{5e}\u{a}\u{5d}\u{2b}")
print(string.format("\u{74}\u{6f}\u{74}\u{61}\u{6c}\u{3a}\u{20}\u{30}\u{78}\u{25}\u{78}\u{20}\u{25}\u{73}\u{20}\u{28}\u{27}\u{25}\u{73}\u{27}\u{29}",count,what,msg))
return st,msg
end
function controlstruct()
print("\u{63}\u{6f}\u{6e}\u{74}\u{72}\u{6f}\u{6c}\u{20}\u{73}\u{74}\u{72}\u{75}\u{63}\u{74}\u{75}\u{72}\u{65}\u{20}\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{6f}\u{6e}\u{67}")
local lim = (((0x1 << 0x18) - 0x2) // 0x3)
local s = string.rep("\u{61}\u{20}\u{3d}\u{20}\u{61}\u{20}\u{2b}\u{20}\u{31}\u{a}",lim)
s=("\u{77}\u{68}\u{69}\u{6c}\u{65}\u{20}\u{74}\u{72}\u{75}\u{65}\u{20}\u{64}\u{6f}\u{20}" .. (s .. "\u{65}\u{6e}\u{64}"))
assert(load(s))
print(("\u{6f}\u{6b}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}" .. (lim .. "\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{73}")))
lim=(lim + 0x3)
s=string.rep("\u{61}\u{20}\u{3d}\u{20}\u{61}\u{20}\u{2b}\u{20}\u{31}\u{a}",lim)
s=("\u{77}\u{68}\u{69}\u{6c}\u{65}\u{20}\u{74}\u{72}\u{75}\u{65}\u{20}\u{64}\u{6f}\u{20}" .. (s .. "\u{65}\u{6e}\u{64}"))
local st,msg = load(s)
assert((not (st and string.find(msg,"\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{6f}\u{6e}\u{67}"))))
print(msg)
end
function manylines()
print("\u{6c}\u{6f}\u{61}\u{64}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{73}")
local st,msg = loadrep("\u{a}","\u{6c}\u{69}\u{6e}\u{65}\u{73}")
assert((not (st and string.find(msg,"\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{6c}\u{69}\u{6e}\u{65}\u{73}"))))
print("\u{2b}")
end
function hugeid()
print("\u{6c}\u{6f}\u{61}\u{64}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{68}\u{75}\u{67}\u{65}\u{20}\u{69}\u{64}\u{65}\u{6e}\u{74}\u{69}\u{66}\u{69}\u{65}\u{72}")
local st,msg = loadrep("\u{61}","\u{63}\u{68}\u{61}\u{72}\u{73}")
assert((not (st and (string.find(msg,"\u{6c}\u{65}\u{78}\u{69}\u{63}\u{61}\u{6c}\u{20}\u{65}\u{6c}\u{65}\u{6d}\u{65}\u{6e}\u{74}\u{20}\u{74}\u{6f}\u{6f}\u{20}\u{6c}\u{6f}\u{6e}\u{67}") or string.find(msg,"\u{6e}\u{6f}\u{74}\u{20}\u{65}\u{6e}\u{6f}\u{75}\u{67}\u{68}\u{20}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}")))))
print("\u{2b}")
end
function toomanyinst()
print("\u{6c}\u{6f}\u{61}\u{64}\u{69}\u{6e}\u{67}\u{20}\u{63}\u{68}\u{75}\u{6e}\u{6b}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{69}\u{6e}\u{73}\u{74}\u{72}\u{75}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{73}")
local st,msg = loadrep("\u{61}\u{20}\u{3d}\u{20}\u{31}\u{30}\u{3b}\u{20}","\u{69}\u{6e}\u{73}\u{74}\u{72}\u{75}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{73}")
print("\u{2b}")
end
local function loadrepfunc
(prefix,f)
local count = (- 0x1)
local function aux
()
count=(count + 0x1)
if (count == 0x0) then
return prefix
else
if ((count % 0x100000) == 0x0) then
io.stderr:write("\u{28}",(count // (0x2 ^ 0x14)),"\u{20}\u{4d}\u{29}")
end
return f(count)
end
end
local st,msg = load(aux,"\u{6b}")
print("\u{a}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}\u{3a}\u{20}",(collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}") * 0x400))
msg=string.match(msg,"\u{5e}\u{5b}\u{5e}\u{a}\u{5d}\u{2b}")
print("\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{3a}\u{20}",msg)
end
function toomanyconst()
print("\u{6c}\u{6f}\u{61}\u{64}\u{69}\u{6e}\u{67}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{74}\u{6f}\u{6f}\u{20}\u{6d}\u{61}\u{6e}\u{79}\u{20}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{61}\u{6e}\u{74}\u{73}")
loadrepfunc("\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{6f}\u{6f}\u{20}\u{28}\u{29}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{7b}\u{30}\u{2c}",function (n)
return string.char(0x22,(((n // (0x80 ^ 0x0)) & 0x7f) + 0x80),(((n // (0x80 ^ 0x1)) & 0x7f) + 0x80),(((n // (0x80 ^ 0x2)) & 0x7f) + 0x80),(((n // (0x80 ^ 0x3)) & 0x7f) + 0x80),(((n // (0x80 ^ 0x4)) & 0x7f) + 0x80),0x22,0x2c)
end)
end
function toomanystr()
local a = {}
local st,msg = pcall(function ()
for i = 0x1, math.huge
do
if ((i % 0x100000) == 0x0) then
io.stderr:write("\u{28}",(i // (0x2 ^ 0x14)),"\u{20}\u{4d}\u{29}")
end
a[i]=string.pack("\u{49}",i)
end
end)
local size = (# a)
a=collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}")
print("\u{a}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}\u{3a}",(a * 0x400))
print("\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{3a}",msg)
print("\u{73}\u{69}\u{7a}\u{65}\u{3a}",size)
end
function toomanyidx()
local a = {}
local st,msg = pcall(function ()
for i = 0x1, math.huge
do
if ((i % 0x100000) == 0x0) then
io.stderr:write("\u{28}",(i // (0x2 ^ 0x14)),"\u{20}\u{4d}\u{29}")
end
a[i]=i
end
end)
print("\u{a}\u{6d}\u{65}\u{6d}\u{6f}\u{72}\u{79}\u{3a}\u{20}",(collectgarbage("\u{63}\u{6f}\u{75}\u{6e}\u{74}") * 0x400))
print("\u{65}\u{78}\u{70}\u{65}\u{63}\u{74}\u{65}\u{64}\u{20}\u{65}\u{72}\u{72}\u{6f}\u{72}\u{3a}\u{20}",msg)
print("\u{73}\u{69}\u{7a}\u{65}\u{3a}",(# a))
end
toomanyidx()
print("\u{4f}\u{4b}")