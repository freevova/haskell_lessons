-- Q22.2 Write a program that allows a user to select a number between 1 and 5 and then
--   prints a famous quote (quotes are of your choosing). After printing the quote, the pro-
--   gram will ask whether the user would like another. If the user enters n, the program
--   ends; otherwise, the user gets another quote. The program repeats until the user enters
--   n. Try to use lazy evaluation and treat the user input as a list rather than recursively
--   calling main at the end.

import System.Environment
import Control.Monad

quotes :: [String]
quotes = ["quote 1"
          ,"quote 2"
          ,"quote 3"
          ,"quote 4"
          ,"quote 5"]

lookupQuote :: [String] -> [String]
lookupQuote [] = []
lookupQuote ("n":xs) = []
lookupQuote (x:xs) = quote : (lookupQuote xs)
  where quote = quotes !! (read x - 1)

main :: IO ()
main = do
  userInput <- getContents
  mapM_ putStrLn (lookupQuote  (lines userInput))
