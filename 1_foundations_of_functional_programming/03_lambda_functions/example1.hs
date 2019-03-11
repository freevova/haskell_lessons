sumSquareOrSquareSum1 x y = if sumSquare > squareSum
                           then sumSquare
                           else squareSum
                             where sumSquare = x^2 + y^2
                                   squareSum = (x + y)^2


sumSquareOrSquareSum2 x y = if (x^2 + y^2) > ((x+y)^2)
                           then (x^2 + y^2)
                           else (x+y)^2

body3 sumSquare squareSum = if sumSquare > squareSum
                           then sumSquare
                           else squareSum
-- body4 = (\sumSquare squareSum -> if sumSquare > squareSum
--                                  then sumSquare
--                                  else squareSum)
sumSquareOrSquareSum3 x y = body3 (x^2 + y^2) ((x+y)^2)

sumSquareOrSquareSum5 x y = (\sumSquare squareSum ->
                               if sumSquare > squareSum
                               then sumSquare
                               else squareSum) (x^2 + y^2) ((x+y)^2)

-- WITH LET
--
sumSquareOrSquareSum6 x y = let sumSquare = (x^2 + y^2)
                                squareSum = (x+y)^2
                            in
                             if sumSquare > squareSum
                             then sumSquare
                             else squareSum

overwriteLet x = let x = 2
                   in
                     let x = 3
                       in
                         let x = 4
                           in
                             x

overwriteLam x = (\x ->
                   (\x ->
                     (\x -> x) 4
                   )3
                 )2
