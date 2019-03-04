import qualified Data.Map as Map

-- Q18.1 For the types Triple and Box, implement a function similar to map, tripleMap, and boxMap.

data Box a = Box a deriving Show
data Triple a = Triple a a a deriving Show

type Point3D = Triple Double
aPoint :: Point3D
aPoint = Triple 0.1 53.2 12.3

-- WITH NATIVE MAP
boxMap1 :: (a -> b) -> [Box a] -> [Box b]
boxMap1 fun l1 = map (\(Box a) -> Box (fun a)) l1

-- WITH RECURSION
boxMap2 :: (a -> b) -> [Box a] -> [Box b]
boxMap2 fun [] = []
boxMap2 fun ((Box a):xs) = (Box (fun a)):boxMap2 fun xs

result1 = boxMap1 (\x -> x + 1) [Box 1, Box 2]
result2 = boxMap2 (\x -> x + 1) [Box 1, Box 2]

-- Q18.2 Modify the Organ type so that it can be used as a key.
-- Then build a Map, organInventory, of each organ to its count in the organCatalog.

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
