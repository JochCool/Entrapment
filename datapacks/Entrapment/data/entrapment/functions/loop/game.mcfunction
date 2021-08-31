# Player modes
gamemode survival @a[team=!none,gamemode=adventure]
gamemode spectator @a[team=none,gamemode=adventure,scores={Op=1..}]
gamemode spectator @a[team=none,gamemode=survival,scores={Op=1..}]
gamemode adventure @a[team=none,gamemode=spectator,scores={Op=..0}]
gamemode adventure @a[team=none,gamemode=survival,scores={Op=..0}]
gamemode spectator @a[scores={Deaths=1..},team=!none]
scoreboard players reset @a[scores={Deaths=1..}] Deaths
effect give @a saturation 3 1 true

# Make sure team AS don't unload
tp @e[type=armor_stand,name=HomeTeam] 1011 2 3
tp @e[type=armor_stand,name=AwayTeam] 1011 2 2

# Timing
scoreboard players remove @e[type=armor_stand,name=Game] Tick 1
scoreboard players operation Seconds Tick = @e[type=armor_stand,name=Game] Tick
scoreboard players operation Seconds Tick /= 20 Const
scoreboard players operation Time Time = Seconds Tick
execute if score @e[type=armor_stand,name=Game,limit=1] Tick matches 1 run function entrapment:game/newround

# Countdown sounds
execute if score @e[name=Game,type=armor_stand,limit=1] Tick matches 99 as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~
execute if score @e[name=Game,type=armor_stand,limit=1] Tick matches 79 as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~
execute if score @e[name=Game,type=armor_stand,limit=1] Tick matches 59 as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~
execute if score @e[name=Game,type=armor_stand,limit=1] Tick matches 39 as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~
execute if score @e[name=Game,type=armor_stand,limit=1] Tick matches 19 as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~

# Display round counter on action bar
title @a actionbar [{"text":"Round "},{"score":{"objective":"Round","name":"Total"}}]

# Spawn area lamp protection
kill @e[type=minecraft:item,x=-48,y=230,z=-3,dx=96,dy=15,dz=6,nbt={Item:{id:"minecraft:redstone_lamp"}}]
kill @e[type=minecraft:item,x=-48,y=230,z=-3,dx=96,dy=15,dz=6,nbt={Item:{id:"minecraft:sea_lantern"}}]
kill @e[type=minecraft:item,x=-48,y=230,z=-3,dx=96,dy=15,dz=6,nbt={Item:{id:"minecraft:prismarine_crystals"}}]

# Chests
execute as @e[type=armor_stand,name=NewNTChest,x=-59,y=220,z=1,dx=38,dy=34,dz=94,nbt={OnGround:1b}] at @s if block ~ ~ ~ air run data merge entity @s {CustomName:'"TChest"'}
execute as @e[type=armor_stand,name=NewPTChest,x=21,y=220,z=0,dx=96,dy=34,dz=96,nbt={OnGround:1b}] at @s if block ~ ~ ~ air run data merge entity @s {CustomName:'"TChest"'}

spreadplayers -40 47 1 46 false @e[type=armor_stand,name=NewNTChest,nbt={OnGround:1b}]
spreadplayers 40 47 1 46 false @e[type=armor_stand,name=NewPTChest,nbt={OnGround:1b}]

# See if we've used all the treasure items
execute unless entity @e[type=armor_stand,tag=Treasure] as @e[type=armor_stand,tag=TreasureCD] run tag @s add Treasure
execute as @e[type=armor_stand,tag=Treasure,tag=TreasureCD] run tag @s remove TreasureCD

# Particle beacons
execute at @e[type=armor_stand,name=OldTChest] run particle firework ~ ~11 ~ 0 3 0 0 2 force

# Remove tracking of empty or destroyed chests
execute as @e[type=armor_stand,name=OldTChest] at @s if block ~ ~ ~ air run kill @s
execute as @e[type=armor_stand,name=OldTChest] at @s store result score @s SuccessCount run data get block ~ ~ ~ Items
kill @e[type=armor_stand,name=OldTChest,scores={SuccessCount=0}]

# Place chest if valid spot found
execute as @e[type=armor_stand,name=TChest] run function entrapment:game/placechest

# Kill portal blocks
execute as @a at @s run fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace nether_portal

# Player confinement
scoreboard players set @a InArena 0
scoreboard players set @a[x=-59,y=221,z=1,dx=38,dy=50,dz=94] InArena 1
scoreboard players set @a[x=21,y=221,z=1,dx=38,dy=50,dz=94] InArena 1
scoreboard players set @a[x=-44,y=236,z=-8,dx=8,dy=5,dz=8] InArena 1
scoreboard players set @a[x=36,y=236,z=-8,dx=8,dy=5,dz=8] InArena 1
scoreboard players set @a[scores={InArena=1}] OutOfMap 0
scoreboard players add @a[scores={InArena=0}] OutOfMap 1
title @a[gamemode=survival,scores={OutOfMap=1}] title [{"text":"Return to the arena!","color":"red"}]
effect give @a[gamemode=survival,scores={OutOfMap=100..}] wither 1 2

