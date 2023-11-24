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

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

html_ :: String -> String
html_ =
  el "html"

head_ :: String -> String
head_ =
  el "head"

title_ :: String -> String
title_ =
  el "title"

body_ :: String -> String
body_ =
  el "body"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

{- |

>>> makeHtml "TITLE" "BODY"
"<html><head><title>TITLE</title></head><body>BODY</body></html>"
-}
makeHtml :: String -> String -> String
makeHtml title body =
  html_
    $ head_ (title_ title)
    <> body_ body

myHtml :: String
myHtml =
  makeHtml
    "Learn Haskell by building a Blog Generator"
    (h1_ "A title" <> p_ "A paragraph")

main :: IO ()
main =
  putStrLn myHtml
