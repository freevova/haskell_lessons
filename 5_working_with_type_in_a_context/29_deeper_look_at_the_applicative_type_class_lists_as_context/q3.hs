-- Q29.3 Take the following example and use nondeterministic computing with
--   Lists to determine how much beer you need to purchase to assure there will be enough:
--
--   - You bought beer last night but don’t remember whether it was a 6-pack or a 12- pack.
--   - You and your roommate each had two beers last night.
--   - You’re having either two or three friends coming over tonight, depending on who can come.
--   - For a long night of gaming, you expect the average person to drink three to four beers.

startingBeer :: [Int]
startingBeer = [6,12]
remainingBeer :: [Int]
remainingBeer = (\count -> count - 4) <$> startingBeer
guests :: [Int]
guests = [2,3]
totalPeople :: [Int]
totalPeople = (+ 2) <$> guests
beersPerGuest :: [Int]
beersPerGuest = [3,4]
totalBeersNeeded :: [Int]
totalBeersNeeded = (pure (*)) <*>  beersPerGuest <*> totalPeople
beersToPurchase :: [Int]
beersToPurchase = (pure (-)) <*> totalBeersNeeded  <*> remainingBeer
