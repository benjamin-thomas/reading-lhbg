module Html
  ( Html
  , Structure(..)
  , append_
  , h1_
  , html_
  , p_
  , render
  ) where

import Prelude

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