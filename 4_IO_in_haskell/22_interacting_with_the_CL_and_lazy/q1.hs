-- Q22.1 Write a program, simple_calc.hs, that reads simple equations involving adding
--   two numbers or multiplying two numbers. The program should solve the equation each
--   user types into each line as each line is entered.
-- data Actions = Add | Multiply deriving (Show)
--

import System.Environment
import Control.Monad

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
