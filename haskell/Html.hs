module Html (
    Html,
    Title,
    Structure,
    html_,
    p_,
    h1_,
    ul_,
    ol_,
    code_,
    render,
) where

newtype Html = Html String
newtype Structure = Structure String deriving (Show)

type Title = String -- a type alias

-- append_ :: Structure -> Structure -> Structure
-- append_ (Structure a) (Structure b) = Structure $ a <> b
instance Semigroup Structure where
    (<>) :: Structure -> Structure -> Structure
    (Structure a) <> (Structure b) = Structure $ a <> b

{- |
>>> escape "<hello>"
"&lt;hello&gt;"
-}
escape :: String -> String
escape =
    let
        escapeChar :: Char -> String
        escapeChar c =
            case c of
                '<' -> "&lt;"
                '>' -> "&gt;"
                '&' -> "&amp;"
                '"' -> "&quot;"
                '\'' -> "&#39;"
                _ -> [c]
     in
        concatMap escapeChar

render :: Html -> String
render (Html str) = str

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

p_ :: String -> Structure
p_ =
    Structure . el "p" . escape

code_ :: String -> Structure
code_ =
    Structure . el "pre" . escape

h1_ :: String -> Structure
h1_ =
    Structure . el "h1" . escape

getString :: Structure -> String
getString (Structure x) = x

ul_ :: [Structure] -> Structure
ul_ =
    Structure . el "ul" . concatMap (el "li" . getString)

ol_ :: [Structure] -> Structure
ol_ =
    Structure . el "ol" . concatMap (el "li" . getString)

html_ :: Title -> Structure -> Html
html_ title (Structure content) =
    Html
        ( el
            "html"
            ( el "head" (el "title" $ escape title)
                <> el "body" content
            )
        )
