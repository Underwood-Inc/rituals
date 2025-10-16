# ========================================
# Prosperity Ritual Effect
# ========================================
# Attracts items and grants Luck effect to players

# Get tier-based range settings
function rituals:ritual/get_tier_settings

# Get prosperity-specific frequency
function rituals:ritual/get_prosperity_settings

# Check timing using separate effect counter
scoreboard players add @s rituals.data 1

# DEBUG: Show timer and frequency every 5 seconds (100 ticks) - only if debug enabled
execute if entity @s[tag=rituals.debug] run scoreboard players operation #timer_mod rituals.temp = @s rituals.data
execute if entity @s[tag=rituals.debug] run scoreboard players operation #timer_mod rituals.temp %= #100 rituals.data
execute if entity @s[tag=rituals.debug] if score #timer_mod rituals.temp matches 0 run tellraw @a[distance=..10] [{"text":"[DEBUG PROSPERITY] Timer: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.data"},"color":"yellow"},{"text":" / ","color":"gray"},{"score":{"name":"#current_freq","objective":"rituals.temp"},"color":"yellow"},{"text":" | Range: ","color":"gray"},{"score":{"name":"#current_h_range","objective":"rituals.temp"},"color":"gold"},{"text":"x","color":"gray"},{"score":{"name":"#current_v_range","objective":"rituals.temp"},"color":"gold"}]

execute unless score @s rituals.data >= #current_freq rituals.temp run return 0
scoreboard players set @s rituals.data 0

# Apply effects in tier-based range
function rituals:ritual/apply_in_tier_range

# Apply prosperity effects based on tier with dynamic range
function rituals:ritual/effects/prosperity_apply with storage rituals:temp

# Ambient particles
particle dust{color:[1.0,0.8,0.0],scale:1.0} ~ ~1 ~ 2 1 2 0.1 5

