successfulRequest :: Maybe Int
successfulRequest = Just 6
failedRequest :: Maybe Int
failedRequest = Nothing

incMaybe :: Maybe Int -> Maybe Int
incMaybe (Just n) = Just (n + 1)
incMaybe Nothing = Nothing


result1 = fmap (+ 1) successfulRequest
result2 = fmap (+ 1) failedRequest

-- as string
successStr :: Maybe String
successStr = show <$> successfulRequest
failStr :: Maybe String
failStr = show <$> failedRequest
