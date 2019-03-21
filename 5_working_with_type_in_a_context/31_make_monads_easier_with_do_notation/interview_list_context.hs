data Grade = F | D | C | B | A deriving (Eq, Ord, Enum, Show, Read)
data Degree = HS | BA | MS | PhD deriving (Eq, Ord, Enum, Show, Read)

data Candidate = Candidate
  { candidateId :: Int
  , codeReview :: Grade
  , cultureFit :: Grade
  , education :: Degree } deriving Show

viable :: Candidate -> Bool
viable candidate = all (== True) tests
  where passedCoding = codeReview candidate > B
        passedCultureFit = cultureFit candidate > C
        educationMin = education candidate >= MS
        tests = [passedCoding
                ,passedCultureFit
                ,educationMin]

candidate1 :: Candidate
candidate1 = Candidate
  { candidateId = 1
  , codeReview = A
  , cultureFit = A
  , education = BA }

candidate2 :: Candidate
candidate2 = Candidate
  { candidateId = 2
  , codeReview = C
  , cultureFit = A
  , education = PhD }

candidate3 :: Candidate
candidate3 = Candidate
  { candidateId = 3
  , codeReview = A
  , cultureFit = B
  , education = MS }

candidates :: [Candidate]
candidates = [candidate1
             ,candidate2
             ,candidate3]

assessCandidateList :: [Candidate] -> [String]
assessCandidateList candidates = do
  candidate <- candidates
  let passed = viable candidate
  let statement = if passed
                  then "passed"
                  else "failed"
  return statement

-- the same as:
-- assessCandidates :: [Candidate] -> [String]
-- assessCandidates candidates = map (\x -> if x
--                                          then "passed"
--                                          else "failed") passed
--   where passed  = map viable candidates
