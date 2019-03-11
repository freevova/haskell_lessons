type MiddleName = String
type FirstName  = String
type LastName   = String

data Name = Name FirstName LastName
           | NameWithMiddle FirstName MiddleName LastName

data Sex = Male | Female

data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

-- data Patient = Patient Name Sex Int Int Int BloodType
data Patient = Patient { name :: Name
                      , sex :: Sex
                      , age :: Int
                      , height :: Int
                      , weight :: Int
                      , bloodType :: BloodType }

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l

jackieSmith :: Patient
jackieSmith = Patient {name = Name "Jackie" "Smith"
                     , age = 43
                     , sex = Female
                     , height = 62
                     , weight = 115
                     , bloodType = BloodType O Neg }

b = age jackieSmith
jackieSmithUpdated = jackieSmith { age = 44 }
c = age jackieSmithUpdated
