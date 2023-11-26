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
rg --files *.purs | entr tmux send-keys -t reading-lhbg:2.2 C-l ":reload" Enter "myHtml" Enter

Terminal 2:
spago repl # see .purs-repl

---

Compile and run:

spago run

 -}

newtype Html = Html String

instance showHtml :: Show Html where
  show (Html str) = "Html: " <> str

newtype Structure = Structure String

type Title = String

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure $ a <> b

toString :: Structure -> String
toString (Structure s) = s

render :: Html -> String
render (Html s) = s

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

p_ :: String -> Structure
p_ = Structure <<< el "p"

h1_ :: String -> Structure
h1_ = Structure <<< el "h1"

html_ :: Title -> Structure -> Html
html_ title content =
  Html
    ( el "html"
        ( el "head" (el "title" title)
            <> el "body" (toString content)
        )
    )

myHtml :: Html
myHtml =
  html_
    "My title"
    ( append_
        (h1_ "Heading")
        ( append_
            (p_ "Paragraph #1")
            (p_ "Paragraph #2")
        )
    )

main :: Effect Unit
main =
  log (render myHtml)

