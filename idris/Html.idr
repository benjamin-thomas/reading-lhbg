module Html

import Data.String

export
data Html = MkHtml String

export
data Structure = MkStructure String

public export
Title : Type -- A type alias!
Title = String

export
append_ : Structure -> Structure -> Structure
append_ (MkStructure a) (MkStructure b) = MkStructure $ a ++ b

toString : Structure -> String
toString (MkStructure s) = s

export
render : Html -> String
render (MkHtml s) = s

el : String -> String -> String
el tag content =
  "<" ++ tag ++ ">" ++ content ++ "</" ++ tag ++ ">"

escape : String -> String
escape str =
  let
    escapeChar : Char -> String
    escapeChar c =
      case c of
        '<' => "&lt;"
        '>' => "&gt;"
        '&' => "&amp;"
        '"' => "&quot;"
        '\'' => "&#39;"
        _ => String.singleton c
  in
  concat . map escapeChar $ unpack str
   
export
h1_ : String -> Structure
h1_ = MkStructure . el "h1" . escape

export
p_ : String -> Structure
p_ = MkStructure . el "p" . escape

export
html_ : Title -> Structure -> Html
html_ title content =
  MkHtml
    ( el
        "html"
        ( el "head" (el "title" $ escape title)
          ++ el "body" (toString content)
        )
    )

