maybeHead :: [a] -> Maybe a
maybeHead [] = Nothing
maybeHead (x:_) = Just x

-- for Functor:
f = (+2) <$> maybeHead [1]

-- for Applicative:
a = (:) <$> maybeHead [1,2,3] <*> Just []

-- myTake for APplicative:
myTakeSafer :: Int -> Maybe [a] -> Maybe [a]
myTakeSafer 0 _ = Just []
myTakeSafer n (Just xs) = (:) <$> maybeHead xs <*> myTakeSafer (n-1) (Just (tail xs))
