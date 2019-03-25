-- Q42.2 Write a function that takes a UArray Int Int as an input.
--   The input will have a mixture of zeros and other values.
--   The function, replaceZeros, should return the array with all of the zeros replaced with the value –1.

replaceZeros :: UArray Int Int -> UArray Int Int
replaceZeros array = runSTUArray $ do
  starray <- thaw array
  let end = (snd . bounds) array
  let count = 0
  forM_ [0 .. end] $ \i -> do
    val <- readArray starray i
    when (val == 0) $ do
      writeArray starray i (-1)
  return starray
