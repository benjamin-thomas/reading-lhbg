
Main> :module Data.String
Imported module Data.String

Main> :let lst = asList "hello"

Main> lst
'h' :: Delay (asList (assert_smaller "hello" "ello"))

Main> unpack "hello"
['h', 'e', 'l', 'l', 'o']
