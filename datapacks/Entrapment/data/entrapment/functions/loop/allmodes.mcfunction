# Function run by all state loop functions

# tp players to spawn area
tp @a[gamemode=survival,x=1008,y=-10,z=0,dx=272,dy=255,dz=272] 0 251 117 0 0
tp @a[gamemode=spectator,x=1008,y=-10,z=0,dx=272,dy=255,dz=272] 0 251 117 0 0
tp @a[gamemode=adventure,x=1008,y=-10,z=0,dx=272,dy=255,dz=272] 0 251 117 0 0

# Team joining
team join home @a[scores={Team=1}]
team join away @a[scores={Team=2}]
team join none @a[team=]

# Op management
scoreboard players set JochCool Op 2
scoreboard players set JochTwo Op 2
scoreboard players add @a Op 0

# Reset lobby paintings & item frames
execute as @e[type=item_frame,x=-11,y=251,z=118,dx=22,dy=4,dz=28] run data merge entity @s {ItemRotation:0b}

# Make sure we don't get duplicates
tag @e[name=HomeTeam,limit=1] add Keep
tag @e[name=AwayTeam,limit=1] add Keep
kill @e[type=armor_stand,scores={Team=1..},tag=!Keep]
tag @e[scores={Team=1..},tag=Keep] remove Keep

# Make sure we don't lose the team AS
execute unless entity @e[type=armor_stand,name=HomeTeam] run summon armor_stand 1011 2 3 {CustomName:'"HomeTeam"',Marker:1,NoGravity:1,Invisible:1}
scoreboard players set @e[type=armor_stand,name=HomeTeam] Team 1

execute unless entity @e[type=armor_stand,name=AwayTeam] run summon armor_stand 1011 2 2 {CustomName:'"AwayTeam"',Marker:1,NoGravity:1,Invisible:1}
scoreboard players set @e[type=armor_stand,name=AwayTeam] Team 2

# State loop function calls
execute if score @e[type=armor_stand,name=Game,limit=1] State matches 0 run function entrapment:loop/lobby
execute if score @e[type=armor_stand,name=Game,limit=1] State matches 1 run function entrapment:loop/readycheck
execute if score @e[type=armor_stand,name=Game,limit=1] State matches 2 run function entrapment:loop/countdown
execute if score @e[type=armor_stand,name=Game,limit=1] State matches 3..4 run function entrapment:loop/game

# Debug mode
execute if entity @a[name=slicedlime,gamemode=creative] run gamerule sendCommandFeedback true
execute unless entity @a[name=slicedlime,gamemode=creative] run gamerule sendCommandFeedback false
