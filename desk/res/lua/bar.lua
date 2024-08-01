assert(010 .. 020 .. -030 == "1020-30")
x = - 2 ^ - 3^4

x = 1

print(_ENV)
print(_ENV._ENV)

local foo = _ENV

-- local x = 8

do
  _ENV = {x = 2, print = print}
  -- local x = 3
  print(x)
  print(_ENV)
end

print(_ENV)
print(_ENV._ENV)

print(foo._ENV)
