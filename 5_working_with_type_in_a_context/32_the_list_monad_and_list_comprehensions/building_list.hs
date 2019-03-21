import Control.Monad

powersOfTwo :: Int -> [Int]
powersOfTwo n = do
  value <- [1 :: n]
  return (2^value)

-- the same as list structure:
--   powersOfTwoMap :: Int -> [Int]
--   powersOfTwoMap n = map (\x -> 2^x) [1 .. n]

powersOfTwoAndThree :: Int -> [(Int,Int)]
powersOfTwoAndThree n = do
  value <- [1 .. n]
  let powersOfTwo = 2^value
  let powersOfThree = 3^value
  return (powersOfTwo,powersOfThree)

allEvenOdds :: Int -> [(Int,Int)]
allEvenOdds n = do
  evenValue <- [2,4 .. n]
  oddValue <- [1,3 .. n]
  return (evenValue,oddValue)

evensGuard :: Int -> [Int]
evensGuard n = do
  value <- [1 .. n]
  guard(even value)
  return value


evenSquares :: [Int]
evenSquares = do
  n <- [0 .. 9]
  let nSquared = n^2
  guard(even nSquared)
  return nSquared

-- list comprehension

powersOfTwo1 :: Int -> [Int]
powersOfTwo1 n = [value^2 | value <- [1 .. n]]

powersOfTwoAndThree1 :: Int -> [(Int,Int)]
powersOfTwoAndThree1 n = [(powersOfTwo,powersOfThree)
                         | value <- [1 .. n]
                         , let powersOfTwo = 2^value
                         , let powersOfThree = 3^value]

allEvenOdds1 :: Int -> [(Int,Int)]
allEvenOdds1 n = [(evenValue,oddValue) |  evenValue <- [2,4 .. n]
                                      ,  oddValue <- [1,3 .. n]]
evensGuard1 :: Int -> [Int]
evensGuard1 n = [value | value <- [1 .. n], even value]
