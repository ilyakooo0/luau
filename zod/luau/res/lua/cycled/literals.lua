print("\116\101\115\116\105\110\103\32\115\99\97\110\110\101\114")
local debug = require("\100\101\98\117\103")
local function dostring
(x)
return assert(load(x),"")()
end
dostring("\120\32\11\12\32\61\32\9\13\32\39\97\97\39\32\11\12\12")
assert(x == "\97\97" and string.len(x) == 3)
_G.x=nil
assert("\10\34\39\92" == "\10\34\39\92")
assert(string.find("\7\8\12\10\13\9\11","\94\37\99\37\99\37\99\37\99\37\99\37\99\37\99\36"))
assert("\99\49\50" == "\99\49\50")
assert("\99\97\98" == "\99\97\98")
assert("\99" == "\99")
assert("\99\10" == "\99\10")
assert("\97\108\111" == "" .. "" .. "\97\108\111")
assert(10 .. 20 .. - 30 == "\49\48\50\48\45\51\48")
assert("\5\16\31\60\255\232" == "\5\16\31\60\255\232")
local function lexstring
(x,y,n)
local f = assert(load("\114\101\116\117\114\110\32" .. x .. "\44\32\114\101\113\117\105\114\101\34\100\101\98\117\103\34\46\103\101\116\105\110\102\111\40\49\41\46\99\117\114\114\101\110\116\108\105\110\101",""))
local s,l = f()
assert(s == y and l == n)
end
lexstring("\39\97\98\99\92\122\32\32\10\32\32\32\101\102\103\39","\97\98\99\101\102\103",2)
lexstring("\39\97\98\99\92\122\32\32\10\10\10\39","\97\98\99",4)
lexstring("\39\92\122\32\32\10\9\12\11\10\39","",3)
lexstring("\91\91\10\97\108\111\10\97\108\111\10\10\93\93","\97\108\111\10\97\108\111\10\10",5)
lexstring("\91\91\10\97\108\111\13\97\108\111\10\10\93\93","\97\108\111\10\97\108\111\10\10",5)
lexstring("\91\91\10\97\108\111\13\97\108\111\13\10\93\93","\97\108\111\10\97\108\111\10",4)
lexstring("\91\91\13\97\108\111\10\13\97\108\111\13\10\93\93","\97\108\111\10\97\108\111\10",4)
lexstring("\91\91\97\108\111\93\10\93\97\108\111\93\93","\97\108\111\93\10\93\97\108\111",2)
assert("\97\98\99\100\101\102\103\104\105" == "\97\98\99\100\101\102\103\104\105")
assert("" == string.char(0,0,0,0))
assert("\127" == "\127")
assert("\128\255\7" == "\194\128\223\191")
assert("\0\8\255\255" == "\224\160\128\239\191\191")
assert("\0\0\1\255\255\31" == "\240\144\128\128\247\191\191\191")
assert("\0\0\32\255\255\255\3" == "\248\136\128\128\128\251\191\191\191\191")
assert("\0\0\0\4\255\255\255\127" == "\252\132\128\128\128\128\253\191\191\191\191\191")
local function lexerror
(s,err)
local st,msg = load("\114\101\116\117\114\110\32" .. s,"")
if err ~= "\60\101\111\102\62" then
err=err .. "\39"
end
assert(not st and string.find(msg,"\110\101\97\114\32\46\45" .. err))
end
lexerror("\34\97\98\99\92\120\34","\92\120\34")
lexerror("\34\97\98\99\92\120","\92\120")
lexerror("\34\92\120","\92\120")
lexerror("\34\92\120\53\34","\92\120\53\34")
lexerror("\34\92\120\53","\92\120\53")
lexerror("\34\92\120\114\34","\92\120\114")
lexerror("\34\92\120\114","\92\120\114")
lexerror("\34\92\120\46","\92\120\46")
lexerror("\34\92\120\56\37\34","\92\120\56\37\37")
lexerror("\34\92\120\65\71","\92\120\65\71")
lexerror("\34\92\103\34","\92\103")
lexerror("\34\92\103","\92\103")
lexerror("\34\92\46\34","\92\37\46")
lexerror("\34\92\57\57\57\34","\92\57\57\57\34")
lexerror("\34\120\121\122\92\51\48\48\34","\92\51\48\48\34")
lexerror("\34\32\32\32\92\50\53\54\34","\92\50\53\54\34")
lexerror("\34\97\98\99\92\117\123\49\48\48\48\48\48\48\48\48\125\34","\97\98\99\92\117\123\49\48\48\48\48\48\48\48\48")
lexerror("\34\97\98\99\92\117\49\49\114\34","\97\98\99\92\117\49")
lexerror("\34\97\98\99\92\117\34","\97\98\99\92\117\34")
lexerror("\34\97\98\99\92\117\123\49\49\114\34","\97\98\99\92\117\123\49\49\114")
lexerror("\34\97\98\99\92\117\123\49\49\34","\97\98\99\92\117\123\49\49\34")
lexerror("\34\97\98\99\92\117\123\49\49","\97\98\99\92\117\123\49\49")
lexerror("\34\97\98\99\92\117\123\114\34","\97\98\99\92\117\123\114")
lexerror("\91\61\91\97\108\111\93\93","\60\101\111\102\62")
lexerror("\91\61\91\97\108\111\93\61","\60\101\111\102\62")
lexerror("\91\61\91\97\108\111\93","\60\101\111\102\62")
lexerror("\39\97\108\111","\60\101\111\102\62")
lexerror("\39\97\108\111\32\92\122\32\32\10\10","\60\101\111\102\62")
lexerror("\39\97\108\111\32\92\122","\60\101\111\102\62")
lexerror("\39\97\108\111\32\92\57\56","\60\101\111\102\62")
for i = 0, 255
do
local s = string.char(i)
assert(not string.find(s,"\91\97\45\122\65\45\90\95\93") == not load(s .. "\61\49",""))
assert(not string.find(s,"\91\97\45\122\65\45\90\95\48\45\57\93") == not load("\97" .. s .. "\49\32\61\32\49",""))
end
local var1 = string.rep("\97",15000) .. "\49"
local var2 = string.rep("\97",15000) .. "\50"
local prog = string.format("\32\32\37\115\32\61\32\53\10\32\32\37\115\32\61\32\37\115\32\43\32\49\10\32\32\114\101\116\117\114\110\32\102\117\110\99\116\105\111\110\32\40\41\32\114\101\116\117\114\110\32\37\115\32\45\32\37\115\32\101\110\100\10",var1,var2,var1,var1,var2)
local f = dostring(prog)
assert(_G[var1] == 5 and _G[var2] == 6 and f() == - 1)
_G[var1],_G[var2]=nil
print("\43")
assert("\10\9" == "\10\9")
assert("\10\32\36\100\101\98\117\103" == "\10\32\36\100\101\98\117\103")
assert("\32\91\32" ~= "\32\93\32")
local b = "\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57"
assert(string.len(b) == 960)
prog="\112\114\105\110\116\40\39\43\39\41\10\10\108\111\99\97\108\32\97\49\32\61\32\91\91\34\116\104\105\115\32\105\115\32\97\32\39\115\116\114\105\110\103\39\32\119\105\116\104\32\115\101\118\101\114\97\108\32\39\113\117\111\116\101\115\39\34\93\93\10\108\111\99\97\108\32\97\50\32\61\32\34\39\113\117\111\116\101\115\39\34\10\10\97\115\115\101\114\116\40\115\116\114\105\110\103\46\102\105\110\100\40\97\49\44\32\97\50\41\32\61\61\32\51\52\41\10\112\114\105\110\116\40\39\43\39\41\10\10\97\49\32\61\32\91\61\61\91\116\101\109\112\32\61\32\91\91\97\110\32\97\114\98\105\116\114\97\114\121\32\118\97\108\117\101\93\93\59\32\93\61\61\93\10\97\115\115\101\114\116\40\108\111\97\100\40\97\49\41\41\40\41\10\97\115\115\101\114\116\40\116\101\109\112\32\61\61\32\39\97\110\32\97\114\98\105\116\114\97\114\121\32\118\97\108\117\101\39\41\10\95\71\46\116\101\109\112\32\61\32\110\105\108\10\45\45\32\108\111\110\103\32\115\116\114\105\110\103\115\32\45\45\10\108\111\99\97\108\32\98\32\61\32\34\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\34\10\97\115\115\101\114\116\40\115\116\114\105\110\103\46\108\101\110\40\98\41\32\61\61\32\57\54\48\41\10\112\114\105\110\116\40\39\43\39\41\10\10\108\111\99\97\108\32\97\32\61\32\91\91\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\48\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\10\93\93\10\97\115\115\101\114\116\40\115\116\114\105\110\103\46\108\101\110\40\97\41\32\61\61\32\49\56\54\51\41\10\97\115\115\101\114\116\40\115\116\114\105\110\103\46\115\117\98\40\97\44\32\49\44\32\52\48\41\32\61\61\32\115\116\114\105\110\103\46\115\117\98\40\98\44\32\49\44\32\52\48\41\41\10\120\32\61\32\49\10"
print("\43")
_G.x=nil
dostring(prog)
assert(x)
_G.x=nil
do
local function getadd
(s)
return string.format("\37\112",s)
end
local s1 <const> = "\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57"
local s2 <const> = "\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57"
local s3 = "\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57"
local function foo
()
return s1
end
local function foo1
()
return s3
end
local function foo2
()
return "\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57"
end
local a1 = getadd(s1)
assert(a1 == getadd(s2))
assert(a1 == getadd(foo()))
assert(a1 == getadd(foo1()))
assert(a1 == getadd(foo2()))
local sd = "\48\49\50\51\52\53\54\55\56\57" .. "\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57\48\49\50\51\52\53\54\55\56\57"
assert(sd == s1 and getadd(sd) ~= a1)
end
prog="\108\111\99\97\108\32\97\32\61\32\49\32\32\32\32\32\32\32\32\45\45\32\97\32\99\111\109\109\101\110\116\10\108\111\99\97\108\32\98\32\61\32\50\10\10\10\120\32\61\32\91\61\91\10\104\105\10\93\61\93\10\121\32\61\32\34\92\10\104\101\108\108\111\92\114\92\110\92\10\34\10\114\101\116\117\114\110\32\114\101\113\117\105\114\101\34\100\101\98\117\103\34\46\103\101\116\105\110\102\111\40\49\41\46\99\117\114\114\101\110\116\108\105\110\101\10"
for _,n in pairs({"\10","\13","\10\13","\13\10"})
do
local prog,nn = string.gsub(prog,"\10",n)
assert(dostring(prog) == nn)
assert(_G.x == "\104\105\10" and _G.y == "\10\104\101\108\108\111\13\10\10")
end
_G.x,_G.y=nil
local a = "\93\61"
assert(a == "\93\61")
a="\91\61\61\61\91\91\61\91\93\93\61\93\91\61\61\61\61\91\93\93\61\61\61\93\61\61\61"
assert(a == "\91\61\61\61\91\91\61\91\93\93\61\93\91\61\61\61\61\91\93\93\61\61\61\93\61\61\61")
a="\91\61\61\61\91\91\61\91\93\93\61\93\91\61\61\61\61\91\93\93\61\61\61\93\61\61\61"
assert(a == "\91\61\61\61\91\91\61\91\93\93\61\93\91\61\61\61\61\91\93\93\61\61\61\93\61\61\61")
a="\93\93\93\93\93\93\93\93"
assert(a == "\93\93\93\93\93\93\93\93")
local x = {"\61","\91","\93","\10"}
local len = 4
local function gen
(c,n)
if n == 0 then
coroutine.yield(c)
else
for _,a in pairs(x)
do
gen(c .. a,n - 1)
end
end
end
for s in coroutine.wrap(function ()
gen("",len)
end)
do
assert(s == load("\114\101\116\117\114\110\32\91\61\61\61\61\91\10" .. s .. "\93\61\61\61\61\93","")())
end
if os.setlocale("\112\116\95\66\82") or os.setlocale("\112\116\98") then
assert(tonumber("\51\44\52") == 3.4 and tonumber("\51\46\52") == 3.4)
assert(tonumber("\32\32\45\46\52\32\32") == - 0.4)
assert(tonumber("\32\32\43\48\120\46\52\49\32\32") == 0.25390625)
assert(not load("\97\32\61\32\40\51\44\52\41"))
assert(assert(load("\114\101\116\117\114\110\32\51\46\52"))() == 3.4)
assert(assert(load("\114\101\116\117\114\110\32\46\52\44\51"))() == 0.4)
assert(assert(load("\114\101\116\117\114\110\32\52\46"))() == 4.0)
assert(assert(load("\114\101\116\117\114\110\32\52\46\43\46\53"))() == 4.5)
assert("\32\48\120\46\49\32" + "\32\48\120\44\49" + "\45\48\88\46\49\9" == 0.0625)
assert(not tonumber("\105\110\102") and not tonumber("\78\65\78"))
assert(assert(load(string.format("\114\101\116\117\114\110\32\37\113",4.51)))() == 4.51)
local a,b = load("\114\101\116\117\114\110\32\52\46\53\46")
assert(string.find(b,"\39\52\37\46\53\37\46\39"))
assert(os.setlocale("\67"))
else
(Message or print)("\10\32\62\62\62\32\112\116\95\66\82\32\108\111\99\97\108\101\32\110\111\116\32\97\118\97\105\108\97\98\108\101\58\32\115\107\105\112\112\105\110\103\32\100\101\99\105\109\97\108\32\112\111\105\110\116\32\116\101\115\116\115\32\60\60\60\10")
end
local s = "\97\32\115\116\114\105\110\103\32\119\105\116\104\32\13\32\97\110\100\32\10\32\97\110\100\32\13\10\32\97\110\100\32\10\13"
local c = string.format("\114\101\116\117\114\110\32\37\113",s)
assert(assert(load(c))() == s)
assert(not load("\97\32\61\32\39\110\111\110\45\101\110\100\105\110\103\32\115\116\114\105\110\103"))
assert(not load("\97\32\61\32\39\110\111\110\45\101\110\100\105\110\103\32\115\116\114\105\110\103\10\39"))
assert(not load("\97\32\61\32\39\92\51\52\53\39"))
assert(not load("\97\32\61\32\91\61\120\93"))
local function malformednum
(n,exp)
local s,msg = load("\114\101\116\117\114\110\32" .. n)
assert(not s and string.find(msg,exp))
end
malformednum("\48\120\101\45","\110\101\97\114\32\60\101\111\102\62")
malformednum("\48\120\101\112\45\112","\109\97\108\102\111\114\109\101\100\32\110\117\109\98\101\114")
malformednum("\49\112\114\105\110\116\40\41","\109\97\108\102\111\114\109\101\100\32\110\117\109\98\101\114")
print("\79\75")