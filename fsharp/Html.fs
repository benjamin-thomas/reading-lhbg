module BlogGenerator.Html

type Html = Html of string
type Structure = Structure of string

let append_ (Structure a) (Structure b) = Structure(a + b)
let render (Html s) = s

let private el tag content = $"<%s{tag}>%s{content}</%s{tag}>"

let private escape (str: string) : string =
    let escape_char =
        function
        | '<' -> "&lt;"
        | '>' -> "&gt;"
        | '&' -> "&amp;"
        | '"' -> "&quot;"
        | '\'' -> "&#39;"
        | c -> $"%c{c}" in

    str
    |> Seq.fold (fun acc c -> escape_char c :: acc) []
    |> Seq.rev
    |> List.ofSeq
    |> String.concat ""

let h1_ = Structure << el "h1" << escape
let p_ = Structure << el "p" << escape
let code_ = Structure << el "pre" << escape

let ul_ =
    Structure
    << el "ul"
    << String.concat ""
    << List.map (fun (Structure x) -> el "li" x)

let html_ title (Structure content) =
    let head = el "head" (el "title" <| escape title)
    let body = el "body" content
    Html(el "html" (head + body))
