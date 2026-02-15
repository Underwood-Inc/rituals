# ========================================
# SOUL XP CONFIG LOADER
# ========================================
# Loads all XP configuration values for soul weapons.
# These are the ENUMERATED LISTS -- every block and mob that
# grants XP is defined here with its XP value as a scoreboard
# constant on rituals.config.
#
# When the Java mod is present, SoulXpTracker pushes TOML config
# values to these SAME scoreboard constants, overriding defaults.
# The tracking method is IDENTICAL either way.
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

# === LOAD BLOCK XP VALUES (enumerated scoreboard constants) ===
function rituals:config/soul_xp/pickaxe_blocks
function rituals:config/soul_xp/shovel_blocks
function rituals:config/soul_xp/axe_blocks
function rituals:config/soul_xp/hoe_blocks

# === LOAD KILL XP VALUES (enumerated scoreboard constants) ===
function rituals:config/soul_xp/kill_values
