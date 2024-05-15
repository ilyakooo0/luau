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
  %+  parse-interlist  parse-binop  parse-atomic-expr
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
    :: [%float @rd]
  ==
++  parse-numeral
  %+  knee  *numeral
  |.
  ;~  pose
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
  ==
:: exprlist
::
+$  exprlist  (lest expr)
++  print-exprlist
  |=  [=exprlist]
  %-  commaed
  %+  turn  exprlist  print-expr
++  parse-exprlist
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
    [%var var] 
  ==
++  parse-prefix-expr
  %+  knee  *prefix-expr
  |.
  ;~  pose
    %+  cook  |=([=var] [%var var])  parse-var
    ::
    parse-parened-expr
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
  ==
:: stat
::
+$  stat
  $%
    [%blok blok]
    [%asmnt varlist exprlist]
    [%empty ~]
  ==
++  parse-stat
  %+  knee  *stat
  |.
  ;~  pose
    (cold [%empty ~] (just ';'))
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
  ==
:: Blok
::
+$  blok  (lest stat)
++  print-blok
  |=  [=blok]
  ^-  tape
  %-  zing
  %+  join  "\0a"
  (turn blok print-stat)
++  parse-blok
  %+  knee  *blok
  |.
  (most wss parse-stat)
:: Helpers
::
++  commaed 
  |=  [l=(list tape)]
  ^-  tape
  %-  zing
  %+  join  ","  l
:: ++  gawn  (cold ~ (plus ;~(pose vul gah)))
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
--
