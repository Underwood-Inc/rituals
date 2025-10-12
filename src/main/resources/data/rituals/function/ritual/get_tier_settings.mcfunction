# Get range settings for current totem's tier
# Sets #current_h_range, #current_v_range
# NOTE: Frequency is now per-ritual, loaded by get_*_settings functions

execute if score @s rituals.tier matches 1 run scoreboard players operation #current_h_range rituals.temp = #tier1_h_range rituals.data
execute if score @s rituals.tier matches 2 run scoreboard players operation #current_h_range rituals.temp = #tier2_h_range rituals.data
execute if score @s rituals.tier matches 3 run scoreboard players operation #current_h_range rituals.temp = #tier3_h_range rituals.data
execute if score @s rituals.tier matches 4 run scoreboard players operation #current_h_range rituals.temp = #tier4_h_range rituals.data
execute if score @s rituals.tier matches 5 run scoreboard players operation #current_h_range rituals.temp = #tier5_h_range rituals.data
execute if score @s rituals.tier matches 6 run scoreboard players operation #current_h_range rituals.temp = #tier6_h_range rituals.data

execute if score @s rituals.tier matches 1 run scoreboard players operation #current_v_range rituals.temp = #tier1_v_range rituals.data
execute if score @s rituals.tier matches 2 run scoreboard players operation #current_v_range rituals.temp = #tier2_v_range rituals.data
execute if score @s rituals.tier matches 3 run scoreboard players operation #current_v_range rituals.temp = #tier3_v_range rituals.data
execute if score @s rituals.tier matches 4 run scoreboard players operation #current_v_range rituals.temp = #tier4_v_range rituals.data
execute if score @s rituals.tier matches 5 run scoreboard players operation #current_v_range rituals.temp = #tier5_v_range rituals.data
execute if score @s rituals.tier matches 6 run scoreboard players operation #current_v_range rituals.temp = #tier6_v_range rituals.data

