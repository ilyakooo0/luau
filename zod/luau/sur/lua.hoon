|%
+$  name  @t
+$  ast
  $%
    [%blok blok]
  ==
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
+$  string  @t
+$  table  field-list
+$  field-list  (list field)
+$  field
  $%
    [%keyed expr expr]
    [%unkeyed expr]
  ==
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
+$  numeral
  $%
    [%int @u]
    [%float @rd]
  ==
+$  exprlist  (lest expr)
+$  var
  $%
    [%dot prefix-expr name]
    [%indexed prefix-expr expr]
    [%name name]
  ==
+$  varlist  (lest var)
+$  prefix-expr
  $%
    [%expr expr]
    [%call functioncall]
    [%var var] 
  ==
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
+$  if  [cond=expr body=blok elsa=(list [cond=expr body=blok]) else=(unit blok)]
+$  functioncall
  $%
    [%call func=prefix-expr =args]
    [%method obj=prefix-expr method=name =args]
  ==
+$  args  exprlist
+$  label  name
+$  blok  [body=(lest stat) ret=(unit ret)]
+$  ret  exprlist
--
