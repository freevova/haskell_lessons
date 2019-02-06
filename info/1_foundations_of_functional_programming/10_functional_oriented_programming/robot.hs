robot (name,attack,hp) = \message -> message (name,attack,hp)
name (n,_,_) = n
attack (_,a,_) = a
hp (_,_,hp) = hp

-- GETTERS
getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHP aRobot = aRobot hp

-- SETTERS
setName aRobot newName = aRobot (\(n,a,h) -> robot (newName,a,h))
setAttack aRobot newAttack = aRobot (\(n,a,h) -> robot (n,newAttack,h))
setHP aRobot newHP = aRobot (\(n,a,h) -> robot (n,a,newHP))

killerRobot = robot ("Kill3r",25,200)
killerName = getName killerRobot
killerAttack = getAttack killerRobot
nicerRobot = setName killerRobot "kitty"

printRobot aRobot = aRobot (\(n,a,h) -> n ++
                                         " attack:" ++ (show a) ++
                                         " hp:"++ (show h))
-- messages between objects
damage aRobot attackDamage = aRobot (\(n,a,h) ->
                                       robot (n,a,h-attackDamage))
fight aRobot defender = damage defender attack
  where attack = if getHP aRobot > 10
                 then getAttack aRobot
                 else 0

afterHit = damage killerRobot 90
newRobot = getHP afterHit

gentleGiant = robot ("Mr. Friendly", 10, 300)

gentleGiantRound1 = fight killerRobot gentleGiant
killerRobotRound1 = fight gentleGiant killerRobot
gentleGiantRound2 = fight killerRobotRound1 gentleGiantRound1
killerRobotRound2 = fight gentleGiantRound1 killerRobotRound1
gentleGiantRound3 = fight killerRobotRound2 gentleGiantRound2
killerRobotRound3 = fight gentleGiantRound2 killerRobotRound2

-- printRobot gentleGiantRound3
-- printRobot killerRobotRound3
