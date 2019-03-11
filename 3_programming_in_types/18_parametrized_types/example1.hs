data Box a = Box a deriving Show

-- GHCi> n = 6 :: Int
-- GHCi> :t Box n
-- Box n :: Box Int
-- GHCi> word = "box"
-- GHCi> :t Box word
-- Box word :: Box [Char]
-- GHCi> f x = x
-- GHCi> :t Box f
-- Box f :: Box (t -> t)
-- GHCi> otherBox = Box n
-- GHCi> :t Box otherBox
-- Box otherBox :: Box (Box Int)

wrap :: a -> Box a
wrap x = Box x
unwrap :: Box a -> a
unwrap (Box x) = x
