-- Q41.1 Create an IO action named addTool, like addUser, to add a tool to the database.

addTool :: String -> String -> IO ()
addTool toolName toolDesc  = withConn "tools.db" $
                             \conn -> do
                               execute conn (mconcat ["INSERT INTO tools
                                                     , '(name, description, timesBorrowed) '
                                                     , 'VALUES (?,?,?)"')
                                  (toolName, toolDesc, (0 :: Int))
                               print "tool added"
