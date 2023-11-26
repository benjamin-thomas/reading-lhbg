module Html

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

export
h1_ : String -> Structure
h1_ = MkStructure . el "h1"

export
p_ : String -> Structure
p_ = MkStructure . el "p"

export
html_ : Title -> Structure -> Html
html_ title content =
  MkHtml
    ( el
        "html"
        ( el "head" (el "title" title)
          ++ el "body" (toString content)
        )
    )

