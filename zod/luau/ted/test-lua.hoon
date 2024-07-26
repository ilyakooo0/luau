/-  spider
/+  *strandio
/+  lua-parser
=<
=/  m  (strand:spider ,vase)
^-  thread:spider
|=  arg=vase
^-  form:m
;<  bek=beak  bind:m  get-beak
;<  lua-files=(list path)  bind:m  (list-tree [bek /res/lua])
;<  results=(list test-result)  bind:m  
  =/  m  (strand:spider ,(list test-result))
  =/  res=(list test-result)  ~
  |-
  ?~  lua-files  (pure:m res)
  =/  current-file  i.lua-files
  ~&  current-file
  ;<  =cage  bind:m  (read-file [bek current-file])
  =/  lua-code=@t  (of-wain:format !<(wain +.cage))
  ~&  %parsing
  =/  parse-result  ?~  (rush lua-code lua-parser)  %err  %ok
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
--
