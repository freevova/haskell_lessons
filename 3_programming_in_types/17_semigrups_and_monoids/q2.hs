-- Q17.2 If your Events and Probs types were data types and not just synonyms, you could make them instances of
--   Semigroup and Monoid, where combineEvents and combineProbs were the <> operator in each case.
--   Refactor these types and make instances of Semigroup and Monoid.

import Data.Semigroup

data Event = Event String deriving Show
data Prob  = Prob Double deriving Show

data PTable = PTable [Event] [Prob]

createPTable :: [Event] -> [Prob] -> PTable
createPTable events probs = PTable events normalizedProbs
  where totalProbs = foldl (\acc (Prob prob) -> prob + acc) 0 probs
        normalizedProbs = map (\(Prob prob) -> Prob(prob / totalProbs)) probs

showPair :: Event -> Prob -> String
showPair (Event event) (Prob prob) = mconcat [event,"|", show prob,"\n"]

instance Show PTable where
  show (PTable events probs) = mconcat pairs
    where pairs = zipWith showPair events probs

table :: PTable
table = createPTable [(Event "heads"),(Event "tails")] [(Prob 0.5),(Prob 0.5)]

instance Semigroup Event where
  (<>) (Event e1) (Event e2) = Event result
    where result = (\x y -> mconcat [x,"-",y]) e1 e2

instance Monoid Event where
  mempty = Event ""
  mappend = (<>)

instance Semigroup Prob where
  (<>) (Prob p1) (Prob p2) = Prob result
    where result = (*) p1 p2

instance Monoid Prob where
  mempty = Prob 0
  mappend = (<>)

instance Semigroup PTable where
  (<>) ptable1 (PTable [] []) = ptable1
  (<>) (PTable [] []) ptable2 = ptable2
  (<>) (PTable e1 p1) (PTable e2 p2) = createPTable newEvents newProbs
    where newEvents = cartCombine mappend e1 e2
          newProbs = cartCombine mappend p1 p2

cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 cycledL2
 where nToAdd = length l2
       repeatedL1 = map (take nToAdd . repeat) l1
       newL1 = mconcat repeatedL1
       cycledL2 = cycle l2

-- EXAMPLE
coin :: PTable
coin = createPTable [Event "heads", Event "tails"] [Prob 0.5, Prob 0.5]
spinner :: PTable
spinner = createPTable [Event "red", Event "blue", Event "green"] [Prob 0.1, Prob 0.2, Prob 0.7]

combined = coin <> spinner
