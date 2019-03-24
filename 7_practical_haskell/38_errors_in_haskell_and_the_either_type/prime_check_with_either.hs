primes :: [Int]
primes = [2,3,5,7]

maxN :: Int
maxN = 10

isPrime :: Int -> Either String Bool
isPrime n
  | n < 2 = Left "Numbers less than 2 are not candidates for primes"
  | n > maxN = Left "Value exceeds limits of prime checker"
  | otherwise = Right (n `elem` primes)

data PrimeError = TooLarge | InvalidValue

instance Show PrimeError where
  show TooLarge = "Value exceed max bound"
  show InvalidValue = "Value is not a valid candidate for prime checking"

isPrimeM :: Int -> Either PrimeError Bool
isPrimeM n
  | n < 2 = Left InvalidValue
  | n > maxN = Left TooLarge
  | otherwise = Right (n `elem` primes)


displayResult :: Either PrimeError Bool -> String
displayResult (Right True) = "It's prime"
displayResult (Right False) = "It's composite"
displayResult (Left primeError) = show primeError

main :: IO ()
main = do
  print "Enter a number to test for primality:"
  n <- read <$> getLine
  let result = isPrimeM n
  print (displayResult result)
