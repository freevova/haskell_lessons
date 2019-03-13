-- Q24.2 Write a program called capitalize.hs that will take a file as an argument, read
--   that file, and then rewrite it capitalized.

import System.Environment
import System.IO
import qualified Data.Text as T
import qualified Data.Text.IO as TI

main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  input <- TI.readFile fileName
  TI.writeFile fileName (T.toUpper input)
