# Tier 4 (Gold): 5×5 horizontal, 6 vertical = box from -5 to 5 X/Z, -6 to 6 Y
# Sentry: 10×10 horizontal, 12 vertical (2x multiplier)
# Color: Yellow [1.0, 0.9, 0.0] for normal, Red [1.0, 0.2, 0.2] for sentry

# 8 Corner markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-5 ~-6 ~-5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.7},Radius:0.15f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~5 ~-6 ~-5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.7},Radius:0.15f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-5 ~-6 ~5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.7},Radius:0.15f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~5 ~-6 ~5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.7},Radius:0.15f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-5 ~6 ~-5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.7},Radius:0.15f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~5 ~6 ~-5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.7},Radius:0.15f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-5 ~6 ~5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.7},Radius:0.15f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~5 ~6 ~5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.7},Radius:0.15f,Color:16776960}

# 8 Corner markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-10 ~-12 ~-10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~10 ~-12 ~-10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-10 ~-12 ~10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~10 ~-12 ~10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-10 ~12 ~-10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~10 ~12 ~-10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-10 ~12 ~10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~10 ~12 ~10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}

# 6 Face centers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~-5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.6},Radius:0.12f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.6},Radius:0.12f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-5 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.6},Radius:0.12f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~5 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.6},Radius:0.12f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.6},Radius:0.12f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.6},Radius:0.12f,Color:16776960}

# 6 Face centers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~-10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-10 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~10 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-12 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~12 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}

# 12 Edge midpoint markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~6 ~-5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~6 ~5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-5 ~6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~5 ~6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-6 ~-5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-6 ~5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-5 ~-6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~5 ~-6 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-5 ~0 ~-5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~5 ~0 ~-5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-5 ~0 ~5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~5 ~0 ~5 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.9,0.0],scale:0.5},Radius:0.08f,Color:16776960}

# 12 Edge midpoint markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~12 ~-10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~12 ~10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-10 ~12 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~10 ~12 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-12 ~-10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-12 ~10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-10 ~-12 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~10 ~-12 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-10 ~0 ~-10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~10 ~0 ~-10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-10 ~0 ~10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~10 ~0 ~10 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}

# Link to totem ID
execute if score #is_sentry rituals.temp matches 0 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..16] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
execute if score #is_sentry rituals.temp matches 1 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..26] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
tag @e[type=area_effect_cloud,tag=rituals.marker_new] remove rituals.marker_new

