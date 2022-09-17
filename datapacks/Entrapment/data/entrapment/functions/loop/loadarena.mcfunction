# Set air to all the redstone block locations
execute if score $Game Tick matches 1 positioned -59 285 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 285 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 285 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 285 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 285 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 285 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 285 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 285 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 285 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 285 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 285 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 285 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 288 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 288 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 288 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 288 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 288 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 288 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 288 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 288 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 288 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 288 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 288 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 288 65 run function entrapment:arenas/prepare

# 0 0 0 structure block
execute if score $Game Tick matches 1 run data modify block -59 285 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[0]
execute if score $Game Tick matches 1 run setblock -59 286 1 redstone_block

execute if score $Game Tick matches 4 run data modify block 21 285 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[0]
execute if score $Game Tick matches 4 run setblock 21 286 1 redstone_block

# 1 0 0 structure block

execute if score $Game Tick matches 7 run data modify block -27 285 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[3]
execute if score $Game Tick matches 7 run setblock -27 286 1 redstone_block

execute if score $Game Tick matches 10 run data modify block 53 285 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[3]
execute if score $Game Tick matches 10 run setblock 53 286 1 redstone_block

# 0 0 1 structure block
execute if score $Game Tick matches 13 run data modify block -59 285 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[1]
execute if score $Game Tick matches 13 run setblock -59 286 33 redstone_block

execute if score $Game Tick matches 16 run data modify block 21 285 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[1]
execute if score $Game Tick matches 16 run setblock 21 286 33 redstone_block

# 1 0 1 structure block

execute if score $Game Tick matches 19 run data modify block -27 285 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[4]
execute if score $Game Tick matches 19 run setblock -27 286 33 redstone_block

execute if score $Game Tick matches 22 run data modify block 53 285 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[4]
execute if score $Game Tick matches 22 run setblock 53 286 33 redstone_block

# 0 0 2 structure block

execute if score $Game Tick matches 25 run data modify block -59 285 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[2]
execute if score $Game Tick matches 25 run setblock -59 286 65 redstone_block

execute if score $Game Tick matches 28 run data modify block 21 285 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[2]
execute if score $Game Tick matches 28 run setblock 21 286 65 redstone_block

# 1 0 2 structure block

execute if score $Game Tick matches 31 run data modify block -27 285 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[5]
execute if score $Game Tick matches 31 run setblock -27 286 65 redstone_block

execute if score $Game Tick matches 34 run data modify block 53 285 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[5]
execute if score $Game Tick matches 34 run setblock 53 286 65 redstone_block

# 0 1 0 structure block

execute if score $Game Tick matches 37 run data modify block -59 288 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[6]
execute if score $Game Tick matches 37 run setblock -59 289 1 redstone_block

execute if score $Game Tick matches 40 run data modify block 21 288 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[6]
execute if score $Game Tick matches 40 run setblock 21 289 1 redstone_block

# 1 1 0 structure block

execute if score $Game Tick matches 43 run data modify block -27 288 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[9]
execute if score $Game Tick matches 43 run setblock -27 289 1 redstone_block

execute if score $Game Tick matches 46 run data modify block 53 288 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[9]
execute if score $Game Tick matches 46 run setblock 53 289 1 redstone_block

# 0 1 1 structure block

execute if score $Game Tick matches 49 run data modify block -59 288 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[7]
execute if score $Game Tick matches 49 run setblock -59 289 33 redstone_block

execute if score $Game Tick matches 52 run data modify block 21 288 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[7]
execute if score $Game Tick matches 52 run setblock 21 289 33 redstone_block

# 1 1 1 structure block

execute if score $Game Tick matches 55 run data modify block -27 288 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[10]
execute if score $Game Tick matches 55 run setblock -27 289 33 redstone_block

execute if score $Game Tick matches 58 run data modify block 53 288 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[10]
execute if score $Game Tick matches 58 run setblock 53 289 33 redstone_block

# 0 1 2 structure block

execute if score $Game Tick matches 61 run data modify block -59 288 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[8]
execute if score $Game Tick matches 61 run setblock -59 289 65 redstone_block

execute if score $Game Tick matches 64 run data modify block 21 288 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[8]
execute if score $Game Tick matches 64 run setblock 21 289 65 redstone_block

# 1 1 2 structure block
 
execute if score $Game Tick matches 67 run data modify block -27 288 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[11]
execute if score $Game Tick matches 67 run setblock -27 289 65 redstone_block

execute if score $Game Tick matches 70 run data modify block 53 288 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[11]
execute if score $Game Tick matches 70 run setblock 53 289 65 redstone_block

kill @e[type=minecraft:item]
