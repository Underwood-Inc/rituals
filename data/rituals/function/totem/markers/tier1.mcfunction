# Tier 1 (Wood): 2×2 horizontal, 3 vertical = box from -2 to 2 X/Z, -3 to 3 Y
# Spawn 8 corners + 6 face centers = 14 markers
# Color: Brown [0.5, 0.35, 0.2]

# 8 Corner markers
summon area_effect_cloud ~-2 ~-3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
summon area_effect_cloud ~2 ~-3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
summon area_effect_cloud ~-2 ~-3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
summon area_effect_cloud ~2 ~-3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
summon area_effect_cloud ~-2 ~3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
summon area_effect_cloud ~2 ~3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
summon area_effect_cloud ~-2 ~3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}
summon area_effect_cloud ~2 ~3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.6},Radius:0.15f,Color:8347443}

# 6 Face center markers
summon area_effect_cloud ~0 ~0 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
summon area_effect_cloud ~0 ~0 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
summon area_effect_cloud ~-2 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
summon area_effect_cloud ~2 ~0 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
summon area_effect_cloud ~0 ~-3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}
summon area_effect_cloud ~0 ~3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.5},Radius:0.12f,Color:8347443}

# 12 Edge midpoint markers (wireframe lines)
# Top edges (Y=3)
summon area_effect_cloud ~0 ~3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
summon area_effect_cloud ~0 ~3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
summon area_effect_cloud ~-2 ~3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
summon area_effect_cloud ~2 ~3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
# Bottom edges (Y=-3)
summon area_effect_cloud ~0 ~-3 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
summon area_effect_cloud ~0 ~-3 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
summon area_effect_cloud ~-2 ~-3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
summon area_effect_cloud ~2 ~-3 ~0 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
# Vertical edges (midpoints at Y=0)
summon area_effect_cloud ~-2 ~0 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
summon area_effect_cloud ~2 ~0 ~-2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
summon area_effect_cloud ~-2 ~0 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}
summon area_effect_cloud ~2 ~0 ~2 {Duration:-1,Tags:["rituals.range_marker","rituals.marker_new"],Particle:{type:"dust",color:[0.5,0.35,0.2],scale:0.4},Radius:0.08f,Color:8347443}

# Link all new markers to this totem's ID
execute as @e[type=area_effect_cloud,tag=rituals.marker_new,distance=..10] run scoreboard players operation @s rituals.id = #marker_id rituals.temp
tag @e[type=area_effect_cloud,tag=rituals.marker_new] remove rituals.marker_new


