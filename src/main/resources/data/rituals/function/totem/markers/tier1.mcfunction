# Tier 1 (Wood): 2×2 horizontal, 3 vertical = box from -2 to 2 X/Z, -3 to 3 Y
# Sentry: 4×4 horizontal, 6 vertical (2x multiplier)
# Spawn 8 corners + 6 face centers + 12 edge markers
# Color: Brown [0.5, 0.35, 0.2] for normal, Red [1.0, 0.2, 0.2] for sentry

# 8 Corner markers - Normal range
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-2 ~-3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~2 ~-3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-2 ~-3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~2 ~-3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-2 ~3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~2 ~3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-2 ~3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~2 ~3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}

# 8 Corner markers - Sentry range (doubled)
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-4 ~-6 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~4 ~-6 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-4 ~-6 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~4 ~-6 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-4 ~6 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~4 ~6 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-4 ~6 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~4 ~6 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}

# 6 Face center markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-2 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~2 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}

# 6 Face center markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-4 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~4 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}

# 12 Edge midpoint markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-2 ~3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~2 ~3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-2 ~-3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~2 ~-3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-2 ~0 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~2 ~0 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-2 ~0 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~2 ~0 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}

# 12 Edge midpoint markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~6 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~6 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-4 ~6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~4 ~6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-6 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-6 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-4 ~-6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~4 ~-6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-4 ~0 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~4 ~0 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-4 ~0 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~4 ~0 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}

# Link all new markers to this totem's ID (increased distance for sentry range)
execute if score #is_sentry rituals.temp matches 0 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..10] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
execute if score #is_sentry rituals.temp matches 1 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..14] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
tag @e[type=area_effect_cloud,tag=rituals.marker_new] remove rituals.marker_new


