-- Q16.1 To further complicate the items in your store, you eventually keep an inventory of free pamphlets.
--   Pamphlets have a title, a description, and a contact field for the organization that provides the pamphlet.
--   Create the Pamphlet type and add it to StoreItem. Additionally, modify the price so that it works with Pamphlet.

type FirstName = String
type LastName = String
type MiddleName = String

data Name = Name FirstName LastName
          | NameWithMiddle FirstName MiddleName LastName
          | TwoInitialsWithLast Char Char LastName

data Creator = AuthorCreator Author | ArtistCreator Artist
data Author = Author Name
data Artist = Person Name | Band String

data Book = Book {
  author    :: Creator
  , isbn      :: String
  , bookTitle :: String
  , bookYear  :: Int
  , bookPrice :: Double
}

data VinylRecord = VinylRecord {
  artist :: Creator
  , recordTitle :: String
  , recordYear  :: Int
  , recordPrice :: Double
}

data CollectibleToy = CollectibleToy {
  name :: String
  , descrption :: String
  , toyPrice :: Double
}

data Pamplet = Pamplet {
    pampletTitle :: String
  , pampletDescrption :: String
  , pampletContact :: String
  , pampletPrice :: Double
}
data StoreItem = BookItem Book
  | RecordItem VinylRecord
  | ToyItem CollectibleToy
  | PampletItem Pamplet

price :: StoreItem -> Double
price (BookItem book) = bookPrice book
price (RecordItem record) = recordPrice record
price (ToyItem toy) = toyPrice toy
price (PampletItem pamplet) = pampletPrice pamplet

-- Q16.2 Create a Shape type that includes the following shapes: Circle, Square, and Rectangle.
--   Then write a function to compute the perimeter of a Shape as well as its area.

data Circle = Circle {
  circleRadius :: Double
}
data Square = Square {
  squareLength :: Double
}
data Rectangle = Rectangle {
  rectangleLength :: Double,
  rectangleHeight :: Double
}

data Shape = CircleShape Circle | SquareShape Square | RectangleShape Rectangle

circle :: Circle
circle = Circle { circleRadius = 2 }
square :: Square
square = Square {squareLength = 2}
rectangle :: Rectangle
rectangle = Rectangle {
  rectangleLength = 2,
  rectangleHeight = 3
}

getArea :: Shape -> Double
getArea (CircleShape circle) = 3.14 * (circleRadius circle) ^ 2 / 2
getArea (SquareShape square) = (squareLength square) ^ 2
getArea (RectangleShape rectangle) = (rectangleLength rectangle) * (rectangleHeight rectangle)

getPerimeter :: Shape -> Double
getPerimeter (CircleShape circle) = 2 * 3.14 * (circleRadius circle)
getPerimeter (SquareShape square) = 4 * (squareLength square)
getPerimeter (RectangleShape rectangle) = 2 * (rectangleLength rectangle) + 2 * (rectangleHeight rectangle)
