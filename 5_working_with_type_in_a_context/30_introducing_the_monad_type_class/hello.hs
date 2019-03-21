askForName :: IO ()
askForName = putStrLn "What is your name?"

nameStatement :: String -> String
nameStatement name = "Hello, " ++ name ++ "!"

result = (askForName >> getLine) >>= (\name -> return (nameStatement name))

helloName :: IO ()
helloName = askForName >>
            getLine >>=
            (\name -> return (nameStatement name)) >>=
            putStrLn
