-- Q32.2 Translate the preceding question into do-notation, and then into Monad methods and lambdas.

monthEnds :: [Int]
monthEnds = [31,28,31,30,31,30,31,31,30,31,30,31]
dates :: [Int] -> [Int]
dates ends = [date | end <- ends, date <- [1 ..end ]]

datesDo :: [Int] -> [Int]
datesDo ends = do
  end <- ends
  date <- [1 .. end]
  return date

 datesMonad :: [Int] -> [Int]
 datesMonad ends  = ends >>=
  (\end ->
    [1 .. end] >>=
      (\date -> return date))
