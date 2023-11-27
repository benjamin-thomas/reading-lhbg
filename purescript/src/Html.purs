module Html
  ( Html
  , Structure(..)
  , append_
  , h1_
  , html_
  , p_
  , ul_
  , ol_
  , code_
  , render
  ) where

import Prelude

import Data.String (joinWith)
import Data.String.CodeUnits (singleton, toCharArray)

newtype Html = Html String

instance showHtml :: Show Html where
  show (Html str) = "Html: " <> str

newtype Structure = Structure String

type Title = String

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure $ a <> b

render :: Html -> String
render (Html s) = s

toString :: Structure -> String
toString (Structure s) = s

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
        _ -> singleton c
  in
    joinWith "" <<< map escapeChar <<< toCharArray

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

p_ :: String -> Structure
p_ = Structure <<< el "p" <<< escape

code_ :: String -> Structure
code_ = Structure <<< el "pre" <<< escape

h1_ :: String -> Structure
h1_ = Structure <<< el "h1" <<< escape

ul_ :: Array Structure -> Structure
ul_ =
  Structure <<< el "ul" <<< joinWith "" <<< map (el "li" <<< toString)

ol_ :: Array Structure -> Structure
ol_ =
  Structure <<< el "ol" <<< joinWith "" <<< map (el "li" <<< toString)

html_ :: Title -> Structure -> Html
html_ title (Structure content) =
  Html
    ( el "html"
        ( el "head" (el "title" $ escape title)
            <> el "body" content
        )
    )
