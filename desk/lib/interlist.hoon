=<
|%
++  interlist
  |$  [sep val]
  $%
    [%double =val =sep tail=(interlist sep val)]
    [%single =val]
  ==
++  parse-interlist
  |*  [s=rule v=rule]
  =/  val  (rule-type v)
  =/  sep  (rule-type s)
  %+  cook
    |*  [v=* rest=(list [* *])]
    ^-  (interlist sep val)
    =/  rrest  (flop rest)
    ?~  rrest  [%single v]
    =/  tail
      %+  roll  t.rrest
      |*  [[s=* v=*] _[acc=`(interlist sep val)`[%single +.i.rrest] last-sep=-.i.rrest]]
      [[%double v last-sep acc] s]
    [%double v +.tail -.tail]
  ;~(plug v (star ;~(plug s v)))
--
|%
++  rule-type
  |*  =rule
  $_
  =/  ret  q:$:rule
  ?>  ?=(^ ret)
  p.u.ret
--
