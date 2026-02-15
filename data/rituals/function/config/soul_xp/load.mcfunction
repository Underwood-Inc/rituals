# ========================================
# SOUL XP CONFIG LOADER
# ========================================
# Loads configuration for the time-based passive soul XP system.
# The soul gains XP through observation and existence — simply
# having a soul weapon in the hotbar lets the soul grow.
#
# Offhand items act as catalysts that modify the growth rate.
#
# Default rate preset: HARD (600 ticks = 30 seconds per cycle).
# When the Java mod is present, SoulXpTracker pushes TOML config
# values to these SAME storage/scoreboard keys, overriding defaults.
#
# Called from config/load.mcfunction on /reload
# Minecraft 1.21.11

# === CREATE CONFIG SCOREBOARD ===
scoreboard objectives add rituals.config dummy

# === LEVEL CURVE ===
# Formula: XP_needed = (level * base) + (level^2 * scaling)
data modify storage rituals:config soul_level_base set value 100
data modify storage rituals:config soul_level_scaling set value 25

# === NOTIFICATION COOLDOWN ===
data modify storage rituals:config soul_notify_cooldown set value 40

# === PASSIVE XP SETTINGS ===
# Base XP gained per award cycle (soul grows through observation)
data modify storage rituals:config soul_xp_base_rate set value 1
# Ticks between XP awards — default: 600 (30 seconds, HARD preset)
# Presets: EASY=200 (10s), MEDIUM=400 (20s), HARD=600 (30s)
data modify storage rituals:config soul_xp_interval set value 600

# === LOAD OFFHAND RATE MODIFIERS (scoreboard constants) ===
function rituals:config/soul_xp/offhand_rates

# ========================================
# SMART TIME DISPLAY
# ========================================
# Convert interval ticks to human-readable time for operator convenience.
# Shows on every /reload so operators know the active XP timing.
execute store result score #xp_seconds rituals.soul_temp run data get storage rituals:config soul_xp_interval
scoreboard players operation #xp_seconds rituals.soul_temp /= #20 rituals.data
scoreboard players operation #xp_minutes rituals.soul_temp = #xp_seconds rituals.soul_temp
scoreboard players operation #xp_minutes rituals.soul_temp /= #60 rituals.data
scoreboard players operation #xp_rem_sec rituals.soul_temp = #xp_seconds rituals.soul_temp
scoreboard players operation #xp_rem_sec rituals.soul_temp %= #60 rituals.data

# Display: "Xm Ys" if >= 60s, otherwise "Xs"
execute if score #xp_seconds rituals.soul_temp matches 60.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"Soul XP: 1 cycle every ","color":"aqua"},{"score":{"name":"#xp_minutes","objective":"rituals.soul_temp"},"color":"white","bold":true},{"text":"m ","color":"aqua"},{"score":{"name":"#xp_rem_sec","objective":"rituals.soul_temp"},"color":"white","bold":true},{"text":"s","color":"aqua"}]
execute unless score #xp_seconds rituals.soul_temp matches 60.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"Soul XP: 1 cycle every ","color":"aqua"},{"score":{"name":"#xp_seconds","objective":"rituals.soul_temp"},"color":"white","bold":true},{"text":"s","color":"aqua"}]

# ========================================
# CONFIG VERIFICATION DIAGNOSTICS
# ========================================
# Verify critical config values loaded correctly.
scoreboard players set #cfg_ok rituals.soul_temp 0

# --- Base rate check (should be 1+) ---
execute store result score #cfg_test rituals.soul_temp run data get storage rituals:config soul_xp_base_rate
execute if score #cfg_test rituals.soul_temp matches 1.. run scoreboard players add #cfg_ok rituals.soul_temp 1
execute unless score #cfg_test rituals.soul_temp matches 1.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"ERROR: ","color":"red"},{"text":"soul_xp_base_rate is 0 or missing","color":"yellow"}]

# --- Interval check (should be 1+) ---
execute store result score #cfg_test rituals.soul_temp run data get storage rituals:config soul_xp_interval
execute if score #cfg_test rituals.soul_temp matches 1.. run scoreboard players add #cfg_ok rituals.soul_temp 1
execute unless score #cfg_test rituals.soul_temp matches 1.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"ERROR: ","color":"red"},{"text":"soul_xp_interval is 0 or missing","color":"yellow"}]

# --- Offhand rate check (#offhand_soul_sand should be 150) ---
execute store result score #cfg_test rituals.soul_temp run scoreboard players get #offhand_soul_sand rituals.config
execute if score #cfg_test rituals.soul_temp matches 1.. run scoreboard players add #cfg_ok rituals.soul_temp 1
execute unless score #cfg_test rituals.soul_temp matches 1.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"ERROR: ","color":"red"},{"text":"Offhand rates FAILED to load (#offhand_soul_sand = 0)","color":"yellow"}]

# --- Summary ---
execute if score #cfg_ok rituals.soul_temp matches 3 run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"Soul XP config loaded OK (3/3 checks passed)","color":"green"}]
execute unless score #cfg_ok rituals.soul_temp matches 3 run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"Soul XP config INCOMPLETE - see errors above","color":"red"}]
