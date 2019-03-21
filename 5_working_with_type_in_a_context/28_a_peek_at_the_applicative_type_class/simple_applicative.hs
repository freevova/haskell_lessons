maybeInc :: Maybe (Integer -> Integer)
maybeInc = (+) <$> Just 1

a = maybeInc <*> Just 5
b = maybeInc <*> Nothing
c = maybeInc <*> Just 100

val1 = (Just 10)
val2 = (Just 5)
result1 = (+) <$> val1 <*> val2
result2 = div <$> val1 <*> val2
result3 = mod <$> val1 <*> val2
