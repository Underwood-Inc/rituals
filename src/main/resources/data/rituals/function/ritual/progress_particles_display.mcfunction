# ========================================
# Display Progress Particles (Macro Function)
# ========================================
# Uses dynamic height based on progress

# Glittering particles that change based on ritual type and progress
# Growth - Green sparkles
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 1 if score #particle_count rituals.temp matches 1.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 1 if score #particle_count rituals.temp matches 2.. run particle minecraft:composter ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 1 if score #particle_count rituals.temp matches 3.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 1 if score #particle_count rituals.temp matches 4.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 1 if score #particle_count rituals.temp matches 5.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force

# Strength - Red sparkles
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 2 if score #particle_count rituals.temp matches 1.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 2 if score #particle_count rituals.temp matches 2.. run particle minecraft:flame ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 2 if score #particle_count rituals.temp matches 3.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 2 if score #particle_count rituals.temp matches 4.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 2 if score #particle_count rituals.temp matches 5.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force

# Prosperity - Gold sparkles
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 3 if score #particle_count rituals.temp matches 1.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 3 if score #particle_count rituals.temp matches 2.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 3 if score #particle_count rituals.temp matches 3.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 3 if score #particle_count rituals.temp matches 4.. run particle minecraft:end_rod ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 3 if score #particle_count rituals.temp matches 5.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force

# Protection - Blue sparkles
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 4 if score #particle_count rituals.temp matches 1.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 4 if score #particle_count rituals.temp matches 2.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 4 if score #particle_count rituals.temp matches 3.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 4 if score #particle_count rituals.temp matches 4.. run particle minecraft:soul ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 4 if score #particle_count rituals.temp matches 5.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force

# Healing - Pink sparkles
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 5 if score #particle_count rituals.temp matches 1.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 5 if score #particle_count rituals.temp matches 2.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 5 if score #particle_count rituals.temp matches 3.. run particle minecraft:heart ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 5 if score #particle_count rituals.temp matches 4.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 5 if score #particle_count rituals.temp matches 5.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force

# Sentry - Aqua sparkles
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 6 if score #particle_count rituals.temp matches 1.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 6 if score #particle_count rituals.temp matches 2.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 6 if score #particle_count rituals.temp matches 3.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 6 if score #particle_count rituals.temp matches 4.. run particle minecraft:soul_fire_flame ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 6 if score #particle_count rituals.temp matches 5.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force

# Auto-Farming - Yellow sparkles
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 7 if score #particle_count rituals.temp matches 1.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 7 if score #particle_count rituals.temp matches 2.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 7 if score #particle_count rituals.temp matches 3.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 7 if score #particle_count rituals.temp matches 4.. run particle minecraft:happy_villager ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 7 if score #particle_count rituals.temp matches 5.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force

# Auto-Breeding - Heart sparkles
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 11 if score #particle_count rituals.temp matches 1.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 11 if score #particle_count rituals.temp matches 2.. run particle minecraft:heart ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 11 if score #particle_count rituals.temp matches 3.. run particle minecraft:glow ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 11 if score #particle_count rituals.temp matches 4.. run particle minecraft:enchanted_hit ~ ~$(progress_height) ~ 0.15 0.05 0.15 0 1 force
$execute if entity @s[tag=rituals.active_ritual] if score @s rituals.effect matches 11 if score #particle_count rituals.temp matches 5.. run particle minecraft:heart ~ ~$(progress_height) ~ 0.1 0.05 0.1 0 1 force

