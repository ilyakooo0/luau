/-  lua
/+  lua-parser
/+  lua-printer

|_  ast=ast:lua
++  grad  %noun
++  grow
  |%
  ++  noun  ast
  ++  mime
    ^-  ^mime
    [/text/lua (as-octt:mimes:html (lua-printer ast))]
  --
++  grab
  |%
  ++  noun  ast:lua
  ++  mime
    |=  [=mite len=@ tex=@]
    (rash tex lua-parser)
  --
--

