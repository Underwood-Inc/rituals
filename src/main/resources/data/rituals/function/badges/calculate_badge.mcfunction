# ========================================
# Calculate Player Badge
# ========================================
# Runs as a player to determine their badge tier
# Checks highest totem tier obtained + ritual types completed

# Reset calculation scores
scoreboard players set @s rituals.badge_tier 0
scoreboard players set @s rituals.ritual_count 0

# ========================================
# DETERMINE HIGHEST TIER (1-6)
# ========================================
# Check via advancements (most reliable method)

# Check tier 6 (Netherite) - Master Ritualist advancement
execute if entity @s[advancements={rituals:guide/master_ritualist=true}] run scoreboard players set @s rituals.badge_tier 6

# Check tier 5 (Diamond)
execute if entity @s[advancements={rituals:guide/craft_diamond_totem=true}] unless score @s rituals.badge_tier matches 6 run scoreboard players set @s rituals.badge_tier 5

# Check tier 4 (Gold)
execute if entity @s[advancements={rituals:guide/craft_gold_totem=true}] unless score @s rituals.badge_tier matches 5.. run scoreboard players set @s rituals.badge_tier 4

# Check tier 3 (Iron)
execute if entity @s[advancements={rituals:guide/craft_iron_totem=true}] unless score @s rituals.badge_tier matches 4.. run scoreboard players set @s rituals.badge_tier 3

# Check tier 2 (Copper)
execute if entity @s[advancements={rituals:guide/craft_copper_totem=true}] unless score @s rituals.badge_tier matches 3.. run scoreboard players set @s rituals.badge_tier 2

# Check tier 1 (Wood)
execute if entity @s[advancements={rituals:guide/craft_totem=true}] unless score @s rituals.badge_tier matches 2.. run scoreboard players set @s rituals.badge_tier 1

# ========================================
# COUNT RITUAL TYPES COMPLETED
# ========================================
# Check individual ritual completion scoreboards

# Growth Ritual (Emerald)
execute if score @s rituals.growth_done matches 1.. run scoreboard players add @s rituals.ritual_count 1

# Strength Ritual (Diamond)
execute if score @s rituals.strength_done matches 1.. run scoreboard players add @s rituals.ritual_count 1

# Prosperity Ritual (Netherite Block)
execute if score @s rituals.prosperity_done matches 1.. run scoreboard players add @s rituals.ritual_count 1

# Protection Ritual (Iron Ingot)
execute if score @s rituals.protection_done matches 1.. run scoreboard players add @s rituals.ritual_count 1

# Healing Ritual (Nether Star)
execute if score @s rituals.healing_done matches 1.. run scoreboard players add @s rituals.ritual_count 1

# Sentry Ritual (Arrow)
execute if score @s rituals.sentry_done matches 1.. run scoreboard players add @s rituals.ritual_count 1

# Auto-Farming Ritual (Diamond Hoe + Square)
execute if score @s rituals.farming_done matches 1.. run scoreboard players add @s rituals.ritual_count 1

# Auto-Breeding Ritual (Wheat + Star)
execute if score @s rituals.breeding_done matches 1.. run scoreboard players add @s rituals.ritual_count 1

# Cap ritual count at 8 (max rituals)
execute if score @s rituals.ritual_count matches 9.. run scoreboard players set @s rituals.ritual_count 8

# Check for hidden advancement unlocks based on progress
function rituals:badges/check_hidden_advancements

# Badge calculation complete - use /function rituals:badges/check_status to view

