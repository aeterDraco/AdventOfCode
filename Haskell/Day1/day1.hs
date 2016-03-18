import Data.Char
import Data.Maybe
import Data.List
import Text.Printf

stripChars :: String -> String -> String
stripChars = filter . flip notElem

main = do
	src <- readFile "day1.input"
	let up = stripChars ")" src
	let down = stripChars "(" src
	putStrLn $ "" ++ up - down

