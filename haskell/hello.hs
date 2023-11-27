import Html (Html, append_, h1_, html_, ol_, p_, render, ul_)

{-

Workflow:

Terminal 1:
echo ./hello.hs | entr tmux send-keys -t reading-lhbg:0.2 C-l ":reload" Enter

Terminal 2:
ghci ./hello.hs

---

To run the program, use:

runghc ./hello.hs

-}

myHtml :: Html
myHtml =
  html_
    "My title"
    ( append_
        (h1_ "Heading <noes>!")
        ( append_
            ( append_
                (p_ "Paragraph #1")
                (p_ "Paragraph #2")
            )
            ( append_
                (ul_ [p_ "A", p_ "B", p_ "C"])
                (ol_ [p_ "D", p_ "E", p_ "F"])
            )
        )
    )

main :: IO ()
main =
  putStrLn (render myHtml)
