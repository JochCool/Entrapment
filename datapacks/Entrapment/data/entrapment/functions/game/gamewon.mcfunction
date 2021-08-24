# Win messages
execute if entity @e[type=armor_stand,name=HomeTeam,scores={Count=1..}] run title @a subtitle {"nbt":"HomeWin","storage":"entrapment:teams","interpret":true}
execute if entity @e[type=armor_stand,name=AwayTeam,scores={Count=1..}] run title @a subtitle {"nbt":"AwayWin","storage":"entrapment:teams","interpret":true}
title @a title [{"text":"Game Over"}]
execute if entity @e[type=armor_stand,name=HomeTeam,scores={Count=1..}] run tellraw @a {"nbt":"HomeWin","storage":"entrapment:teams","interpret":true}
execute if entity @e[type=armor_stand,name=AwayTeam,scores={Count=1..}] run tellraw @a {"nbt":"AwayWin","storage":"entrapment:teams","interpret":true}

scoreboard players set @e[type=armor_stand,name=Game] State 4
