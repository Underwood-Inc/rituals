# ========================================
# OFFHAND RATE MODIFIERS - Soul XP Catalysts
# ========================================
# Holding certain items in the offhand attunes the soul's awareness,
# accelerating its passive XP growth.
#
# Values are PERCENTAGES: 100 = normal (1.0x), 150 = 1.5x, 200 = 2.0x
# Format: #offhand_<item_id> rituals.config <percentage>
#
# When the Java mod is present, SoulXpTracker pushes TOML config
# values to these SAME scoreboard constants, overriding defaults.
#
# Called from config/soul_xp/load.mcfunction on /reload
# Minecraft 1.21.11

# === SOUL-THEMED ITEMS ===
scoreboard players set #offhand_soul_sand rituals.config 150
scoreboard players set #offhand_soul_soil rituals.config 150

# === MYSTICAL ITEMS ===
scoreboard players set #offhand_amethyst_shard rituals.config 175
scoreboard players set #offhand_ender_pearl rituals.config 200
scoreboard players set #offhand_ender_eye rituals.config 225

# === HIGH-VALUE CATALYSTS ===
scoreboard players set #offhand_experience_bottle rituals.config 250
scoreboard players set #offhand_nether_star rituals.config 500
