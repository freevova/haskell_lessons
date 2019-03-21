doorPrize :: [Int]
doorPrize = [1000,2000,3000]

boxPrize :: [Int]
boxPrize = [500,20000]

-- deterministic door prize
-- totalPrize :: Int
-- totalPrize = (+) doorPrize boxPrize

-- nondeterministic door prize
totalPrize :: [Int]
totalPrize = pure (+) <*> doorPrize <*> boxPrize
