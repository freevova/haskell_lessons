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
