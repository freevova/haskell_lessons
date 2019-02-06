-- Q3.2 To prove that let and lambda aren’t identical, rewrite the counter function exactly as it is here,
-- but use nested lambdas instead of let.

-- CAUSES ERROR
counter x = let x = x + 1
            in
              let b = x + 1
              in
                x

-- WORKS
counterL x = (\x ->
               (\x -> x) x + 1
             ) x + 1
