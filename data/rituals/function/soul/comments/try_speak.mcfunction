# ========================================
# Try to Speak - Soul Comments
# ========================================
# Checks if the soul should speak (cooldown-based)
# Base: 5-60 minutes | Reserved: 8-75 min | Chatty: 2-35 min

# If on cooldown, skip
execute if score @s rituals.soul_speak_cd matches 1.. run return 0

# Cooldown expired! Time to speak!
function rituals:soul/comments/say_random

# Set cooldown based on personality traits
# Check for Reserved buff (speaks less) - 8-75 minutes (9600-90000 ticks)
execute if data entity @s SelectedItem.components."minecraft:custom_data".soul_buffs[{id:"reserved"}] store result score @s rituals.soul_speak_cd run random value 9600..90000
execute if data entity @s SelectedItem.components."minecraft:custom_data".soul_buffs[{id:"reserved"}] run return 1

# Check for Chatty debuff (speaks more) - 2-35 minutes (2400-42000 ticks)
execute if data entity @s SelectedItem.components."minecraft:custom_data".soul_debuffs[{id:"chatty"}] store result score @s rituals.soul_speak_cd run random value 2400..42000
execute if data entity @s SelectedItem.components."minecraft:custom_data".soul_debuffs[{id:"chatty"}] run return 1

# Default: 5-60 minutes (6000-72000 ticks)
execute store result score @s rituals.soul_speak_cd run random value 6000..72000
