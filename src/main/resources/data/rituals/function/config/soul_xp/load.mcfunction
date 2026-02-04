# ========================================
# SOUL XP CONFIG LOADER
# ========================================
# Loads all block-to-XP mappings for soul weapons
# Called from config/load.mcfunction on /reload
# Minecraft 1.21.11 (Mounts of Mayhem)

# === COMBAT XP ===
data modify storage rituals:config soul_xp_melee_kill set value 5
data modify storage rituals:config soul_xp_ranged_kill set value 10
data modify storage rituals:config soul_xp_boss_kill set value 50

# === LEVEL CURVE ===
# Formula: XP_needed = (level × base) + (level² × scaling)
data modify storage rituals:config soul_level_base set value 100
data modify storage rituals:config soul_level_scaling set value 25

# === NOTIFICATION COOLDOWN ===
data modify storage rituals:config soul_notify_cooldown set value 40

# === LOAD BLOCK MAPPINGS ===
function rituals:config/soul_xp/pickaxe_blocks
function rituals:config/soul_xp/shovel_blocks
function rituals:config/soul_xp/axe_blocks
function rituals:config/soul_xp/hoe_blocks



