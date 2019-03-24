-- If you hve dataa in json format like:
-- {
--     "metadata":{
--        "resultset":{
--           "offset":1,
--           "count":11,
--           "limit":25
-- } },
--     "results":[
--        {
--           "uid":"gov.noaa.ncdc:C00861",
--           "mindate":"1763-01-01",
--           "maxdate":"2017-02-01",
--           "name":"Daily Summaries",
--           "datacoverage":1,
--           "id":"GHCND"
--        },
-- .....

data NOAAResult = NOAAResult
                   { uid :: T.Text
                   , mindate :: T.Text
                   , maxdate :: T.Text
                   , name :: T.Text
                   , datacoverage :: Int
                   , resultId :: T.Text
                   } deriving Show


instance FromJSON NOAAResult where
   parseJSON (Object v) =
     NOAAResult <$> v .: "uid"
                <*> v .: "mindate"
                <*> v .: "maxdate"
                <*> v .: "name"
                <*> v .: "datacoverage"
                <*> v .: "id"

data Resultset = Resultset
                 { offset :: Int
                 , count :: Int
                 , limit :: Int
                 } deriving (Show,Generic)
instance FromJSON Resultset

data Metadata = Metadata
                {
                  resultset :: Resultset
                } deriving (Show,Generic)
instance FromJSON Metadata

data NOAAResponse = NOAAResponse
                    { metadata :: Metadata
                    , results :: [NOAAResult]
                    } deriving (Show,Generic)
instance FromJSON NOAAResponse

-- The forM_ function works just like the mapM_ function, only it reverses the order of the data and the function used to map over the data.
printResults :: Maybe [NOAAResult] -> IO ()
printResults Nothing = print "error loading data"
printResults (Just results) =  do
  forM_ results (print . name)
    print dataName

 main :: IO ()
 main = do
        jsonData <- B.readFile "data.json"
        let noaaResponse = decode jsonData :: Maybe NOAAResponse
        let noaaResults = results <$> noaaResponse
        printResults noaaResults


-- GHCi> main
--  "Daily Summaries"
--  "Global Summary of the Month"
--  "Global Summary of the Year"
--  "Weather Radar (Level II)"
--  "Weather Radar (Level III)"
--  "Normals Annual/Seasonal"
--  "Normals Daily"
--  "Normals Hourly"
--  "Normals Monthly"
--  "Precipitation 15 Minute"
--  "Precipitation Hourly"
