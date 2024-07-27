if _port then
return 
end
print("testing stand-alone interpreter")
assert(os.execute())
local arg = arg or ARG
local prog = os.tmpname()
local otherprog = os.tmpname()
local out = os.tmpname()
local progname = 
local i = 0
while arg[i] do
i=i - 1
progname=arg[i + 1]
print("progname: " .. progname)
local prepfile = (s,mod,p)
mod=mod and "wb" or "w"
p=p or prog
local f = io.open(p,mod)
f:write(s)
assert(f:close())
end
local function getoutput
()
local f = io.open(out)
local t = f:read("a")
f:close()
assert(os.remove(out))
return t
end
local function checkprogout
(s)
assert(string.sub(s,- 1) == "
")
local t = getoutput()
for line in string.gmatch(s,".-
")
do
assert(string.find(t,line,1,true))
end
end
local function checkout
(s)
local t = getoutput()
if s ~= t then
print(string.format("'%s' - '%s'
",s,t))
end
assert(s == t)
return t
end
local function RUN
(p, ...)
p=string.gsub(p,"lua",""" .. progname .. """,1)
local s = string.format(p,...)
assert(os.execute(s))
end
local function NoRun
(msg,p, ...)
p=string.gsub(p,"lua",""" .. progname .. """,1)
local s = string.format(p,...)
s=string.format("%s >%s 2>&1",s,out)
assert(not os.execute(s))
assert(string.find(getoutput(),msg,1,true))
end
RUN("lua -v")
print(string.format("(temporary program file used in these tests: %s)",prog))
prepfile("")
RUN("lua - < %s > %s",prog,out)
checkout("")
prepfile("  print(
1, a
)
")
RUN("lua - < %s > %s",prog,out)
checkout("1	nil
")
RUN("echo "print(10)
print(2)
" | lua > %s",out)
checkout("10
2
")
prepfile("ï»¿")
RUN("lua %s > %s",prog,out)
checkout("")
prepfile("ï»¿print(3)")
RUN("lua %s > %s",prog,out)
checkout("3
")
prepfile("ï»¿# comment!!
print(3)")
RUN("lua %s > %s",prog,out)
checkout("3
")
prepfile("ï",true)
NoRun("unexpected symbol","lua %s",prog)
prepfile("ï»",true)
NoRun("unexpected symbol","lua %s",prog)
prepfile("ïprint(3)",true)
NoRun("unexpected symbol","lua %s",prog)
prepfile("ï»print(3)",true)
NoRun("unexpected symbol","lua %s",prog)
RUN("echo "print(arg[1])" | lua - -h > %s",out)
checkout("-h
")
prepfile("print(package.path)")
RUN("env LUA_INIT= LUA_PATH=x lua %s > %s",prog,out)
checkout("x
")
RUN("env LUA_INIT= LUA_PATH_5_4=y LUA_PATH=x lua %s > %s",prog,out)
checkout("y
")
prepfile("print(package.cpath)")
RUN("env LUA_INIT= LUA_CPATH=xuxu lua %s > %s",prog,out)
checkout("xuxu
")
RUN("env LUA_INIT= LUA_CPATH_5_4=yacc LUA_CPATH=x lua %s > %s",prog,out)
checkout("yacc
")
prepfile("print(X)")
RUN("env LUA_INIT="X=tonumber(arg[1])" lua %s 3.2 > %s",prog,out)
checkout("3.2
")
prepfile("print(X)")
RUN("env LUA_INIT_5_4="X=10" LUA_INIT="X=3" lua %s > %s",prog,out)
checkout("10
")
prepfile("x = x or 10; print(x); x = x + 1")
RUN("env LUA_INIT="@%s" lua %s > %s",prog,prog,out)
checkout("10
11
")
NoRun("LUA_INIT:1: msg","env LUA_INIT="error('msg')" lua")
local defaultpath,defaultCpath = 
prepfile("print(package.path, package.cpath)")
RUN("env LUA_INIT="error(10)" LUA_PATH=xxx LUA_CPATH=xxx lua -E %s > %s",prog,out)
local output = getoutput()
defaultpath=string.match(output,"^(.-)	")
defaultCpath=string.match(output,"	(.-)$")
RUN("env -i lua %s > %s",prog,out)
local out = getoutput()
assert(defaultpath == string.match(output,"^(.-)	"))
assert(defaultCpath == string.match(output,"	(.-)$"))
assert(not string.find(defaultpath,"xxx") and string.find(defaultpath,"lua") and not string.find(defaultCpath,"xxx") and string.find(defaultCpath,"lua"))
local function convert
(p)
prepfile("print(package.path)")
RUN("env LUA_PATH="%s" lua %s > %s",p,prog,out)
local expected = getoutput()
expected=string.sub(expected,1,- 2)
if string.find(p,";;") then
p=string.gsub(p,";;",";" .. defaultpath .. ";")
p=string.gsub(p,"^;","")
p=string.gsub(p,";$","")
end
assert(p == expected)
end
convert(";")
convert(";;")
convert("a;;b")
convert(";;b")
convert("a;;")
convert("a;b;;c")
prepfile("print(1); a=2; return {x=15}")
prepfile(("print(a); print(_G['%s'].x)"):format(prog),false,otherprog)
RUN("env LUA_PATH="?;;" lua -l %s -l%s -lstring -l io %s > %s",prog,otherprog,otherprog,out)
checkout("1
2
15
2
15
")
prepfile("print(str.upper'alo alo', m.max(10, 20))")
RUN("lua -l 'str=string' '-lm=math' -e 'print(m.sin(0))' %s > %s",prog,out)
checkout("0.0
ALO ALO	20
")
RUN("env LUA_CPATH='./libs/?.so' lua -l lib2-v2 -e 'print(lib2.id())' > %s",out)
checkout("true
")
local a = "  assert(#arg == 3 and arg[1] == 'a' and
         arg[2] == 'b' and arg[3] == 'c')
  assert(arg[-1] == '--' and arg[-2] == "-e " and arg[-3] == '%s')
  assert(arg[4] == undef and arg[-4] == undef)
  local a, b, c = ...
  assert(... == 'a' and a == 'a' and b == 'b' and c == 'c')
"
a=string.format(a,progname)
prepfile(a)
RUN("lua "-e " -- %s a b c",prog)
prepfile("assert(arg)")
prepfile("assert(arg)",false,otherprog)
RUN("env LUA_PATH="?;;" lua -l%s - < %s",prog,otherprog)
RUN("echo "print(...)" | lua -e "arg[1] = 100" - > %s",out)
checkout("100
")
NoRun("'arg' is not a table","echo "" | lua -e "arg = 1" -")
RUN("echo 10 | lua -e "print=nil" -i > /dev/null 2> %s",out)
assert(string.find(getoutput(),"error calling 'print'"))
RUN("echo "io.stderr:write(1000)
cont" | lua -e "require'debug'.debug()" 2> %s",out)
checkout("lua_debug> 1000lua_debug> ")
print("testing warnings")
RUN("echo "io.stderr:write(1); warn[[XXX]]" | lua 2> %s",out)
checkout("1")
prepfile("warn("@allow")               -- unknown control, ignored
warn("@off", "XXX", "@off")  -- these are not control messages
warn("@off")                 -- this one is
warn("@on", "YYY", "@on")    -- not control, but warn is off
warn("@off")                 -- keep it off
warn("@on")                  -- restart warnings
warn("", "@on")              -- again, no control, real warning
warn("@on")                  -- keep it "started"
warn("Z", "Z", "Z")          -- common warning
")
RUN("lua -W %s 2> %s",prog,out)
checkout("Lua warning: @offXXX@off
Lua warning: @on
Lua warning: ZZZ
")
prepfile("warn("@allow")
-- create two objects to be finalized when closing state
-- the errors in the finalizers must generate warnings
u1 = setmetatable({}, {__gc = function () error("XYZ") end})
u2 = setmetatable({}, {__gc = function () error("ZYX") end})
")
RUN("lua -W %s 2> %s",prog,out)
checkprogout("ZYX)
XYZ)
")
prepfile("-- should be called last
print("creating 1")
setmetatable({}, {__gc = function () print(1) end})

print("creating 2")
setmetatable({}, {__gc = function ()
  print("2")
  print("creating 3")
  -- this finalizer should not be called, as object will be
  -- created after 'lua_close' has been called
  setmetatable({}, {__gc = function () print(3) end})
  print(collectgarbage())    -- cannot call collector here
  os.exit(0, true)
end})
")
RUN("lua -W %s > %s",prog,out)
checkout("creating 1
creating 2
2
creating 3
nil
1
")
prepfile("print(({...})[30])")
RUN("lua %s %s > %s",prog,string.rep(" a",30),out)
checkout("a
")
RUN("lua "-eprint(1)" -ea=3 -e "print(a)" > %s",out)
checkout("1
3
")
prepfile("(6*2-6) -- ===
a =
10
print(a)
a")
RUN("lua -e"_PROMPT='' _PROMPT2=''" -i < %s > %s",prog,out)
checkprogout("6
10
10

")
prepfile("a = [[b
c
d
e]]
=a")
RUN("lua -e"_PROMPT='' _PROMPT2=''" -i < %s > %s",prog,out)
checkprogout("b
c
d
e

")
local prompt = "alo"
prepfile(" --
a = 2
")
RUN("lua "-e_PROMPT='%s'" -i < %s > %s",prompt,prog,out)
local t = getoutput()
assert(string.find(t,prompt .. ".*" .. prompt .. ".*" .. prompt))
prepfile(" --
a = 2
")
RUN("lua -i < %s > %s",prog,out)
local t = getoutput()
prompt="> "
assert(string.find(t,prompt .. ".*" .. prompt .. ".*" .. prompt))
prompt="local C = 0;_PROMPT=setmetatable({},{__tostring = function () C = C + 1; return C end})"
prepfile(" --
a = 2
")
RUN("lua -e "%s" -i < %s > %s",prompt,prog,out)
local t = getoutput()
assert(string.find(t,"1 --
2a = 2
3
",1,true))
prepfile("debug = require "debug"
m = {x=0}
setmetatable(m, {__tostring = function(x)
  return tostring(debug.getinfo(4).currentline + x.x)
end})
error(m)
")
NoRun(progname .. ": 6
","lua %s",prog)
prepfile("error{}")
NoRun("error object is a table value","lua %s",prog)
local s = " --
function f ( x )
  local a = [[
xuxu
]]
  local b = "\
xuxu\n"
  if x == 11 then return 1 + 12 , 2 + 20 end  --[[ test multiple returns ]]
  return x + 1
  --\\
end
return( f( 100 ) )
assert( a == b )
do return f( 11 ) end  "
s=string.gsub(s," ","

")
prepfile(s)
RUN("lua -e"_PROMPT='' _PROMPT2=''" -i < %s > %s",prog,out)
checkprogout("101
13	22

")
prepfile("#comment in 1st line without \n at the end")
RUN("lua %s",prog)
prepfile("#comment
" .. string.dump(load("print(3)")),true)
RUN("lua %s > %s",prog,out)
checkout("3
")
prepfile(string.format("io.output(%q); io.write('alo')",out))
RUN("lua %s",prog)
checkout("alo")
RUN("lua -v  -e"print'hello'" > %s",out)
t=getoutput()
assert(string.find(t,"PUC%-Rio
hello"))
prepfile("os.exit(nil, true)")
RUN("lua %s",prog)
prepfile("os.exit(0, true)")
RUN("lua %s",prog)
prepfile("os.exit(true, true)")
RUN("lua %s",prog)
prepfile("os.exit(1, true)")
NoRun("","lua %s",prog)
prepfile("os.exit(false, true)")
NoRun("","lua %s",prog)
prepfile("  local x <close> = setmetatable({},
        {__close = function (self, err)
                     assert(err == nil)
                     print("Ok")
                   end})
  local e1 <close> = setmetatable({}, {__close = function () print(120) end})
  os.exit(true, true)
")
RUN("lua %s > %s",prog,out)
checkprogout("120
Ok
")
assert(os.remove(prog))
assert(os.remove(otherprog))
assert(not os.remove(out))
NoRun("unrecognized option '-h'","lua -h")
NoRun("unrecognized option '---'","lua ---")
NoRun("unrecognized option '-Ex'","lua -Ex")
NoRun("unrecognized option '-vv'","lua -vv")
NoRun("unrecognized option '-iv'","lua -iv")
NoRun("'-e' needs argument","lua -e")
NoRun("syntax error","lua -e a")
NoRun("'-l' needs argument","lua -l")
if T then
print("testing 'not enough memory' to create a state")
NoRun("not enough memory","env MEMLIMIT=100 lua")
warn("@store")
warn("@123","456","789")
assert(_WARN == "@123456789")
;
_WARN=false
warn("zip",""," ","zap")
assert(_WARN == "zip zap")
;
_WARN=false
warn("ZIP",""," ","ZAP")
assert(_WARN == "ZIP ZAP")
;
_WARN=false
warn("@normal")
end
local st,msg = pcall(warn)
assert(string.find(msg,"string expected"))
st,msg=pcall(warn,"SHOULD NOT APPEAR",{})
assert(string.find(msg,"string expected"))
print("+")
print("testing Ctrl C")
local function kill
(pid)
return os.execute(string.format("kill -INT %s 2> /dev/null",pid))
end
local function runback
(luaprg)
local shellprg = string.format("%s -e "%s" & echo $!",progname,luaprg)
local f = io.popen(shellprg,"r")
local pid = f:read()
print("(if test fails now, it may leave a Lua script running in background, pid " .. pid .. ")")
return f,pid
end
local f,pid = runback("    pcall(function () print(12); while true do end end); print(42)")
assert(f:read() == "12")
kill(pid)
assert(f:read() == "42")
assert(f:close())
print("done")
local f,pid = runback("    print(15); string.find(string.rep('a', 100000), '.*b')")
assert(f:read() == "15")
assert(os.execute("sleep 1"))
local n = 100
for i = 0, 100
do
if not kill(pid) then
n=i
break
end
end
assert(f:close())
assert(n >= 2)
print(string.format("done (with %d kills)",n))
print("OK")