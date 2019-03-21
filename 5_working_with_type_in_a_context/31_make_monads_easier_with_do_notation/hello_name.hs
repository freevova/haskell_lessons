askForName :: IO ()
askForName = putStrLn "What is your name?"

nameStatement :: String -> String
nameStatement name = "Hello, " ++ name ++ "!"

helloName :: IO ()
helloName = askForName >>
            getLine >>=
            (\name -> return (nameStatement name)) >>=
            putStrLn

-- the same in do-notation
helloNameDo :: IO ()
helloNameDo = do
  askForName
  name <- getLine
  putStrLn (nameStatement name)

-- Example 2
helloPerson :: String -> String
helloPerson name = "Hello" ++ " " ++ name ++ "!"
main :: IO ()
main = do
  name <- getLine
  let statement = helloPerson name
  putStrLn statement

main :: IO ()
main = getLine >>=
  (\name ->
    (\statement -> putStrLn statement)
      (helloPerson name)
  )
