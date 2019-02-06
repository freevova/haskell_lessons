-- Q5.1 Now that you know about partial application, you no longer need to use genIfEvenX.
--     Redefine ifEvenInc, ifEvenDouble, and ifEvenSquare by using ifEven and partial application.

inc n = n + 1
double n = n*2
square n = n^2

genIfEven f = (\x -> ifEven f x)
ifEvenInc = genIfEven inc
