# Cycle max time added

scoreboard players add @e[type=armor_stand,name=Game] MaxTimeAdded 1
scoreboard players set @e[type=armor_stand,name=Game,scores={MaxTimeAdded=6..}] MaxTimeAdded 0
# Update sign
execute as @e[type=armor_stand,name=Game] if score @s MaxTimeAdded matches 1 run data merge block -3 316 144 {Text1:'{"text":"Maximum Time","color":"white"}',Text2:'{"text":"Added:","color":"white"}',Text3:'[""]',Text4:'[{"text":"","clickEvent":{"action":"run_command","value":"trigger Action set 8"}},{"text":"1","clickEvent":{"action":"run_command","value":"trigger Action set 8"},"color":"gold"},{"text":" minute","clickEvent":{"action":"run_command","value":"trigger Action set 8"},"color":"gold"}]'}
execute as @e[type=armor_stand,name=Game] unless score @s MaxTimeAdded matches 1 run data merge block -3 316 144 {Text1:'{"text":"Maximum Time","color":"white"}',Text2:'{"text":"Added:","color":"white"}',Text3:'[""]',Text4:'[{"text":"","clickEvent":{"action":"run_command","value":"trigger Action set 8"}},{"score":{"objective":"MaxTimeAdded","name":"@e[type=armor_stand,name=Game]"},"clickEvent":{"action":"run_command","value":"trigger Action set 8"},"color":"gold"},{"text":" minutes","clickEvent":{"action":"run_command","value":"trigger Action set 8"},"color":"gold"}]'}
