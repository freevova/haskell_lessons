module Lib
  ( isPalindrome
  , preprocess
  ) where

import Data.Text as T
import Data.Char(isPunctuation)

-- for String
--   preprocess :: String -> String
--   preprocess text = filter (not . isPunctuation) text
--
--   isPalindrome :: String -> Bool
--   isPalindrome text = cleanText == reverse cleanText
--     where cleanText = preprocess text

-- For Text you have to run stack install quickcheck-instances
preprocess :: T.Text -> T.Text
preprocess text = T.filter (not . isPunctuation) text

isPalindrome :: T.Text -> Bool
isPalindrome text = cleanText == T.reverse cleanText
  where cleanText = preprocess text
