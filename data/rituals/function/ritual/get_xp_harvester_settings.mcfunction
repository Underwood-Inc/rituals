# Load XP Harvester ritual frequency for current tier
# All tiers activate once per second (20 ticks)
# Higher tiers give MORE XP per activation AND have larger range

execute if score @s rituals.tier matches 1 run scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 2 run scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 3 run scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 4 run scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 5 run scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 6 run scoreboard players set #current_freq rituals.temp 20


