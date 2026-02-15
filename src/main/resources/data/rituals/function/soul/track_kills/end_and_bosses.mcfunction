# ========================================
# Track End Mobs & Bosses - Weighted Tier XP
# ========================================
# Adds weighted end/boss kill counts to #total rituals.soul_temp
# Called from soul/track_kills.mcfunction

# === END MOBS ===
# Tier 5 (5 XP - endermite)
scoreboard players set #ke5 rituals.soul_temp 0
scoreboard players operation #ke5 rituals.soul_temp += @s rituals.k_endermite
scoreboard players operation #ke5 rituals.soul_temp *= #5 rituals.data
scoreboard players operation #total rituals.soul_temp += #ke5 rituals.soul_temp

# Tier 15 (15 XP - shulker)
scoreboard players set #ke15 rituals.soul_temp 0
scoreboard players operation #ke15 rituals.soul_temp += @s rituals.k_shulker
scoreboard players operation #ke15 rituals.soul_temp *= #15 rituals.data
scoreboard players operation #total rituals.soul_temp += #ke15 rituals.soul_temp

# === DEEP DARK ===
# Tier 50 (50 XP - warden)
scoreboard players set #kw rituals.soul_temp 0
scoreboard players operation #kw rituals.soul_temp += @s rituals.k_warden
scoreboard players operation #kw rituals.soul_temp *= #50 rituals.data
scoreboard players operation #total rituals.soul_temp += #kw rituals.soul_temp

# === BOSSES ===
# Wither (200 XP) - multiply 20 * 10
scoreboard players set #kb1 rituals.soul_temp 0
scoreboard players operation #kb1 rituals.soul_temp += @s rituals.k_wither
scoreboard players operation #kb1 rituals.soul_temp *= #20 rituals.data
scoreboard players operation #kb1 rituals.soul_temp *= #10 rituals.data
scoreboard players operation #total rituals.soul_temp += #kb1 rituals.soul_temp

# Ender Dragon (500 XP) - multiply 50 * 10
scoreboard players set #kb2 rituals.soul_temp 0
scoreboard players operation #kb2 rituals.soul_temp += @s rituals.k_ender_dragon
scoreboard players operation #kb2 rituals.soul_temp *= #50 rituals.data
scoreboard players operation #kb2 rituals.soul_temp *= #10 rituals.data
scoreboard players operation #total rituals.soul_temp += #kb2 rituals.soul_temp
