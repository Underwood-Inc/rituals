# ========================================
# Soul Mending - Repair Durability
# ========================================
# Timer-based: attempts repair once per cooldown cycle.
# Level 1: every 60 seconds, Level 2: every 30s, Level 3: every 15s
# apply_effects runs every 10 ticks, so cooldowns are /10.
# Expects: #repair_lvl rituals.soul_temp (1-3)

execute unless score @s rituals.repair_cd matches 0.. run scoreboard players set @s rituals.repair_cd 0

# Cooling down — decrement and bail
execute if score @s rituals.repair_cd matches 1.. run scoreboard players remove @s rituals.repair_cd 1
execute if score @s rituals.repair_cd matches 1.. run return 0

# Set cooldown for next cycle (ticks/10 because apply_effects is throttled)
execute if score #repair_lvl rituals.soul_temp matches 1 run scoreboard players set @s rituals.repair_cd 120
execute if score #repair_lvl rituals.soul_temp matches 2 run scoreboard players set @s rituals.repair_cd 60
execute if score #repair_lvl rituals.soul_temp matches 3.. run scoreboard players set @s rituals.repair_cd 30

# Read current damage (0 = full durability)
execute store result score #current_damage rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:damage"
execute if score #current_damage rituals.soul_temp matches ..0 run return 0

# Reduce damage by 1
scoreboard players remove #current_damage rituals.soul_temp 1

# Write back via item modify (SelectedItem is read-only in 1.20.5+)
execute store result storage rituals:temp new_damage int 1 run scoreboard players get #current_damage rituals.soul_temp
function rituals:soul/buffs/effects/write_damage with storage rituals:temp

particle minecraft:happy_villager ~ ~1 ~ 0.2 0.2 0.2 0 3
