-- Q13.1 If you ran the :info examples, you likely noticed that the type Word has come up a few times.
--   Without looking at external resources, use :info to explore Word and the relevant type classes
--   to come up with your own explanation for the Word type. How is it different from Int?

-- Q13.2 One type class we didn’t discuss is Enum. Use :info to look at the definition of this type class,
--   as well as example members. Now consider Int, which is an instance of both Enum and Bounded.
--   Given the following definition of inc:
--
--   inc :: Int -> Int
--   inc x = x + 1
--
--   and the succ function required by Enum, what’s the difference between inc and succ for Int?
a = succ 'a' -- 'b'

-- Q13.3 Write the following function that works just like succ on Bounded types but can be called an unlimited number of times without error.
--   The function will work like inc in the preceding example but works on a wider range of types, including types that aren’t members of Num:
--
--   cycleSucc :: (Bounded a, Enum a, ? a) => a -> a
--   cycleSucc n = ?
--
--   Your definition will include functions/values from Bounded, Enum, and the mystery type class.
--   Make a note of where each of these three (or more) functions/values comes from.
