-- Q38.2 The following are all partial functions. Use the type specified to implement a safer version of the function:
--   - succ — Maybe
--   - tail — [a] (Keep the type the same.)
--   - last — Either (last fails on empty lists and infinite lists; use an upper bound for the infinite case.

safeSucc :: (Enum a, Bounded a, Eq a) => a -> Maybe a
safeSucc n = if n == maxBound
             then Nothing
             else Just (succ n)
safeTail :: [a] -> [a]
safeTail [] = []
safeTail (x:xs) = xs
safeLast :: [a] -> Either a String
safeLast [] = Right "empty list"
safeLast xs =  safeLast' 10000 xs

-- The empty list isn’t possible, because only safeLast will call this function,
-- and it already checks for the empty list:

safeLast' :: Int -> [a] -> Either a String
safeLast' 0 _ = Right "List exceeds safe bound"
safeLast' _ (x:[]) = Left x
safeLast' n (x:xs) = safeLast' (n - 1) xs
