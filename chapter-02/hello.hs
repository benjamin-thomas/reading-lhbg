{-
 
To run the program, we first compile it with `ghc ./hello.hs`.

This generates:
  - `hello.o`: an Object file
  - `hello.hi`: a Haskell interface file
  - `hello`: a native executable

-}
main =
  putStrLn "<html><body>Hello, world</body></html>"
