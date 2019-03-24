-- Q39.2 Improve the output of your code when something goes wrong.
--   getResponseStatus will give you a data type including both the statusCode and the statusMessage.
--   Fix main so that if you do get a non-200 statusCode, you print out the appropriate error.

main :: IO ()
main = do
  response <- httpLBS request
  let status = getResponseStatusCode response
  if status == 200
    then do
         print "saving request to file"
         let jsonBody = getResponseBody response
         L.writeFile "data.json" jsonBody
    else print $ statusMessage $ getResponseStatus response
