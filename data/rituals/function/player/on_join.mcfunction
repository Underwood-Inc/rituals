# Runs once each time a player joins the server.
# Gives the enchanted welcome guidebook on first join ever (tracked by rituals.guidebook score).

execute unless data storage rituals:config {give_guidebook_on_join:false} unless score @s rituals.guidebook matches 1.. run function rituals:give/guidebook_welcome
execute unless data storage rituals:config {give_guidebook_on_join:false} unless score @s rituals.guidebook matches 1.. run scoreboard players set @s rituals.guidebook 1
