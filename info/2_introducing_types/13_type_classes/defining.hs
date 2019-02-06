data Icecream = Chocolate | Vanilla deriving (Show)

addThenDouble :: Num a => a -> a -> a
addThenDouble x y = (x + y)*2
