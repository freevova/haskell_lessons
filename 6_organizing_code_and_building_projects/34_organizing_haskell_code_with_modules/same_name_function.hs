-- module Main where

head :: Monoid a => [a] -> a
head (x:xs) = x
head [] = mempty

example :: [[Int]]
example = []

result1 = Main.head []
result2 = Prelude.head []
