-- Q32.1 Use a list comprehension that generates a list of correct calendar dates,
--   given that you know the number of days in each month.
--   For example, it should start with 1 .. 31 for January and be followed by 1 .. 28 for February.

monthEnds :: [Int]
monthEnds = [31,28,31,30,31,30,31,31,30,31,30,31]
dates :: [Int] -> [Int]
dates ends = [date | end <- ends, date <- [1 ..end ]]
