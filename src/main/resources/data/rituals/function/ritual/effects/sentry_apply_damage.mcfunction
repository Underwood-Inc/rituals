# Apply damage to the mob that was hit
# Runs as the mob
# #damage is stored as x10 (e.g. 15 = 1.5 damage, 120 = 12.0 damage)

# Apply damage (divide by 10 to get actual damage)
execute if score #damage rituals.temp matches ..20 run damage @s 1.5 magic
execute if score #damage rituals.temp matches 21..40 run damage @s 3.0 magic
execute if score #damage rituals.temp matches 41..60 run damage @s 4.5 magic
execute if score #damage rituals.temp matches 61..80 run damage @s 6.0 magic
execute if score #damage rituals.temp matches 81..100 run damage @s 9.0 magic
execute if score #damage rituals.temp matches 101.. run damage @s 12.0 magic

