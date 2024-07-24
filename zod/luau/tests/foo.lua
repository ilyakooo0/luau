foosjis = nil

baz = bar[nil]
baz = bar(1).foo

i = 3
i, a[i] = i + 1, 20 >> 9

hello = "hellodkndjвговшов"

x = { [hello] = 8, hello = 12 }

;

test_cases = {
	{ 0x7fffffff,           "2147483647" },
	{ 2147483647,           "2147483647" },

	{ 0xffffffff,           "4294967295" },
	{ 4294967295,           "4294967295" },

	{ 0x7fffffffffffffff,   "9.2233720368548e+18" },
	{ 9223372036854775807,  "9.2233720368548e+18" },

	{ 0xffffffffffffffff,   "1.844674407371e+19" },
	{ 18446744073709551615, "1.844674407371e+19" },

	{ 0x100000000,          "4294967296" },
	{ 4294967296,           "4294967296" },

	{ 0x100000000000,       "17592186044416" },
	{ 17592186044416,       "17592186044416" },

	{ 0x80000000,           "2147483648" },
	{ 2147483648,           "2147483648" },

	{ 0x800000000000,       "1.4073748835533e+14" },
	{ 140737488355328,      "1.4073748835533e+14" },
}
::
helli
::
foo = {
	3.0, 3.1416, 314.16e-2, 0.31416E1, 34e1,
	0x0.1E, 0xA23p-4, 0xA23p-4, 0X1.921FB54442D18P+1, 0x1.fp10
}

do
	foo = 1
	return 8, foo;
end

print('the way of the future')

print 'hello'

h{key1 = 'Sonmi~451'}

goto helli

break

while true do
	break
end

repeat
do
	foo = 9
	;
end
until true


if l == 3 then a = a + 1 ; assert(getlocal(2, 1) == "(temporary)")
elseif l == 4 then a = a + 1; assert(getlocal(2, 1) == "A")
else ;
end

for i = 1, 100 do  
  karlSum = karlSum + i
end

for j = 100, 1, 1 do fredSum = fredSum + j end

for key, val in pairs(u) do
  print(key, val)
end

function Dog:new()                         
  newObj = {sound = 'woof'}                
  self.__index = self                      
  return setmetatable(newObj, self)        
end

function Dog:makeSound()                   
  print('I say ' .. self.sound)
end


local function g(x) return math.sin(x) end



local a = require('mod2')  
local b = require('mod2')  
function adder(x)
  return function (y) return x + y end
end


x = -1 + 8
if _VERSION ~= version then
  io.stderr:write("This test suite is for ", version,
                  ", not for ", _VERSION, "\nExiting tests")
  return
end

math.randomseed()
local random_x, random_y = math.randomseed()
do
  -- set random seed
  local random_x, random_y = math.randomseed()
  print(string.format("random seeds: %d, %d", random_x, random_y))
end
