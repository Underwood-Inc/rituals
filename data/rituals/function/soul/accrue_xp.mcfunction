# ========================================
# Accrue Passive Soul XP
# ========================================
# Runs as player with a soul weapon in their hotbar.
# Awards XP based on time alive — the soul grows through
# observation and existence, not just deeds.
#
# Offhand items act as catalysts that modify the growth rate.
# Rate values are percentages on rituals.config scoreboard.
#
# Called from soul/tick.mcfunction when the soul timer fires.
# Minecraft 1.21.11

# === BASE XP RATE (from config storage) ===
execute store result score #xp_gain rituals.soul_temp run data get storage rituals:config soul_xp_base_rate

# === OFFHAND CATALYST CHECK ===
# Default rate: 100% (no modifier). If an offhand item matches a
# configured catalyst, its rate percentage overrides the default.
scoreboard players set #xp_rate rituals.soul_temp 100

# Soul-themed
execute if items entity @s weapon.offhand minecraft:soul_sand run scoreboard players operation #xp_rate rituals.soul_temp = #offhand_soul_sand rituals.config
execute if items entity @s weapon.offhand minecraft:soul_soil run scoreboard players operation #xp_rate rituals.soul_temp = #offhand_soul_soil rituals.config

# Mystical
execute if items entity @s weapon.offhand minecraft:amethyst_shard run scoreboard players operation #xp_rate rituals.soul_temp = #offhand_amethyst_shard rituals.config
execute if items entity @s weapon.offhand minecraft:ender_pearl run scoreboard players operation #xp_rate rituals.soul_temp = #offhand_ender_pearl rituals.config
execute if items entity @s weapon.offhand minecraft:ender_eye run scoreboard players operation #xp_rate rituals.soul_temp = #offhand_ender_eye rituals.config

# High-value catalysts
execute if items entity @s weapon.offhand minecraft:experience_bottle run scoreboard players operation #xp_rate rituals.soul_temp = #offhand_experience_bottle rituals.config
execute if items entity @s weapon.offhand minecraft:nether_star run scoreboard players operation #xp_rate rituals.soul_temp = #offhand_nether_star rituals.config

# === APPLY RATE MODIFIER ===
# XP = base_rate * rate_percentage / 100
scoreboard players operation #xp_gain rituals.soul_temp *= #xp_rate rituals.soul_temp
scoreboard players operation #xp_gain rituals.soul_temp /= #100 rituals.data

# === AWARD XP (reuses existing notification/sync/leveling logic) ===
execute if score #xp_gain rituals.soul_temp matches 1.. run function rituals:soul/award_xp
