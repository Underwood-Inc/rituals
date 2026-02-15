# ========================================
# Track Common Kills - Config-Driven XP
# ========================================
# Each mob's kill count is multiplied by its XP value from rituals.config
# Config values set in config/soul_xp/kill_values.mcfunction
# Called from soul/track_kills.mcfunction

# === General Overworld Hostiles ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_zombie
scoreboard players operation #bxp rituals.soul_temp *= #kxp_zombie rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_skeleton
scoreboard players operation #bxp rituals.soul_temp *= #kxp_skeleton rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_spider
scoreboard players operation #bxp rituals.soul_temp *= #kxp_spider rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_creeper
scoreboard players operation #bxp rituals.soul_temp *= #kxp_creeper rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_enderman
scoreboard players operation #bxp rituals.soul_temp *= #kxp_enderman rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_witch
scoreboard players operation #bxp rituals.soul_temp *= #kxp_witch rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_slime
scoreboard players operation #bxp rituals.soul_temp *= #kxp_slime rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_phantom
scoreboard players operation #bxp rituals.soul_temp *= #kxp_phantom rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_drowned
scoreboard players operation #bxp rituals.soul_temp *= #kxp_drowned rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_husk
scoreboard players operation #bxp rituals.soul_temp *= #kxp_husk rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_stray
scoreboard players operation #bxp rituals.soul_temp *= #kxp_stray rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_cave_spider
scoreboard players operation #bxp rituals.soul_temp *= #kxp_cave_spider rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_silverfish
scoreboard players operation #bxp rituals.soul_temp *= #kxp_silverfish rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_zombie_villager
scoreboard players operation #bxp rituals.soul_temp *= #kxp_zombie_villager rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === Illagers ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_pillager
scoreboard players operation #bxp rituals.soul_temp *= #kxp_pillager rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_vindicator
scoreboard players operation #bxp rituals.soul_temp *= #kxp_vindicator rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_evoker
scoreboard players operation #bxp rituals.soul_temp *= #kxp_evoker rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_ravager
scoreboard players operation #bxp rituals.soul_temp *= #kxp_ravager rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_vex
scoreboard players operation #bxp rituals.soul_temp *= #kxp_vex rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_illusioner
scoreboard players operation #bxp rituals.soul_temp *= #kxp_illusioner rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === Guardians ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_guardian
scoreboard players operation #bxp rituals.soul_temp *= #kxp_guardian rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_elder_guardian
scoreboard players operation #bxp rituals.soul_temp *= #kxp_elder_guardian rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === Trial Chamber ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_breeze
scoreboard players operation #bxp rituals.soul_temp *= #kxp_breeze rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_bogged
scoreboard players operation #bxp rituals.soul_temp *= #kxp_bogged rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp

# === Pale Garden ===
scoreboard players operation #bxp rituals.soul_temp = @s rituals.k_creaking
scoreboard players operation #bxp rituals.soul_temp *= #kxp_creaking rituals.config
scoreboard players operation #total rituals.soul_temp += #bxp rituals.soul_temp
