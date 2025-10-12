# ========================================
# Debug barrier entities
# ========================================
# Shows info about barriers in the world

# Count all barrier entities
execute store result score #barrier_count rituals.temp if entity @e[type=block_display,tag=rituals.totem_barrier]

# Count totems with barrier_shown tag
execute store result score #shown_count rituals.temp if entity @e[type=interaction,tag=rituals.totem,tag=rituals.barrier_shown]

# Count totems with redstone_powered tag
execute store result score #powered_count rituals.temp if entity @e[type=interaction,tag=rituals.totem,tag=rituals.redstone_powered]

# Show results to command executor
tellraw @s [{"text":"[Debug] Barrier Entities: ","color":"gold"},{"score":{"name":"#barrier_count","objective":"rituals.temp"},"color":"white"}]
tellraw @s [{"text":"[Debug] Totems marked barrier_shown: ","color":"gold"},{"score":{"name":"#shown_count","objective":"rituals.temp"},"color":"white"}]
tellraw @s [{"text":"[Debug] Totems powered: ","color":"gold"},{"score":{"name":"#powered_count","objective":"rituals.temp"},"color":"white"}]

# Show nearby barriers to command executor
tellraw @s [{"text":"[Debug] Barriers within 50 blocks: ","color":"gold"}]
execute as @e[type=block_display,tag=rituals.totem_barrier,distance=..50] at @s run tellraw @a[distance=..50] [{"text":"  - Barrier ID: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.id"},"color":"aqua"}]


