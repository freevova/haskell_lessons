-- Q31.2 At the end of lesson 21 in unit 4, we first introduced the idea that do-notation isn’t specific to IO.
--   You ended up with this function for a Maybe type:
--
--   maybeMain :: Maybe String
--   maybeMain = do
--     size1 <- Map.lookup 1 sizeData
--     cost1 <- Map.lookup 1 costData
--     size2 <- Map.lookup 2 sizeData
--     cost2 <- Map.lookup 2 costData
--     let pizza1 = (size1,cost1)
--     let pizza2 = (size2,cost2)
--     let betterPizza = comparePizzas pizza1 pizza2
--     return  (describePizza betterPizza)
--
--   Rewrite this function so it works with the List type (don’t worry if the results seem strange).

listMain :: [String]
listMain = do
  size1 <- [10,12,17]
  cost1 <- [12.0,15.0,20.0]
  size2 <- [10,11,18]
  cost2 <- [13.0,14.0,21.0]
  let pizza1 = (size1,cost1)
  let pizza2 = (size2,cost2)
  let betterPizza = comparePizzas pizza1 pizza2
  return (describePizza betterPizza)
