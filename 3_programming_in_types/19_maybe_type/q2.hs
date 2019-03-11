-- Q19.2 Write a version of map that works for Maybe types, called maybeMap.

import qualified Data.Map as Map
import Data.Maybe -- isJust function
import Data.List

maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap func Nothing = Nothing
maybeMap func (Just val) = Just (func val)
