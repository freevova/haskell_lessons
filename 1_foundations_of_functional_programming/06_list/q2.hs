-- Q6.2 Write a function subseq that takes three arguments: a start position, an end posi- tion, and a list.
--     The function should return the subsequence between the start and end.

subseq start end collection = drop start rest
  where rest = take end collection

a = subseq 2 5 [1 .. 10] -- [3,4,5]
