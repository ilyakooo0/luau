/-  *lua
/+  st
/+  interlist
/+  *bintree
=<
apex
|%
++  apex
  %^  tnee  %apex  ast
  ;~  pfix
    %-  punt
    ;~  plug
      hax
      (star ;~(less (just '\0a') next))
    ==
    ::
    %+  ifix  [ws ws]
    (cook |=(=blok [%blok blok]) parse-blok)
  ==
:: The expressions that are separated by binary operators
::
++  parse-atomic-expr
  %^  tnee  %parse-atomic-expr  expr
  ;~  pose
    (cold [%nil ~] (jest 'nil'))
    ::
    (cold [%true ~] (jest 'true'))
    ::
    (cold [%false ~] (jest 'false'))
    ::
    %+  cook
      |=(=numeral [%num numeral])
    parse-numeral
    ::
    %+  cook
      |=(=prefix-expr [%prefix-expr prefix-expr])
    (knee *prefix-expr |.(parse-prefix-expr))
    ::
    %+  cook
      |=(=table [%table table])
    parse-table
    ::
    %+  cook
      |=(=string [%string string])
    parse-string
    ::
    (cold [%wildcard ~] (jest '...'))
    ::
    %+  cook
      |=(=funcbody [%functiondef funcbody])
    ;~  pfix
      (jest 'function')
      ws
      parse-funcbody
    ==
    ::
    %+  cook  |=  [=unop =expr]  [%unop unop expr]
    ;~  plug
      ;~  pose
        ;~  sfix
          ;~  pose
            (cold %minus (just '-'))
            (cold %sig (just '~'))
            (cold %hax (just '#'))
          ==
          ws
        ==
        ;~  sfix
          (cold %not (jest 'not'))
          ;~(less parse-name ws)
        ==
      ==
      %+  knee  *expr  |.(parse-expr)
    ==
  ==
:: Parse expressions separated by binary operators
::
++  parse-expr-list
  %^  tnee  %parse-expr-list  (interlist:interlist binop expr)
  %+  parse:interlist  (ifix [ws ws] parse-binop)  parse-atomic-expr
:: TODO: This is mock and should take operator priority into account.
::
++  process-expr-list
  =<
  |=  l=(interlist:interlist binop expr)
  ^-  expr
  %-  strip-tree
  %-  (process-left-assoc ~[%or])
  %-  (process-left-assoc ~[%and])
  %-  (process-left-assoc ~[%lt %gt %lteq %gteq %neq %eq])
  %-  (process-left-assoc ~[%bor])
  %-  (process-left-assoc ~[%bxor])
  %-  (process-left-assoc ~[%band])
  %-  (process-left-assoc ~[%rshft %lshft])
  %-  (process-right-assoc ~[%concat])
  %-  (process-left-assoc ~[%add %sub])
  %-  (process-left-assoc ~[%mul %div %int-div %mod])
  %-  (process-left-assoc ~[%pow])
  [%leaf l]
  |%
  ++  strip-tree
    |=  tree=(bintree binop (interlist:interlist binop expr))
    ^-  expr
    ?-  -.tree
      %leaf  ?>  ?=(%single +<.tree)  +>.tree
      %node  [%binop $(tree l.tree) n.tree $(tree r.tree)]
    ==
  ++  process-right-assoc
    |=  ops=(lest binop)
    |=  tree=(bintree binop (interlist:interlist binop expr))
    ^+  tree
    ?-  -.tree
      %leaf
        =/  l  +.tree
        |-
        =/  splitted  (split-left-on:interlist |=(op=binop (elem op ops)) l)
        ?~  splitted  [%leaf l]
        [%node $(l lhs.u.splitted) pivot.u.splitted $(l rhs.u.splitted)]
      %node
        [%node $(tree l.tree) n.tree $(tree r.tree)]
    ==
  ++  process-left-assoc
    |=  ops=(lest binop)
    |=  tree=(bintree binop (interlist:interlist binop expr))
    ^+  tree
    ?-  -.tree
      %leaf
        =/  l  +.tree
        |-
        =/  splitted  (split-right-on:interlist |=(op=binop (elem op ops)) l)
        ?~  splitted  [%leaf l]
        [%node $(l lhs.u.splitted) pivot.u.splitted $(l rhs.u.splitted)]
      %node
        [%node $(tree l.tree) n.tree $(tree r.tree)]
    ==
  --
++  parse-expr
  %^  tnee  %parse-expr  expr
  %+  cook  process-expr-list  parse-expr-list
