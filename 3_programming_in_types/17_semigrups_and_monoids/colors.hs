import Data.Semigroup

-- main = do
data Color = Red |
  Yellow |
  Blue |
  Green |
  Purple |
  Orange |
  Brown deriving (Show,Eq)

instance Semigroup Color where
    (<>) Red Blue = Purple
    (<>) Blue Red = Purple
    (<>) Yellow Blue = Green
    (<>) Blue Yellow = Green
    (<>) Yellow Red = Orange
    (<>) Red Yellow = Orange
    (<>) a b | a == b = a
             | all (`elem` [Red,Blue,Purple]) [a,b] = Purple
             | all (`elem` [Blue,Yellow,Green]) [a,b] = Green
             | all (`elem` [Red,Yellow,Orange]) [a,b] = Orange
             | otherwise = Brown

a = (Green <> Blue) <> Yellow -- Green
b = Green <> (Blue <> Yellow) -- Green
