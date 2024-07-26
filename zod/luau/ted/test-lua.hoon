/-  spider
/+  *strandio
=<
=/  m  (strand:spider ,vase)
^-  thread:spider
|=  arg=vase
^-  form:m
;<  bek=beak  bind:m  get-beak
;<  lua-files=(list path)  bind:m  (list-tree [bek /res/lua])
:: ;<  *  bind:m  ((map-m ,@ud ~) ~[1 2 3] |=(x=@ (flog-text "{<x>}")))
;<  results=(list test-result)  bind:m  
  =/  m  (strand:spider ,(list test-result))
  =/  res=(list test-result)  ~
  |-
  ?~  lua-files  (pure:m res)
  ;<  =cage  bind:m  (read-file [bek i.lua-files])
  =/  bar  (of-wain:format !<(wain +.cage))
  :: ;<  *  bind:m  (flog-text "{<i.lua-files>} {(scag 50 (trip bar))}")
  $(lua-files t.lua-files, res [%ok res])
(pure:m !>(~))
|%
+$  test-result  $?(%ok %err)
--