++  parse-parened-expr
  %^  tnee  %parse-parened-expr  prefix-expr
  %+  cook
    |=([=expr] [%expr expr])
  (ifix [(just '(') (just ')')] (knee *expr |.(parse-expr)))
++  parse-string
  %^  tnee  %parse-string  string
  =>
  |%
  ++  parse-string
    |=  quot=char
    =/  quot  (just quot)
    %+  cook
      |=([* =tape *] tape)
    ;~  plug
      quot
      %+  cook  zing
      %-  star
      ;~  less  quot
        ;~  pose
          %+  cold  ~['\07']  (jest '\\a')
          %+  cold  ~['\08']  (jest '\\b')
          %+  cold  ~['\0c']  (jest '\\f')
          %+  cold  ~['\0a']  (jest '\\n')
          %+  cold  ~['\0d']  (jest '\\r')
          %+  cold  ~['\09']  (jest '\\t')
          %+  cold  ~['\0b']  (jest '\\v')
          %+  cold  ~['\\']  (jest '\\\\')
          %+  cold  ~['"']  (jest '\\"')
          %+  cold  ~['\'']  (jest '\\\'')
          %+  cold  ~['\0a']  (jest '\\\0a')
          %+  cold  ~  ;~(plug (jest '\\z') gaw)
          ::
          ;~  pfix
            (jest '\\x')
            ;<  hex-digits=tape  bind  ;~(plug next next (easy ~))
            =/  digit=(unit @)  (rust hex-digits hex)
            ?~  digit  fail  (easy ~[`@`u.digit])
          ==
          ::
          ;~  pfix
            (jest '\\')
            ;<  digits=tape  bind  (stun [1 3] (shim '0' '9'))
            =/  digit=(unit @)  (rust digits dem)
            ?~  digit  fail  (easy ~[`@`u.digit])
          ==
          ::
          %+  cook
            |=  [* point=@ *]  ~[point]
          ;~  plug
            (jest '\\u{')
            hex
            (just '}')
          ==
          ::
          %+  cook  |=(char=@ ~[char])
          next
        ==
      ==
      quot
    ==
  --
  ;~  pose
    (parse-string '"')
    (parse-string '\'')
    ::
    %-  long-brackets
    |*  closing=rule 
    ;~  pfix
      (punt nl)
      %-  star
      ;~  less  closing  next
      ==
    ==
  ==
++  parse-table
  %^  tnee  %parse-table  table
  %+  cook
    |=([* =table *] table)
  ;~  (glue ws)
    (just '{')
    parse-field-list
    (just '}')
  ==
++  parse-field-list
  %^  tnee  %parse-field-list  field-list
  =>
  |%
  ++  field-sep
    ;~  pose
      com
      mic
    ==
  --
  %+  cook
    |=([=field-list *] field-list)
  ;~  (glue ws)
    (more (ifix [ws ws] field-sep) parse-field)
    (punt field-sep)
  ==
++  parse-field
  %+  knee  *field
  |.
  %^  tnee  %parse-field  field
  ;~  pose
    %+  cook
      |=([* key=expr * * val=expr] [%keyed key val])
    ;~  (glue ws)
      (just '[')
      parse-expr
      (just ']')
      tis
      parse-expr
    ==
    ::
    %+  cook
      |=([=name * =expr] [%keyed [%string (trip name)] expr])
    ;~  (glue ws)
      parse-name
      tis
      parse-expr
    ==
    ::
    %+  cook
      |=(=expr [%unkeyed expr])
    parse-expr
  ==
++  parse-binop
  %^  tnee  %parse-binop  binop
  ;~  pose
    (cold %add (jest '+'))
    (cold %sub (jest '-'))
    (cold %mul (jest '*'))
    (cold %int-div (jest '//'))
    (cold %div (jest '/'))
    (cold %pow (jest '^'))
    (cold %mod (jest '%'))
    (cold %band (jest '&'))
    (cold %bor (jest '|'))
    (cold %eq (jest '=='))
    (cold %rshft (jest '>>'))
    (cold %lshft (jest '<<'))
    (cold %lteq (jest '<='))
    (cold %gteq (jest '>='))
    (cold %neq (jest '~='))
    (cold %bxor (jest '~'))
    (cold %and (jest 'and'))
    (cold %or (jest 'or'))
    (cold %lt (jest '<'))
    (cold %gt (jest '>'))
    (cold %concat (jest '..'))
  ==
