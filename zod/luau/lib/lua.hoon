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
  %+  knee  *ast
  |.
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
++  parse-atomic-expr
  %+  knee  *expr
  |.
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
  ==
++  parse-expr-list
  %+  knee  *(interlist binop expr)
  |.
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
  ~&  "parse-exp"
  %+  knee  *expr
  |.
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
  %+  knee  *string
  |.
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
  %+  knee  *table
  |.
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
  %+  knee  *field-list
  |.
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
  %+  knee  *binop
  |.
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
  %+  knee  *numeral
  |.
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
  ~&  "parse-exprlist"
  %+  knee  *exprlist
  |.
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
  %+  knee  *var
  |.
  =>
  |%
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
  ;~  pose
    ;<  prefix=name  bind  parse-name
    ;~  pose
      (parse-access [%var %name prefix])
      (parse-dot [%var %name prefix])
      (easy [%name prefix])
    ==
    ::
    ;<  prefix=prefix-expr  bind  parse-parened-expr
    ;~  pose
      (parse-access prefix)
      (parse-dot prefix)
    ==
  ==
::  varlist
::
+$  varlist  (lest var)
++  print-varlist
  |=  [=varlist]
  %-  commaed
  %+  turn  varlist  print-var
++  parse-varlist
  %+  knee  *varlist
  |.
  %+  most  (ifix [ws ws] com)  parse-var
:: Prefix Expr
::
+$  prefix-expr
  $%
    [%expr expr]
    [%call functioncall]
    [%var var] 
  ==
++  parse-simple-prefix-expr
  ~&  "parse-simple-prefix-expr"
  %+  knee  *$%([%expr expr] [%var var])
  |.
  ;~  pose
    parse-parened-expr
    ::
    %+  cook  |=([=var] [%var var])  parse-var
  ==
++  parse-prefix-expr
  ~&  "parse-prefix-expr"
  %+  knee  *prefix-expr
  |.
  ;<  prefix=$%([%expr expr] [%var var])  bind  parse-simple-prefix-expr
  ;~  pose
    %+  cook  |=(=functioncall [%call functioncall])
    (parse-functioncall-args prefix)
    ::
    (easy prefix)
  ==
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
  %+  knee  *functioncall
  |.
  ;<  prefix=prefix-expr  bind  parse-prefix-expr
  ~&  >  prefix
  (parse-functioncall-args prefix)
++  parse-functioncall-args
  ~&  "parse-functioncall-args"
  |=  =prefix-expr
  %+  knee  *functioncall
  |.
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
  ~&  "parse-args"
  %+  knee  *args
  |.
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
  %+  knee  *label
  |.
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
  %+  knee  *blok
  |.
  ;~  plug
    (most wss parse-stat)
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
  %+  knee  *ret
  |.
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
  %+  knee  *name
  |.
  =>
  |%
  ++  name-char  ;~(pose name-fst-char dit:ab)
  ++  name-fst-char  ;~(pose alf:ab (just '_'))
  --
  %+  cook 
    |=  =tape  (crip tape)
  ;~(plug name-fst-char (star name-char))
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
  %+  knee  *@rd
  |.
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
  %+  knee  *@rd
  |.
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
    %+  knee  *char
    |.
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
 --
