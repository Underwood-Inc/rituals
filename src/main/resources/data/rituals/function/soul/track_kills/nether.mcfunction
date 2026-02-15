# ========================================
# Track Nether Kills - Config-Driven XP
# ========================================
# Each mob's kill count is multiplied by its XP value from rituals.config
# Config values set in config/soul_xp/kill_values.mcfunction
# Called from soul/track_kills.mcfunction

# === Nether Mobs ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_blaze
scoreboard players operation #bxp rituals.soul_temp *= #kxp_blaze rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_ghast
scoreboard players operation #bxp rituals.soul_temp *= #kxp_ghast rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_magma_cube
scoreboard players operation #bxp rituals.soul_temp *= #kxp_magma_cube rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_piglin
scoreboard players operation #bxp rituals.soul_temp *= #kxp_piglin rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_piglin_brute
scoreboard players operation #bxp rituals.soul_temp *= #kxp_piglin_brute rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_zombified_piglin
scoreboard players operation #bxp rituals.soul_temp *= #kxp_zombified_piglin rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_hoglin
scoreboard players operation #bxp rituals.soul_temp *= #kxp_hoglin rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_zoglin
scoreboard players operation #bxp rituals.soul_temp *= #kxp_zoglin rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_wither_skeleton
scoreboard players operation #bxp rituals.soul_temp *= #kxp_wither_skeleton rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_strider
scoreboard players operation #bxp rituals.soul_temp *= #kxp_strider rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
