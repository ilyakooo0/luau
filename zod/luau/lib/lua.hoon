/+  *interlist
|%
:: Name
::
+$  name  @t
:: AST
::
+$  ast
  $%
    [%blok blok]
  ==
++  print
  |=  [=ast]
  ^-  tape
  ?-  -.ast
    %blok  (print-blok +.ast)
  ==
++  apex
  %^  tnee  %apex  ast
  %+  ifix  [ws ws]
  ;~  pose
    (cook |=(=blok [%blok blok]) parse-blok)
  ==
:: Expr
::
+$  expr
  $%
    [%string string]
    [%binop expr binop expr]
    [%prefix-expr prefix-expr]
    [%num numeral]
    [%table table]
    [%true ~]
    [%false ~]
    [%nil ~]
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
    %+  cook
      |=(=string [%string string])
    parse-string
  ==
:: Parse expressions separated by binary operators
::
++  parse-expr-list
  %^  tnee  %parse-expr-list  (interlist binop expr)
  %+  parse-interlist  (ifix [ws ws] parse-binop)  parse-atomic-expr
:: TODO: This is mock and should take operator priority into account.
::
++  process-expr-list
  |=  l=(interlist binop expr)
  ^-  expr
  ?-  -.l
    %single  val.l
    %double  [%binop val.l sep.l (process-expr-list tail.l)]
  ==
++  parse-expr
  %^  tnee  %parse-expr  expr
  %+  cook  process-expr-list  parse-expr-list
++  parse-parened-expr
  %+  cook
    |=([=expr] [%expr expr])
  (ifix [(just '(') (just ')')] (knee *expr |.(parse-expr)))
++  print-expr
  |=  [=expr]
  ^-  tape
  ?-  -.expr
    %prefix-expr  (print-prefix-expr +.expr)
    %nil  "nil"
    %true  "true"
    %false  "false"
    %binop
      %-  zing
      :~
        (print-expr +<.expr)
        " "
        (print-binop +>-.expr)
        " "
        (print-expr +>+.expr)
      ==
    %num  (print-numeral +.expr)
    %table  (print-table +.expr)
    %string  (print-string +.expr)
  ==
:: string
::
+$  string  @t
++  print-string
  |=  =string
  %-  zing
  :~
    "\""
    (trip string)
    "\""
  ==
++  parse-string
  %^  tnee  %parse-string  string
  =>
  |%
  ++  parse-string
    |=  quot=char
    =/  quot  (just quot)
    %+  cook
      |=([* =tape *] (crip tape))
    ;~  plug
      quot
      (star ;~(less quot next))
      quot
    ==
  --
  ;~  pose
    (parse-string '"')
    (parse-string '\'')
  ==
:: table
::
+$  table  field-list
++  print-table
  |=  =table
  ^-  tape
  %-  zing
  :~
    "\{"
    (print-field-list table)
    "}"
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
:: field-list
::
+$  field-list  (list field)
++  print-field-list
  |=  =field-list
  ^-  tape
  %-  commaed
  %+  turn  field-list  print-field
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
:: field
::
+$  field
  $%
    [%keyed expr expr]
    [%unkeyed expr]
  ==
++  print-field
  |=  =field
  ^-  tape
  ?-  -.field
    %keyed
      %-  zing
      :~
        "["
        (print-expr +<.field)
        "] = "
        (print-expr +>.field)
      ==
    %unkeyed
      (print-expr +.field)
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
      |=([=name * =expr] [%keyed [%string name] expr])
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
:: binop
::
+$  binop
  $?
    %add
    %sub
    %mul
    %div
    %int-div
    %pow
    %mod
    %band
    %bor
    %bxor
    %rshft
    %lshft
    %and
    %or
    %lt
    %lteq
    %eq
    %gt
    %gteq
    %neq
    %concat
  ==
