-- Q23.1 Rewrite the hello_world.hs program (reproduced here) from lesson 21 to use
--   Text instead of String types.
--
--     helloPerson :: String -> String
--     helloPerson name = "Hello" ++ " " ++ name ++ "!"
--
--     main :: IO ()
--     main = do
--       putStrLn "Hello! What's your name?"
--       name <- getLine
--       let statement = helloPerson name
--       putStrLn statement