(* Create any HTML *)
let el tag content = "<" ^ tag ^ ">" ^ content ^ "</" ^ tag ^ ">"

(* Html helpers *)
let html_ = el "html"
let head_ = el "head"
let title_ = el "title"
let body_ = el "body"
let p_ = el "p"
let h1_ = el "h1"

(* Helper functions *)
let makeHtml title body = html_ (head_ (title_ title) ^ body_ body)

(* Build the final HTML *)
let myHtml =
  makeHtml "Learn OCaml by building a Blog Generator" (h1_ "A title" ^ p_ "A paragraph")
;;

(* Printing the generated HTML *)
let () =
  ()
  ; print_newline ()
  ; print_newline ()
  ; print_endline myHtml
;;
