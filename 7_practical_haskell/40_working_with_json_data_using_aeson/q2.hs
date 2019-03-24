-- Q40.2 Make a Sum type called IntList and use DerivingGeneric to make it an instance of ToJSON.
--   Don’t use the existing List type, but rather write it from scratch. Here’s an exam- ple of an IntList:
--
--   intListExample :: IntList
--   intListExample = Cons 1 $
--                    Cons 2 EmptyList

 data IntList = EmptyList | Cons Int IntList deriving (Show,Generic)
 instance ToJSON IntList
 instance FromJSON IntList
