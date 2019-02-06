-- Q6.1 Haskell has a function called repeat that takes a value and repeats it infinitely.
--     Using the functions you’ve learned so far, implement your own version of repeat.

infinity1 = repeat 5
infinity2 = cycle [5]

-- Q6.2 Write a function subseq that takes three arguments: a start position, an end posi- tion, and a list.
--     The function should return the subsequence between the start and end.

subseq start end collection = drop start rest
  where rest = take end collection

a = subseq 2 5 [1 .. 10] -- [3,4,5]

-- Q6.3 Write a function inFirstHalf that returns True if an element is in the first half of a list,
--    and otherwise returns False.

inFirstHalf symbol collection = symbol `elem` firstHalf
  where firstHalfLength = (length collection) `div` 2
        firstHalf = take firstHalfLength collection
