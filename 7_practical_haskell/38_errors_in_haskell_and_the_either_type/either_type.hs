primes :: [Int]
primes = [2,3,5,7]

maxN :: Int
maxN = 10

isPrime :: Int -> Maybe Bool
isPrime n
  | n < 2 = Nothing
  | n > maxN = Nothing
  | otherwise = Just (n `elem` primes)

-- either definition:
--   data Either a b = Left a | Right b

eitherHead :: [a] -> Either String a
eitherHead [] = Left "There is no head because the list is empty"
eitherHead (x:xs) = Right x

intExample :: [Int]
intExample = [1,2,3]

intExampleEmpty :: [Int]
intExampleEmpty = []

charExample :: [Char]
charExample = "cat"

charExampleEmpty :: [Char]
charExampleEmpty = ""

monadResult = (+ 1) <$> (eitherHead intExample) -- Right 2
