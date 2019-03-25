import Data.Array.ST
import Control.Monad
import Control.Monad.ST

zeroIndexArray :: UArray Int Bool
zeroIndexArray = array (0,9) [(3,True)]

result = zeroIndexArray ! 3

oneIndexArray :: UArray Int Bool
oneIndexArray = array (1,10) $ zip [1 .. 10] $ cycle [True]

-- Updating
updatedBiB :: UArray Int Int
updatedBiB = beansInBuckets // [(1,5),(3,6)]

-- GHCi> accum (+) updatedBiB $ zip [0 .. 3] $ cycle [2]
-- array (0,3) [(0,2),(1,7),(2,2),(3,8)]

listToSTUArray :: [Int] -> ST s (STUArray s Int Int)
listToSTUArray vals = do
    let end =  length vals - 1
    myArray <- newArray (0,end) 0
    forM_ [0 .. end] $ \i -> do
      let val = vals !! i
      writeArray myArray i val
    return myArray

listToUArray :: [Int] -> UArray Int Int
listToUArray vals = runSTUArray $ listToSTUArray vals

-- GHCi> listToUArray [1,2,3]
-- array (0,2) [(0,1),(1,2),(2,3)]

listToUArray1 :: [Int] -> UArray Int Int
listToUArray1 vals = runSTUArray $ do
  let end =  length vals - 1
  myArray <- newArray (0,end) 0
  forM_ [0 .. end] $ \i -> do
      let val = vals !! i
      writeArray myArray i val
  return myArray

-- SORT
myData :: UArray Int Int
myData = listArray (0,5) [7,6,4,8,10,2]

bubbleSort :: UArray Int Int -> UArray Int Int
bubbleSort myArray = runSTUArray $ do
  stArray <- thaw myArray
  let end = (snd . bounds) myArray
  forM_ [1 .. end] $ \i -> do
    forM_ [0 .. (end - i)] $ \j -> do
      val <- readArray stArray j
      nextVal <- readArray stArray (j + 1)
      let outOfOrder = val > nextVal
      when outOfOrder $ do
        writeArray stArray j nextVal
        writeArray stArray (j + 1) val
  return stArray

-- GHCi> bubbleSort myData
-- array (0,5) [(0,2),(1,4),(2,6),(3,7),(4,8),(5,10)]
