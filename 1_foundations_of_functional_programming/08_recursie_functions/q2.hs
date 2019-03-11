-- Q8.2 Calculating Fibonacci numbers is perhaps the single most common example of a recursive function.
--   The most straightforward definition is as follows:

fastFib _ _ 0 = 0
fastFib _ _ 1 = 1
fastFib _ _ 2 = 1
fastFib x y 3 = x + y
fastFib x y c = fastFib (x + y) x (c - 1)
