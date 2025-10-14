# ========================================
# Check if totem has been mined enough to break
# ========================================
# Runs as and at totem

# Define required hits per tier
# Tier 1 (Wood): 3 hits
# Tier 2 (Copper): 5 hits
# Tier 3 (Iron): 8 hits
# Tier 4 (Gold): 10 hits
# Tier 5 (Diamond): 15 hits
# Tier 6 (Netherite): 20 hits

# Store required hits in temp
execute if score @s rituals.tier matches 1 run scoreboard players set #required_hits rituals.temp 3
execute if score @s rituals.tier matches 2 run scoreboard players set #required_hits rituals.temp 5
execute if score @s rituals.tier matches 3 run scoreboard players set #required_hits rituals.temp 8
execute if score @s rituals.tier matches 4 run scoreboard players set #required_hits rituals.temp 10
execute if score @s rituals.tier matches 5 run scoreboard players set #required_hits rituals.temp 15
execute if score @s rituals.tier matches 6 run scoreboard players set #required_hits rituals.temp 20

# Get current progress from NBT
execute store result score #current_progress rituals.temp run data get entity @s data.rituals.mine_progress

# Calculate percentage for particle feedback
scoreboard players operation #progress_pct rituals.temp = #current_progress rituals.temp
scoreboard players operation #progress_pct rituals.temp *= #100 rituals.data
scoreboard players operation #progress_pct rituals.temp /= #required_hits rituals.temp

# Play sound and show particles based on progress
playsound block.stone.hit block @a ~ ~ ~ 1.0 1.0
execute if score #progress_pct rituals.temp matches ..33 run particle block{block_state:"minecraft:oak_planks"} ~ ~1 ~ 0.3 0.3 0.3 0 3
execute if score #progress_pct rituals.temp matches 34..66 run particle block{block_state:"minecraft:stone"} ~ ~1 ~ 0.3 0.3 0.3 0 5
execute if score #progress_pct rituals.temp matches 67.. run particle block{block_state:"minecraft:crying_obsidian"} ~ ~1 ~ 0.3 0.3 0.3 0 8

# If progress >= required hits, break the totem
execute if score #current_progress rituals.temp >= #required_hits rituals.temp run function rituals:totem/break