# Confine spectators
execute if entity @e[type=armor_stand,name=Game,scores={Round=1,SpectatorLock=1}] run teleport @a[gamemode=spectator,team=home,scores={InArena=0}] -40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=2,SpectatorLock=1}] run teleport @a[gamemode=spectator,team=away,scores={InArena=0}] -40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=2,SpectatorLock=1}] run teleport @a[gamemode=spectator,team=home,scores={InArena=0}] 40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=1,SpectatorLock=1}] run teleport @a[gamemode=spectator,team=away,scores={InArena=0}] 40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=1,SpectatorLock=1}] positioned 20 0 -10 run teleport @a[team=home,gamemode=spectator,dx=42,dy=500,dz=110] -40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=2,SpectatorLock=1}] positioned 20 0 -10 run teleport @a[team=away,gamemode=spectator,dx=42,dy=500,dz=110] -40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=1,SpectatorLock=1}] positioned -60 0 -10 run teleport @a[team=away,gamemode=spectator,dx=42,dy=500,dz=110] 40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=2,SpectatorLock=1}] positioned -60 0 -10 run teleport @a[team=home,gamemode=spectator,dx=42,dy=500,dz=110] 40 236 -8 0 0

# Locked on player mode:
execute if entity @e[type=armor_stand,name=Game,scores={SpectatorLock=2}] run tag @a[gamemode=spectator] remove spectatingplayer
execute if entity @e[type=armor_stand,name=Game,scores={SpectatorLock=2}] as @a[gamemode=spectator,team=home] at @s if entity @p[team=home,distance=..2,gamemode=survival] run tag @s add spectatingplayer
execute if entity @e[type=armor_stand,name=Game,scores={SpectatorLock=2}] as @a[gamemode=spectator,team=away] at @s if entity @p[team=away,distance=..2,gamemode=survival] run tag @s add spectatingplayer
execute if entity @e[type=armor_stand,name=Game,scores={SpectatorLock=2}] as @a[gamemode=spectator,tag=!spectatingplayer,team=home] at @s run spectate @p[team=home,gamemode=survival]
execute if entity @e[type=armor_stand,name=Game,scores={SpectatorLock=2}] as @a[gamemode=spectator,tag=!spectatingplayer,team=away] at @s run spectate @p[team=away,gamemode=survival]

# Tp players in wrong arena (reconnects)
execute if entity @e[type=armor_stand,name=Game,scores={Round=1}] positioned 20 220 -10 run teleport @a[team=home,gamemode=survival,dx=42,dy=40,dz=110] -40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=2}] positioned 20 220 -10 run teleport @a[team=away,gamemode=survival,dx=42,dy=40,dz=110] -40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=1}] positioned -60 220 -10 run teleport @a[team=away,gamemode=survival,dx=42,dy=40,dz=110] 40 236 -8 0 0
execute if entity @e[type=armor_stand,name=Game,scores={Round=2}] positioned -60 220 -10 run teleport @a[team=home,gamemode=survival,dx=42,dy=40,dz=110] 40 236 -8 0 0

# Gates
scoreboard players set @e[type=armor_stand,name=Gate] Gate 1
execute as @e[type=armor_stand,name=Gate] at @s if entity @p[dx=10,dy=5,dz=3,gamemode=!spectator] run scoreboard players set @s Gate 0
execute at @e[type=armor_stand,name=Gate,scores={Gate=1}] positioned ~1 ~1 ~1 run fill ~ ~ ~ ~8 ~3 ~ barrier replace air
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~1 ~1 ~1 run fill ~ ~ ~ ~8 ~3 ~ air replace barrier
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~1 ~1 ~1 run fill ~ ~ ~ ~8 ~3 ~ air destroy
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~ ~ ~1 run fill ~ ~1 ~ ~ ~4 ~ redstone_lamp[lit=true]
execute at @e[type=armor_stand,name=Gate,scores={Gate=1}] positioned ~ ~ ~1 run fill ~ ~1 ~ ~ ~4 ~ sea_lantern
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~10 ~ ~1 run fill ~ ~1 ~ ~ ~4 ~ redstone_lamp[lit=true]
execute at @e[type=armor_stand,name=Gate,scores={Gate=1}] positioned ~10 ~ ~1 run fill ~ ~1 ~ ~ ~4 ~ sea_lantern
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~ ~ ~1 run fill ~1 ~ ~ ~9 ~ ~ redstone_lamp[lit=true]
execute at @e[type=armor_stand,name=Gate,scores={Gate=1}] positioned ~ ~ ~1 run fill ~1 ~ ~ ~9 ~ ~ sea_lantern
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~ ~5 ~1 run fill ~1 ~ ~ ~9 ~ ~ redstone_lamp[lit=true]
execute at @e[type=armor_stand,name=Gate,scores={Gate=1}] positioned ~ ~5 ~1 run fill ~1 ~ ~ ~9 ~ ~ sea_lantern
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~-1 ~ ~1 run fill ~ ~1 ~ ~ ~4 ~ redstone_block
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~11 ~ ~1 run fill ~ ~1 ~ ~ ~4 ~ redstone_block
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~ ~-1 ~1 run fill ~1 ~ ~ ~9 ~ ~ redstone_block
execute at @e[type=armor_stand,name=Gate,scores={Gate=0}] positioned ~ ~6 ~1 run fill ~1 ~ ~ ~9 ~ ~ redstone_block

