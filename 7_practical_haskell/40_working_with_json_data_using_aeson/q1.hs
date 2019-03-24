-- Q40.1 Make your NOAAResponse type an instance of ToJSON. This requires making all the
-- types used by this type instances of ToJSON as well.

instance ToJSON NOAAResult where
  toJSON (NOAAResult uid mindate maxdate name datacoverage resultId) =
    object ["uid" .= uid
           ,"mindate" .= mindate
           ,"maxdate" .= maxdate
           ,"name" .= name
           ,"datacoverage" .= datacoverage
           ,"id" .= resultId]
instance ToJSON Resultset
instance ToJSON Metadata
instance ToJSON NOAAResponse
