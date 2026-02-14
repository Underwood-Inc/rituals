# ========================================
# Track Passive Mob Kills - Weighted Tier XP
# ========================================
# Adds weighted passive mob kill counts to #total rituals.soul_temp
# Called from soul/track_kills.mcfunction
# Low XP for passive mobs (they don't fight back, you monster)

# === TIER 1 (1 XP - standard passive) ===
scoreboard players operation #total rituals.soul_temp += @s rituals.k_pig
scoreboard players operation #total rituals.soul_temp += @s rituals.k_cow
scoreboard players operation #total rituals.soul_temp += @s rituals.k_sheep
scoreboard players operation #total rituals.soul_temp += @s rituals.k_chicken
scoreboard players operation #total rituals.soul_temp += @s rituals.k_rabbit
scoreboard players operation #total rituals.soul_temp += @s rituals.k_frog
scoreboard players operation #total rituals.soul_temp += @s rituals.k_armadillo

# === TIER 2 (2 XP - slightly more interesting) ===
scoreboard players set #kp2 rituals.soul_temp 0
scoreboard players operation #kp2 rituals.soul_temp += @s rituals.k_fox
scoreboard players operation #kp2 rituals.soul_temp += @s rituals.k_bee
scoreboard players operation #kp2 rituals.soul_temp += @s rituals.k_goat
scoreboard players operation #kp2 rituals.soul_temp += @s rituals.k_camel
scoreboard players operation #kp2 rituals.soul_temp += @s rituals.k_sniffer
scoreboard players operation #kp2 rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #kp2 rituals.soul_temp

# === TIER 3 (3 XP - wolf, because it fights back) ===
scoreboard players set #kp3 rituals.soul_temp 0
scoreboard players operation #kp3 rituals.soul_temp += @s rituals.k_wolf
scoreboard players operation #kp3 rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #kp3 rituals.soul_temp
