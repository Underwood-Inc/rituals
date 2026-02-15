# Apply Channeling (max 1)
# Reads current level from storage, increments (capped at max), writes back

# Read current level (0 if not present)
execute store result score #ench_level rituals.soul_temp run data get storage rituals:temp item.components."minecraft:enchantments".levels."minecraft:channeling"

# Cap check — if already at max, still announce but don't exceed
execute if score #ench_level rituals.soul_temp matches 1.. run data modify storage rituals:temp enchant_name set value '"Channeling (MAX)"'
execute if score #ench_level rituals.soul_temp matches 1.. run return 0

# Increment level
scoreboard players add #ench_level rituals.soul_temp 1

# Write new level back
execute store result storage rituals:temp item.components."minecraft:enchantments".levels."minecraft:channeling" int 1 run scoreboard players get #ench_level rituals.soul_temp

# Set display name for announcement
data modify storage rituals:temp enchant_name set value '"Channeling"'
