# Tier 2 (Copper): 3×3 horizontal, 4 vertical = box from -3 to 3 X/Z, -4 to 4 Y
# Sentry: 6×6 horizontal, 8 vertical (2x multiplier)
# Color: Copper [0.8, 0.5, 0.3] for normal, Red [1.0, 0.2, 0.2] for sentry

# 8 Corner markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-3 ~-4 ~-3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.6},Radius:0.15f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~3 ~-4 ~-3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.6},Radius:0.15f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-3 ~-4 ~3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.6},Radius:0.15f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~3 ~-4 ~3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.6},Radius:0.15f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-3 ~4 ~-3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.6},Radius:0.15f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~3 ~4 ~-3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.6},Radius:0.15f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-3 ~4 ~3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.6},Radius:0.15f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~3 ~4 ~3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.6},Radius:0.15f,Color:13398860}

# 8 Corner markers - Sentry (doubled)
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-6 ~-8 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~6 ~-8 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-6 ~-8 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~6 ~-8 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-6 ~8 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~6 ~8 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-6 ~8 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~6 ~8 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.15f,Color:16724736}

# 6 Face centers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~-3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.5},Radius:0.12f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.5},Radius:0.12f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-3 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.5},Radius:0.12f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~3 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.5},Radius:0.12f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-4 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.5},Radius:0.12f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~4 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.5},Radius:0.12f,Color:13398860}

# 6 Face centers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-6 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~6 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.12f,Color:16724736}

# 12 Edge midpoint markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~4 ~-3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~4 ~3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-3 ~4 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~3 ~4 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-4 ~-3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-4 ~3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-3 ~-4 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~3 ~-4 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-3 ~0 ~-3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~3 ~0 ~-3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-3 ~0 ~3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~3 ~0 ~3 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.8,0.5,0.3],scale:0.4},Radius:0.08f,Color:13398860}

# 12 Edge midpoint markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~8 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~8 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-6 ~8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~6 ~8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-8 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-8 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-6 ~-8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~6 ~-8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-6 ~0 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~6 ~0 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-6 ~0 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~6 ~0 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.4},Radius:0.08f,Color:16724736}

# Link to totem ID
execute if score #is_sentry rituals.temp matches 0 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..12] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
execute if score #is_sentry rituals.temp matches 1 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..18] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
tag @e[type=area_effect_cloud,tag=rituals.marker_new] remove rituals.marker_new

