ifEvenInc1 n    = if even n then n + 1 else n
ifEvenDouble1 n = if even n then n * 2 else n
ifEvenSquare1 n = if even n then n^2   else n

ifEven myFunction x = if even x then myFunction x else x
inc n = n + 1
double n = n*2
square n = n^2

ifEvenInc2 n = ifEven inc n
ifEvenDouble2 n = ifEven double n
ifEvenSquare2 n = ifEven square n

ifEven (\x -> x * 2) 6
