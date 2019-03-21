-- Q28.1 Writing haversineMaybe (listing 28.4) was straightforward.
--   Write the function haversineIO without using <*>. Here’s the type signature:
--
--   haversineIO :: IO LatLong -> IO LatLong -> IO Double

haversineIO :: IO LatLong -> IO LatLong -> IO Double
haversineIO ioVal1 ioVal2 = do
    val1 <- ioVal1
    val2 <- ioVal2
    let dist = haversine val1 val2
    return dist