++  parse-numeral
  %^  tnee  %parse-numeral  numeral
  ;~  pose
    %+  cook
      |=  x=@rd  [%float x]
    parse-hex-float
    ::
    %+  cook
      |=  x=@u  [%int (new:st x)]
    ;~  pfix
      (just '0')
      (mask "xX")
      hex
    ==
    ::
    %+  cook
      |=  x=@rd  [%float x]
    parse-float
    ::
    %+  cook
      |=  x=@u
      ?:  (gth x max-int)
      [%float (sun:rd x)]
      [%int (new:st x)]
    (bass 10 (plus dit))
  ==
++  parse-exprlist
  %^  tnee  %parse-exprlist  exprlist
  %+  most  (ifix [ws ws] com)  parse-expr
++  parse-var
  %^  tnee  %parse-var  var
  ;<  prefix=prefix-expr  bind  parse-prefix-expr
  ?:  ?=(%var -.prefix)  (easy +.prefix)  fail
++  parse-varlist
  %^  tnee  %parse-varlist  varlist
  %+  most  (ifix [ws ws] com)  parse-var
++  parse-prefix-expr
  %^  tnee  %parse-prefix-expr  prefix-expr
  =<
  ;<  prefix=prefix-expr  bind
    ;~  pose
      %+  cook  |=(=name [%var %name name])
      parse-name
      ::
      parse-parened-expr
    ==
  (recurse-prefix-var prefix)
  |%
  :: Takes a prefix (initially [%var ...]) and applies variable access and function calls.
  :: This completely sidesteps calling the var parser.
  ::
  ++  recurse-prefix-var
    |=  prefix=prefix-expr
    %^  tnee  %recurse-prefix-var  prefix-expr
    ;~  pose
      ;<  =var  bind
        ;~  pose
          (parse-access prefix)
          (parse-dot prefix)
        ==
      (recurse-prefix-var [%var var])
      ::
      ;<  prefix=prefix-expr  bind  
        %+  cook  |=(=functioncall [%call functioncall])
        (parse-functioncall-args prefix)
      (recurse-prefix-var prefix)
      ::
      (easy prefix)
    ==
  ++  parse-access
    |=  =prefix-expr
    %+  cook
      |=([* =expr *] [%indexed prefix-expr expr])
    ;~  (glue ws)
      (just '[')
      parse-expr
      (just ']')
    ==
  ++  parse-dot
    |=  =prefix-expr
    %+  cook
      |=([* =name] [%dot prefix-expr name])
    ;~  (glue ws)
      dot
      parse-name
    ==
  --
++  parse-stat
  %+  knee  *stat
  |.
  %^  tnee  %parse-stat  stat
  ;~  pose
    (cold [%empty ~] (just ';'))
    ::
    (cold [%break ~] (jest 'break'))
    ::
    %+  cook
      |=  [* cond=expr * body=blok]  [%while cond body]
    ;~  (glue wss)
      (jest 'while')
      parse-expr
      (jest 'do')
      ;<  body=blok  bind  parse-blok
      ;~  pfix
        ?:  (blok-is-empty body)  ws  wss
        (jest 'end')
        (easy body)
      ==
    ==
    ::
    %+  cook
      |=  [* body=blok cond=expr]  [%repeat body cond]
    ;~  (glue wss)
      (jest 'repeat')
      ;<  body=blok  bind  parse-blok
      ;~  pfix
        ?:  (blok-is-empty body)  ws  wss
        (jest 'until')
        (easy body)
      ==
      parse-expr
    ==
    ::
    %+  cook
      |=  [* =label]  [%goto label]
    ;~  (glue ws)
      (jest 'goto')
      parse-name
    ==
    ::
    %+  cook
      |=  =if  [%if if]
    parse-if
    ::
    %+  cook
      |=  =label  [%label label]
    parse-label
    ::
    %+  cook
      |=([* =blok *] [%blok blok])
    ;~  (glue wss)
      (jest 'do')
      (knee *blok |.(parse-blok))
      (jest 'end')
    ==
    ::
    %+  cook
      |=([=varlist * =exprlist] [%asmnt varlist exprlist])
    ;~  (glue ws)
      parse-varlist
      (just '=')
      parse-exprlist
    ==
    ::
    %+  cook
      |=  =functioncall  [%func-call functioncall]
    parse-functioncall
    ::
    %+  cook
      |=  =for-range  [%for-range for-range]
    parse-for-range
    ::
    %+  cook
      |=  =for-in  [%for-in for-in]
    parse-for-in
    ::
    %+  cook
      |=  =function  [%function function]
    parse-function
    ::
    %+  cook
      |=  =local-function  [%local-function local-function]
    parse-local-function
    ::
    %+  cook
      |=  =local-asmnt  [%local-asmnt local-asmnt]
    parse-local-asmnt
  ==