++  print-binop
  |=  [=binop]
  ?-  binop
    %add  "+"
    %sub  "-"
    %mul  "*"
    %div  "/"
    %int-div  "//"
    %pow  "^"
    %mod  "%"
    %band  "&"
    %bor  "|"
    %bxor  "~"
    %rshft  ">>"
    %lshft  "<<"
    %and  "and"
    %or  "or"
    %lt  "<"
    %lteq  "<="
    %eq  "=="
    %gt  ">"
    %gteq  ">="
    %neq  "~="
    %concat  ".."
  ==
++  parse-binop
  %^  tnee  %parse-binop  binop
  ;~  pose
    (cold %add (jest '+'))
    (cold %sub (jest '-'))
    (cold %mul (jest '*'))
    (cold %div (jest '/'))
    (cold %int-div (jest '//'))
    (cold %pow (jest '^'))
    (cold %mod (jest '%'))
    (cold %band (jest '&'))
    (cold %bor (jest '|'))
    (cold %bxor (jest '~'))
    (cold %rshft (jest '>>'))
    (cold %lshft (jest '<<'))
    (cold %and (jest 'and'))
    (cold %or (jest 'or'))
    (cold %lt (jest '<'))
    (cold %lteq (jest '<='))
    (cold %eq (jest '=='))
    (cold %gt (jest '>'))
    (cold %gteq (jest '>='))
    (cold %neq (jest '~='))
    (cold %concat (jest '..'))
  ==
:: numeral
::
+$  numeral
  $%
    [%int @u]
    [%float @rd]
  ==
++  parse-numeral
  %^  tnee  %parse-numeral  numeral
  ;~  pose
    %+  cook
      |=  x=@rd  [%float x]
    ;~  pose
      parse-float
      parse-hex-float
    ==
    ::
    %+  cook
      |=  x=@u  [%int x]
    ;~  pose
      ;~  pfix
        (just '0')
        (mask "xX")
        hex
      ==
      ::
      (bass 10 (plus dit))
    ==
  ==
++  print-numeral
  |=  [num=numeral]
  ^-  tape
  ?-  -.num
    %int  (show-u +.num)
    %float  (show-float +.num)
  ==
:: exprlist
::
+$  exprlist  (lest expr)
++  print-exprlist
  |=  [=exprlist]
  %-  commaed
  %+  turn  exprlist  print-expr
++  parse-exprlist
  %^  tnee  %parse-exprlist  exprlist
  %+  most  (ifix [ws ws] com)  parse-expr
:: Var
::
+$  var
  $%
    [%dot prefix-expr name]
    [%indexed prefix-expr expr]
    [%name name]
  ==
++  print-var
  |=  [=var]
  ^-  tape
  ?-  -.var
    %name  (trip +.var)
    %indexed
      %-  zing
      :~
        (print-prefix-expr +<.var)
        "["
        (print-expr +>.var)
        "]"
      ==
    %dot
      %-  zing
      :~
        (print-prefix-expr +<.var)
        "."
        (trip +>.var)
      ==
  ==
++  parse-var
  %^  tnee  %parse-var  var
  ;<  prefix=prefix-expr  bind  parse-prefix-expr
  ?:  ?=(%var -.prefix)  (easy +.prefix)  fail
::  varlist
::
+$  varlist  (lest var)
++  print-varlist
  |=  [=varlist]
  %-  commaed
  %+  turn  varlist  print-var
++  parse-varlist
  %^  tnee  %parse-varlist  varlist
  %+  most  (ifix [ws ws] com)  parse-var
:: Prefix Expr
::
+$  prefix-expr
  $%
    [%expr expr]
    [%call functioncall]
    [%var var] 
  ==
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
    %+  knee  *prefix-expr
    |.
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
    ;~  plug
      dot
      parse-name
    ==
  --
++  print-prefix-expr
  |=  [=prefix-expr]
  ?-  -.prefix-expr
    %var  (print-var +.prefix-expr)
    %expr  
      %-  zing
      :~
        "("
        (print-expr +.prefix-expr)
        ")"
      ==
    %call  (print-functioncall +.prefix-expr)
  ==
