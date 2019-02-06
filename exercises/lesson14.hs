-- Q14.1 Note that Enum doesn’t require either Ord or Eq, even though it maps types to Int
--   values (which implement both Ord and Eq). Ignoring the fact that you can easily use deriving for Eq and Ord,
--   use the derived implementation of Enum to make manually defining Eq and Ord much easier.

-- Q14.2 Define a five-sided die (FiveSidedDie type). Then define a type class named Die
--   and at least one method that would be useful to have for a die.
--   Also include super-classes you think make sense for a die.
--   Finally, make your FiveSidedDie an instance of Die.

data FiveSidedDie = S1 | S2 | S3 | S4 | S5

class Super a where
  superTest :: a -> String

class Super a => Die a where
  test :: a -> String

instance Die FiveSidedDie where
  test S1 = "1"
  test S2 = "2"
  test S3 = "3"
  test S4 = "4"
  test S5 = "5"

instance Super FiveSidedDie where
  superTest S1 = "11"
  superTest S2 = "21"
  superTest S3 = "31"
  superTest S4 = "41"
  superTest S5 = "51"
