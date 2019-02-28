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




-- Q21.2 Create a program that asks the user to input a number and then returns
--   the nth Fibonacci numbers (see lesson 8 for an example of computing Fibonacci numbers).
