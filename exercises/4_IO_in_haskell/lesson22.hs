import System.Environment
import Control.Monad

-- Q22.1 Write a program, simple_calc.hs, that reads simple equations involving adding
--   two numbers or multiplying two numbers. The program should solve the equation each
--   user types into each line as each line is entered.
-- data Actions = Add | Multiply deriving (Show)
--

actionFromInput input = case input of
                        "*" -> (*)
                        _ -> (+)

main :: IO ()
main = do
  userInput <- getArgs
  let action = if length userInput > 0
               then actionFromInput (head userInput)
               else actionFromInput "+"
  numbers <- replicateM 2 getLine
  let ints = map read numbers :: [Int]
  print( action (ints !! 0) (ints !! 1) )



-- Q22.2 Write a program that allows a user to select a number between 1 and 5 and then
--   prints a famous quote (quotes are of your choosing). After printing the quote, the pro-
--   gram will ask whether the user would like another. If the user enters n, the program
--   ends; otherwise, the user gets another quote. The program repeats until the user enters
--   n. Try to use lazy evaluation and treat the user input as a list rather than recursively
--   calling main at the end.