++  parse-local-asmnt
  %^  tnee  %parse-local-asmnt  local-asmnt
  %+  cook
    |=  [* * =attnamelist rhs=(unit explist)]  [attnamelist rhs]
  ;~  plug
    (jest 'local')
    wss
    parse-attnamelist
    %-  punt
    ;~  pfix
      ws
      (just '=')
      ws
      parse-explist
    ==
  ==
++  parse-attnamelist
  %^  tnee  %parse-attnamelist  attnamelist
  %+  most  (ifix [ws ws] com)
  ;~  plug
    parse-name
    ::
    %-  punt
    %+  cook  |=  [* * =attrib *]  attrib
    ;~  plug
      ws
      (just '<')
      ;~  pose
        %+  cold  %const  (jest 'const')
        %+  cold  %close  (jest 'close')
      ==
      (just '>')
    ==
  ==
++  parse-for-range
  %^  tnee  %for-range  for-range
  %+  cook  
    |=  [* * var=name * * * from=expr * * * to=expr by=(unit expr) * * * body=blok *]
    [var from to by body]
  ;~  plug
    (jest 'for')
    wss
    parse-name
    ws
    (jest '=')
    ws
    parse-expr
    ws
    (jest ',')
    ws
    parse-expr
    %-  punt
    %+  cook  |=([* * * =expr] expr)
    ;~  plug
      ws
      (jest ',')
      ws
      parse-expr
    ==
    wss
    (jest 'do')
    wss
    ;<  body=blok  bind  parse-blok
      ;~  pfix
        ?:  (blok-is-empty body)  ws  wss
        (easy body)
      ==
    (jest 'end')
  ==
++  parse-function
  %^  tnee  %parse-function  function
  %+  cook
    |=  [* * name=funcname * body=funcbody]
    [name body]
  ;~  plug
    (jest 'function')
    wss
    parse-funcname
    ws
    parse-funcbody
  ==
++  parse-local-function
  %^  tnee  %parse-local-function  local-function
  %+  cook
    |=  [* * * * =name * body=funcbody]
    [name body]
  ;~  plug
    (jest 'local')
    wss
    (jest 'function')
    wss
    parse-name
    ws
    parse-funcbody
  ==
++  parse-funcname
  %^  tnee  %parse-funcname  funcname
  ;~  plug
    %+  most  dot  parse-name
    ::
    %-  punt
    ;~  pfix
      col
      parse-name
    ==
  ==
++  parse-funcbody
  %^  tnee  %parse-funcbody  funcbody
  %+  cook
    |=  [* * pars=parlist * * * body=blok *]  [pars body]
  ;~  plug
    (just '(')
    ws
    parse-parlist
    ws
    (just ')')
    ws
    ::
    ;<  body=blok  bind  parse-blok
    ;~  pfix
      ?:  (blok-is-empty body)  ws  wss
      (easy body)
    ==
    ::
    (jest 'end')
  ==
++  parse-parlist
  %^  tnee  %parse-parlist  parlist
  ;~  pose
    %+  cold  [~ &]
    (jest '...')
    ::
    ;~  plug
      %+  most  (ifix [ws ws] com)  parse-name
      ::
      %+  cook
        |=  wildcard=(unit *)  !.=(~ wildcard)
      %-  punt
        ;~  plug
          ws
          com
          ws
          (jest '...')
        ==
    ==
    ::
    (easy [~ |])
  ==
++  parse-for-in
  %^  tnee  %parse-for-in  for-in
  %+  cook
    |=  [* vars=namelist * src=explist * body=blok]  [vars src body]
  ;~  (glue wss)
    (jest 'for')
    parse-namelist
    (jest 'in')
    parse-explist    
    (jest 'do')
    ::
    ;<  body=blok  bind  parse-blok
    ;~  pfix
      ?:  (blok-is-empty)  ws  wss
      (jest 'end')
      (easy body)
    ==
  ==
++  parse-explist
  %^  tnee  %parse-explist  explist
  %+  most  (ifix [ws ws] com)  parse-expr
