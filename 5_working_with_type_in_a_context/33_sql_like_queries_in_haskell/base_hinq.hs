-- The main aim is to implement sql-like functions: select, where and join
import Control.Monad

data Name = Name
  { firstName ::String
  , lastName :: String }

instance Show Name where
  show (Name first last) = mconcat [first," ",last]

data GradeLevel = Freshman
  | Sophmore
  | Junior
  | Senior deriving (Eq,Ord,Enum,Show)

data Student = Student
  { studentId :: Int
  , gradeLevel :: GradeLevel
  , studentName :: Name } deriving Show

students :: [Student]
students = [(Student 1 Senior (Name "Audre" "Lorde"))
           ,(Student 2 Junior (Name "Leslie" "Silko"))
           ,(Student 3 Freshman (Name "Judith" "Butler"))
           ,(Student 4 Senior (Name "Guy" "Debord"))
           ,(Student 5 Sophmore (Name "Jean" "Baudrillard"))
           ,(Student 6 Junior (Name "Julia" "Kristeva"))]

data Teacher = Teacher
  { teacherId :: Int
  , teacherName :: Name } deriving Show

teachers :: [Teacher]
teachers = [Teacher 100 (Name "Simone" "De Beauvior")
           ,Teacher 200 (Name "Susan" "Sontag")]

data Course = Course
  { courseId :: Int
  , courseTitle :: String
  , teacher :: Int } deriving Show

courses :: [Course]
courses = [Course 101 "French" 100
          ,Course 201 "English" 200]

_select :: (a -> b) -> [a] -> [b]
_select prop vals = do
  val <- vals
  return (prop val)

result1 = _select (firstName . studentName) students
result2 = _select gradeLevel students
result3 = _select (\x -> (studentName x, gradeLevel x)) students

_where :: (a -> Bool) -> [a] -> [a]
_where test vals = do
  val <- vals
  guard (test val)
  return val

startsWith :: Char -> String -> Bool
startsWith char string = char == (head string)

result4 = _where (startsWith 'J' . firstName) (_select studentName students)

_join :: Eq c => [a] -> [b] -> (a -> c) -> (b -> c) -> [(a,b)]
_join data1 data2 prop1 prop2 = do
  d1 <- data1
  d2 <- data2
  let dpairs = (d1,d2)
  guard ((prop1 (fst dpairs)) == (prop2 (snd dpairs)))
  return dpairs

result5 = _join teachers courses teacherId teacher
