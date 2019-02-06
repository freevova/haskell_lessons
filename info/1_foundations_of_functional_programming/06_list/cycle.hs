-- ones n = take n (cycle [1])
--  GHCi> ones 2
--  [1,1]
--  GHCi> ones 4
--  [1,1,1,1]

assignToGroups n aList = zip groups aList
  where groups = cycle [1..n]

a = assignToGroups 3 ["file1.txt","file2.txt","file3.txt"
                      ,"file4.txt","file5.txt","file6.txt","file7.txt"
                      ,"file8.txt"]
-- => [(1,"file1.txt"),(2,"file2.txt"),(3,"file3.txt"),(1,"file4.txt"),(2,"file5.txt"),(3,"file6.txt"),(1,"file7.txt"),(2,"file8.txt")]
