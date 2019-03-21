-- Q25.2 Add another glitching technique, randomReverseBytes, that randomly reverses a
--   section of bytes in your data.

import System.Environment
import System.Random
import Control.Monad
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC

reverseSection :: Int -> Int -> BC.ByteString -> BC.ByteString
reverseSection start size bytes = mconcat [before,changed,after]
  where (before,rest) = BC.splitAt start bytes
        (target,after) = BC.splitAt size rest
        changed =  BC.reverse target
randomReverseBytes :: BC.ByteString -> IO BC.ByteString
randomReverseBytes bytes = do
  let sectionSize = 25
  let bytesLength = BC.length bytes
  start <- randomRIO (0,(bytesLength - sectionSize))
  return (reverseSection start sectionSize bytes)
