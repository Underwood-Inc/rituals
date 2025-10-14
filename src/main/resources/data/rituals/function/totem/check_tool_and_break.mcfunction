# ========================================
# Check if player has correct tool before breaking
# ========================================
# Wood tier: Requires axe
# All other tiers: Require pickaxe

# Consume interaction data first
data remove entity @s attack
data remove entity @s interaction

# Check for creative mode (can always break)
execute as @p[distance=..6,gamemode=creative] run function rituals:totem/break

# Tier 1 (Wood) - Requires any axe
execute if entity @s[tag=!rituals.broken] if score @s rituals.tier matches 1 as @p[distance=..6,gamemode=!creative,predicate=rituals:holding_axe] run function rituals:totem/break
execute if entity @s[tag=!rituals.broken] if score @s rituals.tier matches 1 as @p[distance=..6,gamemode=!creative,predicate=!rituals:holding_axe] run function rituals:totem/wrong_tool_axe

# Tier 2-6 (Metals) - Require pickaxe
execute if entity @s[tag=!rituals.broken] if score @s rituals.tier matches 2.. as @p[distance=..6,gamemode=!creative,predicate=rituals:holding_pickaxe] run function rituals:totem/break
execute if entity @s[tag=!rituals.broken] if score @s rituals.tier matches 2.. as @p[distance=..6,gamemode=!creative,predicate=!rituals:holding_pickaxe] run function rituals:totem/wrong_tool_pickaxe

