/-  *lua
/+  st
=<
|=  =chunk
((eval-chunk chunk) *state)
|%
++  eval-chunk
  |=  =chunk
  ^-  (eval-m value)
  ?-  -.chunk
    %blok  (eval-blok +.chunk)
  ==
++  object-id  |$  obj  @
++  objects
  |$  obj  [objs=(map (object-id obj) obj) next-id=(object-id obj)]
+$  value
  $%
    [%table val=(object-id table) meta=(unit (object-id table))]
    [%string string]
    [%num numeral]
    [%multires (lest value)]
    [%true ~]
    [%false ~]
    [%nil ~]
  ==
+$  lval
  $%
    [%var name]
    [%table-field (object-id table) value]
  ==
+$  table  (map value value)
+$  state
  $:
    tables=$~([(malt ~[[0 *table]]) 1] (objects table))
    global-env=table
    local-envs=$~(~[(malt ~[['_ENV' table+[0 ~]]])] (lest (map name value)))
  ==
++  eval-m
  |$  [val]
  $-(state [st=state val=val])
++  pure
  |*  x=*
  ^-  (eval-m _x)
  |=(st=state [st x])
++  bind
  |*  =mold
  |*  [prev=(eval-m) cont=$-(* (eval-m mold))]
  ^+  $:cont
  |=  st=state
  =/  [st=state val=_val:$:prev]  (prev st)
  ((cont val) st)
++  get-state
  ^-  (eval-m state)
  |=  st=state
  [st st]
++  set-state
  |=  st=state
  ^-  (eval-m ~)
  |=  state
  [st ~]
++  eval-blok
  =<
  |=  =blok
  ^-  (eval-m value)
  %-  with-local
  =/  body  body.blok
  |-
  ^-  (eval-m value)
  ?~  body
    ?~  ret.blok  (pure nil+~)
    ?~  u.ret.blok  (pure nil+~)
    ;<  rets=(lest value)  bind  (eval-exprlist u.u.ret.blok)
    (pure (multires rets))
  ;<  ~  bind  (eval-stat i.body)
  ;<  ret=value  bind  $(body t.body)
  (pure ret)
  |%
  ++  with-local
    |*  act=(eval-m)
    ^-  _act
    ;<  ~  bind  push-local
    ;<  res=_val:$:act  bind  act
    ;<  ~  bind  pop-local
    (pure res)
  ++  push-local
    ^-  (eval-m ~)
    |=  st=state
    =.  local-envs.st  [*(map name value) local-envs.st]
    [st ~]
  ++  pop-local
    ^-  (eval-m ~)
    |=  st=state
    =.  local-envs.st
      ?~  t.local-envs.st  !!
      t.local-envs.st
    [st ~]
  --
++  multires
  |=  vals=(lest value)
  ^-  value
  ?~  t.vals  i.vals
  multires+vals
++  eval-exprlist
  |=  vals=exprlist
  ^-  (eval-m (lest value))
  ;<  val=value  bind  (eval-expr i.vals)
  ?~  t.vals  (pure [val ~])
  ;<  tail=(list value)  bind  $(vals t.vals)
  (pure [val tail])
++  eval-stat
  |=  =stat
  ^-  (eval-m ~)
  ?+  -.stat  !!
    %asmnt
      ;<  lhs=(lest lval)  bind  (process-varlist +<.stat)
      ;<  rhs=(lest value)  bind  (eval-exprlist +>.stat)
      =/  asmnts  (zip lhs (normalize-multires-exprlist rhs))
      |-
      ?~  asmnts  (pure ~)
      ;<  *  bind
        ?-  -<.i.asmnts
          %var  ((set-var ->.i.asmnts) +.i.asmnts)
          %table-field  
            ;<  tabl=table  bind  (get-table ->-.i.asmnts)
            (set-table ->-.i.asmnts (~(put by tabl) ->+.i.asmnts +.i.asmnts))
        ==
      $(asmnts t.asmnts)
    %local-asmnt
      =/  lhs=(list name)
        %+  turn  attrnamelist.stat
        |=  [=name attr=(unit attrib)]
        ?>  ?=(~ attr)
        name
      ;<  actual-values=(list [name value])  bind  
        ?~  rhs.stat  (pure ~)
        ;<  rhs=(list value)  bind  (eval-exprlist u.rhs.stat)
        (pure (zip lhs rhs))
      ;<  st=state  bind  get-state
      =.  i.local-envs.st
        %-  ~(uni by i.local-envs.st)
        %-  malt
        (weld (turn lhs |=(=name [name `value`nil+~])) actual-values)
      (set-state st)
  ==
