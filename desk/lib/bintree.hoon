|%
++  bintree
  |$  [node leaf]
  $%
    [%node l=(bintree node leaf) n=node r=(bintree node leaf)]
    [%leaf leaf]
  ==
--
