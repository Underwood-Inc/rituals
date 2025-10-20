# Tier 3 (Iron): 4×4 horizontal, 5 vertical = box from -4 to 4 X/Z, -5 to 5 Y
# Sentry: 8×8 horizontal, 10 vertical (2x multiplier)
# Color: Gray [0.6, 0.6, 0.6] for normal, Red [1.0, 0.2, 0.2] for sentry

# 8 Corner markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-4 ~-5 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.6},Radius:0.15f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~4 ~-5 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.6},Radius:0.15f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-4 ~-5 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.6},Radius:0.15f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~4 ~-5 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.6},Radius:0.15f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-4 ~5 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.6},Radius:0.15f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~4 ~5 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.6},Radius:0.15f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-4 ~5 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.6},Radius:0.15f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~4 ~5 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.6},Radius:0.15f,Color:10066329}

# 8 Corner markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-8 ~-10 ~-8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~8 ~-10 ~-8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-8 ~-10 ~8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~8 ~-10 ~8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-8 ~10 ~-8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~8 ~10 ~-8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-8 ~10 ~8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~8 ~10 ~8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.7},Radius:0.15f,Color:16724736}

# 6 Face centers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.5},Radius:0.12f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~0 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.5},Radius:0.12f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-4 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.5},Radius:0.12f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~4 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.5},Radius:0.12f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-5 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.5},Radius:0.12f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~5 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.5},Radius:0.12f,Color:10066329}

# 6 Face centers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~-8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~0 ~8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-8 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~8 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-10 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~10 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.6},Radius:0.12f,Color:16724736}

# 12 Edge midpoint markers - Normal
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~5 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~5 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-4 ~5 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~4 ~5 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-5 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~0 ~-5 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-4 ~-5 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~4 ~-5 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-4 ~0 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~4 ~0 ~-4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~-4 ~0 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}
execute if score #is_sentry rituals.temp matches 0 run summon area_effect_cloud ~4 ~0 ~4 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.6,0.6,0.6],scale:0.4},Radius:0.08f,Color:10066329}

# 12 Edge midpoint markers - Sentry
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~10 ~-8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~10 ~8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-8 ~10 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~8 ~10 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-10 ~-8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~0 ~-10 ~8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-8 ~-10 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~8 ~-10 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-8 ~0 ~-8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~8 ~0 ~-8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~-8 ~0 ~8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}
execute if score #is_sentry rituals.temp matches 1 run summon area_effect_cloud ~8 ~0 ~8 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[1.0,0.2,0.2],scale:0.5},Radius:0.08f,Color:16724736}

# Link to totem ID
execute if score #is_sentry rituals.temp matches 0 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..14] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
execute if score #is_sentry rituals.temp matches 1 as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..22] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
tag @e[type=area_effect_cloud,tag=rituals.marker_new] remove rituals.marker_new

