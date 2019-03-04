import System.Environment
import Control.Monad


-- prints lazy input data
-- main :: IO ()
-- main = do
--   userInput <- getContents
--   mapM_ print userInput


sampleData = ['6','2','\n','2','1','\n']
myLines = lines sampleData

toInts :: String -> [Int]
toInts = map read . lines

main :: IO ()
main = do
  userInput <- getContents
  let numbers = toInts userInput
  print (sum numbers)

