-- Q27.3 Write a command-line interface for partsDB that lets the user look up the cost of an item,
--   given an ID. Use the Maybe type to handle the case of the user entering missing input.

printCost :: Maybe Double -> IO()
printCost Nothing = putStrLn "item not found"
printCost (Just cost)= print cost

main :: IO ()
main = do
  putStrLn "enter a part number"
  partNo <- getLine
  let part = Map.lookup (read partNo) partsDB
  printCost (cost <$> part)
