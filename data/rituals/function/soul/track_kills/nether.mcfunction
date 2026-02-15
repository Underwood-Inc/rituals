# ========================================
# Track Nether Kills - Weighted Tier XP
# ========================================
# Adds weighted nether mob kill counts to #total rituals.soul_temp
# Called from soul/track_kills.mcfunction

# === TIER 3 (3 XP - strider, weak nether) ===
scoreboard players set #k3 rituals.soul_temp 0
scoreboard players operation #k3 rituals.soul_temp += @s rituals.k_strider
scoreboard players operation #k3 rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #k3 rituals.soul_temp

# === TIER 5 (5 XP - common nether mobs) ===
scoreboard players set #k5 rituals.soul_temp 0
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_magma_cube
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_zombified_piglin
scoreboard players operation #k5 rituals.soul_temp *= #5 rituals.data
scoreboard players operation #total rituals.soul_temp += #k5 rituals.soul_temp

# === TIER 8 (8 XP - piglin) ===
scoreboard players set #k8 rituals.soul_temp 0
scoreboard players operation #k8 rituals.soul_temp += @s rituals.k_piglin
scoreboard players operation #k8 rituals.soul_temp *= #4 rituals.data
scoreboard players operation #k8 rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #k8 rituals.soul_temp

# === TIER 10 (10 XP - standard nether threats) ===
scoreboard players set #k10 rituals.soul_temp 0
scoreboard players operation #k10 rituals.soul_temp += @s rituals.k_blaze
scoreboard players operation #k10 rituals.soul_temp += @s rituals.k_hoglin
scoreboard players operation #k10 rituals.soul_temp += @s rituals.k_zoglin
scoreboard players operation #k10 rituals.soul_temp *= #10 rituals.data
scoreboard players operation #total rituals.soul_temp += #k10 rituals.soul_temp

# === TIER 15 (15 XP - dangerous nether mobs) ===
scoreboard players set #k15 rituals.soul_temp 0
scoreboard players operation #k15 rituals.soul_temp += @s rituals.k_ghast
scoreboard players operation #k15 rituals.soul_temp += @s rituals.k_piglin_brute
scoreboard players operation #k15 rituals.soul_temp += @s rituals.k_wither_skeleton
scoreboard players operation #k15 rituals.soul_temp *= #15 rituals.data
scoreboard players operation #total rituals.soul_temp += #k15 rituals.soul_temp
