# Function for the lobby state game loop

scoreboard players add $Game Tick 1
function entrapment:loop/loadarena

tp @e[type=armor_stand,name=HomeTeam] 13 251 130
tp @e[type=armor_stand,name=AwayTeam] -13 251 130

# Player states

# Move everyone to adventure mode
gamemode adventure @a[gamemode=survival]
gamemode adventure @a[gamemode=spectator,name=!slicedlime]

# Clear inventories
clear @a[gamemode=adventure]
function entrapment:lobby/clearenderchests

# Reset player state
effect give @a instant_health 3 1 true
effect give @a saturation 3 1 true
effect give @a[gamemode=adventure] weakness 2 255 true
experience set @a 0 levels
experience set @a 0 points

# Team counts
execute store result score @e[type=armor_stand,name=HomeTeam] Count if entity @a[team=home]
execute store result score @e[type=armor_stand,name=AwayTeam] Count if entity @a[team=away]

# Tutorial control
scoreboard players enable @a Help
scoreboard players add @a HelpPos 0
scoreboard players set @a[scores={HelpPos=..0,Help=1..}] HelpPos 50
scoreboard players add @a[scores={HelpPos=1..}] HelpPos 1

tellraw @a[tag=!HasPreviouslyJoined] ["",{"text":"\nGreetings and welcome to "},{"text":"Entrapment","color":"green"},{"text":" by ","color":"none"},{"text":"slicedlime","color":"gold","clickEvent":{"action":"open_url","value":"http://www.youtube.com/slicedlime"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"slicedlime on YouTube"}]}}},{"text":". If you want\nhelp, please ","color":"none"},{"text":"click here","color":"gold","clickEvent":{"action":"run_command","value":"/trigger Help set 1"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Display help"}]}}},{"text":" or click the Help sign in the lobby.\n","color":"none"}]
tag @a[tag=!HasPreviouslyJoined] add HasPreviouslyJoined

scoreboard players set @a Help 0

execute if entity @a[scores={HelpPos=1..}] run function entrapment:lobby/tutorial

# Map control

# Operator actions:
scoreboard players enable @a Action
# Action 3 - Ready check
execute if entity @a[scores={Action=3,Op=1..}] run function entrapment:control/readycheck

# Op management

scoreboard players set JochCool Op 2
scoreboard players set JochTwo Op 2
scoreboard players add @a Op 0
tellraw @a[scores={Op=0,Action=1..}] {"text":"Game settings can only be changed by operators.","color":"red"}

scoreboard players reset @a[scores={Action=1..}] Action

# Keep players in lobby

scoreboard players set @a InLobby 0
scoreboard players set @a[x=-4,y=251,z=116,dx=9,dy=4,dz=30] InLobby 1
scoreboard players set @a[x=-14,y=251,z=125,dx=32,dy=4,dz=11] InLobby 1
teleport @a[gamemode=adventure,scores={InLobby=0,HelpPos=0}] 0 251 117 0 0

# Silence item frames
execute as @e[type=item_frame] run data merge entity @s {Silent:1}