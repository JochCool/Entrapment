# Win messages
execute if entity @e[type=armor_stand,name=JoinRed,scores={Count=1..}] run title @a subtitle [{"text":"Team Redstone wins!","color":"red"}]
execute if entity @e[type=armor_stand,name=JoinBlue,scores={Count=1..}] run title @a subtitle [{"text":"Team Lapis wins!","color":"blue"}]
title @a title [{"text":"Game Over"}]
execute if entity @e[type=armor_stand,name=JoinRed,scores={Count=1..}] run tellraw @a [{"text":"Team Redstone wins!","color":"red"}]
execute if entity @e[type=armor_stand,name=JoinBlue,scores={Count=1..}] run tellraw @a [{"text":"Team Lapis wins!","color":"blue"}]

execute as @e[type=armor_stand,name=JoinRed,scores={Count=1..}] run scoreboard players add @a[team=red] Wins 1
execute as @e[type=armor_stand,name=JoinBlue,scores={Count=1}] run scoreboard players add @a[team=blue] Wins 1

function entrapment:game/gamereset
