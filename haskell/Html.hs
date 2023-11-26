module Html (
    Html,
    Title,
    Structure,
    html_,
    p_,
    h1_,
    append_,
    render,
) where

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
