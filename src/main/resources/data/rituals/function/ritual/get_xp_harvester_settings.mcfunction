# Load XP Harvester ritual frequency for current tier
# All tiers give 1 XP per second (20 ticks)
# Higher tiers don't give MORE xp, they give it over a larger range

execute if score @s rituals.tier matches 1 scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 2 scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 3 scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 4 scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 5 scoreboard players set #current_freq rituals.temp 20
execute if score @s rituals.tier matches 6 scoreboard players set #current_freq rituals.temp 20


