makeAddress :: Int -> String -> String -> (Int, String, String)
makeAddress number street town = (number,street,town)
makeAddressLambda = (\number ->
                     (\street ->
                      (\town -> (number, street, town))))

address = makeAddressLambda 123 "Happy St" "Haskell Town"

ifEven :: (Int -> Int) -> Int -> Int
ifEven f n = if even n
             then f n
             else n

makeTriple :: a -> b -> c -> (a,b,c)
makeTriple x y z = (x,y,z)
makeTripleNew :: String -> Char -> String -> (String, Char, String)
makeTripleNew x y z = (x,y,z)
