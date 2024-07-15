/-  *lua
=<
print
|%
:: AST
::
++  print
  |=  [=ast]
  ^-  tape
  ?-  -.ast
    %blok  (print-blok +.ast)
  ==
:: Expr
::
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
++  print-string
  |=  =string
  %-  zing
  :~
    "\""
    (trip string)
    "\""
  ==
:: table
::
++  print-table
  |=  =table
  ^-  tape
  %-  zing
  :~
    "\{"
    (print-field-list table)
    "}"
  ==
:: field-list
::
++  print-field-list
  |=  =field-list
  ^-  tape
  %-  commaed
  %+  turn  field-list  print-field
:: field
::
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
:: binop
::
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
:: numeral
::
++  print-numeral
  |=  [num=numeral]
  ^-  tape
  ?-  -.num
    %int  (show-u +.num)
    %float  (show-float +.num)
  ==
:: exprlist
::
++  print-exprlist
  |=  [=exprlist]
  %-  commaed
  %+  turn  exprlist  print-expr
:: Var
::
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
::  varlist
::
++  print-varlist
  |=  [=varlist]
  %-  commaed
  %+  turn  varlist  print-var
:: Prefix Expr
::
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
:: functioncall
::
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
:: args
::
++  print-args
  |=  =args
  ^-  tape
  %-  zing
  :~
    "("
    (print-exprlist args)
    ")"
  ==
::
:: label
::
++  print-label
  |=  =label
  ^-  tape
  %-  zing
  :~
    "::"
    (trip label)
    "::"
  ==
:: Blok
::
++  print-blok
  |=  [=blok]
  ^-  tape
  %-  zing
  %+  join  "\0a"
  %+  weld
    (turn body.blok print-stat)
    ?~  ret.blok  ~
    ~[(print-ret u.ret.blok)]
:: ret
::
++  print-ret
  |=  =ret
  ^-  tape
  %-  zing
  :~
    "return "
    (print-exprlist ret)
  ==
:: Helpers
::
++  commaed 
  |=  [l=(list tape)]
  ^-  tape
  %-  zing
  %+  join  ","  l
++  show-s
  |=(s=@s `tape`[?:((syn:si s) %$ '-') (slag 2 (scow %ui (abs:si s)))])
++  show-u
  |=(u=@u `tape`(slag 2 (scow %ui u)))
++  show-float
  |=  x=@rd
  ^-  tape
  %-  r-co:co
  %-  rlyd
  x
 --
