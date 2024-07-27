local function teststring
()
print("\99\114\101\97\116\105\110\103\32\97\32\115\116\114\105\110\103\32\116\111\111\32\108\111\110\103")
do
local a = "\120"
local st,msg = pcall(function ()
while true do
a=a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a .. a
print(string.format("\115\116\114\105\110\103\32\119\105\116\104\32\37\100\32\98\121\116\101\115",# a))
end
end)
assert(not st and (string.find(msg,"\115\116\114\105\110\103\32\108\101\110\103\116\104\32\111\118\101\114\102\108\111\119") or string.find(msg,"\110\111\116\32\101\110\111\117\103\104\32\109\101\109\111\114\121")))
print("\115\116\114\105\110\103\32\108\101\110\103\116\104\32\111\118\101\114\102\108\111\119\32\119\105\116\104\32" .. # a * 100)
end
print("\43")
end
local function loadrep
(x,what)
local p = 1 << 20
local s = string.rep(x,p)
local count = 0
local function f
()
count=count + p
if count % (128 * p) == 0 then
io.stderr:write("\40",count // 2 ^ 20,"\32\77\41")
end
return s
end
local st,msg = load(f,"\61\98\105\103")
print("\10\109\101\109\111\114\121\58\32",collectgarbage("\99\111\117\110\116") * 1024)
msg=string.match(msg,"\94\91\94\10\93\43")
print(string.format("\116\111\116\97\108\58\32\48\120\37\120\32\37\115\32\40\39\37\115\39\41",count,what,msg))
return st,msg
end
function controlstruct()
print("\99\111\110\116\114\111\108\32\115\116\114\117\99\116\117\114\101\32\116\111\111\32\108\111\110\103")
local lim = ((1 << 24) - 2) // 3
local s = string.rep("\97\32\61\32\97\32\43\32\49\10",lim)
s="\119\104\105\108\101\32\116\114\117\101\32\100\111\32" .. s .. "\101\110\100"
assert(load(s))
print("\111\107\32\119\105\116\104\32" .. lim .. "\32\108\105\110\101\115")
lim=lim + 3
s=string.rep("\97\32\61\32\97\32\43\32\49\10",lim)
s="\119\104\105\108\101\32\116\114\117\101\32\100\111\32" .. s .. "\101\110\100"
local st,msg = load(s)
assert(not st and string.find(msg,"\116\111\111\32\108\111\110\103"))
print(msg)
end
function manylines()
print("\108\111\97\100\105\110\103\32\99\104\117\110\107\32\119\105\116\104\32\116\111\111\32\109\97\110\121\32\108\105\110\101\115")
local st,msg = loadrep("\10","\108\105\110\101\115")
assert(not st and string.find(msg,"\116\111\111\32\109\97\110\121\32\108\105\110\101\115"))
print("\43")
end
function hugeid()
print("\108\111\97\100\105\110\103\32\99\104\117\110\107\32\119\105\116\104\32\104\117\103\101\32\105\100\101\110\116\105\102\105\101\114")
local st,msg = loadrep("\97","\99\104\97\114\115")
assert(not st and (string.find(msg,"\108\101\120\105\99\97\108\32\101\108\101\109\101\110\116\32\116\111\111\32\108\111\110\103") or string.find(msg,"\110\111\116\32\101\110\111\117\103\104\32\109\101\109\111\114\121")))
print("\43")
end
function toomanyinst()
print("\108\111\97\100\105\110\103\32\99\104\117\110\107\32\119\105\116\104\32\116\111\111\32\109\97\110\121\32\105\110\115\116\114\117\99\116\105\111\110\115")
local st,msg = loadrep("\97\32\61\32\49\48\59\32","\105\110\115\116\114\117\99\116\105\111\110\115")
print("\43")
end
local function loadrepfunc
(prefix,f)
local count = - 1
local function aux
()
count=count + 1
if count == 0 then
return prefix
else
if count % (1048576) == 0 then
io.stderr:write("\40",count // 2 ^ 20,"\32\77\41")
end
return f(count)
end
end
local st,msg = load(aux,"\107")
print("\10\109\101\109\111\114\121\58\32",collectgarbage("\99\111\117\110\116") * 1024)
msg=string.match(msg,"\94\91\94\10\93\43")
print("\101\120\112\101\99\116\101\100\32\101\114\114\111\114\58\32",msg)
end
function toomanyconst()
print("\108\111\97\100\105\110\103\32\102\117\110\99\116\105\111\110\32\119\105\116\104\32\116\111\111\32\109\97\110\121\32\99\111\110\115\116\97\110\116\115")
loadrepfunc("\102\117\110\99\116\105\111\110\32\102\111\111\32\40\41\32\114\101\116\117\114\110\32\123\48\44",function (n)
return string.char(34,((n // 128 ^ 0) & 127) + 128,((n // 128 ^ 1) & 127) + 128,((n // 128 ^ 2) & 127) + 128,((n // 128 ^ 3) & 127) + 128,((n // 128 ^ 4) & 127) + 128,34,44)
end)
end
function toomanystr()
local a = {}
local st,msg = pcall(function ()
for i = 1, math.huge
do
if i % (1048576) == 0 then
io.stderr:write("\40",i // 2 ^ 20,"\32\77\41")
end
a[i]=string.pack("\73",i)
end
end)
local size = # a
a=collectgarbage("\99\111\117\110\116")
print("\10\109\101\109\111\114\121\58",a * 1024)
print("\101\120\112\101\99\116\101\100\32\101\114\114\111\114\58",msg)
print("\115\105\122\101\58",size)
end
function toomanyidx()
local a = {}
local st,msg = pcall(function ()
for i = 1, math.huge
do
if i % (1048576) == 0 then
io.stderr:write("\40",i // 2 ^ 20,"\32\77\41")
end
a[i]=i
end
end)
print("\10\109\101\109\111\114\121\58\32",collectgarbage("\99\111\117\110\116") * 1024)
print("\101\120\112\101\99\116\101\100\32\101\114\114\111\114\58\32",msg)
print("\115\105\122\101\58",# a)
end
toomanyidx()
print("\79\75")