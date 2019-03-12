-- Q23.2 Use Data.Text.Lazy and Data.Text.Lazy.IO to rewrite the lazy I/O section from lesson
--   22 by using the Text type.
--
--     toInts :: String -> [Int]
--     toInts = map read . lines
--
--     main :: IO ()
--     main = do
--       userInput <- getContents
--       let numbers = toInts userInput
--       print (sum numbers)

import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as TIO

toInts :: T.Text -> [Int]
toInts = map (read . T.unpack) . T.lines

-- exampleText :: T.Text
-- exampleText = "1 2 3"
-- a = toInts exampleText

main :: IO ()
main = do
  userInput <- TIO.getContents
  let numbers = toInts userInput
  TIO.putStrLn ((T.pack . show . sum) numbers)
