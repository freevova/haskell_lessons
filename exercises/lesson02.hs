-- Q2.2 Write functions named inc, double, and square that
-- increment, double, and square an argument n, respectively.

inc n    = n + 1
double n = (*) n 2
square n = (^ 2) n

-- Q2.3 Write a function that takes a value n.
-- If n is even, the function returns n - 2, and if the number is odd, the function returns 3 × n + 1.
-- To check whether the number is even, you can use either Haskell’s even function or mod
-- (Haskell’s modulo function).

test n = if even n
         then even_result
         else odd_result
           where even_result = n - 2
                 odd_result = 3 * n + 1

