import Data.List

type NameOld = (String,String)

oldNames :: [NameOld]
oldNames = [ ("Emil","Cioran")
           , ("Eugene","Thacker")
           , ("Friedrich","Nietzsche")]

sorted = sort names
-- Sorts by first name because it is tuple of strings
-- instance Ord Name where
--     compare (f1,l1) (f2,l2) = compare (l1,f1) (l2,f2)


data Name = Name (String, String) deriving (Show, Eq)
instance Ord Name where
    compare (Name (f1,l1)) (Name (f2,l2)) = compare (l1,f1) (l2,f2)
names :: [Name]
names = [Name ("Emil","Cioran")
        , Name ("Eugene","Thacker")
        , Name ("Friedrich","Nietzsche")]
