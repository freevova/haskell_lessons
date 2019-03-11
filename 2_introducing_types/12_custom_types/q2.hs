-- Q12.2 Implement a patientSummary function that uses your final Patient type.
--   patient- Summary should output a string that looks like this:
--    **************
--    Patient Name: Smith, John
--    Sex: Male
--    Age: 46
--    Height: 72 in.
--    Weight: 210 lbs.
--    Blood Type: AB+
--    **************
--   If you need to, feel free to create useful helper functions.

type MiddleName = String
type FirstName  = String
type LastName   = String

data Name = Name FirstName LastName
           | NameWithMiddle FirstName MiddleName LastName

data Sex = Male | Female

data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

data Patient = Patient Name Sex Int Int Int BloodType

data RecordPatient = RecordPatient { name :: Name
                                    , sex :: Sex
                                    , age :: Int
                                    , height :: Int
                                    , weight :: Int
                                    , bloodType :: BloodType }
showFullName :: Name -> String
showFullName (Name firstName lastName) = lastName ++ ", " ++ firstName
showSex :: Sex -> String
showSex Male = "Male"
showSex Female = "Female"
showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"
showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"
showBloodType :: BloodType -> String
showBloodType (BloodType abo rh)  = showABO abo ++ showRh rh

jackieSmith :: RecordPatient
jackieSmith = RecordPatient {name = Name "Jackie" "Smith"
                             , age = 43
                             , sex = Female
                             , height = 62
                             , weight = 115
                             , bloodType = BloodType O Neg }
result2 = showBloodType (bloodType jackieSmith)
-- patientSummary (RecordPatient name sex _ _ _ _) = "**************" ++ "\n" ++
patientSummary patient = prefix ++ "\n" ++
                         nameInfo ++ "\n" ++
                         sexInfo ++ "\n" ++
                         ageInfo ++ "\n" ++
                         heightInfo ++ "\n" ++
                         weightInfo ++ "\n" ++
                         bloodTypeInfo ++ "\n" ++
                         prefix
  where prefix = "**************"
        nameInfo = "Patient Name: " ++ showFullName (name patient)
        sexInfo = "Sex: " ++ showSex (sex patient)
        ageInfo = "Age: " ++ show (age patient)
        heightInfo = "Height: " ++ show (height patient) ++ " in."
        weightInfo = "Weight: " ++ show (weight patient) ++ " lbs."
        bloodTypeInfo = "Blood Type: " ++ showBloodType (bloodType patient)