# Spawn area protection
execute at @e[type=armor_stand,name=Gate] positioned ~1 ~1 ~ run fill ~ ~ ~ ~8 ~3 ~-6 air destroy
execute at @e[type=armor_stand,name=Gate] positioned ~1 ~1 ~2 run fill ~ ~ ~ ~8 ~3 ~ air destroy
scoreboard players reset * ShouldMove
scoreboard players set @e[type=!minecraft:item,x=-45,y=235,z=-9,dx=90,dy=5,dz=8] ShouldMove 1
scoreboard players reset @e[type=minecraft:arrow,scores={ShouldMove=1}] ShouldMove
execute as @e[scores={ShouldMove=1}] run data merge entity @s {Motion:[0d,0d,1d]}
execute as @e[type=!player,scores={ShouldMove=1}] at @s run teleport @s ~ ~ ~0.05

# Danger time
scoreboard players remove @e[type=armor_stand,name=Game] DangerTime 1
execute if entity @e[type=armor_stand,name=Game,scores={DangerTime=100..}] as @e[type=armor_stand,name=Gate] at @s positioned ~1 ~1 ~-6 run effect give @a[dx=8,dy=3,dz=8] minecraft:resistance 1 5
scoreboard players operation Seconds DangerTime = @e[type=armor_stand,name=Game] DangerTime
scoreboard players operation Seconds DangerTime /= 20 Const
execute if entity @e[type=armor_stand,name=Game,scores={DangerTime=0..}] run scoreboard players operation SpawnSafety Time = Seconds DangerTime

# Anti-camping in spawn zone
execute if entity @e[type=armor_stand,name=Game,scores={DangerTime=100}] run tellraw @a [{"text":"5 second warning - leave the spawn zone!","color":"red"}]
execute if entity @e[type=armor_stand,name=Game,scores={DangerTime=0}] run worldborder set 4020
# TODO: See if this can match the arena entrance exactly now
execute if entity @e[type=armor_stand,name=Game,scores={DangerTime=0}] run worldborder set 3998.25 10

# Barrier between arenas
kill @e[type=!player,x=-15,y=0,z=0,dx=10,dy=500,dz=100]
kill @e[type=!player,x=5,y=0,z=0,dx=10,dy=500,dz=100]
kill @a[gamemode=survival,x=-15,y=0,z=0,dx=10,dy=500,dz=100]
kill @a[gamemode=survival,x=5,y=0,z=0,dx=10,dy=500,dz=100]

# Get rid of totems of undying
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:totem_of_undying"}}]
clear @a totem_of_undying

# Count remaining players
execute store result score @e[type=armor_stand,name=HomeTeam] Count if entity @a[team=home,gamemode=!spectator]
execute store result score @e[type=armor_stand,name=AwayTeam] Count if entity @a[team=away,gamemode=!spectator]

execute if entity @e[type=armor_stand,name=Game,scores={State=3}] as @e[type=armor_stand,scores={Team=1..,Count=0},limit=1] run function entrapment:game/gamewon

# Protect lobby
kill @e[type=!player,x=-70,y=0,z=100,dx=140,dy=512,dz=10]
kill @a[gamemode=survival,x=-70,y=0,z=100,dx=140,dy=512,dz=10]

# Protect outside of arena walls
fill 19 220 96 19 255 0 air
fill -19 220 96 -19 255 0 air
fill 61 220 96 61 255 0 air
fill -61 220 96 -61 255 0 air
fill 20 242 -1 60 255 -1 air
fill -20 242 -1 -60 255 -1 air
fill 20 242 97 60 255 97 air
fill -20 242 97 -60 255 97 air

# Make mobs persistent
execute as @e[tag=!persistent] run data merge entity @s {PersistenceRequired:1b}
tag @e[tag=!persistent] add persistent

# Calculate info sidebar
scoreboard players operation Time Info = Time Time
scoreboard players operation SpawnSafety Info = SpawnSafety Time
scoreboard players reset @a[team=!none,gamemode=spectator] Info
execute as @a[gamemode=survival] run scoreboard players operation @s Info = @s Health

# Remove ready check helmets
clear @a minecraft:leather_helmet{display:{Name:'"Ready"'}}
