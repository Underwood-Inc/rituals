# ========================================
# Track Passive Mob Kills - Config-Driven XP
# ========================================
# Each mob's kill count is multiplied by its XP value from rituals.config
# Config values set in config/soul_xp/kill_values.mcfunction
# Called from soul/track_kills.mcfunction
# Low XP for passive mobs (they don't fight back, you monster)

# === Passive Mobs ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_pig
scoreboard players operation #bxp rituals.soul_temp *= #kxp_pig rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_cow
scoreboard players operation #bxp rituals.soul_temp *= #kxp_cow rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_sheep
scoreboard players operation #bxp rituals.soul_temp *= #kxp_sheep rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_chicken
scoreboard players operation #bxp rituals.soul_temp *= #kxp_chicken rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_rabbit
scoreboard players operation #bxp rituals.soul_temp *= #kxp_rabbit rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_wolf
scoreboard players operation #bxp rituals.soul_temp *= #kxp_wolf rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_fox
scoreboard players operation #bxp rituals.soul_temp *= #kxp_fox rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_bee
scoreboard players operation #bxp rituals.soul_temp *= #kxp_bee rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_goat
scoreboard players operation #bxp rituals.soul_temp *= #kxp_goat rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_frog
scoreboard players operation #bxp rituals.soul_temp *= #kxp_frog rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_camel
scoreboard players operation #bxp rituals.soul_temp *= #kxp_camel rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_sniffer
scoreboard players operation #bxp rituals.soul_temp *= #kxp_sniffer rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_armadillo
scoreboard players operation #bxp rituals.soul_temp *= #kxp_armadillo rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
