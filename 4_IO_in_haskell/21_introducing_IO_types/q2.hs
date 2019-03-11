-- Q21.2 Create a program that asks the user to input a number and then returns
--   the nth Fibonacci numbers (see lesson 8 for an example of computing Fibonacci numbers).

import qualified Data.Map as Map
import Data.Maybe

fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

main :: IO ()
main = do
  putStrLn "Please enter any number to calculate Fibonacci number"
  input <- getLine
  let number = read input::Int
  let result = fib number
  print result
