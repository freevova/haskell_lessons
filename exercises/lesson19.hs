import qualified Data.Map as Map
import Data.Maybe -- isJust function
import Data.List

-- Q19.1 Write a function emptyDrawers that takes the output of getDrawerContents
-- and tells you the number of drawers that are empty.

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

organs :: [Organ]
organs = [Heart,Heart,Brain,Spleen,Spleen,Kidney]

ids :: [Int]
ids = [2,7,13,14,21,24]

organPairs :: [(Int,Organ)]
organPairs = zip ids organs

organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs

possibleDrawers :: [Int]
possibleDrawers = [1 .. 50]

getDrawerContents :: [Int] -> Map.Map Int Organ -> [Maybe Organ]
getDrawerContents ids catalog = map getContents ids
  where getContents = \id -> Map.lookup id catalog

availableOrgans :: [Maybe Organ]
availableOrgans = getDrawerContents possibleDrawers organCatalog

countOrgan :: Organ -> [Maybe Organ] -> Int
countOrgan organ available = length (filter
                                       (\x -> x == Just organ)
                                       available)

getEmptyDrawers :: [Maybe Organ] -> [Int]
getEmptyDrawers available = filter filterFunction possibleDrawers
  where filterFunction = \id -> (available !! (id - 1)) == Nothing

-- Q19.2 Write a version of map that works for Maybe types, called maybeMap.
