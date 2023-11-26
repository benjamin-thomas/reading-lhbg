module Main
  ( main
  , myHtml
  ) where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Html (Html, append_, h1_, html_, p_, render)

{-

Workflow:

Terminal 1
spago build --watch

Use vscode with its LSP extension

OR

Terminal 1:
find ./src | entr tmux send-keys -t reading-lhbg:2.2 C-l ":reload" Enter "myHtml" Enter

Terminal 2:
spago repl # see .purs-repl

---

Compile and run:

spago run

 -}

myHtml :: Html
myHtml =
  html_
    "My title"
    ( append_
        (h1_ "A <weird> Heading")
        ( append_
            (p_ "Paragraph #1")
            (p_ "Paragraph #2")
        )
    )

main :: Effect Unit
main =
  log (render myHtml)
