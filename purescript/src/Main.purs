module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

{-

Workflow:

Terminal 1
spago build --watch

Use vscode with its LSP extension

OR

Terminal 1:
rg --files *.purs | entr tmux send-keys -t reading-lhbg:2.2 C-l ":reload" Enter

Terminal 2:
spago repl # see .purs-repl
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

makeHtml :: String -> String -> String
makeHtml title body =
  html_
    $ head_ (title_ title)
        <> body_ body

myHtml :: String
myHtml =
  makeHtml
    "Learn PureScript by building a Blog Generator"
    (h1_ "A title" <> p_ "A paragraph")

main :: Effect Unit
main =
  log myHtml

