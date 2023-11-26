module Main

{-

Workflow:

Terminal 1:
echo ./hello.idr | entr tmux send-keys -t reading-lhbg:1.2 C-l ":reload" Enter "myHtml" Enter

Terminal 2:
rlwrap idris2 ./hello.idr

---

Compile and run

idris2 ./hello.idr -o hello && ./build/exec/hello

-}

data Html = MkHtml String
data Structure = MkStructure String

-- A type alias!
Title : Type
Title = String

append_ : Structure -> Structure -> Structure
append_ (MkStructure a) (MkStructure b) = MkStructure $ a ++ b

toString : Structure -> String
toString (MkStructure s) = s

render : Html -> String
render (MkHtml s) = s

el : String -> String -> String
el tag content =
  "<" ++ tag ++ ">" ++ content ++ "</" ++ tag ++ ">"

h1_ : String -> Structure
h1_ = MkStructure . el "h1"

p_ : String -> Structure
p_ = MkStructure . el "p"

html_ : Title -> Structure -> Html
html_ title content =
  MkHtml
    ( el 
        "html" 
        ( el "head" (el "title" title)
          ++ el "body" (toString content)
        )
    )

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
