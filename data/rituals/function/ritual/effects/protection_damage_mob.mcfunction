# Apply damage to this mob based on tier
# Runs as the hostile mob

execute if score #protection_damage rituals.temp matches 2 run damage @s 2.0 magic
execute if score #protection_damage rituals.temp matches 3 run damage @s 3.0 magic
execute if score #protection_damage rituals.temp matches 4 run damage @s 4.0 magic
execute if score #protection_damage rituals.temp matches 5 run damage @s 5.0 magic
execute if score #protection_damage rituals.temp matches 7 run damage @s 7.0 magic
execute if score #protection_damage rituals.temp matches 10 run damage @s 10.0 magic

# Particles
particle dust{color:[0.5,0.7,1.0],scale:1.0} ~ ~1 ~ 0.3 0.5 0.3 0 5

