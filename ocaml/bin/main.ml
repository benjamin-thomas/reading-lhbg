module Html = Lib.Html

let myHtml =
  Html.(
    html_
      ~title:"My title"
      (append_
        (h1_ "Heading")
        (append_
          (p_ "Paragraph 1")
          (p_ "Paragraph 2")
        )
      )
  )
[@@ocamlformat "disable"]

(* Printing the generated HTML *)
let () =
  ()
  ; print_newline ()
  ; print_newline ()
  ; print_endline @@ Html.render myHtml
;;
