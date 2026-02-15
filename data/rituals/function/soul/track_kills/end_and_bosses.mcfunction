# ========================================
# Track End Mobs & Bosses - Config-Driven XP
# ========================================
# Each mob's kill count is multiplied by its XP value from rituals.config
# Config values set in config/soul_xp/kill_values.mcfunction
# Called from soul/track_kills.mcfunction

# === End Mobs ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_endermite
scoreboard players operation #bxp rituals.soul_temp *= #kxp_endermite rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_shulker
scoreboard players operation #bxp rituals.soul_temp *= #kxp_shulker rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === Deep Dark ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_warden
scoreboard players operation #bxp rituals.soul_temp *= #kxp_warden rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === Bosses ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_wither
scoreboard players operation #bxp rituals.soul_temp *= #kxp_wither rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_ender_dragon
scoreboard players operation #bxp rituals.soul_temp *= #kxp_ender_dragon rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
