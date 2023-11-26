open Printf

type html = Html of string
type structure = Structure of string

let append_ (Structure a) (Structure b) = Structure (a ^ b)
let render (Html s) = s
let el tag content = sprintf "<%s>%s</%s>" tag content tag

let escape str =
  let escape_char : char -> string = function
    | '<' -> "&lt;"
    | '>' -> "&gt;"
    | '&' -> "&amp;"
    | '"' -> "&quot;"
    | '\'' -> "&#39;"
    | c -> String.make 1 c
  in
  String.fold_left (fun acc c -> escape_char c :: acc) [] str
  |> List.rev
  |> String.concat ""
;;

(* NOTE: since variant constructors are note functions in OCaml, it doesn't make sens trying to compose at this stage. *)
let h1_ s = Structure (el "h1" @@ escape s)
let p_ s = Structure (el "p" @@ escape s)

let html_ ~title (Structure content) : html =
  let head = el "head" (el "title" @@ escape title) in
  let body = el "body" content in
  Html (el "html" (head ^ body))
;;
