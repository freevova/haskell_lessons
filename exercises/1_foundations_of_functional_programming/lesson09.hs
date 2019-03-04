-- Q9.1 Use filter and length to re-create the elem function.

myElem1 _ [] = False
myElem1 elem list = (length collection) /= 0
  where collection = filter (\x -> x == elem) list

-- Q9.2 Your isPalindrome function from lesson 6 doesn’t handle sentences with spaces or capitals.
--     Use map and filter to make sure the phrase “A man a plan a canal Panama” is recognized as a palindrome.
-- isPalindrome word = word == reverse word

isPalindrome word = word == reverse a
  where without_spaces = filter (\x -> x /= ' ')
        filtered = map (\x -> if x `elem` ['a'..'z'] then x else )


-- Q9.3 In mathematics, the harmonic series is the sum of 1/1 + 1/2 + 1/3 + 1/4 ....
--     Write a function harmonic that takes an argument n and calculates the sum of the series to n.
--     Make sure to use lazy evaluation.
