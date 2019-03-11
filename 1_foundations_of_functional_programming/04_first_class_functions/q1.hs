import Data.List
-- Q4.1 Anything that can be compared in Haskell
--     (for example, [Char], which you use for the names in your name tuples)
--     can be compared with a function called compare.
--     The compare function returns GT, LT, or EQ.
--     Rewrite compareLastNames by using compare.

names = [("Ian", "Curtis"),
          ("Bernard","Sumner"),
          ("Peter", "Hook"),
          ("Stephen","Morris")]

compareLastNames name1 name2 = case compare lastName1 lastName2 of
                               EQ -> compare firstName1 firstName2
                               result -> result
  where lastName1 = snd name1
        lastName2 = snd name2
        firstName1 = fst name1
        firstName2 = fst name2
sorted_by_last_name = sortBy compareLastNames names
