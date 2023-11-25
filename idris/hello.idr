module Main

{-

Workflow:

Terminal 1:
echo ./hello.idr | entr tmux send-keys -t reading-lhbg:1.2 C-l ":reload" Enter

Terminal 2:
rlwrap idris2 ./hello.idr

-}

el : String -> String -> String
el tag content =
  "<" ++ tag ++ ">" ++ content ++ "</" ++ tag ++ ">"

html_ : String -> String
html_ = el "html"

head_ : String -> String
head_ = el "head"

title_ : String -> String
title_ = el "title"

body_ : String -> String
body_ = el "body"

h1_ : String -> String
h1_ = el "h1"

makeHtml : String -> String -> String
makeHtml title body =
  html_
    $ head_ (title_ title)
    ++ body_ body

p_ : String -> String
p_ = el "p"

myHtml : String
myHtml =
  makeHtml
    "Learn Idriss by building a Blog Generator"
    (h1_ "A title" ++ p_ "A paragraph")

main : IO ()
main =
  putStrLn myHtml
