module Main where
import Data.Aeson
import Data.Text as T
import Data.ByteString.Lazy as B

import Data.ByteString.Lazy.Char8 as BC
import GHC.Generics

data Book = Book
  { title :: T.Text
  , author :: T.Text
  , year :: Int
  } deriving (Show,Generic)

instance FromJSON Book
instance ToJSON Book

myBook :: Book
myBook = Book {author="Will Kurt"
              ,title="Learn Haskell"
              ,year=2017}
myBookJSON :: BC.ByteString
myBookJSON = encode myBook

rawJSON :: BC.ByteString
rawJSON = "{\"author\":\"Emil Ciroan\",\"title\": \"A Short History of Decay\",\"year=1949}"
bookFromJSON :: Maybe Book
bookFromJSON = decode rawJSON
-- GHCi> bookFromJSON
-- Just (Book { title = "A Short History of Decay"
--            , author = "Emil Ciroan"
--            , year = 1949})

wrongJSON :: BC.ByteString
wrongJSON = "{\"writer\":\"Emil Cioran\",\"title\": \"A Short History of Decay\",\"year\"=1949}"
bookFromWrongJSON :: Maybe Book
bookFromWrongJSON = decode wrongJSON
-- GHCi> bookFromWrongJSON
-- Nothing

-- GHCi> eitherDecode wrongJSON :: Either String Book
-- Left "Error in $: The key \"author\" was not found"

-- Writing own instances of FromJSON and ToJSON
sampleError :: BC.ByteString
sampleError = "{\"message\":\"oops!\",\"error\": 123}"

-- The error is because of this property.
--   data ErrorMessage = ErrorMessage
--                       { message :: T.Text
--                       , error :: Int
--                       } deriving Show

data ErrorMessage = ErrorMessage
                    { message :: T.Text
                    , errorCode :: Int
                    } deriving Show

instance FromJSON ErrorMessage where
   parseJSON (Object v) =
     ErrorMessage <$> v .: "message"
                  <*> v .: "error"
instance ToJSON ErrorMessage where
  toJSON (ErrorMessage message errorCode) =
    object [ "message" .= message
           , "error" .= errorCode
           ]

sampleErrorMessage :: Maybe ErrorMessage
sampleErrorMessage = decode sampleError
-- GHCi> sampleErrorMessage
-- Just (ErrorMessage {message = "oops!", errorCode = 123})

anErrorMessage :: ErrorMessage
anErrorMessage = ErrorMessage "Everything is Okay" 0
-- GHCi> encode anErrorMessage
-- "{\"error\":0,\"message\":\"Everything is Okay\"}"

main :: IO ()
main = print "hi"
