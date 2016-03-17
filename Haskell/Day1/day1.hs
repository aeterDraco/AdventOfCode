import Data.Char
import Data.Maybe
import Data.List
import Data.Map hiding (map)
import Text.Printf

stripChars :: String -> String -> String
stripChars = filter . flip notElem

main = do
	src <- readFile "day1.input"
	let up = stripChars ")" src
	putStrLn $ "" ++ src

