# ========================================
# Soul Mending - Repair Durability
# ========================================
# Timer-based: attempts repair once per cooldown cycle.
# Level 1: every 60 seconds (1200 ticks)
# Level 2: every 30 seconds (600 ticks)
# Level 3: every 15 seconds (300 ticks)
# Expects: #repair_lvl rituals.soul_temp (1-3)

# Initialize score if it doesn't exist yet (first time holding)
execute unless score @s rituals.repair_cd matches 0.. run scoreboard players set @s rituals.repair_cd 0

# If still cooling down, decrement and bail
execute if score @s rituals.repair_cd matches 1.. run scoreboard players remove @s rituals.repair_cd 1
execute if score @s rituals.repair_cd matches 1.. run return 0

# === Timer expired — attempt repair ===

# Set cooldown for next cycle based on level
execute if score #repair_lvl rituals.soul_temp matches 1 run scoreboard players set @s rituals.repair_cd 1200
execute if score #repair_lvl rituals.soul_temp matches 2 run scoreboard players set @s rituals.repair_cd 600
execute if score #repair_lvl rituals.soul_temp matches 3.. run scoreboard players set @s rituals.repair_cd 300

# Get current damage on the held item (damage=0 means full durability)
execute store result score #current_damage rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:damage"

# Nothing to repair if already at full durability
execute if score #current_damage rituals.soul_temp matches ..0 run return 0

# Reduce damage by 1 (repairs 1 durability point)
scoreboard players remove #current_damage rituals.soul_temp 1

# Write the repaired damage value back to the held item
execute store result entity @s SelectedItem.components."minecraft:damage" int 1 run scoreboard players get #current_damage rituals.soul_temp

# Visual feedback
particle minecraft:happy_villager ~ ~1 ~ 0.2 0.2 0.2 0 3
