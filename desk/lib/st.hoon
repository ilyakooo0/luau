:: Two's complement encoded 64-bit signed integer
=<
|%
:: coerce an unsigned int to a signed int
::
++  new
  |=  x=@u
  ^-  @st
  (dis mask x)
++  to-s
  |=  x=@st
  ^-  @s
  (new:si ?!((sig x)) (abs x))
++  sig
  |=  x=@st
  ^-  ?
  ?!  =(0 (dis sign-mask x))
++  abs
  |=  x=@st
  ^-  @u
  ?.  (sig x)  `@u`x
  (dis mask +((mix mask x)))
++  inc
  |=  x=@st
  ^-  @st
  (dis mask +(x))
++  add
  |=  [x=@st y=@st]
  ^-  @st
  (dis mask (^add x y))
--
|%
++  mask  0xffff.ffff.ffff.ffff
++  sign-mask  0x8000.0000.0000.0000
--
