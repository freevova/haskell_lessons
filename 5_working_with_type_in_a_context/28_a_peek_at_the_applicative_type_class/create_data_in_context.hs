data User = User
  { name :: String
  , gamerId :: Int
  , score :: Int
  } deriving Show

-- For Mayby
serverUsername :: Maybe String
serverUsername = Just "Sue"
serverGamerId :: Maybe Int
serverGamerId =  Just 1337
serverScore :: Maybe Int
serverScore = Just 9001

myUser :: Maybe User
myUser = User <$> serverUsername <*> serverGamerId <*> serverScore
missedUser :: Maybe User
missedUser = User <$> Nothing <*> serverGamerId <*> serverScore

-- For IO
readInt :: IO Int
readInt = read <$> getLine
main :: IO ()
main = do
  putStrLn "Enter a username, gamerId and score"
  user <- User <$> getLine <*> readInt <*> readInt
  print user
