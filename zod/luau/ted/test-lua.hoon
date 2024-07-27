/-  spider
/+  *strandio
/+  lua-parser
/+  lua-printer
=<
=/  m  (strand:spider ,vase)
^-  thread:spider
|=  arg=vase
^-  form:m
;<  bek=beak  bind:m  get-beak
;<  lua-files=(list path)  bind:m  (list-tree [bek /res/lua])
=/  lua-files  %+  skim  lua-files
  |=  =path
  ^-  ?
  .=(4 (lent path))
;<  results=(list test-result)  bind:m  
  =/  m  (strand:spider ,(list test-result))
  =/  res=(list test-result)  ~
  |-
  ?~  lua-files  (pure:m res)
  =/  current-file=path  i.lua-files
  ~&  current-file
  ;<  =cage  bind:m  (read-file [bek current-file])
  =/  lua-code=@t  (of-wain:format !<(wain +.cage))
  ~&  %parsing
  =/  ast-unit  (rush lua-code lua-parser)
  ;<  parse-result=test-result  bind:m
    =/  m  (strand:spider ,test-result)
    ?~  ast-unit  (pure:m %err)
    =/  ast  u.ast-unit
    ~&  %printing
    =/  printed  (lua-printer ast)
    ;<  *  bind:m  %-  send-raw-card
      :*
        %pass  ~  %arvo  %c  %info  %luau
        %&  [(into current-file 2 ~.cycled) %ins %lua !>((to-wain:format (crip printed)))]~
      ==
    ~&  %parsing-printed
    =/  cycled-ast-unit  (rust printed lua-parser)
    ?~  cycled-ast-unit  (pure:m %err)
    ~&  %comparing-asts
    ?.  =(ast u.cycled-ast-unit)  (pure:m %err)
    (pure:m %ok)
  ~&  parse-result
  $(lua-files t.lua-files, res [parse-result res])
%-  pure:m
  !>
  :*
    passed=(lent (skim results |=(=test-result =(%ok test-result))))
    errored=(lent (skim results |=(=test-result =(%err test-result))))
  ==
|%
+$  test-result  $?(%ok %err)
:: ++  rename-file
  
--