++  set-var
  |=  var=name
  |=  val=value
  ^-  (eval-m ~)
  ;<  envs=(list (map name value))  bind  get-local-envs
  =/  new-envs=(unit (lest (map name value)))
    |-
    ^-  (unit (lest (map name value)))
    ?~  envs  ~
    ?.  (~(has by i.envs) var)
      =/  rest  $(envs t.envs)
      ?~  rest  ~
      `[i.envs u.rest]
    `[(~(put by i.envs) var val) t.envs]
  ^-  (eval-m ~)
  ?.  ?=(~ new-envs)
    |=  st=state
    =.  local-envs.st  u.new-envs
    [st ~]
  =/  global-env  (need ((get-from-local-envs envs) '_ENV'))
  :: TODO: proper error
  ?+  -.global-env  !!
    %table
      ;<  tabl=table  bind  (get-table +<.global-env)
      (set-table +<.global-env (~(put by tabl) (string-val var) val))
  ==
++  normalize-multires-exprlist
  |=  vals=(list value)
  ^-  (list value)
  ?~  vals  ~
  ?~  t.vals  ~[(normalize-multires i.vals)]
  [i.vals $(vals t.vals)]
++  normalize-multires
  |=  val=value
  ^-  value
  ?+  -.val  val
    %multires
      =/  res=(lest value)
        =/  vals=(lest value)  +.val
        |-
        ?~  t.vals
          =/  tail=value  (normalize-multires i.vals)
          ?:  ?=(%multires -.tail)  +.tail  [tail ~]
        [i.vals $(vals t.vals)]
      ?~  t.res  i.res
      multires+res
  ==
++  process-varlist
  =<
  |=  =varlist
  ^-  (eval-m (lest lval))
  ;<  val=lval  bind  (process-var i.varlist)
  ?~  t.varlist  (pure ~[val])
  ;<  tail=(list lval)  bind  $(varlist t.varlist)
  (pure [val tail])
  |%
  ++  process-var
    |=  =var
    ^-  (eval-m lval)
    ?-  -.var
      %name  (pure var++.var)
      %indexed
        ;<  prefix=value  bind  (eval-prefix-expr +<.var)
        ;<  idx=value  bind  (eval-expr +>.var)
        :: TODO: proper error
        ?.  ?=(%table -.prefix)  !!
        (pure table-field+[val.prefix idx])
      %dot
        ;<  prefix=value  bind  (eval-prefix-expr +<.var)
        :: TODO: proper error
        ?.  ?=(%table -.prefix)  !!
        (pure table-field+[val.prefix (string-val +>.var)])
    ==
  --
++  eval-expr
  |=  =expr
  ^-  (eval-m value)
  ?+  -.expr  !!
    %false  (pure expr)
    %true  (pure expr)
    %nil  (pure expr)
    %string  (pure expr)
    %num  (pure expr)
    %binop  (eval-binop +.expr)
    %prefix-expr  (eval-prefix-expr +.expr)
    %unop  (eval-unop +.expr)
    %table
      ;<  tabl-id=(object-id table)  bind  (eval-table +.expr)
      (pure table+[tabl-id ~])
  ==
++  eval-table
  |=  tabl=^table
  =<
  ^-  (eval-m (object-id table))
  ;<  felds=(list [value value])  bind
    =/  counter  1
    |-
    ?~  tabl  (pure ~)
    ?-  -.i.tabl
      %keyed
        ;<  k=value  bind  (eval-expr +<.i.tabl)
        ;<  v=value  bind  (eval-expr +>.i.tabl)
        ;<  tail=(list [value value])  bind  $(tabl t.tabl)
        (pure [[k v] tail]) 
      %unkeyed
        ;<  v=value  bind  (eval-expr +.i.tabl)
        ?:  &(?=(~ t.tabl) ?=(%multires -.v))
          =/  vals=(list value)  +.v
          %-  pure
          ^-  (list [value value])
          |-
          ?~  vals  ~
          [[num+int+(new:st counter) i.vals] $(vals t.vals, counter +(counter))]
        ;<  tail=(list [value value])  bind  $(tabl t.tabl, counter +(counter))
        (pure [[num+int+(new:st counter) v] tail])
    ==
  (new-table (malt felds))
  |%
  --
++  eval-unop
  |=  [op=unop =expr]
  ^-  (eval-m value)
  ?+  op  !!
    %minus
      ;<  val=value  bind  (eval-expr expr)
      ;<  num=numeral  bind  (assert-numeral val)
      %-  pure
      ?-  -.num
        %int  num+int+(neg:st +.num)
        %float  num+float+(sub:rd *@rd +.num)
      ==
    %not
      ;<  val=value  bind  (eval-expr expr)
      %-  pure
      ?:  (falsy val)  [%false ~]  [%true ~]
    %sig
      ;<  val=value  bind  (eval-expr expr)
      ;<  n=numeral  bind  (assert-numeral val)
      ;<  i=@st  bind  (to-int n)
      %-  pure
      num+int+(mix i mask:st)
  ==
