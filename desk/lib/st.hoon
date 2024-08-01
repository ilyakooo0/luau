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
++  from-s
  |=  x=@s
  ^-  @st
  %-  ?.  (syn:si x)  neg  |=(x=@st x)
  (dis abs-mask (abs:si x))
++  neg
  |=  x=@st
  ^-  @st
  (dis mask +((mix mask x)))
++  sig
  |=  x=@st
  ^-  ?
  ?!  =(0 (dis sign-mask x))
++  abs
  |=  x=@st
  ^-  @u
  ?.  (sig x)  `@u`x  `@u`(neg x)
++  inc
  |=  x=@st
  ^-  @st
  (dis mask +(x))
++  add
  |=  [x=@st y=@st]
  ^-  @st
  (dis mask (^add x y))
++  sub
  |=  [x=@st y=@st]
  ^-  @st
  (from-s (dif:si (to-s x) (to-s y)))
++  mul
  |=  [x=@st y=@st]
  ^-  @st
  (from-s (pro:si (to-s x) (to-s y)))
++  div
  |=  [x=@st y=@st]
  ^-  @st
  =/  [x=@s y=@s]  [(to-s x) (to-s y)]
  =/  fra  (fra:si x y)
  =/  res  (from-s fra)
  ?:  |(=(0 (rem:si x y)) (syn:si fra))  res
  (dec res)
++  mod
  |=  [x=@st y=@st]
  ^-  @st
  (sub x (mul (div x y) y))
++  mask  0xffff.ffff.ffff.ffff
--
|%
++  abs-mask  0x7fff.ffff.ffff.ffff
++  sign-mask  0x8000.0000.0000.0000
--
