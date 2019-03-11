-- Q9.1 Use filter and length to re-create the elem function.

myElem1 _ [] = False
myElem1 elem list = (length collection) /= 0
  where collection = filter (== elem) list
