ifEven myFunction x = if even x then myFunction x else x
inc n = n + 1
double n = n*2
square n = n^2

genIfEven f = (\x -> ifEven f x)
ifEvenInc = genIfEven inc




addressLetter name location = locationFunction name
  where locationFunction = getLocationFunction location

addressLetterV2 location name = addressLetter name location
flipBinaryArgs binaryFunction = (\x y -> binaryFunction y x)

addressLetterV2 = flipBinaryArgs addressLetter
addressLetterNY = addressLetterV2 "ny"

addressLetterNY ("Bob","Smith")

