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
    "My <weird> title"
    ( append_
      ( append_
        (p_ "Paragraph #1")
        (p_ "Paragraph #2")
      )
      ( append_
        (ul_ [ p_ "A"
             , p_ "B"
             , p_ "C"
             ]
        )
        (ol_ [ p_ "D"
             , p_ "E"
             , p_ "F"
             ]
        )
      )
    )

main : IO ()
main =
  putStrLn (render myHtml)
