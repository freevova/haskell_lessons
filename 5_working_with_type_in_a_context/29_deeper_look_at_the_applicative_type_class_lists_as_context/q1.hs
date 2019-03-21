-- Q29.1 To prove that Applicative is strictly more powerful than Functor, write a universal version of fmap,
--   called allFmap, that defines fmap for all members of the Applicative type class.
--   Because it works for all instances of Applicative, the only functions you can use are the methods
--   required by the Applicative type class. To get you started, here’s your type signature:
--
--   allFmap :: Applicative f => (a -> b) -> f a -> f b
--
--   When you’re finished, test this out on List and Maybe, which are both members of Applicative:
--
--   GHCi> allFmap (+ 1) [1,2,3]
--   [2,3,4]
--   GHCi> allFmap (+ 1) (Just 5)
--   Just 6
--   GHCi> allFmap (+ 1) Nothing
--   Nothing

allFmap :: Applicative f => (a -> b) -> f a -> f b
allFmap func app = (pure func) <*> app
