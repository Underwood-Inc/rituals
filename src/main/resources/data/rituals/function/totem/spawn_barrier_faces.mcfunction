# Spawn block_display entities for each face of the range box
# Uses macro parameters: $neg_h, $neg_v, $box_h, $box_v
# Positions are relative to the totem, forming a sealed cube

# North face (negative Z edge) - XY plane at Z=neg_h
# Anti-culling tags: PersistenceRequired, Invulnerable, teleport_duration (keeps entity active)
$summon block_display ~$(neg_h) ~$(neg_v) ~$(neg_h) {Tags:["rituals.totem_barrier","rituals.barrier_new"],block_state:{Name:"minecraft:light_blue_stained_glass"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[$(box_h)f,$(box_v)f,0.05f]},brightness:{sky:15,block:15},interpolation_duration:5,teleport_duration:2,shadow_strength:0.3f,shadow_radius:0.1f,Invulnerable:1b,PersistenceRequired:1b}

# South face (positive Z edge) - XY plane at Z=neg_h+box_h
$summon block_display ~$(neg_h) ~$(neg_v) ~$(neg_h) {Tags:["rituals.totem_barrier","rituals.barrier_new"],block_state:{Name:"minecraft:light_blue_stained_glass"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,$(box_h)f],scale:[$(box_h)f,$(box_v)f,0.05f]},brightness:{sky:15,block:15},interpolation_duration:5,teleport_duration:2,shadow_strength:0.3f,shadow_radius:0.1f,Invulnerable:1b,PersistenceRequired:1b}

# West face (negative X edge) - ZY plane at X=neg_h
$summon block_display ~$(neg_h) ~$(neg_v) ~$(neg_h) {Tags:["rituals.totem_barrier","rituals.barrier_new"],block_state:{Name:"minecraft:cyan_stained_glass"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.05f,$(box_v)f,$(box_h)f]},brightness:{sky:15,block:15},interpolation_duration:5,teleport_duration:2,shadow_strength:0.3f,shadow_radius:0.1f,Invulnerable:1b,PersistenceRequired:1b}

# East face (positive X edge) - ZY plane at X=neg_h+box_h
$summon block_display ~$(neg_h) ~$(neg_v) ~$(neg_h) {Tags:["rituals.totem_barrier","rituals.barrier_new"],block_state:{Name:"minecraft:cyan_stained_glass"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[$(box_h)f,0f,0f],scale:[0.05f,$(box_v)f,$(box_h)f]},brightness:{sky:15,block:15},interpolation_duration:5,teleport_duration:2,shadow_strength:0.3f,shadow_radius:0.1f,Invulnerable:1b,PersistenceRequired:1b}

# Bottom face (negative Y edge) - XZ plane at Y=neg_v
$summon block_display ~$(neg_h) ~$(neg_v) ~$(neg_h) {Tags:["rituals.totem_barrier","rituals.barrier_new"],block_state:{Name:"minecraft:blue_stained_glass"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[$(box_h)f,0.05f,$(box_h)f]},brightness:{sky:15,block:15},interpolation_duration:5,teleport_duration:2,shadow_strength:0.3f,shadow_radius:0.1f,Invulnerable:1b,PersistenceRequired:1b}

# Top face (positive Y edge) - XZ plane at Y=neg_v+box_v
$summon block_display ~$(neg_h) ~$(neg_v) ~$(neg_h) {Tags:["rituals.totem_barrier","rituals.barrier_new"],block_state:{Name:"minecraft:blue_stained_glass"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,$(box_v)f,0f],scale:[$(box_h)f,0.05f,$(box_h)f]},brightness:{sky:15,block:15},interpolation_duration:5,teleport_duration:2,shadow_strength:0.3f,shadow_radius:0.1f,Invulnerable:1b,PersistenceRequired:1b}

# Link all new barriers to this totem's ID
execute as @e[type=block_display,tag=rituals.barrier_new,distance=..50] run scoreboard players operation @s rituals.id = #barrier_id rituals.temp

# Apply anti-culling effects to all new barriers
execute as @e[type=block_display,tag=rituals.barrier_new,distance=..50] run data merge entity @s {Invulnerable:1b,PersistenceRequired:1b}

# Remove new tag
tag @e[type=block_display,tag=rituals.barrier_new] remove rituals.barrier_new

