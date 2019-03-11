-- Q21.1 Translate listing 21.1 (reproduced below) into code by using do-notation in a Maybe.
--   Assume that all the user input is replaced with a Map with a value for the input.
--   Ignore the first putStrLn and simply return the statement at the end.
--
--     helloPerson :: String -> String
--     helloPerson name = "Hello" ++ " " ++ name ++ "!"
--     main :: IO ()
--     main = do
--        putStrLn "Hello! What's your name?"
--        name <- getLine
--        let statement = helloPerson name
--        putStrLn statement

import qualified Data.Map as Map
import Data.Maybe

type Name = String
inputData :: Map.Map Name String
inputData = Map.fromList [("name", "Ben")]

helloPerson :: Name -> String
helloPerson name = "Hello" ++ " " ++ name ++ "!"

myMain :: Maybe String
myMain = do
  name <- Map.lookup "name" inputData
  let statement = helloPerson name
  return statement
