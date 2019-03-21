-- class Applicative m => Monad (m :: * -> *) where
--   (>>=) :: m a -> (a -> m b) -> m b
--   (>>) :: m a -> m b -> m b
--   return :: a -> m a
--   fail :: String -> m a

echo :: IO ()
echo = getLine >>= putStrLn

-- main :: IO ()
-- main = echo

echoVerbose :: IO ()
echoVerbose = putStrLn "Enter a String an we'll echo it!" >> getLine >>= putStrLn

main :: IO ()
main = echoVerbose