:: stat
::
+$  stat
  $%
    [%blok blok]
    [%asmnt varlist exprlist]
    [%label label]
    [%goto label]
    [%func-call functioncall]
    [%while cond=expr body=blok]
    [%repeat body=blok cond=expr]
    [%if if]
    [%break ~]
    [%empty ~]
  ==
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
      |=  [* cond=expr * body=blok *]  [%while cond body]
    ;~  (glue wss)
      (jest 'while')
      parse-expr
      (jest 'do')
      parse-blok
      (jest 'end')
    ==
    ::
    %+  cook
      |=  [* body=blok * cond=expr]  [%repeat body cond]
    ;~  (glue wss)
      (jest 'repeat')
      parse-blok
      (jest 'until')
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
  ==
++  print-stat
  |=  [=stat]
  ^-  tape
  ?-  -.stat
    %empty  ";"
    %blok  (print-blok +.stat)
    %asmnt  
    %-  zing 
    :~
      (commaed (turn +<.stat print-var))
      "="
      (commaed (turn +>.stat print-expr))
    ==
    %label  (print-label +.stat)
    %func-call  (print-functioncall +.stat)
    %break  "break"
    %goto
    %-  zing
    :~
      "goto "
      (trip +.stat)
    ==
    %while
    %-  zing
    :~
      "while "
      (print-expr cond.stat)
      " do\0a"
      (print-blok body.stat)
    ==
    %repeat
    %-  zing
    :~
      "repeat\0a"
      (print-blok body.stat)
      "until "
      (print-expr cond.stat)
    ==
    %if  (print-if +.stat)
  ==
:: if
::
+$  if  [cond=expr body=blok elsa=(list [cond=expr body=blok]) else=(unit blok)]
++  print-if
  |=  =if
  ^-  tape
  %-  zing
  :~
    "if "
    (print-expr cond.if)
    " then\0a"
    (print-blok body.if)
    ::
    ^-  tape
    %-  zing
    %+  turn  elsa.if
    |=  [cond=expr body=blok]
    %-  zing
    :~
      "\0aelseif"
      (print-expr cond)
      " then\0a"
      (print-blok body)
    ==
    ::
    ?~  else.if  ""
    ^-  tape
    %-  zing
    :~
      "\0aelse\0a"
      (print-blok u.else.if)
    ==
    ::
    "\0aend"
  ==
++  parse-if
  %+  knee  *if
  |.
  %^  tnee  %parse-if  if
  %+  cook
    |=  [* cond=expr * body=blok elsa=(list [cond=expr body=blok]) else=(unit blok) *]
    [cond body elsa else]
  ;~  (glue wss)
    (jest 'if')
    parse-expr
    (jest 'then')
    parse-blok
    ::
    %-  star
    %+  cook
      |=  [* cond=expr * body=blok]  [cond body]
    ;~  (glue wss)
      (jest 'elseif')
      parse-expr
      (jest 'then')
      parse-blok
    ==
    ::
    %-  punt
    %+  cook
      |=  [* =blok]  blok
    ;~  (glue wss)
      (jest 'else')
      parse-blok
    ==
    (jest 'end')
  ==
:: functioncall
::
+$  functioncall
  $%
    [%call func=prefix-expr =args]
    [%method obj=prefix-expr method=name =args]
  ==
++  print-functioncall
  |=  call=functioncall
  ^-  tape
  ?-  -.call
    %call
      %-  zing
      :~
        (print-prefix-expr func.call)
        (print-args args.call)
      ==
    %method
      %-  zing
      :~
        (print-prefix-expr obj.call)
        ":"
        (trip method.call)
        (print-args args.call)
      ==
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
:: args
::
+$  args  exprlist
++  print-args
  |=  =args
  ^-  tape
  %-  zing
  :~
    "("
    (print-exprlist args)
    ")"
  ==
