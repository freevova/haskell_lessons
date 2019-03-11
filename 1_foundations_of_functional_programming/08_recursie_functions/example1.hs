myLength [] = 0
myLength xs = 1 + myLength (tail xs)

myTake _ [] = []
myTake 0 _ = []
myTake n (x:xs) = x:rest
  where rest = myTake (n - 1) xs
