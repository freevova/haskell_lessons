sampleInput :: T.Text
sampleInput = "this\nis\ninput"

someText :: T.Text
someText = "Some\ntext for\t you"

breakText :: T.Text
breakText = "simple"

exampleText :: T.Text
exampleText = "This is simple to do"

-- LINES
T.lines sampleInput

-- WORDS
T.words someText

-- UNLINE AND UNWORDS
T.unlines (T.lines sampleInput)
T.unwords (T.words someText)

-- INTERCALATE
T.intercalate breakText (T.splitOn breakText exampleText)

-- MONOID OPERATIONS
combined :: String
combined = "some" ++ " " ++ "strings"

{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T
import Data.Semigroup

combinedTextMonoid :: T.Text
combinedTextMonoid = mconcat ["some"," ","text"]

combinedTextSemigroup :: T.Text
combinedTextSemigroup = "some" <> " " <> "text"
