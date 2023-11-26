(*
 * dotnet watch run
 *)

module H = BlogGenerator.Html

let myHtml =
    H.html_
        "My title"
        (H.append_ (H.h1_ "My <weird> Heading")
             (H.append_
                  (H.p_ "Paragraph #1")
                  (H.p_ "Paragraph #2")
             )
        )

let () =
    printfn $"%s{H.render myHtml}"
