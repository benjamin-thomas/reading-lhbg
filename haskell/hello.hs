import Html (Html, append_, h1_, html_, p_, render)

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
        (h1_ "Heading")
        ( append_
            (p_ "Paragraph #1")
            (p_ "Paragraph #2")
        )
    )

main :: IO ()
main =
  putStrLn (render myHtml)
