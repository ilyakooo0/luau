print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{67}\u{65}\u{6e}\u{65}\u{72}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{61}\u{6c}\u{20}\u{67}\u{61}\u{72}\u{62}\u{61}\u{67}\u{65}\u{20}\u{63}\u{6f}\u{6c}\u{6c}\u{65}\u{63}\u{74}\u{69}\u{6f}\u{6e}")
local debug = require("\u{64}\u{65}\u{62}\u{75}\u{67}")
assert(collectgarbage("\u{69}\u{73}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}"))
collectgarbage()
local oldmode = collectgarbage("\u{67}\u{65}\u{6e}\u{65}\u{72}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{61}\u{6c}")
do
local U = {}
collectgarbage()
assert((not (T or (T.gcage(U) == "\u{6f}\u{6c}\u{64}"))))
U[0x1]={["\u{78}"] = {0xea}}
assert((not (T or ((T.gcage(U) == "\u{74}\u{6f}\u{75}\u{63}\u{68}\u{65}\u{64}\u{31}") and (T.gcage(U[0x1]) == "\u{6e}\u{65}\u{77}")))))
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert((not (T or ((T.gcage(U) == "\u{74}\u{6f}\u{75}\u{63}\u{68}\u{65}\u{64}\u{32}") and (T.gcage(U[0x1]) == "\u{73}\u{75}\u{72}\u{76}\u{69}\u{76}\u{61}\u{6c}")))))
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert((not (T or ((T.gcage(U) == "\u{6f}\u{6c}\u{64}") and (T.gcage(U[0x1]) == "\u{6f}\u{6c}\u{64}\u{31}")))))
assert((U[0x1].x[0x1] == 0xea))
end
do
local function foo
()

end
local old = {0xa}
collectgarbage()
assert((not (T or (T.gcage(old) == "\u{6f}\u{6c}\u{64}"))))
setmetatable(old,{})
assert((not (T or (T.gcage(getmetatable(old)) == "\u{6f}\u{6c}\u{64}\u{30}"))))
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert((not (T or (T.gcage(getmetatable(old)) == "\u{6f}\u{6c}\u{64}\u{31}"))))
setmetatable(getmetatable(old),{["\u{5f}\u{5f}\u{67}\u{63}"] = foo})
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
end
do
local A = {}
A[0x1]=false
local function gcf
(obj)
A[0x1]=obj
assert((not (T or (T.gcage(obj) == "\u{6f}\u{6c}\u{64}\u{31}"))))
obj=nil
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
print(getmetatable(A[0x1]).x)
end
collectgarbage()
local obj = {}
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert((not (T or (T.gcage(obj) == "\u{73}\u{75}\u{72}\u{76}\u{69}\u{76}\u{61}\u{6c}"))))
setmetatable(obj,{["\u{5f}\u{5f}\u{67}\u{63}"] = gcf,["\u{78}"] = "\u{2b}"})
assert((not (T or (T.gcage(getmetatable(obj)) == "\u{6e}\u{65}\u{77}"))))
obj=nil
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
end
do
local old = {0xa}
collectgarbage()
local co = coroutine.create(function ()
local x = nil
local f = function ()
return x[0x1]
end
x=coroutine.yield(f)
coroutine.yield()
end)
local _,f = coroutine.resume(co)
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
old[0x1]={"\u{68}\u{65}\u{6c}\u{6c}\u{6f}"}
coroutine.resume(co,{0x7b})
co=nil
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert(((f() == 0x7b) and (old[0x1][0x1] == "\u{68}\u{65}\u{6c}\u{6c}\u{6f}")))
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert(((f() == 0x7b) and (old[0x1][0x1] == "\u{68}\u{65}\u{6c}\u{6c}\u{6f}")))
end
do
local t = setmetatable({},{["\u{5f}\u{5f}\u{6d}\u{6f}\u{64}\u{65}"] = "\u{6b}\u{76}"})
collectgarbage()
assert((not (T or (T.gcage(t) == "\u{6f}\u{6c}\u{64}"))))
t[0x1]={0xa}
assert((not (T or ((T.gcage(t) == "\u{74}\u{6f}\u{75}\u{63}\u{68}\u{65}\u{64}\u{31}") and (T.gccolor(t) == "\u{67}\u{72}\u{61}\u{79}")))))
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert((not (T or ((T.gcage(t) == "\u{74}\u{6f}\u{75}\u{63}\u{68}\u{65}\u{64}\u{32}") and (T.gccolor(t) == "\u{62}\u{6c}\u{61}\u{63}\u{6b}")))))
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert((not (T or (T.gcage(t) == "\u{6f}\u{6c}\u{64}"))))
t[0x1]={0xa}
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert((t[0x1] == nil))
end
if (T == nil) then
(Message or print)("\u{a}\u{20}\u{3e}\u{3e}\u{3e}\u{20}\u{74}\u{65}\u{73}\u{74}\u{43}\u{20}\u{6e}\u{6f}\u{74}\u{20}\u{61}\u{63}\u{74}\u{69}\u{76}\u{65}\u{3a}\u{20}\u{73}\u{6b}\u{69}\u{70}\u{70}\u{69}\u{6e}\u{67}\u{20}\u{73}\u{6f}\u{6d}\u{65}\u{20}\u{67}\u{65}\u{6e}\u{65}\u{72}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{61}\u{6c}\u{20}\u{74}\u{65}\u{73}\u{74}\u{73}\u{20}\u{3c}\u{3c}\u{3c}\u{a}")
print("\u{4f}\u{4b}")
return 
end
do
local U = T.newuserdata(0x0,0x1)
collectgarbage()
assert((T.gcage(U) == "\u{6f}\u{6c}\u{64}"))
debug.setuservalue(U,{["\u{78}"] = {0xea}})
assert(((T.gcage(U) == "\u{74}\u{6f}\u{75}\u{63}\u{68}\u{65}\u{64}\u{31}") and (T.gcage(debug.getuservalue(U)) == "\u{6e}\u{65}\u{77}")))
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert(((T.gcage(U) == "\u{74}\u{6f}\u{75}\u{63}\u{68}\u{65}\u{64}\u{32}") and (T.gcage(debug.getuservalue(U)) == "\u{73}\u{75}\u{72}\u{76}\u{69}\u{76}\u{61}\u{6c}")))
collectgarbage("\u{73}\u{74}\u{65}\u{70}",0x0)
assert(((T.gcage(U) == "\u{6f}\u{6c}\u{64}") and (T.gcage(debug.getuservalue(U)) == "\u{6f}\u{6c}\u{64}\u{31}")))
assert((debug.getuservalue(U).x[0x1] == 0xea))
end
assert(collectgarbage("\u{69}\u{73}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}"))
assert(collectgarbage("\u{69}\u{73}\u{72}\u{75}\u{6e}\u{6e}\u{69}\u{6e}\u{67}"))
collectgarbage(oldmode)
print("\u{4f}\u{4b}")