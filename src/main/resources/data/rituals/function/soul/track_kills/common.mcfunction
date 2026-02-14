# ========================================
# Track Common Overworld Kills - Weighted Tier XP
# ========================================
# Adds weighted kill counts to #total rituals.soul_temp
# Called from soul/track_kills.mcfunction

# === TIER 2 (2 XP - weaklings) ===
scoreboard players set #k2 rituals.soul_temp 0
scoreboard players operation #k2 rituals.soul_temp += @s rituals.k_silverfish
scoreboard players operation #k2 rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #k2 rituals.soul_temp

# === TIER 3 (3 XP - nuisance mobs) ===
scoreboard players set #k3 rituals.soul_temp 0
scoreboard players operation #k3 rituals.soul_temp += @s rituals.k_slime
scoreboard players operation #k3 rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #k3 rituals.soul_temp

# === TIER 5 (5 XP - standard hostiles) ===
scoreboard players set #k5 rituals.soul_temp 0
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_zombie
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_skeleton
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_spider
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_cave_spider
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_drowned
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_husk
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_stray
scoreboard players operation #k5 rituals.soul_temp += @s rituals.k_zombie_villager
scoreboard players operation #k5 rituals.soul_temp *= #5 rituals.data
scoreboard players operation #total rituals.soul_temp += #k5 rituals.soul_temp

# === TIER 8 (8 XP - stronger overworld) ===
scoreboard players set #k8 rituals.soul_temp 0
scoreboard players operation #k8 rituals.soul_temp += @s rituals.k_creeper
scoreboard players operation #k8 rituals.soul_temp += @s rituals.k_witch
scoreboard players operation #k8 rituals.soul_temp += @s rituals.k_phantom
scoreboard players operation #k8 rituals.soul_temp += @s rituals.k_pillager
scoreboard players operation #k8 rituals.soul_temp += @s rituals.k_bogged
# Multiply by 8 = multiply by 4 then by 2
scoreboard players operation #k8 rituals.soul_temp *= #4 rituals.data
scoreboard players operation #k8 rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #k8 rituals.soul_temp

# === TIER 10 (10 XP - elite overworld) ===
scoreboard players set #k10 rituals.soul_temp 0
scoreboard players operation #k10 rituals.soul_temp += @s rituals.k_enderman
scoreboard players operation #k10 rituals.soul_temp += @s rituals.k_vindicator
scoreboard players operation #k10 rituals.soul_temp += @s rituals.k_breeze
scoreboard players operation #k10 rituals.soul_temp += @s rituals.k_guardian
scoreboard players operation #k10 rituals.soul_temp += @s rituals.k_creaking
scoreboard players operation #k10 rituals.soul_temp *= #10 rituals.data
scoreboard players operation #total rituals.soul_temp += #k10 rituals.soul_temp

# === TIER 15 (15 XP - rare/dangerous overworld) ===
scoreboard players set #k15 rituals.soul_temp 0
scoreboard players operation #k15 rituals.soul_temp += @s rituals.k_evoker
scoreboard players operation #k15 rituals.soul_temp += @s rituals.k_illusioner
scoreboard players operation #k15 rituals.soul_temp *= #15 rituals.data
scoreboard players operation #total rituals.soul_temp += #k15 rituals.soul_temp

# === TIER 20 (20 XP - ravager) ===
scoreboard players set #k20 rituals.soul_temp 0
scoreboard players operation #k20 rituals.soul_temp += @s rituals.k_ravager
scoreboard players operation #k20 rituals.soul_temp *= #20 rituals.data
scoreboard players operation #total rituals.soul_temp += #k20 rituals.soul_temp

# === TIER 25 (25 XP - elder guardian) ===
scoreboard players set #k25 rituals.soul_temp 0
scoreboard players operation #k25 rituals.soul_temp += @s rituals.k_elder_guardian
scoreboard players operation #k25 rituals.soul_temp *= #25 rituals.data
scoreboard players operation #total rituals.soul_temp += #k25 rituals.soul_temp

# === TIER 5 (5 XP - vex, special case in illager group) ===
scoreboard players set #kv rituals.soul_temp 0
scoreboard players operation #kv rituals.soul_temp += @s rituals.k_vex
scoreboard players operation #kv rituals.soul_temp *= #5 rituals.data
scoreboard players operation #total rituals.soul_temp += #kv rituals.soul_temp
