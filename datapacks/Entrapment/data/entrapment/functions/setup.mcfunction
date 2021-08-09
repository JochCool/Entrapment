# Sets up the map for an Entrapment Fan Tournament game

# ADD THE NUMBER OF THE CHOSEN ARENA
scoreboard players set Selected Arena ___

execute as @e[type=armor_stand,scores={Arena=-2147483648..}] if score Selected Arena = @s Arena run scoreboard players set @s Selected 1
data merge block 3 253 144 {Text1:'{"text":"Arena:","color":"white"}',Text2:'{"text":""}',Text3:'{"selector":"@e[scores={Selected=1..,Arena=1..}]","color":"gold"}',Text4:'[{"text":"by ","color":"white"},{"nbt":"ArmorItems[3].tag.author","entity":"@e[type=armor_stand,scores={Selected=1},sort=nearest,limit=1]","interpret":true,"color":"gold"}]'}
function entrapment:lobby/applypreview

# ADD THE TEAM MEMBERS
scoreboard players set ___ Team 1
scoreboard players set ___ Team 1
scoreboard players set ___ Team 1
scoreboard players set ___ Team 1
scoreboard players set ___ Team 2
scoreboard players set ___ Team 2
scoreboard players set ___ Team 2
scoreboard players set ___ Team 2

# ADD THE COLOURS AND NAMES OF THE TEAMS
team modify home color ___
team modify away color ___
data merge storage entrapment:teams {HomeWin:'{"text":"___ wins!","color":"___"}',AwayWin:'{"text":"___ wins!","color":"___"}'}
