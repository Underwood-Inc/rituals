# ========================================
# Check tool and apply progressive mining
# ========================================
# Wood tier: Requires axe, 3 hits
# Copper: Requires pickaxe, 5 hits
# Iron: Requires pickaxe, 8 hits
# Gold: Requires pickaxe, 10 hits
# Diamond: Requires pickaxe, 15 hits
# Netherite: Requires pickaxe, 20 hits

# Consume interaction data first
data remove entity @s attack
data remove entity @s interaction

# Creative mode can always instantly break
execute as @p[distance=..6,gamemode=creative] run function rituals:totem/break

# Tier 1 (Wood) - Requires any axe
execute if entity @s[tag=!rituals.broken] if score @s rituals.tier matches 1 as @p[distance=..6,gamemode=!creative,predicate=rituals:holding_axe] at @s run function rituals:totem/mine_hit
execute if entity @s[tag=!rituals.broken] if score @s rituals.tier matches 1 as @p[distance=..6,gamemode=!creative,predicate=!rituals:holding_axe] run function rituals:totem/wrong_tool_axe

# Tier 2-6 (Metals) - Require pickaxe
execute if entity @s[tag=!rituals.broken] if score @s rituals.tier matches 2.. as @p[distance=..6,gamemode=!creative,predicate=rituals:holding_pickaxe] at @s run function rituals:totem/mine_hit
execute if entity @s[tag=!rituals.broken] if score @s rituals.tier matches 2.. as @p[distance=..6,gamemode=!creative,predicate=!rituals:holding_pickaxe] run function rituals:totem/wrong_tool_pickaxe


