-- Q8.1 Implement your own version of reverse, which reverses a list.

myReverse [] = []
myReverse (x:xs) = myReverse(xs) ++ [x]
