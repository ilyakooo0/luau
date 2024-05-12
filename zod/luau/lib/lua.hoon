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
  %+  ifix  [gaw gaw]
  ;~  pose
    (cook |=(=blok [%blok blok]) parse-blok)
  ==
:: Expr
::
+$  expr
  $%
    :: [%string ~]
    [%binop expr binop expr]
    [%prefix-expr prefix-expr]
    [%num numeral]
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
    [%int @s]
    :: [%float @rd]
  ==
++  parse-numeral
  %+  knee  *numeral
  |.
  ;~  pose
    %+  cook
      |=  [is-neg=(unit *) x=@]
      [%int (new:si ?=(~ is-neg) x)]
    ;~  plug
      (punt (just '-'))
      (bass 10 (plus dit))
    ==
  ==
++  print-numeral
  |=  [num=numeral]
  ^-  tape
  ?-  -.num
    %int  (show-s +.num)
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
  %+  most  (ifix [gaw gaw] com)  parse-expr
:: Var
::
+$  var
  $%
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
  ==
++  parse-var
  %+  knee  *var
  |.
  ;~  pose
    %+  cook
      |=([=name * =expr *] [%indexed [%var [%name name]] expr])
    ;~  (glue gaw)
      parse-name
      (just '[')
      parse-expr
      (just ']')
    ==
    ::
    (cook |=(=name [%name name]) parse-name)
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
  %+  most  (ifix [gaw gaw] com)  parse-var
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
    %+  cook
      |=([=expr] [%expr expr])
    (ifix [(just '(') (just ')')] (knee *expr |.(parse-expr)))
    ::
    %+  cook
      |=([=var] [%var var])
    (knee *var |.(parse-var))
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
    ;~  (glue gawn)
      (jest 'do')
      (knee *blok |.(parse-blok))
      (jest 'end')
    ==
    ::
    %+  cook
      |=([=varlist * =exprlist] [%asmnt varlist exprlist])
    ;~  (glue gaw)
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
  (most gawn parse-stat)
:: Helpers
::
++  commaed 
  |=  [l=(list tape)]
  ^-  tape
  %-  zing
  %+  join  ","  l
++  gawn  (cold ~ (plus ;~(pose vul gah)))
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
++  bind
  |*  =mold
  |*  [prev=rule cont=$-(mold rule)]
  |=  =nail
  =/  prev-edge  (prev nail)
  ?~  q.prev-edge  prev-edge
  ((cont p.u.q.prev-edge) q.u.q.prev-edge)
--
