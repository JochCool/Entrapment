# Set the game into running state
scoreboard players set @e[type=armor_stand,name=Game] State 3
scoreboard players reset * ReadyCheck

# Show in-game UI stuff
title @a title [{"text":"Game starting!"}]
scoreboard objectives setdisplay sidebar Time

# Set up score tracking
scoreboard players set @e[type=armor_stand,name=Game] Round 0
scoreboard players reset * Deaths

# Set up environment
gamerule naturalRegeneration false
time set day
gamerule doDaylightCycle true

# Set player state
gamemode survival @a[team=!none]

# Summon AS markers for gates
summon armor_stand -45 299 -2 {CustomName:'"Gate"',NoGravity:1,Invisible:1,Marker:1,Invulnerable:1}
summon armor_stand 35 299 -2 {CustomName:'"Gate"',NoGravity:1,Invisible:1,Marker:1,Invulnerable:1}

# Set up time tracking
scoreboard players set AddedTime TimeIncrease 0
scoreboard players operation Seconds MaxTimeAdded = @e[type=armor_stand,name=Game,limit=1] MaxTimeAdded
scoreboard players operation Seconds MaxTimeAdded *= 60 Const

# Safe time tracking
scoreboard players operation Remaining SafeRounds = @e[type=armor_stand,name=Game,limit=1] SafeRounds
scoreboard players set Time DangerTime 15
scoreboard players add Remaining SafeRounds 1
scoreboard players set Total Round 0

# Team setup
team modify red collisionRule always
team modify blue collisionRule always
execute if score @e[type=armor_stand,name=Game,limit=1] FriendlyFire matches 0 run team modify red friendlyFire false
execute if score @e[type=armor_stand,name=Game,limit=1] FriendlyFire matches 0 run team modify blue friendlyFire false
execute if score @e[type=armor_stand,name=Game,limit=1] FriendlyFire matches 1 run team modify red friendlyFire true
execute if score @e[type=armor_stand,name=Game,limit=1] FriendlyFire matches 1 run team modify blue friendlyFire true

# Trigger new round
function entrapment:game/newround

recipe give @a *

scoreboard objectives setdisplay list Health

kill @e[type=area_effect_cloud]

tp @e[team=none] 0 334 55 180 40
