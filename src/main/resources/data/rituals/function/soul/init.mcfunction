# ========================================
# Soul Embodiment - Initialization
# ========================================
# Sets up scoreboards and storage for the soul weapon system
# Called from load.mcfunction

# === SCOREBOARDS ===
# Player-based tracking
scoreboard objectives add rituals.soul_holder dummy "Soul Holder"
scoreboard objectives add rituals.soul_xp_gain dummy "Soul XP Pending"
scoreboard objectives add rituals.soul_durability dummy "Soul Tool Durability"
scoreboard objectives add rituals.soul_action dummy "Soul Action Type"
scoreboard objectives add rituals.combat_timer dummy "Bloodthirst Combat Timer"
scoreboard objectives add rituals.repair_cd dummy "Soul Mending Cooldown"
scoreboard objectives add rituals.prev_damage dummy "Fragile Damage Tracker"

# Statistics tracking (using vanilla stats)
# Mob kills - track total mobs killed
scoreboard objectives add rituals.mob_kills minecraft.custom:minecraft.mob_kills "Mobs Killed"
# Damage dealt for combat XP  
scoreboard objectives add rituals.damage_dealt minecraft.custom:minecraft.damage_dealt "Damage Dealt"

# === BLOCK SCOREBOARDS ===
# Full block tracking for all tool types (Minecraft 1.21.11)
# Loaded from separate files for organization
function rituals:soul/scoreboards/load

# Combined tracking scoreboards (per tool type)
scoreboard objectives add rituals.pickaxe_mined dummy
scoreboard objectives add rituals.shovel_mined dummy
scoreboard objectives add rituals.axe_mined dummy
scoreboard objectives add rituals.hoe_mined dummy
scoreboard objectives add rituals.sword_kills dummy
scoreboard objectives add rituals.ranged_kills dummy
scoreboard objectives add rituals.axe_kills dummy

# Previous values for delta calculation (unified tracking)
scoreboard objectives add rituals.prev_blocks dummy "Prev Blocks Mined"
scoreboard objectives add rituals.prev_kills dummy "Prev Kills"

# Notification cooldown (prevents chat spam)
scoreboard objectives add rituals.soul_notify_cd dummy "Soul Notify Cooldown"

# Scrying glass use cooldown
scoreboard objectives add rituals.scrying_cd dummy "Scrying Cooldown"

# Scrying glass usage detection (via statistic)
scoreboard objectives add rituals.spyglass_used minecraft.used:minecraft.spyglass "Spyglass Used"
scoreboard objectives add rituals.spyglass_prev dummy "Prev Spyglass Use"

# Scrying glass charge-up counter (60 ticks = 3 seconds to sync)
scoreboard objectives add rituals.scrying_charge dummy "Scrying Charge"

# Soul speak cooldown (3-60 minutes between comments)
scoreboard objectives add rituals.soul_speak_cd dummy "Soul Speak Cooldown"

# Temporary calculation scoreboards
scoreboard objectives add rituals.soul_temp dummy "Soul Temp"
scoreboard objectives add rituals.soul_level dummy "Soul Level Cache"
scoreboard objectives add rituals.soul_tier dummy "Soul Tier Cache"
scoreboard objectives add rituals.soul_cap dummy "Soul Level Cap"
scoreboard objectives add rituals.soul_roll dummy "Soul Bonus Roll"

# === STORAGE INITIALIZATION ===
# Level thresholds (XP required to reach each level)
# Formula: base_xp × (level ^ 1.5) + (level × 50)
data modify storage rituals:soul level_thresholds set value [0, 150, 333, 546, 782, 1039, 1315, 1608, 1916, 2239, 2575, 2924, 3285, 3658, 4041, 4435, 4839, 5252, 5674, 6105, 6545, 6993, 7449, 7913, 8384, 8862, 9348, 9840, 10339, 10845, 11357, 11875, 12399, 12930, 13466, 14008, 14556, 15109, 15668, 16232, 16801, 17376, 17955, 18540, 19129, 19723, 20322, 20926, 21534, 22147, 22764, 23386, 24012, 24643, 25278, 25917, 26560, 27208, 27859, 28515, 29174, 29838, 30505, 31177, 31852, 32531, 33214, 33900, 34590, 35284, 35981, 36682, 37387, 38095, 38807, 39522, 40241, 40963, 41689, 42418, 43150, 43886, 44625, 45368, 46113, 46862, 47615, 48370, 49129, 49891, 50656, 51424, 52196, 52970, 53748, 54529, 55313, 56100, 56890, 57683]

# Tier caps (level cap per ascension tier)
data modify storage rituals:soul tier_caps set value [15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]

# Soul names pool (loaded from config, these are fallbacks)
data modify storage rituals:soul fallback_names set value ["Soulbound", "Spiritforged", "Essencekeeper", "Voidtouched", "Awakened", "Sentient", "Living", "Conscious", "Eternal", "Bonded"]

# Ascension bonus chance (50 = 50%)
data modify storage rituals:soul bonus_chance set value 50

# XP multipliers per action
data modify storage rituals:soul xp_values set value {block_mined: 1, ore_mined: 5, damage_dealt: 1, mob_killed: 10, boss_killed: 100}

# Initialize name index counter
scoreboard players set #soul_name_index rituals.data 0

# Constants for calculations (XP multipliers)
scoreboard players set #2 rituals.data 2
scoreboard players set #3 rituals.data 3
scoreboard players set #4 rituals.data 4
scoreboard players set #5 rituals.data 5
scoreboard players set #10 rituals.data 10
scoreboard players set #12 rituals.data 12
scoreboard players set #15 rituals.data 15
scoreboard players set #20 rituals.data 20
scoreboard players set #25 rituals.data 25
scoreboard players set #50 rituals.data 50
scoreboard players set #100 rituals.data 100

# Initialize buff/debuff registry
function rituals:soul/buffs/init

# Confirmation
tellraw @a[tag=rituals.debug] [{"text":"[Rituals] ","color":"gold"},{"text":"Soul Embodiment system initialized!","color":"green"}]