++  eval-binop
  |=  [lhs=expr op=binop rhs=expr]
  ^-  (eval-m value)
  =<
  ?+  op  !!
    %add
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  unified=unified-numerals  bind  (unify-numeral-values lhs rhs)
      %-  pure
      :-  %num
      ?-  -.unified
        %i  :-  %int  (add:st a.unified b.unified)
        %f  :-  %float  (add:rd a.unified b.unified)
      ==
    %sub
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  unified=unified-numerals  bind  (unify-numeral-values lhs rhs)
      %-  pure
      :-  %num
      ?-  -.unified
        %i  :-  %int  (sub:st a.unified b.unified)
        %f  :-  %float  (sub:rd a.unified b.unified)
      ==
    %mul
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  unified=unified-numerals  bind  (unify-numeral-values lhs rhs)
      %-  pure
      :-  %num
      ?-  -.unified
        %i  :-  %int  (mul:st a.unified b.unified)
        %f  :-  %float  (mul:rd a.unified b.unified)
      ==
    %int-div
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  unified=unified-numerals  bind  (unify-numeral-values lhs rhs)
      %-  pure
      :-  %num
      ?-  -.unified
        %i  :-  %int  (div:st +.unified)
        %f  :-  %float  (int-div-float +.unified)
      ==
    %mod
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  unified=unified-numerals  bind  (unify-numeral-values lhs rhs)
      %-  pure
      :-  %num
      ?-  -.unified
        %i  :-  %int  (mod:st +.unified)
        %f
          :-  %float
          (sub:rd a.unified (mul:rd (int-div-float +.unified) b.unified))
      ==
    %div
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  lhs=numeral  bind  (assert-numeral lhs)
      ;<  rhs=numeral  bind  (assert-numeral rhs)
      %-  pure  num+float+(div:rd (to-float lhs) (to-float rhs))
    %exp  !!
    %band
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  lhs=numeral  bind  (assert-numeral lhs)
      ;<  rhs=numeral  bind  (assert-numeral rhs)
      ;<  lhs=@st  bind  (to-int lhs)
      ;<  rhs=@st  bind  (to-int rhs)
      %-  pure
      num+int+(dis lhs rhs)
    %bor
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  lhs=numeral  bind  (assert-numeral lhs)
      ;<  rhs=numeral  bind  (assert-numeral rhs)
      ;<  lhs=@st  bind  (to-int lhs)
      ;<  rhs=@st  bind  (to-int rhs)
      %-  pure
      num+int+(con lhs rhs)
    %bxor
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  lhs=numeral  bind  (assert-numeral lhs)
      ;<  rhs=numeral  bind  (assert-numeral rhs)
      ;<  lhs=@st  bind  (to-int lhs)
      ;<  rhs=@st  bind  (to-int rhs)
      %-  pure
      num+int+(mix lhs rhs)
    %rshft
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  lhs=numeral  bind  (assert-numeral lhs)
      ;<  rhs=numeral  bind  (assert-numeral rhs)
      ;<  lhs=@st  bind  (to-int lhs)
      ;<  rhs=@st  bind  (to-int rhs)
      %-  pure
      num+int+(dis mask:st (?:((sig:st rhs) lsh rsh) [0 (abs:st rhs)] lhs))
    %lshft
      ;<  lhs=value  bind  (eval-expr lhs)
      ;<  rhs=value  bind  (eval-expr rhs)
      ;<  lhs=numeral  bind  (assert-numeral lhs)
      ;<  rhs=numeral  bind  (assert-numeral rhs)
      ;<  lhs=@st  bind  (to-int lhs)
      ;<  rhs=@st  bind  (to-int rhs)
      %-  pure
      num+int+(dis mask:st (?:((sig:st rhs) rsh lsh) [0 (abs:st rhs)] lhs))
    %or
      ;<  lhs=value  bind  (eval-expr lhs)
      ?.  (falsy lhs)  (pure lhs)
      (eval-expr rhs)
    %and
      ;<  lhs=value  bind  (eval-expr lhs)
      ?:  (falsy lhs)  (pure lhs)
      (eval-expr rhs)
  ==
  |%
  ++  show-numeral
    |=  n=numeral
    ^-  tape
    ?-  -.n
      %int  (scow %s (to-s:st +.n))
      %float  (scow %rd +.n)
    ==
  ++  int-div-float
    |=  [a=@rd b=@rd]
    =/  whole=(unit @s)  (~(toi rd %d) (div:rd a b)) 
    ?~  whole  (div:rd .~0 .~0)
    (san:rd u.whole)
  +$  unified-numerals  $%([%i a=@st b=@st] [%f a=@rd b=@rd])
  ++  unify-numeral-values
    |=  [a=value b=value]
    ^-  (eval-m unified-numerals)
    ;<  a=numeral  bind  (assert-numeral a)
    ;<  b=numeral  bind  (assert-numeral b)
    (pure (unify-numerals a b))
  ++  unify-numerals
    |=  [a=numeral b=numeral]
    ^-  unified-numerals
    ?:  &(?=(%int -.a) ?=(%int -.b))  [%i +.a +.b]
    [%f (to-float a) (to-float b)]
  ++  to-float
    |=  n=numeral
    ^-  @rd
    ?:  ?=(%float -.n)  +.n
    (san:rd (to-s:st +.n))
  --
