-- Q11.2 In Haskell, both tail and head have an error when called on an empty list.
--   You can write a version of tail that won’t fail but instead return an empty list when called on an empty list.
--   Can you write a version of head that returns an empty list when called on an empty list?
--   To answer this, start by writing out the type signatures of both head and tail.

myTail :: [a] -> [a]
myTail [] = []
myTail (x:xs) = xs