++  parse-args
  %^  tnee  %parse-args  args
  ;~  pose
    %+  cook
      |=  [* =exprlist *]  exprlist
    ;~  (glue ws)
      (just '(')
      parse-exprlist
      (just ')')
    ==
    ::
    %+  cook
      |=  =table  ~[[%table table]]
    parse-table
    ::
    %+  cook
      |=  =string  ~[[%string string]]
    parse-string
  ==
::
:: label
::
+$  label  name
++  print-label
  |=  =label
  ^-  tape
  %-  zing
  :~
    "::"
    (trip label)
    "::"
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
:: Blok
::
+$  blok  [body=(lest stat) ret=(unit ret)]
++  print-blok
  |=  [=blok]
  ^-  tape
  %-  zing
  %+  join  "\0a"
  %+  weld
    (turn body.blok print-stat)
    ?~  ret.blok  ~
    ~[(print-ret u.ret.blok)]
++  parse-blok
  %^  tnee  %parse-blok  blok
  ;~  plug
    (most ws parse-stat)
    ::
    %-  punt
    ;~  pfix
      wss
      parse-ret
    ==
  ==
:: ret
::
+$  ret  exprlist
++  print-ret
  |=  =ret
  ^-  tape
  %-  zing
  :~
    "return "
    (print-exprlist ret)
  ==
++  parse-ret
  %^  tnee  %parse-ret  ret
  %+  cook
    |=  [[* =exprlist] *]  exprlist
  ;~  plug
    ;~  (glue wss)
      (jest 'return')
      parse-exprlist
    ==
    (punt (just ';'))
  ==
:: Helpers
::
++  commaed 
  |=  [l=(list tape)]
  ^-  tape
  %-  zing
  %+  join  ","  l
++  parse-name
  =>
  |%
  ++  name-char  ;~(pose name-fst-char dit:ab)
  ++  name-fst-char  ;~(pose alf:ab (just '_'))
  --
  %+  cook  |=  =tape  (crip tape)
  ;~(less keyword ;~(plug name-fst-char (star name-char)))
++  show-s
  |=(s=@s `tape`[?:((syn:si s) %$ '-') (slag 2 (scow %ui (abs:si s)))])
++  show-u
  |=(u=@u `tape`(slag 2 (scow %ui u)))
++  bind
  |*  =mold
  |*  [prev=rule cont=$-(mold rule)]
  |=  =nail
  =/  prev-edge  (prev nail)
  ?~  q.prev-edge  prev-edge
  ((cont p.u.q.prev-edge) q.u.q.prev-edge)
++  w
  ;~  pose
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
    |=  [int=@ frac=(unit [@ @]) exp=(unit [exp-sign=? exp=@])]
    ?:  ?=([~ ~] [frac exp])  ~
    %-  some
    :*
      %d
      &
      int
      (fall frac [0 0])
      (fall exp [& 0])
    ==
  =/  moo
    |=  a=tape
    :-  (lent a)
    (scan a (bass 10 (plus sid:ab)))
  ;~  plug
    ;~  plug
      dim:ag
      ::
      (punt ;~(pfix dot (cook moo (plus (shim '0' '9')))))
      ::
      %-  punt
      ;~  pfix
        (mask "eE")
        ;~(plug ;~(pose (cold | hep) (easy &)) dim:ag)
      ==
    ==
  ==
++  parse-hex-float
  %^  tnee  %parse-hex-float  @rd
  =<
  %+  sear
    |=  [* * int=tape frac=(unit tape) exp=(unit [exp-sign=? exp=@])]
    ?:  ?=([~ ~] [frac exp])  ~
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
    (plus hex-digit)
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
++  show-float
  |=  x=@rd
  ^-  tape
  %-  r-co:co
  %-  rlyd
  x
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
  =/  trace  &
  ~?  trace  [term q.tub]
  =/  res  (sef tub)
  ?.  trace  res
  ?~  q.res
  ~&  [term %nope]  res
  ~&  >  [term %ok]  res
 --
