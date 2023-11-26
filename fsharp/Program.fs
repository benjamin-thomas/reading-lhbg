(*
 * dotnet watch run
 *)
type Html = Html of string
type Structure = Structure of string

let append_ (Structure a) (Structure b) = Structure(a + b)
let render (Html s) = s
let el tag content = $"<%s{tag}>%s{content}</%s{tag}>"

let h1_ = Structure << el "h1"
let p_ = Structure << el "p"

let html_ title (Structure content) =
    Html(el "html" (el "head" (el "title" title) + el "body" content))

let myHtml =
    html_
        "My title"
        (append_ (h1_ "Heading")
             (append_
                  (p_ "Paragraph #1")
                  (p_ "Paragraph #2")
             )
        )


let () =
    printfn $"%s{render myHtml}"
