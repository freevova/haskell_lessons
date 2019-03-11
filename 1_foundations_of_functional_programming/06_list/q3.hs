-- Q6.3 Write a function inFirstHalf that returns True if an element is in the first half of a list,
--    and otherwise returns False.

inFirstHalf symbol collection = symbol `elem` firstHalf
  where firstHalfLength = (length collection) `div` 2
        firstHalf = take firstHalfLength collection
