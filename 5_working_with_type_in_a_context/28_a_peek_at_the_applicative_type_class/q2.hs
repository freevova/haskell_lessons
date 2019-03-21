-- Q28.2 Rewrite haversineIO, this time using <*>.

haversineIO :: IO LatLong -> IO LatLong -> IO Double
haversineIO ioVal1 ioVal2 = return haversine <$> ioVal1 <*> ioVal2
