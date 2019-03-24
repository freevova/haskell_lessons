-- will throw error on myTake 4 [1,2,3] :: [Int]
myTake :: Int -> [a] -> [a]
myTake 0 _ = []
myTake n xs = head xs : myTake (n-1) (tail xs)


-- won't throw error on myTake 4 [1,2,3] :: [Int] because of pattern match
myTakePM :: Int -> [a] -> [a]
myTakePM 0 _ = []
myTakePM n (x:xs) = x : myTakePM (n-1) xs
