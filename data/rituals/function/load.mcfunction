# ========================================
# Totem Rituals Datapack - Load Function
# ========================================
# This function runs once when the datapack is loaded

# Create scoreboards for tracking
scoreboard objectives add rituals.data dummy
scoreboard objectives add rituals.timer dummy
scoreboard objectives add rituals.distance dummy
scoreboard objectives add rituals.tier dummy
scoreboard objectives add rituals.effect dummy
scoreboard objectives add rituals.temp dummy
scoreboard objectives add rituals.id dummy
scoreboard objectives add rituals.use_count minecraft.used:minecraft.warped_fungus_on_a_stick

# Menu system scoreboards
scoreboard objectives add rituals.menu trigger
scoreboard objectives add rituals.menu_state dummy

# Load config (can be modified in-game with /data modify storage rituals:config)
function rituals:config/load

# Apply config to scoreboards
execute store result score #ritual_duration rituals.data run data get storage rituals:config ritual_duration
execute store result score #min_totems rituals.data run data get storage rituals:config min_totems_required
execute store result score #ritual_check_range rituals.data run data get storage rituals:config ritual_check_range
execute store result score #sentry_target_range rituals.data run data get storage rituals:config sentry_target_range
execute store result score #sentry_max_distance rituals.data run data get storage rituals:config sentry_max_distance
execute store result score #sentry_range_mult rituals.data run data get storage rituals:config sentry_range_multiplier

# Load tier-specific configs
execute store result score #tier1_h_range rituals.data run data get storage rituals:config tier1_horizontal_range
execute store result score #tier2_h_range rituals.data run data get storage rituals:config tier2_horizontal_range
execute store result score #tier3_h_range rituals.data run data get storage rituals:config tier3_horizontal_range
execute store result score #tier4_h_range rituals.data run data get storage rituals:config tier4_horizontal_range
execute store result score #tier5_h_range rituals.data run data get storage rituals:config tier5_horizontal_range
execute store result score #tier6_h_range rituals.data run data get storage rituals:config tier6_horizontal_range

execute store result score #tier1_v_range rituals.data run data get storage rituals:config tier1_vertical_range
execute store result score #tier2_v_range rituals.data run data get storage rituals:config tier2_vertical_range
execute store result score #tier3_v_range rituals.data run data get storage rituals:config tier3_vertical_range
execute store result score #tier4_v_range rituals.data run data get storage rituals:config tier4_vertical_range
execute store result score #tier5_v_range rituals.data run data get storage rituals:config tier5_vertical_range
execute store result score #tier6_v_range rituals.data run data get storage rituals:config tier6_vertical_range

# NOTE: Frequency is now per-ritual, loaded dynamically by get_*_settings functions
# No longer loading generic tier frequencies

# Tier multipliers for effect strength (not range)
scoreboard players set #tier1_power rituals.data 1
scoreboard players set #tier2_power rituals.data 2
scoreboard players set #tier3_power rituals.data 3

# Constants
scoreboard players set #check_interval rituals.data 20

# System constants
scoreboard players set #-1 rituals.data -1
scoreboard players set #2 rituals.data 2
scoreboard players set #10 rituals.data 10
scoreboard players set #20 rituals.data 20
scoreboard players set #100 rituals.data 100

# Initialize global ID counter
execute unless score #global_totem_id rituals.id matches 1.. run scoreboard players set #global_totem_id rituals.id 1

tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Datapack loaded!","color":"white","bold":false}]
tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Press ","color":"gray","bold":false},{"text":"L","color":"aqua","bold":true},{"text":" to open Advancement Guide!","color":"gray","bold":false}]
tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Or use: ","color":"gray","bold":false},{"text":"/function rituals:help","color":"green","clickEvent":{"action":"suggest_command","value":"/function rituals:help"},"hoverEvent":{"action":"show_text","value":"Click for help"}},{"text":" for help","color":"gray"}]

