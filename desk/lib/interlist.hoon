=<
|%
++  interlist
  |$  [sep val]
  $%
    [%double =val =sep tail=(interlist sep val)]
    [%single =val]
  ==
++  reverse
  |*  l=(interlist)
  ^+  l
  =/  tmp=(unit _?>(?=(%double -.l) +>.l))  ~
  |-
  ^+  l
  ?-  -.l
    %single
      ?~  tmp  l  [%double +.l u.tmp]
    %double
      %=  $
        l  +>+.l
        tmp
          ?~  tmp  `[+>-.l [%single +<.l]]
          `[+>-.l [%double +<.l u.tmp]]
      ==
  ==
++  parse
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
++  split-left-on
  |*  [is-pivot=$-(* *) l=(interlist)]
  ^-  (unit _[lhs=l pivot=+<.is-pivot rhs=l])
  ?-  -.l
    %single  ~
    %double
      ?:  (is-pivot sep.l)  `[[%single val.l] sep.l tail.l]
      =/  rest  $(l tail.l)
      ?~  rest  ~
      `[[%double val.l sep.l lhs.u.rest] pivot.u.rest rhs.u.rest]
  ==
++  split-right-on
  |*  [is-pivot=$-(* *) l=(interlist * *)]
  ^-  (unit _[lhs=l pivot=+<.is-pivot rhs=l])
  %+  bind  (split-left-on is-pivot (reverse l))
  |*  [a=(interlist * *) b=* c=(interlist * *)]  [(reverse c) b (reverse a)]
--
|%
++  rule-type
  |*  =rule
  $_
  =/  ret  q:$:rule
  ?>  ?=(^ ret)
  p.u.ret
--
