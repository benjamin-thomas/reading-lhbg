module BlogGenerator.Markup

type structure =
  | Heading of int * string
  | Paragraph of string
  | UnorderedList of string list
  | OrderedList of string list
  | CodeBlock of string list

type document = structure list

let example1 : document = [ Paragraph "Hello, World!" ]
let example2 = [ Heading (1, "Welcome"); Paragraph "To this tutorial about Haskell." ]

let example3 =
  [ Paragraph
      "Remember that multiple lines with no separation are grouped together into a \
       single paragraph but list items remain separate."
  ; UnorderedList [ "Item 1 of a list"; "Item 2 of the same list" ]
  ]
;;

let example4 =
  [ Heading (1, "Compiling programs with GHC")
  ; Paragraph
      "Running ghc invokes the Glasgow Haskell Compiler (GHC), and can be used to \
       compile Haskell modules and programs into native executables and libraries."
  ; Paragraph
      "Create a new Haskell source file named hello.hs, and write the following code in \
       it:"
  ; CodeBlock [ "main = putStrLn \"Hello, Haskell!\"" ]
  ; Paragraph "Now, we can compile the program by invoking ghc with the file name:"
  ; CodeBlock
      [ "➜ ghc hello.hs"
      ; "[1 of 1] Compiling Main             ( hello.hs, hello.o )"
      ; "Linking hello ..."
      ]
  ; Paragraph "GHC created the following files:"
  ; UnorderedList
      [ "hello.hi - Haskell interface file"
      ; "hello.o - Object file, the output of the compiler before linking"
      ; "hello (or hello.exe on Microsoft Windows) - A native runnable executable."
      ]
  ; Paragraph
      "GHC will produce an executable when the source file satisfies both conditions:"
  ; OrderedList
      [ "Defines the main function in the source file"
      ; "Defines the module name to be Main or does not have a module declaration"
      ]
  ; Paragraph "Otherwise, it will only produce the .o and .hi files."
  ]
;;

