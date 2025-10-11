# Spawn a companion silverfish for this player
# The silverfish will be invulnerable and have tier-based damage

# Summon silverfish with tags
summon silverfish ~ ~ ~ {Tags:["rituals.companion","rituals.companion_new"],CustomName:'{"text":"Ritual Companion","color":"aqua"}',CustomNameVisible:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:0b}

# Set the companion's owner ID to match the player
execute as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run scoreboard players operation @s rituals.id = @p[tag=rituals.has_companion_totem] rituals.id

# Set tier-based attributes
execute if score @s rituals.tier matches 1 as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run attribute @s generic.attack_damage base set 2.0
execute if score @s rituals.tier matches 2 as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run attribute @s generic.attack_damage base set 3.0
execute if score @s rituals.tier matches 3 as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run attribute @s generic.attack_damage base set 4.0
execute if score @s rituals.tier matches 4 as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run attribute @s generic.attack_damage base set 6.0
execute if score @s rituals.tier matches 5 as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run attribute @s generic.attack_damage base set 8.0
execute if score @s rituals.tier matches 6 as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run attribute @s generic.attack_damage base set 12.0

# Set health and speed
execute as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run attribute @s generic.max_health base set 20.0
execute as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run data modify entity @s Health set value 20.0f
execute as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run attribute @s generic.movement_speed base set 0.35

# Store tier on companion
execute as @e[type=silverfish,tag=rituals.companion_new,limit=1,sort=nearest] run scoreboard players operation @s rituals.tier = @p[tag=rituals.has_companion_totem] rituals.tier

# Remove new tag
tag @e[type=silverfish,tag=rituals.companion_new] remove rituals.companion_new

# Visual feedback
particle poof ~ ~1 ~ 0.3 0.5 0.3 0.05 20
playsound entity.silverfish.ambient master @a ~ ~ ~ 1.0 1.5
tellraw @s [{"text":"[Companion Totem] ","color":"aqua","bold":true},{"text":"Your companion has been summoned!","color":"green","bold":false}]

