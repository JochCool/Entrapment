# Cycle min time added

scoreboard players add @e[type=armor_stand,name=Game] MinSafeTime 10
scoreboard players set @e[type=armor_stand,name=Game,scores={MinSafeTime=70..}] MinSafeTime 10
data merge block -3 317 144 {Text1:'{"text":"Minimum Safe Time","color":"white"}',Text2:'{"text":""}',Text3:'{"text":""}',Text4:'[{"score":{"objective":"MinSafeTime","name":"@e[type=armor_stand,name=Game]"},"color":"gold","clickEvent":{"action":"run_command","value":"/trigger Action set 10"}},{"text":" seconds","color":"gold"}]'}
