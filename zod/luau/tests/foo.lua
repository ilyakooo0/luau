foosjis = nil

baz = bar[nil]
baz = bar

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
