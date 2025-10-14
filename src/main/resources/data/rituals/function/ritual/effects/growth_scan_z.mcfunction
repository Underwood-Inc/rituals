# Recursive Z scanning
# Check block at this position and apply growth with tier-based random chance
# Tier 1 (Wood): 90% - Small range compensated with high success rate
# Tier 2 (Copper): 75%
# Tier 3 (Iron): 60%
# Tier 4 (Gold): 50%
# Tier 5 (Diamond): 40%
# Tier 6 (Netherite): 30% - Large range compensated with lower success rate
execute if block ~ ~ ~ #minecraft:crops if score #current_tier rituals.temp matches 1 if predicate rituals:random_90_percent run function rituals:ritual/effects/apply_growth_here
execute if block ~ ~ ~ #minecraft:crops if score #current_tier rituals.temp matches 2 if predicate rituals:random_75_percent run function rituals:ritual/effects/apply_growth_here
execute if block ~ ~ ~ #minecraft:crops if score #current_tier rituals.temp matches 3 if predicate rituals:random_60_percent run function rituals:ritual/effects/apply_growth_here
execute if block ~ ~ ~ #minecraft:crops if score #current_tier rituals.temp matches 4 if predicate rituals:random_50_percent run function rituals:ritual/effects/apply_growth_here
execute if block ~ ~ ~ #minecraft:crops if score #current_tier rituals.temp matches 5 if predicate rituals:random_40_percent run function rituals:ritual/effects/apply_growth_here
execute if block ~ ~ ~ #minecraft:crops if score #current_tier rituals.temp matches 6 if predicate rituals:random_30_percent run function rituals:ritual/effects/apply_growth_here

# Increment Z and continue if not done
scoreboard players add #scan_z rituals.temp 1
execute if score #scan_z rituals.temp <= #max_z rituals.temp positioned ~ ~ ~1 run function rituals:ritual/effects/growth_scan_z

