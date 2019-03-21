data User = User
  {
    name :: String
  , gamerId :: Int
  , score :: Int
  } deriving Show

testNames :: [String]
testNames = ["John Smith"
            ,"Robert'); DROP TABLE Students;--"
            ,"Christina NULL"
            ,"Randall Munroe"]

testIds :: [Int]
testIds = [1337
          , 0123
          , 999999]

testScores :: [Int]
testScores = [0
             , 100000
             , -99999]

testData :: [User]
testData = pure User <*> testNames <*> testIds <*> testScores
