print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{52}\u{4b}")
local function foo
()
local dummy = {0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9,0xa,0xb,0xc,0xd,0xe,0xf,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f,0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x2e,0x2f,0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,0x3f,0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f,0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57,0x58,0x59,0x5a,0x5b,0x5c,0x5d,0x5e,0x5f,0x60,0x61,0x62,0x63,0x64,0x65,0x66,0x67,0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f,0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,0x78,0x79,0x7a,0x7b,0x7c,0x7d,0x7e,0x7f,0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9a,0x9b,0x9c,0x9d,0x9e,0x9f,0xa0,0xa1,0xa2,0xa3,0xa4,0xa5,0xa6,0xa7,0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf,0xb0,0xb1,0xb2,0xb3,0xb4,0xb5,0xb6,0xb7,0xb8,0xb9,0xba,0xbb,0xbc,0xbd,0xbe,0xbf,0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7,0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf,0xd0,0xd1,0xd2,0xd3,0xd4,0xd5,0xd6,0xd7,0xd8,0xd9,0xda,0xdb,0xdc,0xdd,0xde,0xdf,0xe0,0xe1,0xe2,0xe3,0xe4,0xe5,0xe6,0xe7,0xe8,0xe9,0xea,0xeb,0xec,0xed,0xee,0xef,0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,0xf8,0xf9,0xfa,0xfb,0xfc,0xfd,0xfe,0xff,0x100}
assert(((24.5 + 0.6) == 25.1))
local t = {["\u{66}\u{6f}\u{6f}"] = function (self,x)
return (x + self.x)
end,["\u{78}"] = 0xa}
t.t=t
assert((t:foo(1.5) == 11.5))
assert((t.t:foo(0.5) == 10.5))
assert((24.3 == 24.3))
assert(((function ()
return t.x
end)() == 0xa))
end
foo()
foo=nil
if _soft then
return 0xa
end
print("\u{74}\u{65}\u{73}\u{74}\u{69}\u{6e}\u{67}\u{20}\u{6c}\u{61}\u{72}\u{67}\u{65}\u{20}\u{70}\u{72}\u{6f}\u{67}\u{72}\u{61}\u{6d}\u{73}\u{20}\u{28}\u{3e}\u{36}\u{34}\u{6b}\u{29}")
local prog = "\u{24}\u{a}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{61}\u{2c}\u{62}\u{a}\u{a}\u{62}\u{20}\u{3d}\u{20}\u{7b}\u{24}\u{31}\u{24}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{30}\u{39}\u{20}\u{3d}\u{20}\u{36}\u{35}\u{35}\u{33}\u{34}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{30}\u{20}\u{3d}\u{20}\u{36}\u{35}\u{35}\u{33}\u{35}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{31}\u{20}\u{3d}\u{20}\u{36}\u{35}\u{35}\u{33}\u{36}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{32}\u{20}\u{3d}\u{20}\u{36}\u{35}\u{35}\u{33}\u{37}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{33}\u{20}\u{3d}\u{20}\u{31}\u{36}\u{37}\u{37}\u{37}\u{32}\u{31}\u{34}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{34}\u{20}\u{3d}\u{20}\u{31}\u{36}\u{37}\u{37}\u{37}\u{32}\u{31}\u{35}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{35}\u{20}\u{3d}\u{20}\u{31}\u{36}\u{37}\u{37}\u{37}\u{32}\u{31}\u{36}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{36}\u{20}\u{3d}\u{20}\u{31}\u{36}\u{37}\u{37}\u{37}\u{32}\u{31}\u{37}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{37}\u{20}\u{3d}\u{20}\u{30}\u{78}\u{37}\u{66}\u{66}\u{66}\u{66}\u{66}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{38}\u{20}\u{3d}\u{20}\u{2d}\u{30}\u{78}\u{37}\u{66}\u{66}\u{66}\u{66}\u{66}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{31}\u{39}\u{20}\u{3d}\u{20}\u{30}\u{78}\u{31}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{32}\u{30}\u{20}\u{3d}\u{20}\u{2d}\u{30}\u{78}\u{31}\u{66}\u{66}\u{66}\u{66}\u{64}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{32}\u{31}\u{20}\u{3d}\u{20}\u{2d}\u{36}\u{35}\u{35}\u{33}\u{34}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{32}\u{32}\u{20}\u{3d}\u{20}\u{2d}\u{36}\u{35}\u{35}\u{33}\u{35}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{32}\u{33}\u{20}\u{3d}\u{20}\u{2d}\u{36}\u{35}\u{35}\u{33}\u{36}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{32}\u{34}\u{20}\u{3d}\u{20}\u{2d}\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{2c}\u{a}\u{20}\u{20}\u{62}\u{33}\u{30}\u{30}\u{32}\u{35}\u{20}\u{3d}\u{20}\u{31}\u{35}\u{30}\u{31}\u{32}\u{2e}\u{35}\u{2c}\u{a}\u{20}\u{20}\u{24}\u{32}\u{24}\u{a}\u{7d}\u{3b}\u{a}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{62}\u{2e}\u{61}\u{35}\u{30}\u{30}\u{30}\u{38}\u{20}\u{3d}\u{3d}\u{20}\u{32}\u{35}\u{30}\u{30}\u{34}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{62}\u{5b}\u{22}\u{61}\u{31}\u{31}\u{22}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{2d}\u{35}\u{2e}\u{35}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{62}\u{2e}\u{61}\u{33}\u{33}\u{30}\u{30}\u{37}\u{20}\u{3d}\u{3d}\u{20}\u{2d}\u{31}\u{36}\u{35}\u{30}\u{33}\u{2e}\u{35}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{62}\u{2e}\u{61}\u{35}\u{30}\u{30}\u{30}\u{39}\u{20}\u{3d}\u{3d}\u{20}\u{2d}\u{32}\u{35}\u{30}\u{30}\u{34}\u{2e}\u{35}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{62}\u{5b}\u{22}\u{62}\u{22}\u{2e}\u{2e}\u{33}\u{30}\u{30}\u{32}\u{34}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{2d}\u{30}\u{78}\u{66}\u{66}\u{66}\u{66}\u{66}\u{66}\u{29}\u{a}\u{a}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{62}\u{3a}\u{78}\u{78}\u{78}\u{20}\u{28}\u{61}\u{2c}\u{62}\u{29}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{61}\u{2b}\u{62}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{62}\u{3a}\u{78}\u{78}\u{78}\u{28}\u{31}\u{30}\u{2c}\u{20}\u{31}\u{32}\u{29}\u{20}\u{3d}\u{3d}\u{20}\u{32}\u{32}\u{29}\u{20}\u{20}\u{20}\u{2d}\u{2d}\u{20}\u{70}\u{75}\u{73}\u{68}\u{73}\u{65}\u{6c}\u{66}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{6e}\u{6f}\u{6e}\u{2d}\u{63}\u{6f}\u{6e}\u{73}\u{74}\u{61}\u{6e}\u{74}\u{20}\u{69}\u{6e}\u{64}\u{65}\u{78}\u{a}\u{62}\u{5b}\u{22}\u{78}\u{78}\u{78}\u{22}\u{5d}\u{20}\u{3d}\u{20}\u{75}\u{6e}\u{64}\u{65}\u{66}\u{a}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{73}\u{20}\u{3d}\u{20}\u{30}\u{3b}\u{20}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{6e}\u{3d}\u{30}\u{a}\u{66}\u{6f}\u{72}\u{20}\u{61}\u{2c}\u{62}\u{20}\u{69}\u{6e}\u{20}\u{70}\u{61}\u{69}\u{72}\u{73}\u{28}\u{62}\u{29}\u{20}\u{64}\u{6f}\u{20}\u{73}\u{3d}\u{73}\u{2b}\u{62}\u{3b}\u{20}\u{6e}\u{3d}\u{6e}\u{2b}\u{31}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{2d}\u{2d}\u{20}\u{77}\u{69}\u{74}\u{68}\u{20}\u{33}\u{32}\u{2d}\u{62}\u{69}\u{74}\u{20}\u{66}\u{6c}\u{6f}\u{61}\u{74}\u{73}\u{2c}\u{20}\u{65}\u{78}\u{61}\u{63}\u{74}\u{20}\u{76}\u{61}\u{6c}\u{75}\u{65}\u{20}\u{6f}\u{66}\u{20}\u{27}\u{73}\u{27}\u{20}\u{64}\u{65}\u{70}\u{65}\u{6e}\u{64}\u{73}\u{20}\u{6f}\u{6e}\u{20}\u{73}\u{75}\u{6d}\u{6d}\u{61}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{6f}\u{72}\u{64}\u{65}\u{72}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{38}\u{31}\u{38}\u{30}\u{30}\u{30}\u{30}\u{30}\u{2e}\u{30}\u{20}\u{3c}\u{20}\u{73}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{73}\u{20}\u{3c}\u{20}\u{38}\u{31}\u{38}\u{36}\u{30}\u{30}\u{30}\u{30}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{6e}\u{20}\u{3d}\u{3d}\u{20}\u{37}\u{30}\u{30}\u{30}\u{31}\u{29}\u{a}\u{a}\u{61}\u{20}\u{3d}\u{20}\u{6e}\u{69}\u{6c}\u{3b}\u{20}\u{62}\u{20}\u{3d}\u{20}\u{6e}\u{69}\u{6c}\u{a}\u{70}\u{72}\u{69}\u{6e}\u{74}\u{27}\u{2b}\u{27}\u{a}\u{a}\u{6c}\u{6f}\u{63}\u{61}\u{6c}\u{20}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{66}\u{28}\u{78}\u{29}\u{20}\u{62}\u{3d}\u{78}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{a}\u{61}\u{20}\u{3d}\u{20}\u{66}\u{7b}\u{24}\u{33}\u{24}\u{7d}\u{20}\u{6f}\u{72}\u{20}\u{31}\u{30}\u{a}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{61}\u{3d}\u{3d}\u{31}\u{30}\u{29}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{62}\u{5b}\u{31}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{61}\u{31}\u{30}\u{22}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{62}\u{5b}\u{32}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{35}\u{20}\u{61}\u{6e}\u{64}\u{20}\u{62}\u{5b}\u{23}\u{62}\u{2d}\u{31}\u{5d}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{61}\u{35}\u{30}\u{30}\u{30}\u{39}\u{22}\u{29}\u{a}\u{a}\u{a}\u{66}\u{75}\u{6e}\u{63}\u{74}\u{69}\u{6f}\u{6e}\u{20}\u{78}\u{78}\u{78}\u{78}\u{20}\u{28}\u{78}\u{29}\u{20}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{62}\u{5b}\u{78}\u{5d}\u{20}\u{65}\u{6e}\u{64}\u{a}\u{a}\u{61}\u{73}\u{73}\u{65}\u{72}\u{74}\u{28}\u{78}\u{78}\u{78}\u{78}\u{28}\u{33}\u{29}\u{20}\u{3d}\u{3d}\u{20}\u{22}\u{61}\u{31}\u{31}\u{22}\u{29}\u{a}\u{a}\u{61}\u{20}\u{3d}\u{20}\u{6e}\u{69}\u{6c}\u{3b}\u{20}\u{62}\u{3d}\u{6e}\u{69}\u{6c}\u{a}\u{78}\u{78}\u{78}\u{78}\u{20}\u{3d}\u{20}\u{6e}\u{69}\u{6c}\u{a}\u{a}\u{72}\u{65}\u{74}\u{75}\u{72}\u{6e}\u{20}\u{31}\u{30}\u{a}\u{a}"
local function sig
(x)
return (((((x % 0x2) == 0x0)) and "") or "\u{2d}")
end
local F = {function ()
for i = 0xa, 0xc359
do
io.write("\u{61}",i,"\u{20}\u{3d}\u{20}",sig(i),(0x5 + ((((i - 0xa)) / 0x2))),"\u{2c}\u{a}")
end
end,function ()
for i = 0x754a, 0xc359
do
io.write("\u{62}",i,"\u{20}\u{3d}\u{20}",sig(i),(0x3aa5 + ((((i - 0x754a)) / 0x2))),"\u{2c}\u{a}")
end
end,function ()
for i = 0xa, 0xc359
do
io.write("\u{22}\u{61}",i,"\u{22}\u{2c}\u{20}",sig(i),(0x5 + ((((i - 0xa)) / 0x2))),"\u{2c}\u{a}")
end
end}
local file = os.tmpname()
io.output(file)
for s in string.gmatch(prog,"\u{24}\u{28}\u{5b}\u{5e}\u{24}\u{5d}\u{2b}\u{29}")
do
local n = tonumber(s)
if not n then
io.write(s)
else
F[n]()
end
end
io.close()
local result = dofile(file)
assert(os.remove(file))
print("\u{4f}\u{4b}")
return result