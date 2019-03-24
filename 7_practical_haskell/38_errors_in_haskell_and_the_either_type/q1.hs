-- Q38.1 Make a function addStrInts that takes two Ints represented as Strings and adds them.
--   The function would return an Either String Int. The Right constructor should return the result,
--   provided that the two arguments can be parsed into Ints (use Data.Char isDigit to check).
--   Return a different Left result for the three possible cases:
--
--   - First value can’t be parsed.
--   - Second value can’t be parsed.
--   - Neither value can be parsed.

allDigits :: String -> Bool
allDigits val = all (== True) (map isDigit val)

addStrInts :: String -> String -> Either Int String
addStrInts val1 val2
  | allDigits val1 && allDigits val2 = Left (read val1 + read val2)
  | not (allDigits val1 || allDigits val2) = Right "both args invalid"
  | not (allDigits val1) = Right "first arg invalid"
  | otherwise = Right "second arg invalid"
