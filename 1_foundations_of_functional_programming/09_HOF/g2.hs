-- Q9.2 Your isPalindrome function from lesson 6 doesn’t handle sentences with spaces or capitals.
--     Use map and filter to make sure the phrase “A man a plan a canal Panama” is recognized as a palindrome.
-- isPalindrome word = word == reverse word

isPalindrome word = word == reverse a
  where without_spaces = filter (\x -> x /= ' ')
        filtered = map (\x -> if x `elem` ['a'..'z'] then x else )
