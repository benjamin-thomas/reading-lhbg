{-

Workflow:

Terminal 1:
echo ./hello.hs | entr tmux send-keys -t reading-lhbg:0.2 C-l ":reload" Enter

Terminal 2:
ghci ./hello.hs

---

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

---

## A note on function application.

When we want to check if/why combining functions type-checks, here's how to proceed:

First we look at the type signature of compose:

  (b -> c) -> (a -> b) -> a -> c

Then we replace the functions we feed it with: the type variables must match

   0) For composing: `Structure . el "p"`
   1) (.) :: (b -> c) -> (a -> b) -> a -> c
   2) Looking at both functions, we note that:
         - b ~ String
         - c ~ Structure
         - a ~ String
   3) (.) :: (String -> Structure) -> (String -> String) -> (String -> Structure)

-}

newtype Html = Html String
newtype Structure = Structure String deriving (Show)

type Title = String -- a type alias

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure $ a <> b

render :: Html -> String
render (Html str) = str

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

p_ :: String -> Structure
p_ =
  Structure . el "p"

h1_ :: String -> Structure
h1_ =
  Structure . el "h1"

html_ :: Title -> Structure -> Html
html_ title (Structure content) =
  Html
    ( el
        "html"
        ( el "head" (el "title" title)
            <> el "body" content
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

main :: IO ()
main =
  putStrLn (render myHtml)
