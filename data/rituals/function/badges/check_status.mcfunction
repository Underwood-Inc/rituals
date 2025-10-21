# ========================================
# Check Badge Status
# ========================================
# Shows player their current badge tier and ritual count

# Recalculate badge (ensures it's up to date)
function rituals:badges/calculate_badge

# Display header
tellraw @s [{"text":""}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]
tellraw @s [{"text":"⚡ ","color":"yellow"},{"text":"Your Ritual Badge Status","color":"gold","bold":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]
tellraw @s [{"text":""}]

# Show tier
tellraw @s [{"text":"Totem Tier: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.badge_tier"},"color":"yellow"}]

# Show tier name
execute if score @s rituals.badge_tier matches 0 run tellraw @s [{"text":"  └ ","color":"dark_gray"},{"text":"None (Craft a totem!)","color":"red"}]
execute if score @s rituals.badge_tier matches 1 run tellraw @s [{"text":"  └ ","color":"dark_gray"},{"text":"Wood","color":"green"}]
execute if score @s rituals.badge_tier matches 2 run tellraw @s [{"text":"  └ ","color":"dark_gray"},{"text":"Copper","color":"gold"}]
execute if score @s rituals.badge_tier matches 3 run tellraw @s [{"text":"  └ ","color":"dark_gray"},{"text":"Iron","color":"gray"}]
execute if score @s rituals.badge_tier matches 4 run tellraw @s [{"text":"  └ ","color":"dark_gray"},{"text":"Gold","color":"yellow"}]
execute if score @s rituals.badge_tier matches 5 run tellraw @s [{"text":"  └ ","color":"dark_gray"},{"text":"Diamond","color":"aqua"}]
execute if score @s rituals.badge_tier matches 6 run tellraw @s [{"text":"  └ ","color":"dark_gray"},{"text":"Netherite","color":"dark_purple","bold":true}]

tellraw @s [{"text":""}]

# Show ritual count
tellraw @s [{"text":"Rituals Completed: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.ritual_count"},"color":"aqua"},{"text":"/8","color":"dark_gray"}]

# List completed rituals
tellraw @s [{"text":""}]
tellraw @s [{"text":"Ritual Types Mastered:","color":"yellow"}]

execute if score @s rituals.growth_done matches 1.. run tellraw @s [{"text":"  ✓ ","color":"green"},{"text":"Growth (Emerald)","color":"green"}]
execute unless score @s rituals.growth_done matches 1.. run tellraw @s [{"text":"  ✗ ","color":"red"},{"text":"Growth (Emerald)","color":"gray"}]

execute if score @s rituals.strength_done matches 1.. run tellraw @s [{"text":"  ✓ ","color":"green"},{"text":"Strength (Diamond)","color":"aqua"}]
execute unless score @s rituals.strength_done matches 1.. run tellraw @s [{"text":"  ✗ ","color":"red"},{"text":"Strength (Diamond)","color":"gray"}]

execute if score @s rituals.prosperity_done matches 1.. run tellraw @s [{"text":"  ✓ ","color":"green"},{"text":"Prosperity (Netherite Block)","color":"yellow"}]
execute unless score @s rituals.prosperity_done matches 1.. run tellraw @s [{"text":"  ✗ ","color":"red"},{"text":"Prosperity (Netherite Block)","color":"gray"}]

execute if score @s rituals.protection_done matches 1.. run tellraw @s [{"text":"  ✓ ","color":"green"},{"text":"Protection (Iron Ingot)","color":"blue"}]
execute unless score @s rituals.protection_done matches 1.. run tellraw @s [{"text":"  ✗ ","color":"red"},{"text":"Protection (Iron Ingot)","color":"gray"}]

execute if score @s rituals.healing_done matches 1.. run tellraw @s [{"text":"  ✓ ","color":"green"},{"text":"Healing (Nether Star)","color":"light_purple"}]
execute unless score @s rituals.healing_done matches 1.. run tellraw @s [{"text":"  ✗ ","color":"red"},{"text":"Healing (Nether Star)","color":"gray"}]

execute if score @s rituals.sentry_done matches 1.. run tellraw @s [{"text":"  ✓ ","color":"green"},{"text":"Sentry (Arrow)","color":"red"}]
execute unless score @s rituals.sentry_done matches 1.. run tellraw @s [{"text":"  ✗ ","color":"red"},{"text":"Sentry (Arrow)","color":"gray"}]

execute if score @s rituals.farming_done matches 1.. run tellraw @s [{"text":"  ✓ ","color":"green"},{"text":"Auto-Farming (Diamond Hoe)","color":"green","bold":true}]
execute unless score @s rituals.farming_done matches 1.. run tellraw @s [{"text":"  ✗ ","color":"red"},{"text":"Auto-Farming (Diamond Hoe)","color":"gray"}]

execute if score @s rituals.breeding_done matches 1.. run tellraw @s [{"text":"  ✓ ","color":"green"},{"text":"Auto-Breeding (Wheat)","color":"yellow","bold":true}]
execute unless score @s rituals.breeding_done matches 1.. run tellraw @s [{"text":"  ✗ ","color":"red"},{"text":"Auto-Breeding (Wheat)","color":"gray"}]

tellraw @s [{"text":""}]
tellraw @s [{"text":"Total Ritual Activations: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.total_activations"},"color":"gold"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]
tellraw @s [{"text":"💡 Tip: ","color":"yellow"},{"text":"Your progress is saved automatically!","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]

