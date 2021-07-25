# Check if ready check can be done, and if so activate it

# Error conditions:
execute unless entity @e[scores={Arena=1..,Selected=1..}] run tellraw @a[scores={Op=1..}] [{"text":"Please select an arena.","color":"red"}]
execute unless entity @e[type=armor_stand,scores={Count=1..}] run tellraw @a[scores={Op=1..}] [{"text":"At least one player needs to be in a team.","color":"red"}]

# Start ready check
execute if entity @e[scores={Arena=1..,Selected=1..}] if entity @e[type=armor_stand,scores={Count=1..}] run function entrapment:lobby/startreadycheck
