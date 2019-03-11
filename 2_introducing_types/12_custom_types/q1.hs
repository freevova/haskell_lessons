-- Q12.1 Write a function similar to canDonateTo that takes two patients as arguments rather than two BloodTypes.

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


patient1 :: Patient
patient1 = Patient (Name "John" "Doe") Male 30 74 200 (BloodType A Pos)
patient2 :: Patient
patient2 = Patient (Name "Ben" "Doe") Male 30 74 200 (BloodType AB Pos)

canDonateTo :: Patient -> Patient -> Bool
canDonateTo (Patient _ _ _ _ _ (BloodType O _)) _ = True
canDonateTo (Patient _ _ _ _ _ (BloodType A _)) (Patient _ _ _ _ _ (BloodType A _)) = True
canDonateTo (Patient _ _ _ _ _ (BloodType B _)) (Patient _ _ _ _ _ (BloodType B _)) = True
canDonateTo _ _ = False

result1 = canDonateTo patient1 patient2
