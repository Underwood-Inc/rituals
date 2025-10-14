# Load auto-breeding ritual config for current tier
execute if score @s rituals.tier matches 1 store result score #current_freq rituals.temp run data get storage rituals:config breeding_tier1_frequency
execute if score @s rituals.tier matches 2 store result score #current_freq rituals.temp run data get storage rituals:config breeding_tier2_frequency
execute if score @s rituals.tier matches 3 store result score #current_freq rituals.temp run data get storage rituals:config breeding_tier3_frequency
execute if score @s rituals.tier matches 4 store result score #current_freq rituals.temp run data get storage rituals:config breeding_tier4_frequency
execute if score @s rituals.tier matches 5 store result score #current_freq rituals.temp run data get storage rituals:config breeding_tier5_frequency
execute if score @s rituals.tier matches 6 store result score #current_freq rituals.temp run data get storage rituals:config breeding_tier6_frequency