++  to-int
  |=  n=numeral
  ^-  (eval-m @st)
  ?:  ?=(%int -.n)  (pure +.n)
  =/  i=(unit @s)  (toi:rd +.n)
  :: TODO: proper error
  ?~  i  !!
  =/  i  u.i
  =/  cycled  (san:rd i)
  :: TODO: proper error
  :: checks that we don't lose any information
  ?.  =(+.n cycled)  !!
  (pure (from-s:st i))
++  falsy
  |=  v=value
  ^-  ?
  ?+  -.v  |
    %false  &
    %nil  &
  ==
++  assert-numeral
  |=  [a=value]
  ^-  (eval-m numeral)
  :: TODO: throw a proper error
  ?.  ?=(%num -.a)  !!
  (pure +.a)
++  eval-prefix-expr
  |=  =prefix-expr
  ^-  (eval-m value)
  ?-  -.prefix-expr
    %expr  (eval-expr +.prefix-expr)
    %call  (eval-functioncall +.prefix-expr)
    %var
      ?-  +<.prefix-expr
        %name  (lookup-var +>.prefix-expr)
        %dot
          ;<  tabl=value  bind  (eval-prefix-expr +>-.prefix-expr)
          (lookup-table-field tabl (string-val +>+.prefix-expr))
        %indexed
          ;<  tabl=value  bind  (eval-prefix-expr +>-.prefix-expr)
          ;<  idx=value  bind  (eval-expr +>+.prefix-expr)
          (lookup-table-field tabl idx)
      ==
  ==
++  lookup-table-field
  |=  [val=value fild=value]
  ^-  (eval-m value)
  :: TODO: proper error
  ?+  -.val  !!
    %table
      ;<  tabl=table  bind  (get-table val.val)
      =/  res  (~(get by tabl) fild)      
      :: TODO: error
      ?~  res  !!
      (pure u.res)
  ==
++  lookup-var
  |=  =name
  ^-  (eval-m value)
  ;<  envs=(list (map ^name value))  bind  get-local-envs
  =/  get-local  (get-from-local-envs envs)
  =/  local=(unit value)  (get-local name)
  ?.  ?=(~ local)  (pure u.local)
  =/  global-env  (get-local '_ENV')
  ?~  global-env  !!
  (lookup-table-field u.global-env (string-val name))
++  get-from-local-envs
  |=  envs=(list (map name value))
  |=  =name
  ^-  (unit value)
  ?~  envs  ~
  =/  val=(unit value)  (~(get by i.envs) name)
  ?~  val  $(envs t.envs)
  val
++  string-val
  |=  val=@t
  ^-  value
  string+(trip val)
++  get
  |*  f=$-(state *)
  ^-  (eval-m _$:f)
  |=  st=state
  [st (f st)]
++  get-table
  |=  id=(object-id table)
  ^-  (eval-m table)
  ;<  tables=(objects table)  bind
    %-  get  |=(st=state tables.st)
  =/  table  (~(get by objs.tables) id)
  :: TODO: proper error
  ?~  table  !!
  (pure u.table)
++  set-table
  |=  [id=(object-id table) tabl=table]
  ^-  (eval-m ~)
  |=  st=state
  =.  objs.tables.st  (~(put by objs.tables.st) id tabl)
  [st ~]
++  get-local-envs
  ^-  (eval-m (list (map name value)))
  %-  get  |=(st=state local-envs.st)
++  eval-functioncall
  |=  =functioncall
  ^-  (eval-m value)
  !!
++  new-table
  |=  tabl=table
  ^-  (eval-m (object-id table))
  |=  st=state
  =/  id  next-id.tables.st
  =.  next-id.tables.st  +(id)
  =.  objs.tables.st  (~(put by objs.tables.st) id tabl)
  [st id]
++  zip
  |*  [lhs=(list) rhs=(list)]
  ^-  (list [_?<(?=(~ lhs) i.lhs) _?<(?=(~ rhs) i.rhs)])
  ?:  |(?=(~ lhs) ?=(~ rhs))  ~
  [[i.lhs i.rhs] $(lhs t.lhs, rhs t.rhs)]
--
