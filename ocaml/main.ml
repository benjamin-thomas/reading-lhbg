open Printf

type html = Html of string
type structure = Structure of string

let append_ (Structure a) (Structure b) = Structure (a ^ b)
let render (Html s) = s
let el tag content = sprintf "<%s>%s</%s>" tag content tag

(* NOTE: since variant constructors are note functions in OCaml, it doesn't make sens trying to compose at this stage. *)
let h1_ s = Structure (el "h1" s)
let p_ s = Structure (el "p" s)

let html_ ~title (Structure content) : html =
  let head = el "head" (el "title" title) in
  let body = el "body" content in
  Html (el "html" (head ^ body))
;;

let myHtml =
  html_
    ~title:"My title"
    ( append_
        (h1_ "Heading")
        (append_
          (p_ "Paragraph 1")
          (p_ "Paragraph 2")
        )
    )
[@@ocamlformat "disable"]

(* Printing the generated HTML *)
let () =
  ()
  ; print_newline ()
  ; print_newline ()
  ; print_endline @@ render myHtml
;;
