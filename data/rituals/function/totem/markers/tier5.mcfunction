# Tier 5 (Diamond): 6×6 horizontal, 7 vertical = box from -6 to 6 X/Z, -7 to 7 Y
# Sentry: 12×12 horizontal, 14 vertical (2x multiplier)
# Color: Cyan [0.0, 1.0, 1.0] for normal, Red [1.0, 0.2, 0.2] for sentry

# 8 Corner markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-6 ~-7 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.7},Radius:0.15f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~6 ~-7 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.7},Radius:0.15f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-6 ~-7 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.7},Radius:0.15f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~6 ~-7 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.7},Radius:0.15f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-6 ~7 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.7},Radius:0.15f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~6 ~7 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.7},Radius:0.15f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-6 ~7 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.7},Radius:0.15f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~6 ~7 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.7},Radius:0.15f,Color:65535}

# 8 Corner markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-12 ~-14 ~-12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~12 ~-14 ~-12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-12 ~-14 ~12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~12 ~-14 ~12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-12 ~14 ~-12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~12 ~14 ~-12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-12 ~14 ~12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~12 ~14 ~12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}

# 6 Face centers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.6},Radius:0.12f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.6},Radius:0.12f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-6 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.6},Radius:0.12f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~6 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.6},Radius:0.12f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-7 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.6},Radius:0.12f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~7 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.6},Radius:0.12f,Color:65535}

# 6 Face centers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~-12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-12 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~12 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-14 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~14 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}

# 12 Edge midpoint markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~7 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~7 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-6 ~7 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~6 ~7 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-7 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-7 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-6 ~-7 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~6 ~-7 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-6 ~0 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~6 ~0 ~-6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-6 ~0 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~6 ~0 ~6 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.0,1.0,1.0],scale:0.5},Radius:0.08f,Color:65535}

# 12 Edge midpoint markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~14 ~-12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~14 ~12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-12 ~14 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~12 ~14 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-14 ~-12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-14 ~12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-12 ~-14 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~12 ~-14 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-12 ~0 ~-12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~12 ~0 ~-12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-12 ~0 ~12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~12 ~0 ~12 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}

# Link to totem ID
execute if score #is_sentry rituals.temp matches 0 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..18] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
execute if score #is_sentry rituals.temp matches 1 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..30] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
tag @e[type=area_effect_cloud,tag=rituals.marker_new] remove rituals.marker_new

