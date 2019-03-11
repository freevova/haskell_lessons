double :: Int -> Int
double n = n*2

printDouble :: Int -> String
printDouble value = show (value*2)

half :: Int -> Double
half n = n/2 -- ERROR
half n = (fromIntegral n) / 2 -- RIGHT

a = read "6" :: Int -- 6
b = read "6" :: Double -- 6.0
