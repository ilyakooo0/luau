/-  spider
/+  *strandio
/+  lua-parser
/+  lua-printer
/+  lua-interpreter
=>
|%
--
=/  m  (strand:spider ,vase)
^-  thread:spider
|=  arg=vase
^-  form:m
=/  file=beam  (need (de-beam (need !<((unit path) arg))))
;<  =cage  bind:m  (read-file file)
=/  lua-code=@t  (of-wain:format !<(wain +.cage))
~&  %parsing
=/  ast  (scan (trip lua-code) lua-parser)
~&  %evaluating
%-  pure:m  !>((lua-interpreter ast))
