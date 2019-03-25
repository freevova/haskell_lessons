-- Q42.1 One of the most important operations in the implementation of a genetic algo- rithm is combining two arrays of
--   Booleans through an operation called crossover. Crossover takes as input a pair of equal-sized arrays.
--   Then a cutoff point is chosen, and the top and bottom are swapped. The final value is this new pair of arrays.
--   Here’s an illus- tration using lists and an example (using 1 for True and 0 for False):
--
--   ([1,1,1,1,1],[0,0,0,0,0])
--
--   If you perform crossover at index 3, your result should be
--
--   [1,1,1,0,0]
--
--   Implement crossover where the result is a UArray but the crossover itself is performed using STUArrays.

crossOver :: (UArray Int Int ,UArray Int Int) -> Int -> UArray Int Int
crossOver (a1,a2) crossOverPt = runSTUArray $ do
  st1 <- thaw a1
  let end = (snd . bounds) a1
  forM_ [crossOverPt .. end] $ \i -> do
    writeArray st1 i $ a2 ! i
  return st1
