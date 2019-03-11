-- Q18.2 Modify the Organ type so that it can be used as a key.
-- Then build a Map, organInventory, of each organ to its count in the organCatalog.

import qualified Data.Map as Map

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

instance Ord Organ where
  compare Heart Heart   = EQ
  compare Heart Brain   = GT
  compare Heart Kidney  = GT
  compare Heart Spleen  = GT

  compare Brain Brain   = EQ
  compare Brain Heart   = LT
  compare Brain Kidney  = GT
  compare Brain Spleen  = GT

  compare Kidney Kidney = EQ
  compare Kidney Heart  = LT
  compare Kidney Brain  = LT
  compare Kidney Spleen = GT

  compare Spleen Spleen = EQ
  compare Spleen Heart  = LT
  compare Spleen Brain  = LT
  compare Spleen Kidney = LT



organs :: [Organ]
organs = [Heart,Heart,Brain,Spleen,Spleen,Kidney]

ids :: [Int]
ids = [2,7,13,14,21,24]

organsList :: [(Organ, Int)]
organsList = [
  (Heart,  2),
  (Brain,  1),
  (Kidney, 1),
  (Spleen, 2)
            ]

organInventory :: Map.Map Organ Int
organInventory = Map.fromList organsList

getHeart :: Mayby a
getHeart = Map.lookup Heart organCatalog
