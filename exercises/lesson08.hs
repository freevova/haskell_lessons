-- Q8.1 Implement your own version of reverse, which reverses a list.

myReverse [] = []
myReverse (x:xs) = myReverse(xs) ++ [x]

-- Q8.2 Calculating Fibonacci numbers is perhaps the single most common example of a
--     recursive function. The most straightforward definition is as follows:
-- fib 0 = 0
-- fib 1 = 1
-- fib n = fib (n-1) + fib (n-2)

myFib 0 = 0
myFib 1 = 1
myFib n = myFib (n-1) + myFib (n-2)

fastFib 1 1 0 = 0
fastFib 1 1 1 = 1
fastFib n1 n2 counter = ...