++  parse-namelist
  %^  tnee  %parse-namelist  namelist
  %+  most  (ifix [ws ws] com)  parse-name
++  parse-if
  %^  tnee  %parse-if  if
  %+  cook
    |=  [[* cond=expr * body=blok] elsa=(list [cond=expr body=blok]) else=(unit blok) *]
    [cond body elsa else]
  ;~  plug
    ;~  (glue wss)
      (jest 'if')
      parse-expr
      (jest 'then')
      parse-blok
    ==
    ::
    %-  star
    %+  cook
      |=  [* cond=expr * body=blok]  [cond body]
    ;~  pfix
      wss
      ;~  (glue wss)
        (jest 'elseif')
        parse-expr
        (jest 'then')
        parse-blok
      ==
    ==
    ::
    ;<  else-body=(unit blok)  bind
      %-  punt
      %+  cook
        |=  [* =blok]  blok
      ;~  pfix
        wss
        ;~  (glue wss)
          (jest 'else')
          parse-blok
        ==
      ==
    ;~  pfix
      ?~  else-body  wss
      ?:  (blok-is-empty u.else-body)  ws  wss
      (easy else-body)
    ==
    ::
    (jest 'end')
  ==
++  parse-functioncall
  %^  tnee  %parse-functioncall  functioncall
  ;<  prefix=prefix-expr  bind  parse-prefix-expr
  ;~  pose
    (parse-functioncall-args prefix)
    ::
    ?:  ?=(%call -.prefix)  (easy +.prefix)  fail
  ==
++  parse-functioncall-args
  |=  =prefix-expr
  %^  tnee  %parse-functioncall-args  functioncall
  ;~  pfix
    ws
    ;~  pose
      %+  cook
        |=  =args  [%call prefix-expr args]
      parse-args
      ::
      %+  cook
        |=  [* method=name =args]
        [%method prefix-expr method args]
      ;~  (glue ws)
        (just ':')
        parse-name
        parse-args
      ==
    ==
  ==
++  parse-args
  %^  tnee  %parse-args  args
  ;~  pose
    %+  cook
      |=  [* args=(unit exprlist) *]  args
    ;~  (glue ws)
      (just '(')
      (punt parse-exprlist)
      (just ')')
    ==
    ::
    %+  cook
      |=  =table  `~[[%table table]]
    parse-table
    ::
    %+  cook
      |=  =string  `~[[%string string]]
    parse-string
  ==
++  parse-label
  %^  tnee  %parse-label  label
  %+  cook
    |=  [* =label *]  label
  ;~  (glue ws)
    (jest '::')
    parse-name
    (jest '::')
  ==
++  parse-blok
  %^  tnee  %parse-blok  blok
  ;<  stats=(list stat)  bind  (more ws parse-stat)
  %+  cook
    |=  ret=(unit ret)  [stats ret]
  %-  punt
  ;~  pfix
    ?~  stats  ws  wss
    parse-ret
  ==
++  parse-ret
  %^  tnee  %parse-ret  ret
  %+  cook
    |=  [* ret=(unit exprlist) *]  ret
  ;~  plug
    (jest 'return')
    (punt ;~(pfix wss parse-exprlist))
    (punt ;~(plug ws (just ';')))
  ==
++  parse-name
  =>
  |%
  ++  name-char  ;~(pose name-fst-char (shim '0' '9'))
  ++  name-fst-char  ;~(pose alf:ab (just '_'))
  --
  %+  cook  |=  =tape  (crip tape)
  ;~(less ;~(plug keyword ;~(less name-char (easy ~))) ;~(plug name-fst-char (star name-char)))
++  bind
  |*  =mold
  |*  [prev=rule cont=$-(mold rule)]
  |=  =nail
  =/  prev-edge  (prev nail)
  ?~  q.prev-edge  prev-edge
  ((cont p.u.q.prev-edge) q.u.q.prev-edge)
++  comment
  ;~  pose
    %+  cold  ~
    ;~  plug
      (jest '--')
      (long-brackets |*(closing=rule (star ;~(less closing next))))
    ==
    %+  cold  ~
    ;~  plug
      (jest '--')
      (star ;~(less nl next))
    ==
  ==
++  nl  (just '\0a')
++  w
  ;~  pose
    comment
    gah
    (just '\09')
  ==
++  ws
  %+  cold  ~
  %-  star  w
++  wss
  %+  cold  ~
  %-  plus  w
