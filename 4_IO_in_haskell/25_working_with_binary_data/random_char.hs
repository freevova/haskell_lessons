import System.Random

randomChar :: IO Char
randomChar = do
  randomInt <- randomRIO (0,255) -- could also use max and min bound
  return (toEnum randomInt)
