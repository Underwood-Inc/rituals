# ========================================
# Spooky Sound - Paranoid Debuff
# ========================================
# Plays a random spooky ambient sound

execute store result score #sound_roll rituals.soul_temp run random value 1..10

execute if score #sound_roll rituals.soul_temp matches 1 run playsound minecraft:ambient.cave master @s ~ ~ ~ 0.3 0.8
execute if score #sound_roll rituals.soul_temp matches 2 run playsound minecraft:entity.enderman.stare master @s ~ ~ ~ 0.2 0.5
execute if score #sound_roll rituals.soul_temp matches 3 run playsound minecraft:entity.ghast.ambient master @s ~ ~ ~ 0.2 0.6
execute if score #sound_roll rituals.soul_temp matches 4 run playsound minecraft:entity.phantom.ambient master @s ~ ~ ~ 0.3 0.7
execute if score #sound_roll rituals.soul_temp matches 5 run playsound minecraft:block.sculk_sensor.clicking master @s ~ ~ ~ 0.4 0.8
execute if score #sound_roll rituals.soul_temp matches 6 run playsound minecraft:entity.warden.heartbeat master @s ~ ~ ~ 0.2 1.0
execute if score #sound_roll rituals.soul_temp matches 7 run playsound minecraft:entity.vex.ambient master @s ~ ~ ~ 0.3 0.5
execute if score #sound_roll rituals.soul_temp matches 8 run playsound minecraft:block.portal.ambient master @s ~ ~ ~ 0.2 0.6
execute if score #sound_roll rituals.soul_temp matches 9 run playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 0.1 0.8
execute if score #sound_roll rituals.soul_temp matches 10 run playsound minecraft:ambient.nether_wastes.mood master @s ~ ~ ~ 0.3 0.7