++  parse-float
  %^  tnee  %parse-float  @rd
  %+  cook  ryld
  %+  cook  royl-cell:so
  %+  sear  
    |=  [leading-zeros=tape int=(unit @) frac=(unit (unit [@ @])) exp=(unit [exp-sign=? exp=@])]
    =/  int=(unit @)  ?~(int ?:(?=(~ leading-zeros) ~ `0) int)
    ?:  ?=([~ ~ ~] [int frac exp])  ~
    ?:  ?=([~ [~ ~]] [int frac])  ~
    :: If there is no fractional or exponential part it should just be an int.
    ?:  ?=([~ ~] [frac exp])  ~
    %-  some
    :*
      %d
      &
      (fall int 0)
      (fall (fall frac `[0 0]) [0 0])
      (fall exp [& 0])
    ==
  =/  moo
    |=  a=tape
    :-  (lent a)
    (scan a (bass 10 (plus sid:ab)))
  ;~  plug
    (star (just '0'))
    (punt dim:ag)
    ::
    (punt ;~(pfix dot (punt (cook moo (plus (shim '0' '9'))))))
    ::
    %-  punt
    ;~  pfix
      (mask "eE")
      ;~(plug ;~(pose (cold | hep) (cold & lus) (easy &)) dum:ag)
    ==
  ==
++  parse-hex-float
  %^  tnee  %parse-hex-float  @rd
  =<
  %+  sear
    |=  [* * int=tape frac=(unit tape) exp=(unit [exp-sign=? exp=@])]
    ?:  ?=([~ ~] [frac exp])  ~
    ?:  ?=([~ ~] [int frac])  ~
    %-  some
    =/  frac  (fall frac "")
    =/  whole=@rd  (sun:rd (scan (weld int frac) hex))
    =/  frac-exp=@rd  (sun:rd (pow 16 (lent frac)))
    =/  without-exp  (div:rd whole frac-exp)
    ?~  exp  without-exp
    =/  exp-exp  (sun:rd (pow 2 exp.u.exp))
    ?:  exp-sign.u.exp  
      (mul:rd without-exp exp-exp)
      (div:rd without-exp exp-exp)
  ;~  plug
    (just '0')
    ::
    (mask "xX")
    ::
    (star hex-digit)
    ::
    %-  punt
    ;~  pfix
      dot
      (plus hex-digit)
    ==
    ::
    %-  punt
    ;~  pfix
      (mask "pP")
      ;~(plug ;~(pose (cold | hep) (cold & lus) (easy &)) dim:ag)
    ==
  ==
  |%
  ++  hex-digit
    %^  tnee  %hex-digit  char
      ;~  pose
      (shim '0' '9')
      (shim 'a' 'f')
      (shim 'A' 'F')
    ==
  --
++  long-brackets
  |*  inner=$-(rule rule)
  ;<  longness=@t  bind  
    %+  cook
      |=  [* =tape *]  (crip tape)
    ;~  plug
      (just '[')
      (star (just '='))
      (just '[')
    ==
  =/  closing
    %+  cold  ~
    ;~  plug
      (just ']')
      (jest longness)
      (just ']')
    ==
  ;<  res=_p:(need q:$:$:inner)  bind  (inner closing)
  %+  cold  res  closing
++  keyword
  %+  cold  ~
  ;~  pose
    (jest 'and')
    (jest 'break')
    (jest 'do')
    (jest 'else')
    (jest 'elseif')
    (jest 'end')
    (jest 'false')
    (jest 'for')
    (jest 'function')
    (jest 'goto')
    (jest 'if')
    (jest 'in')
    (jest 'local')
    (jest 'nil')
    (jest 'not')
    (jest 'or')
    (jest 'repeat')
    (jest 'return')
    (jest 'then')
    (jest 'true')
    (jest 'until')
    (jest 'while')
  ==
++  tnee
  |*  [=term gar=mold sef=rule]
  |=  tub=nail
  ^-  (like gar)
  =/  trace  |
  ~?  trace  [p.p.tub term `tape`(scag 40 q.tub)]
  =/  res  (sef tub)
  ?.  trace  res
  ?~  q.res
  ~&  [term %nope]  res
  ~&  >  [term %ok]  res
++  blok-is-empty
  |=  =blok
  ^-  ?
  &(?=(~ body.blok) ?=(~ ret.blok))
++  max-int  9.223.372.036.854.775.807
++  elem
  |=  [nedl=* stak=(list *)]
  ^-  ?
  ?=(^ (find ~[nedl] stak))
--