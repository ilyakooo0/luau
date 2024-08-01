|%
++  interlist
  |$  [sep val]
  $%
    [%double =val =sep tail=(interlist sep val)]
    [%single =val]
  ==
--
