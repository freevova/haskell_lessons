-- Q7.1 The tail function in Haskell returns an error when called on an empty list.
--     Modify myTail so that it does handle the case of an empty list
--     by returning the empty list.

myTail [] = []
myTail collection = tail collection

-- Q7.2 Rewrite myGCD by using pattern matching.
myGCD a b = if remainder == 0
            then b
            else myGCD b remainder
  where remainder = a `mod` b

myGCD1 a b = myGCD1 b (a `mod` b)
  where condition = a `mod` b == 0
myGCD1 a b = b
