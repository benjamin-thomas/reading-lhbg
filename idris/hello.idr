module Main

import Html

{-

Workflow:

Terminal 1:
rg --files *.idr | entr tmux send-keys -t reading-lhbg:1.2 C-l ":reload" Enter "myHtml" Enter

Terminal 2:
rlwrap idris2 ./hello.idr

---

Compile and run

idris2 ./hello.idr -o hello && ./build/exec/hello

-}


myHtml : Html
myHtml =
  html_
    "My title"
    ( append_
      (p_ "Paragraph #1")
      (p_ "Paragraph #2")
    )

main : IO ()
main =
  putStrLn (render myHtml)
