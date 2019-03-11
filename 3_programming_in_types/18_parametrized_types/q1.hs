-- Q18.1 For the types Triple and Box, implement a function similar to map, tripleMap, and boxMap.

import qualified Data.Map as Map

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
