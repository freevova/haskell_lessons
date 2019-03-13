{-# LANGUAGE OverloadedStrings #-}
import System.Environment
import System.IO
import qualified Data.Text as T
import qualified Data.Text.IO as TI

-- With this implementation we have a bug.
-- We can see that we close file before input calls.
-- input value calculates on appendFile(laziness)
-- and in that case file is closed and we have no data
-- to process.
main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  file <- openFile fileName ReadMode
  input <- hGetContents file
  hClose file
  let summary = (countsText . getCounts) input
  appendFile "stats.dat" (mconcat [fileName, " ",summary, "\n"])

  putStrLn summary


-- Right implementation that prevents lazy bag
main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  file <- openFile fileName ReadMode
  input <- hGetContents file
  let summary = (countsText . getCounts) input
  putStrLn summary

-- STRICT IO
-- Here we use TextIO that calculates strict code immediately.

getCounts :: T.Text -> (Int,Int,Int)
getCounts input = (charCount, wordCount, lineCount)
  where charCount = T.length input
        wordCount = (length . T.words) input
        lineCount = (length . T.lines) input

countsText :: (Int,Int,Int) -> T.Text
countsText (cc,wc,lc) = T.pack (unwords ["chars: ", show cc
                                        , " words: ", show wc
                                        , " lines: ", show lc])
main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  input <- TI.readFile fileName
  let summary = (countsText . getCounts) input
  TI.appendFile "stats.dat"
  (mconcat [(T.pack fileName), " ",summary, "\n"])
  TI.putStrLn summary
