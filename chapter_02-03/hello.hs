{-

To run the program, we first compile it with `ghc ./hello.hs`.

This generates:
  - `hello.o`: an Object file
  - `hello.hi`: a Haskell interface file
  - `hello`: a native executable

Alternatively, we may build and run the source file directly with `runghc ./hello.hs`.
This skips the creation of build artifacts, but the program is interpreted,
thus slower than the compiled version. We'll favor using this method in the tutorial.

We'll also redirect the output, like such:

```
runghc ./hello.hs > ./hello.html
```

-}

html_ :: String -> String
html_ content =
  "<html>" <> content <> "</html>"

head_ :: String -> String
head_ content =
  "<head>" <> content <> "</head>"

title_ :: String -> String
title_ content =
  "<title>" <> content <> "</title>"

body_ :: String -> String
body_ content =
  "<body>" <> content <> "</body>"

makeHtml :: String -> String -> String
makeHtml title body =
  html_
    $ head_ (title_ title)
    <> body_ body

myHtml :: String
myHtml =
  makeHtml "My page title" "My page content"

main :: IO ()
main =
  putStrLn myHtml
