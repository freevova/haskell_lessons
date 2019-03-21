primesToN :: Integer -> [Integer]
primesToN n = filter isNotComposite twoThroughN
  where twoThroughN = [2 .. n]
        composite = pure (*) <*> twoThroughN <*> twoThroughN
        isNotComposite = not . (`elem` composite)
