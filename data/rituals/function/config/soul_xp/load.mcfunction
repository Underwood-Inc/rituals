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

# ========================================
# CONFIG VERIFICATION DIAGNOSTICS
# ========================================
# Check one representative value from each category.
# If any reads 0, that category's config file failed to load.
scoreboard players set #cfg_ok rituals.soul_temp 0

# --- Pickaxe check (#xp_stone should be 1) ---
execute store result score #cfg_test rituals.soul_temp run scoreboard players get #xp_stone rituals.config
execute if score #cfg_test rituals.soul_temp matches 1.. run scoreboard players add #cfg_ok rituals.soul_temp 1
execute unless score #cfg_test rituals.soul_temp matches 1.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"ERROR: ","color":"red"},{"text":"Pickaxe block config FAILED to load (#xp_stone = 0)","color":"yellow"}]

# --- Shovel check (#xp_dirt should be 1) ---
execute store result score #cfg_test rituals.soul_temp run scoreboard players get #xp_dirt rituals.config
execute if score #cfg_test rituals.soul_temp matches 1.. run scoreboard players add #cfg_ok rituals.soul_temp 1
execute unless score #cfg_test rituals.soul_temp matches 1.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"ERROR: ","color":"red"},{"text":"Shovel block config FAILED to load (#xp_dirt = 0)","color":"yellow"}]

# --- Axe check (#xp_oak_log should be 2) ---
execute store result score #cfg_test rituals.soul_temp run scoreboard players get #xp_oak_log rituals.config
execute if score #cfg_test rituals.soul_temp matches 1.. run scoreboard players add #cfg_ok rituals.soul_temp 1
execute unless score #cfg_test rituals.soul_temp matches 1.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"ERROR: ","color":"red"},{"text":"Axe block config FAILED to load (#xp_oak_log = 0)","color":"yellow"}]

# --- Hoe check (#xp_oak_leaves should be 1) ---
execute store result score #cfg_test rituals.soul_temp run scoreboard players get #xp_oak_leaves rituals.config
execute if score #cfg_test rituals.soul_temp matches 1.. run scoreboard players add #cfg_ok rituals.soul_temp 1
execute unless score #cfg_test rituals.soul_temp matches 1.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"ERROR: ","color":"red"},{"text":"Hoe block config FAILED to load (#xp_oak_leaves = 0)","color":"yellow"}]

# --- Kill check (#kxp_zombie should be 5) ---
execute store result score #cfg_test rituals.soul_temp run scoreboard players get #kxp_zombie rituals.config
execute if score #cfg_test rituals.soul_temp matches 1.. run scoreboard players add #cfg_ok rituals.soul_temp 1
execute unless score #cfg_test rituals.soul_temp matches 1.. run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"ERROR: ","color":"red"},{"text":"Kill XP config FAILED to load (#kxp_zombie = 0)","color":"yellow"}]

# --- Summary ---
execute if score #cfg_ok rituals.soul_temp matches 5 run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"Soul XP config loaded OK (5/5 categories)","color":"green"}]
execute unless score #cfg_ok rituals.soul_temp matches 5 run tellraw @a [{"text":"[Rituals] ","color":"gold"},{"text":"Soul XP config INCOMPLETE - see errors above","color":"red"}]
