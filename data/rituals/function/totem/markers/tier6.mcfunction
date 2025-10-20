# Tier 6 (Netherite): 7×7 horizontal, 8 vertical = box from -7 to 7 X/Z, -8 to 8 Y
# Sentry: 14×14 horizontal, 16 vertical (2x multiplier)
# Color: Purple [0.5, 0.2, 0.5] for normal, Red [1.0, 0.2, 0.2] for sentry

# 8 Corner markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-7 ~-8 ~-7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.8},Radius:0.15f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~7 ~-8 ~-7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.8},Radius:0.15f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-7 ~-8 ~7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.8},Radius:0.15f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~7 ~-8 ~7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.8},Radius:0.15f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-7 ~8 ~-7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.8},Radius:0.15f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~7 ~8 ~-7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.8},Radius:0.15f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-7 ~8 ~7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.8},Radius:0.15f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~7 ~8 ~7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.8},Radius:0.15f,Color:8331647}

# 8 Corner markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-14 ~-16 ~-14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~14 ~-16 ~-14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-14 ~-16 ~14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~14 ~-16 ~14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-14 ~16 ~-14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~14 ~16 ~-14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-14 ~16 ~14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~14 ~16 ~14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.8},Radius:0.15f,Color:16724736}

# 6 Face centers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~-7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.7},Radius:0.12f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.7},Radius:0.12f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-7 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.7},Radius:0.12f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~7 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.7},Radius:0.12f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.7},Radius:0.12f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.7},Radius:0.12f,Color:8331647}

# 6 Face centers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~-14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-14 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~14 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-16 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~16 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.12f,Color:16724736}

# 12 Edge midpoint markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~8 ~-7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~8 ~7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-7 ~8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~7 ~8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-8 ~-7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-8 ~7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-7 ~-8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~7 ~-8 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-7 ~0 ~-7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~7 ~0 ~-7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-7 ~0 ~7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~7 ~0 ~7 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.2,0.5],scale:0.6},Radius:0.08f,Color:8331647}

# 12 Edge midpoint markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~16 ~-14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~16 ~14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-14 ~16 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~14 ~16 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-16 ~-14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-16 ~14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-14 ~-16 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~14 ~-16 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-14 ~0 ~-14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~14 ~0 ~-14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-14 ~0 ~14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~14 ~0 ~14 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.08f,Color:16724736}

# Link to totem ID
execute if score #is_sentry rituals.temp matches 0 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..20] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
execute if score #is_sentry rituals.temp matches 1 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..34] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
tag @e[type=area_effect_cloud,tag=rituals.marker_new] remove rituals.marker_new

