local tonumber,tointeger = tonumber,math.tointeger
local type,getmetatable,rawget,error = type,getmetatable,rawget,error
local strsub = string.sub
local print = print
_ENV=nil
local function toint
(x)
x=tonumber(x)
if not x then
return false
end
return tointeger(x)
end
local function trymt
(x,y,mtname)
if type(y) ~= "\u{73}\u{74}\u{72}\u{69}\u{6e}\u{67}" then
local mt = getmetatable(y)
local mm = mt and rawget(mt,mtname)
if mm then
return mm(x,y)
end
end
error("\u{61}\u{74}\u{74}\u{65}\u{6d}\u{70}\u{74}\u{20}\u{74}\u{6f}\u{20}\u{27}" .. strsub(mtname,0x3) .. "\u{27}\u{20}\u{61}\u{20}" .. type(x) .. "\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{61}\u{20}" .. type(y),0x4)
end
local function checkargs
(x,y,mtname)
local xi = toint(x)
local yi = toint(y)
if xi and yi then
return xi,yi
else
return trymt(x,y,mtname),nil
end
end
local smt = getmetatable("")
smt.__band=function (x,y)
local x,y = checkargs(x,y,"\u{5f}\u{5f}\u{62}\u{61}\u{6e}\u{64}")
return y and x & y or x
end
smt.__bor=function (x,y)
local x,y = checkargs(x,y,"\u{5f}\u{5f}\u{62}\u{6f}\u{72}")
return y and x | y or x
end
smt.__bxor=function (x,y)
local x,y = checkargs(x,y,"\u{5f}\u{5f}\u{62}\u{78}\u{6f}\u{72}")
return y and x ~ y or x
end
smt.__shl=function (x,y)
local x,y = checkargs(x,y,"\u{5f}\u{5f}\u{73}\u{68}\u{6c}")
return y and x << y or x
end
smt.__shr=function (x,y)
local x,y = checkargs(x,y,"\u{5f}\u{5f}\u{73}\u{68}\u{72}")
return y and x >> y or x
end
smt.__bnot=function (x)
local x,y = checkargs(x,x,"\u{5f}\u{5f}\u{62}\u{6e}\u{6f}\u{74}")
return y and ~ x or x
end