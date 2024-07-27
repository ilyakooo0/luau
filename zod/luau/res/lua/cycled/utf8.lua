print("\116\101\115\116\105\110\103\32\85\84\70\45\56\32\108\105\98\114\97\114\121")
local utf8 = require("\117\116\102\56")
local function checkerror
(msg,f, ...)
local s,err = pcall(f,...)
assert(not s and string.find(err,msg))
end
local function len
(s)
return # string.gsub(s,"\91\128\45\191\93","")
end
local justone = "\94" .. utf8.charpattern .. "\36"
local function checksyntax
(s,t)
local ts = {"\114\101\116\117\114\110\32\39"}
for i = 1, # t
do
ts[i + 1]=string.format("\92\117\123\37\120\125",t[i])
end
ts[# t + 2]="\39"
ts=table.concat(ts)
assert(assert(load(ts))() == s)
end
assert(not utf8.offset("\97\108\111",5))
assert(not utf8.offset("\97\108\111",- 4))
local function check
(s,t,nonstrict)
local l = utf8.len(s,1,- 1,nonstrict)
assert(# t == l and len(s) == l)
assert(utf8.char(table.unpack(t)) == s)
assert(utf8.offset(s,0) == 1)
checksyntax(s,t)
local t1 = {utf8.codepoint(s,1,- 1,nonstrict)}
assert(# t == # t1)
for i = 1, # t
do
assert(t[i] == t1[i])
end
for i = 1, l
do
local pi = utf8.offset(s,i)
local pi1 = utf8.offset(s,2,pi)
assert(string.find(string.sub(s,pi,pi1 - 1),justone))
assert(utf8.offset(s,- 1,pi1) == pi)
assert(utf8.offset(s,i - l - 1) == pi)
assert(pi1 - pi == # utf8.char(utf8.codepoint(s,pi,pi,nonstrict)))
for j = pi, pi1 - 1
do
assert(utf8.offset(s,0,j) == pi)
end
for j = pi + 1, pi1 - 1
do
assert(not utf8.len(s,j))
end
assert(utf8.len(s,pi,pi,nonstrict) == 1)
assert(utf8.len(s,pi,pi1 - 1,nonstrict) == 1)
assert(utf8.len(s,pi,- 1,nonstrict) == l - i + 1)
assert(utf8.len(s,pi1,- 1,nonstrict) == l - i)
assert(utf8.len(s,1,pi,nonstrict) == i)
end
local i = 0
for p,c in utf8.codes(s,nonstrict)
do
i=i + 1
assert(c == t[i] and p == utf8.offset(s,i))
assert(utf8.codepoint(s,p,p,nonstrict) == c)
end
assert(i == # t)
i=0
for c in string.gmatch(s,utf8.charpattern)
do
i=i + 1
assert(c == utf8.char(t[i]))
end
assert(i == # t)
for i = 1, l
do
assert(utf8.offset(s,i) == utf8.offset(s,i - l - 1,# s + 1))
end
end
do
local function check
(s,p)
local a,b = utf8.len(s)
assert(not a and b == p)
end
check("\97\98\99\227\100\101\102",4)
check("\244\159\191",1)
check("\244\159\191\191",1)
check("\230\177\137\229\173\151\128",# ("\230\177\137\229\173\151") + 1)
check("\128\104\101\108\108\111",1)
check("\104\101\108\128\108\111",4)
check("\230\177\137\229\173\151\191",# ("\230\177\137\229\173\151") + 1)
check("\191\104\101\108\108\111",1)
check("\104\101\108\191\108\111",4)
end
do
local function errorcodes
(s)
checkerror("\105\110\118\97\108\105\100\32\85\84\70\37\45\56\32\99\111\100\101",function ()
for c in utf8.codes(s)
do
assert(c)
end
end)
end
errorcodes("\97\98\255")
errorcodes("\0\0\17")
errorcodes("\105\110\128\118\97\108\105\100")
errorcodes("\191\105\110\118\97\108\105\100")
errorcodes("\206\177\206\187\207\134\191\206\177")
local f = utf8.codes("")
assert(f("",2) == nil)
assert(f("",- 1) == nil)
assert(f("",math.mininteger) == nil)
end
checkerror("\112\111\115\105\116\105\111\110\32\111\117\116\32\111\102\32\98\111\117\110\100\115",utf8.offset,"\97\98\99",1,5)
checkerror("\112\111\115\105\116\105\111\110\32\111\117\116\32\111\102\32\98\111\117\110\100\115",utf8.offset,"\97\98\99",1,- 4)
checkerror("\112\111\115\105\116\105\111\110\32\111\117\116\32\111\102\32\98\111\117\110\100\115",utf8.offset,"",1,2)
checkerror("\112\111\115\105\116\105\111\110\32\111\117\116\32\111\102\32\98\111\117\110\100\115",utf8.offset,"",1,- 1)
checkerror("\99\111\110\116\105\110\117\97\116\105\111\110\32\98\121\116\101",utf8.offset,"\240\166\167\186",1,2)
checkerror("\99\111\110\116\105\110\117\97\116\105\111\110\32\98\121\116\101",utf8.offset,"\240\166\167\186",1,2)
checkerror("\99\111\110\116\105\110\117\97\116\105\111\110\32\98\121\116\101",utf8.offset,"\128",1)
checkerror("\111\117\116\32\111\102\32\98\111\117\110\100\115",utf8.len,"\97\98\99",0,2)
checkerror("\111\117\116\32\111\102\32\98\111\117\110\100\115",utf8.len,"\97\98\99",1,4)
local s = "\104\101\108\108\111\32\87\111\114\108\100"
local t = {string.byte(s,1,- 1)}
for i = 1, utf8.len(s)
do
assert(t[i] == string.byte(s,i))
end
check(s,t)
check("\230\177\137\229\173\151\47\230\188\162\229\173\151",{27721,23383,47,28450,23383})
do
local s = "\195\161\195\169\195\173\128"
local t = {utf8.codepoint(s,1,# s - 1)}
assert(# t == 3 and t[1] == 225 and t[2] == 233 and t[3] == 237)
checkerror("\105\110\118\97\108\105\100\32\85\84\70\37\45\56\32\99\111\100\101",utf8.codepoint,s,1,# s)
checkerror("\111\117\116\32\111\102\32\98\111\117\110\100\115",utf8.codepoint,s,# s + 1)
t={utf8.codepoint(s,4,3)}
assert(# t == 0)
checkerror("\111\117\116\32\111\102\32\98\111\117\110\100\115",utf8.codepoint,s,- (# s + 1),1)
checkerror("\111\117\116\32\111\102\32\98\111\117\110\100\115",utf8.codepoint,s,1,# s + 1)
assert(utf8.codepoint("\255\215") == 55296 - 1)
assert(utf8.codepoint("\0\224") == 57343 + 1)
assert(utf8.codepoint("\0\216",1,1,true) == 55296)
assert(utf8.codepoint("\255\223",1,1,true) == 57343)
assert(utf8.codepoint("\255\255\255\127",1,1,true) == 2147483647)
end
assert(utf8.char() == "")
assert(utf8.char(0,97,98,99,1) == "\97\98\99\1")
assert(utf8.codepoint(utf8.char(1114111)) == 1114111)
assert(utf8.codepoint(utf8.char(2147483647),1,1,true) == (1 << 31) - 1)
checkerror("\118\97\108\117\101\32\111\117\116\32\111\102\32\114\97\110\103\101",utf8.char,2147483647 + 1)
checkerror("\118\97\108\117\101\32\111\117\116\32\111\102\32\114\97\110\103\101",utf8.char,- 1)
local function invalid
(s)
checkerror("\105\110\118\97\108\105\100\32\85\84\70\37\45\56\32\99\111\100\101",utf8.codepoint,s)
assert(not utf8.len(s))
end
invalid("\244\159\191\191")
invalid("\0\216")
invalid("\255\223")
invalid("\192\128")
invalid("\193\191")
invalid("\224\159\191")
invalid("\240\143\191\191")
invalid("\128")
invalid("\191")
invalid("\254")
invalid("\255")
check("",{})
s="\32\127\194\128\32\223\191\224\160\128\32\239\191\191\240\144\128\128\32\32\244\143\191\191"
s=string.gsub(s,"\32","")
check(s,{0,127,128,2047,2048,65535,65536,1114111})
do
local s = "\0\0\0\4\255\255\255\127"
assert(# s == 12)
check(s,{67108864,2147483647},true)
s="\0\0\32\255\255\255\3"
assert(# s == 10)
check(s,{2097152,67108863},true)
s="\0\0\1\255\255\31"
assert(# s == 8)
check(s,{65536,2097151},true)
end
local x = "\230\151\165\230\156\172\232\170\158\97\45\52\195\169\195\179"
check(x,{26085,26412,35486,97,45,52,0,233,243})
check("\240\163\178\183\240\160\156\142\240\160\177\147\240\161\129\187\240\160\181\188\97\98\240\160\186\162",{146615,132878,134227,135291,134524,97,98,134818})
check("\240\168\179\138\240\169\182\152\240\166\167\186\240\168\179\146\240\165\132\171\240\164\147\147\244\143\191\191",{167114,171416,158202,167122,151851,148691,1114111})
local i = 0
for p,c in string.gmatch(x,"\40\41\40" .. utf8.charpattern .. "\41")
do
i=i + 1
assert(utf8.offset(x,i) == p)
assert(utf8.len(x,p) == utf8.len(x) - i + 1)
assert(utf8.len(c) == 1)
for j = 1, # c - 1
do
assert(utf8.offset(x,0,p + j - 1) == p)
end
end
print("\111\107")