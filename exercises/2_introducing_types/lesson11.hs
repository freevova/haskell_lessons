-- Q11.1 What is the type signature for filter? How is it different from map?
-- map :: (a -> b) -> [a] -> [b]
-- filter :: (a -> Bool) -> [a] -> [a]

-- Q11.2 In Haskell, both tail and head have an error when called on an empty list.
--   You can write a version of tail that won’t fail but instead return an empty list when called on an empty list.
--   Can you write a version of head that returns an empty list when called on an empty list?
--   To answer this, start by writing out the type signatures of both head and tail.

myTail :: [a] -> [a]
myTail [] = []
myTail (x:xs) = xs

-- Q11.3 Recall myFoldl from lesson 9.
--   myFoldl f init [] = init
--   myFoldl f init (x:xs) = myFoldl f newInit xs
--     where newInit = f init x
--
--   What’s the type signature of this function? Note: foldl has a different type signature.

myFoldl :: (a -> b) -> a -> [a] -> b
myFoldl f init [] = init
myFoldl f init (x:xs) = myFoldl f newInit xs
  where newInit = f init x
