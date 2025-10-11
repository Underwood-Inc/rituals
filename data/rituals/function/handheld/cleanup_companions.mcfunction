# Remove companions whose owners no longer have companion totems equipped
execute as @e[type=silverfish,tag=rituals.companion] run function rituals:handheld/check_companion_owner

