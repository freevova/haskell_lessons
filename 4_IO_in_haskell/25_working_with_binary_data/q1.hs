-- Q25.1 Write a program that reads in a text file and outputs the difference between the
--   number of characters in the file and the number of bytes in the file.

import System.IO
import System.Environment
import qualified Data.Text as T
import qualified Data.ByteString as B
import qualified Data.Text.Encoding as E

main :: IO ()
main = do
  args <- getArgs
  let source =  args !! 0
  input <- B.readFile source
  putStrLn "Bytes:"
  print (B.length input)
  putStrLn "Characters:"
  print ((T.length . E.decodeUtf8) input)
