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
if type(y) ~= "\115\116\114\105\110\103" then
local mt = getmetatable(y)
local mm = mt and rawget(mt,mtname)
if mm then
return mm(x,y)
end
end
error("\97\116\116\101\109\112\116\32\116\111\32\39" .. strsub(mtname,3) .. "\39\32\97\32" .. type(x) .. "\32\119\105\116\104\32\97\32" .. type(y),4)
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
local x,y = checkargs(x,y,"\95\95\98\97\110\100")
return y and x & y or x
end
smt.__bor=function (x,y)
local x,y = checkargs(x,y,"\95\95\98\111\114")
return y and x | y or x
end
smt.__bxor=function (x,y)
local x,y = checkargs(x,y,"\95\95\98\120\111\114")
return y and x ~ y or x
end
smt.__shl=function (x,y)
local x,y = checkargs(x,y,"\95\95\115\104\108")
return y and x << y or x
end
smt.__shr=function (x,y)
local x,y = checkargs(x,y,"\95\95\115\104\114")
return y and x >> y or x
end
smt.__bnot=function (x)
local x,y = checkargs(x,x,"\95\95\98\110\111\116")
return y and ~ x or x
end