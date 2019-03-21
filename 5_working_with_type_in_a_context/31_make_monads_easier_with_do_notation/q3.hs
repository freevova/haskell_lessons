-- Q31.3 Refactor the maybeMain function from the preceding exercise so that it works with any Monad.
--   You’ll need to change the type signature as well as remove the type-specific parts from the body of the function.

monadMain :: Monad m => m Double -> m Double -> m Double -> m Double -> m String
monadMain s1 c1 s2 c2 = do
  size1 <- s1
  cost1 <- c1
  size2 <- s2
  cost2 <- c2
  let pizza1 = (size1,cost1)
  let pizza2 = (size2,cost2)
  let betterPizza = comparePizzas pizza1 pizza2
  return (describePizza betterPizza)
