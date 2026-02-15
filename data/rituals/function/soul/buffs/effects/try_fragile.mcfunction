# ========================================
# Brittle Edge - Extra Durability Loss on USE
# ========================================
# Only triggers when the item actually takes damage from normal use
# (mining, attacking, etc.) — NOT passively while held.
#
# Tracks previous damage value. If damage increased this tick
# (vanilla use caused durability loss), rolls chance to add more.
#
# Level 1: 50% chance of +1 extra damage on use
# Level 2: guaranteed +1 extra damage on use
# Expects: #fragile_lvl rituals.soul_temp (1-2)

# Initialize previous damage tracker if needed
execute unless score @s rituals.prev_damage matches 0.. run scoreboard players set @s rituals.prev_damage -1

# Get current damage on the held item
execute store result score #frag_current rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:damage"

# Compare to previous tick — if damage hasn't increased, item wasn't used
execute unless score #frag_current rituals.soul_temp > @s rituals.prev_damage run scoreboard players operation @s rituals.prev_damage = #frag_current rituals.soul_temp
execute unless score #frag_current rituals.soul_temp > @s rituals.prev_damage run return 0

# === Item took damage from real use this tick ===

# Level 1: 50% chance to add extra damage
execute if score #fragile_lvl rituals.soul_temp matches 1 store result score #frag_roll rituals.soul_temp run random value 1..2
execute if score #fragile_lvl rituals.soul_temp matches 1 if score #frag_roll rituals.soul_temp matches 2 run scoreboard players operation @s rituals.prev_damage = #frag_current rituals.soul_temp
execute if score #fragile_lvl rituals.soul_temp matches 1 if score #frag_roll rituals.soul_temp matches 2 run return 0

# Apply +1 extra damage (Level 2 always reaches here; Level 1 only on roll of 1)
execute store result score #frag_max rituals.soul_temp run data get entity @s SelectedItem.components."minecraft:max_damage"

# Don't exceed max damage - 1 (don't break the item outright)
scoreboard players add #frag_current rituals.soul_temp 1
scoreboard players operation #frag_cap rituals.soul_temp = #frag_max rituals.soul_temp
scoreboard players remove #frag_cap rituals.soul_temp 1
execute if score #frag_current rituals.soul_temp > #frag_cap rituals.soul_temp run scoreboard players operation #frag_current rituals.soul_temp = #frag_cap rituals.soul_temp

# Write back
execute store result entity @s SelectedItem.components."minecraft:damage" int 1 run scoreboard players get #frag_current rituals.soul_temp

# Update tracker to the new value (including our extra damage)
scoreboard players operation @s rituals.prev_damage = #frag_current rituals.soul_temp
