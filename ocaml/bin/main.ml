module Html = Lib.Html

let myHtml =
  Html.(
    html_
      ~title:"My title"
      (append_
        (h1_ "My <weird> Heading")
        (append_
          (append_
            (p_ "Paragraph 1")
            (p_ "Paragraph 2")
          )
          (ul_ [ p_ "A"
               ; p_ "B"
               ; p_ "C"
               ]
          )
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
