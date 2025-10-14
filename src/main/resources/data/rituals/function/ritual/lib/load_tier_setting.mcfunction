# ========================================
# Load Tier Setting (Unified Tier Loader)
# ========================================
# Macro function to load a tier-specific setting into a temp variable
# Eliminates repetitive if-matches chains across all get_*_settings files
#
# Parameters (from storage):
#   prefix: Setting prefix (e.g., "tier", "breeding_tier")
#   suffix: Setting suffix (e.g., "_h_range", "_frequency")
#   output: Output variable name (e.g., "current_h_range", "current_freq")
#
# Usage (horizontal range):
#   data modify storage rituals:tier_load set value {prefix:"tier",suffix:"_h_range",output:"current_h_range"}
#   function rituals:ritual/lib/load_tier_setting with storage rituals:tier_load
#
# Usage (ritual-specific frequency):
#   data modify storage rituals:tier_load set value {prefix:"breeding_tier",suffix:"_frequency",output:"current_freq"}
#   function rituals:ritual/lib/load_tier_setting with storage rituals:tier_load

$execute if score @s rituals.tier matches 1 run scoreboard players operation #$(output) rituals.temp = #$(prefix)1$(suffix) rituals.data
$execute if score @s rituals.tier matches 2 run scoreboard players operation #$(output) rituals.temp = #$(prefix)2$(suffix) rituals.data
$execute if score @s rituals.tier matches 3 run scoreboard players operation #$(output) rituals.temp = #$(prefix)3$(suffix) rituals.data
$execute if score @s rituals.tier matches 4 run scoreboard players operation #$(output) rituals.temp = #$(prefix)4$(suffix) rituals.data
$execute if score @s rituals.tier matches 5 run scoreboard players operation #$(output) rituals.temp = #$(prefix)5$(suffix) rituals.data
$execute if score @s rituals.tier matches 6 run scoreboard players operation #$(output) rituals.temp = #$(prefix)6$(suffix) rituals.data

