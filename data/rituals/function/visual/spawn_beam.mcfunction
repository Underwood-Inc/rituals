# ========================================
# Spawn Detection Beacon Beam (MACRO)
# ========================================
# Parameters:
#   x, y, z: Position offsets from current location
#   color: Beacon color (white/orange/magenta/light_blue/yellow/lime/pink/gray/light_gray/cyan/purple/blue/brown/green/red/black)
#
# Places a beacon block to create a visible beam, and a marker to track it

# DEBUG: Announce beacon spawn
$tellraw @a[distance=..10] [{"text":"[DEBUG] Spawning $(color) beacon at offset $(x),$(z)","color":"yellow"}]

# Place beacon structure (non-interactable)
# Base: Iron block 2 blocks down
$execute positioned ~$(x) ~-2 ~$(z) unless block ~ ~ ~ minecraft:iron_block run setblock ~ ~ ~ minecraft:iron_block replace

# Beacon: 1 block down from items
$execute positioned ~$(x) ~-1 ~$(z) unless block ~ ~ ~ minecraft:beacon run setblock ~ ~ ~ minecraft:beacon replace

# Colored glass at item level to tint beam (only if air)
$execute positioned ~$(x) ~ ~$(z) if block ~ ~ ~ minecraft:air run setblock ~ ~ ~ minecraft:$(color)_stained_glass replace

# Barrier above glass to prevent interaction (invisible, unbreakable)
$execute positioned ~$(x) ~1 ~$(z) if block ~ ~ ~ minecraft:air run setblock ~ ~ ~ minecraft:barrier replace

# Summon marker for cleanup tracking
$execute positioned ~$(x) ~-1 ~$(z) unless entity @e[type=marker,tag=rituals.beam_marker,distance=..0.5] run summon marker ~ ~ ~ {Tags:["rituals.beam_marker","rituals.new_beam"]}

