-- Q30.1 To prove that Monad is strictly more powerful than Functor, write a universal version of <$>,
--   as in the preceding lesson’s exercise, called allFmapM, that defines <$> for all members of the Monad type class.
--   Because it works for all instances of Monad, the only functions you can use are the methods required by the
--   Monad type class (and lambda functions). To get you started, here’s your type signature:
--
--   allFmapM :: Monad m => (a -> b) -> m a -> m b

allFmapM :: Monad m => (a -> b) -> m a -> m b
allFmapM func val = val >>= (\x -> return (func x))
