
import Text.ParserCombinators.Parsec
	
main :: IO ()

csvFile = endBy line eol
line    = sepBy cell (char ',')
cell    = many (noneOf ",\n\r")

eol = char '\n'

parseCSV :: String -> Either ParseError [[String]]
parseCSV input = parse csvFile "(unknown)" input

main =
     do c <- getContents
        case parse csvFile "(stdin)" c of
            Left e -> do putStrLn "Error parsing input:"
                         print e
            Right r -> mapM_ print [r]