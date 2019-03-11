cup flOz = \message -> message flOz
aCup = cup 6
coffeeCup = cup 12

getOz aCup = aCup (\flOz -> flOz)
oz = getOz coffeeCup

drink aCup ozDrank = if ozDiff >= 0
                      then cup ozDiff
                      else cup 0
   where flOz = getOz aCup
         ozDiff = flOz - ozDrank
isEmpty aCup = getOz aCup == 0

afterASip = drink coffeeCup 1
afterTwoSips = drink afterASip 1
afterGulp = drink afterTwoSips 4

oz2 = getOz afterGulp

afterManySips = foldl drink coffeeCup [1,1,1,1,1]
