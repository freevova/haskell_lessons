-- Q28.3 Recall the RobotPart type from the preceding lesson:
--
--   data RobotPart = RobotPart
--     { name :: String
--     , description :: String
--     , cost :: Double
--     , count :: Int
--     } deriving Show
--
--   Make a command-line application that has a database of various RobotParts (at least five),
--   and then lets the user enter in two-part IDs and returns the one with the lowest cost.
--   Handle the case of the user entering an ID that’s not in the parts database.

printCost :: Maybe Double -> IO()
printCost Nothing = putStrLn "missing item"
printCost (Just cost)= print cost

main :: IO ()
main = do
  putStrLn "enter a part number 1"
  partNo1 <- getLine
  putStrLn "enter a part number 2"
  partNo2 <- getLine
  let part1 = Map.lookup (read partNo1) partsDB
  let part2 = Map.lookup (read partNo2) partsDB
  let cheapest = min <$> (cost <$> part1) <*> (cost <$> part2)
  printCost cheapest
