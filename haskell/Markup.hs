module Markup where

import Data.Maybe (maybeToList)
import Numeric.Natural (Natural)

data Structure
    = Heading Natural String
    | Paragraph String
    | UnorderedList [String]
    | OrderedList [String]
    | CodeBlock [String]
    deriving (Show)

type Document = [Structure]

print :: (Show a) => a -> IO ()
print = putStrLn . show

trim :: String -> String
trim = unwords . words

parseLines :: [String] -> [String] -> Document
parseLines currentParagraph lines =
    let
        paragraph = Paragraph (unlines (reverse currentParagraph))
     in
        case lines of
            [] -> [paragraph]
            x : xs ->
                if trim x == ""
                    then paragraph : parseLines [] xs
                    else parseLines (x : currentParagraph) xs

parse :: String -> Document
parse = parseLines [] . lines

maybe2 :: (a -> [a] -> [a]) -> Maybe a -> [a] -> [a]
maybe2 f a lst =
    case a of
        Nothing -> lst
        Just a' -> f a' lst

{-

We want to cons:
ghci> 1 : [2]
[1,2]

But since we have a Maybe on the left, we can't. So instead we do this:
ghci> maybe id (:) (Nothing) [1]
[1]
ghci> maybe id (:) (Just 1) []
[1]

ghci> maybe id (:) (Just 1) [2]
[1,2]

 -}
parseLines' :: Maybe Structure -> [String] -> Document
parseLines' ctx lines =
    case lines of
        [] -> maybeToList ctx
        currLine : rest ->
            let line = trim currLine
             in if line == ""
                    then maybe id (:) ctx (parseLines' Nothing rest)
                    else case ctx of
                        Just (Paragraph p) ->
                            parseLines' (Just $ Paragraph $ unwords [p, line]) rest
                        _ ->
                            maybe id (:) ctx (parseLines' (Just $ Paragraph line) rest)

parse' :: String -> Document
parse' = parseLines' Nothing . lines

example1 :: Document
example1 =
    [ Paragraph "Hello, world!"
    ]

example2 :: Document
example2 =
    [ Heading 1 "Welcome"
    , Paragraph "To this tutorial about Haskell."
    ]

example3 :: Document
example3 =
    [ Paragraph "Remember that multiple lines with no separation are grouped together into a single paragraph but list items remain separate."
    , OrderedList
        [ "Item 1 of a list"
        , "Item 2 of the same list"
        ]
    ]

example4 :: Document
example4 =
    [ Heading 1 "Compiling programs with GHC"
    , Paragraph "Running ghc invokes the Glasgow Haskell Compiler (GHC), and can be used to compile Haskell modules and programs into native executables and libraries."
    , Paragraph "Create a new Haskell source file named hello.hs, and write the following code in it:"
    , CodeBlock ["main = putStrLn \"Hello, Haskell!\""]
    , Paragraph "Now, we can compile the program by invoking ghc with the file name:"
    , CodeBlock
        [ "➜ ghc hello.hs"
        , "[1 of 1] Compiling Main             ( hello.hs, hello.o )"
        , "Linking hello ..."
        ]
    , Paragraph "GHC created the following files:"
    , UnorderedList
        [ "hello.hi - Haskell interface file"
        , "hello.o - Object file, the output of the compiler before linking"
        , "hello (or hello.exe on Microsoft Windows) - A native runnable executable."
        ]
    , Paragraph "GHC will produce an executable when the source file satisfies both conditions:"
    , OrderedList
        [ "Defines the main function in the source file"
        , "Defines the module name to be Main or does not have a module declaration"
        ]
    , Paragraph "Otherwise, it will only produce the .o and .hi files."
    ]
