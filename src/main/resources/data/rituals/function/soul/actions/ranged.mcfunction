# ========================================
# Ranged Combat Action - Bow/Crossbow/Trident XP
# ========================================
# Uses same mob tracking as melee combat
# Awards XP for all kills (ranged weapons can kill any mob)
# Minecraft 1.21.11

# === SUM ALL KILLS WITH XP VALUES ===
# (Same logic as combat.mcfunction - ranged weapons track same kills)
scoreboard players set #total rituals.soul_temp 0

# === COMMON MOBS (5 XP each) ===
scoreboard players set #common rituals.soul_temp 0
scoreboard players operation #common rituals.soul_temp += @s rituals.k_zombie
scoreboard players operation #common rituals.soul_temp += @s rituals.k_skeleton
scoreboard players operation #common rituals.soul_temp += @s rituals.k_spider
scoreboard players operation #common rituals.soul_temp += @s rituals.k_cave_spider
scoreboard players operation #common rituals.soul_temp += @s rituals.k_drowned
scoreboard players operation #common rituals.soul_temp += @s rituals.k_husk
scoreboard players operation #common rituals.soul_temp += @s rituals.k_stray
scoreboard players operation #common rituals.soul_temp += @s rituals.k_silverfish
scoreboard players operation #common rituals.soul_temp += @s rituals.k_zombie_villager
scoreboard players operation #common rituals.soul_temp += @s rituals.k_slime
scoreboard players operation #common rituals.soul_temp += @s rituals.k_phantom
scoreboard players operation #common rituals.soul_temp += @s rituals.k_bogged
scoreboard players operation #common rituals.soul_temp *= #5 rituals.data
scoreboard players operation #total rituals.soul_temp += #common rituals.soul_temp

# === UNCOMMON MOBS (10 XP each) ===
scoreboard players set #uncommon rituals.soul_temp 0
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_creeper
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_enderman
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_witch
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_piglin
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_zombified_piglin
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_hoglin
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_zoglin
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_endermite
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_magma_cube
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_strider
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_pillager
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_vex
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_breeze
scoreboard players operation #uncommon rituals.soul_temp += @s rituals.k_creaking
scoreboard players operation #uncommon rituals.soul_temp *= #10 rituals.data
scoreboard players operation #total rituals.soul_temp += #uncommon rituals.soul_temp

# === DANGEROUS MOBS (15 XP each) ===
scoreboard players set #dangerous rituals.soul_temp 0
scoreboard players operation #dangerous rituals.soul_temp += @s rituals.k_blaze
scoreboard players operation #dangerous rituals.soul_temp += @s rituals.k_ghast
scoreboard players operation #dangerous rituals.soul_temp += @s rituals.k_wither_skeleton
scoreboard players operation #dangerous rituals.soul_temp += @s rituals.k_piglin_brute
scoreboard players operation #dangerous rituals.soul_temp += @s rituals.k_vindicator
scoreboard players operation #dangerous rituals.soul_temp += @s rituals.k_guardian
scoreboard players operation #dangerous rituals.soul_temp += @s rituals.k_shulker
scoreboard players operation #dangerous rituals.soul_temp *= #15 rituals.data
scoreboard players operation #total rituals.soul_temp += #dangerous rituals.soul_temp

# === ELITE MOBS (25 XP each) ===
scoreboard players set #elite rituals.soul_temp 0
scoreboard players operation #elite rituals.soul_temp += @s rituals.k_evoker
scoreboard players operation #elite rituals.soul_temp += @s rituals.k_illusioner
scoreboard players operation #elite rituals.soul_temp += @s rituals.k_ravager
scoreboard players operation #elite rituals.soul_temp += @s rituals.k_elder_guardian
scoreboard players operation #elite rituals.soul_temp *= #25 rituals.data
scoreboard players operation #total rituals.soul_temp += #elite rituals.soul_temp

# === WARDEN (100 XP) ===
scoreboard players set #warden rituals.soul_temp 0
scoreboard players operation #warden rituals.soul_temp += @s rituals.k_warden
scoreboard players operation #warden rituals.soul_temp *= #100 rituals.data
scoreboard players operation #total rituals.soul_temp += #warden rituals.soul_temp

# === BOSSES (500 XP each) ===
scoreboard players set #boss rituals.soul_temp 0
scoreboard players operation #boss rituals.soul_temp += @s rituals.k_wither
scoreboard players operation #boss rituals.soul_temp += @s rituals.k_ender_dragon
scoreboard players set #500 rituals.data 500
scoreboard players operation #boss rituals.soul_temp *= #500 rituals.data
scoreboard players operation #total rituals.soul_temp += #boss rituals.soul_temp

# === PASSIVE MOBS (2 XP each) ===
scoreboard players set #passive rituals.soul_temp 0
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_pig
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_cow
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_sheep
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_chicken
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_rabbit
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_wolf
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_fox
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_bee
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_goat
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_frog
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_camel
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_sniffer
scoreboard players operation #passive rituals.soul_temp += @s rituals.k_armadillo
scoreboard players operation #passive rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #passive rituals.soul_temp

# === CALCULATE XP DELTA ===
scoreboard players operation @s rituals.ranged_kills = #total rituals.soul_temp
execute unless score @s rituals.prev_ranged_kills matches 0.. run scoreboard players operation @s rituals.prev_ranged_kills = @s rituals.ranged_kills
scoreboard players operation #xp_gain rituals.soul_temp = @s rituals.ranged_kills
scoreboard players operation #xp_gain rituals.soul_temp -= @s rituals.prev_ranged_kills

# === AWARD XP ===
execute if score #xp_gain rituals.soul_temp matches 1.. run function rituals:soul/award_xp
scoreboard players operation @s rituals.prev_ranged_kills = @s rituals.ranged_kills

