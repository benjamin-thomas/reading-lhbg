module BlogGenerator.Html

type Html = Html of string
type Structure = Structure of string

let append_ (Structure a) (Structure b) = Structure(a + b)
let render (Html s) = s

let private el tag content = $"<%s{tag}>%s{content}</%s{tag}>"

let h1_ = Structure << el "h1"
let p_ = Structure << el "p"

let html_ title (Structure content) =
    Html(el "html" (el "head" (el "title" title) + el "body" content))
