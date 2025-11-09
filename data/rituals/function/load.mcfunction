# ========================================
# Rituals Datapack - Load Function
# ========================================
# This function runs once when the datapack is loaded

# Create scoreboards for tracking
scoreboard objectives add rituals.data dummy
scoreboard objectives add rituals.timer dummy
scoreboard objectives add rituals.distance dummy
scoreboard objectives add rituals.tier dummy
scoreboard objectives add rituals.effect dummy
scoreboard objectives add rituals.temp dummy
scoreboard objectives add rituals.id dummy
scoreboard objectives add rituals.use_count minecraft.used:minecraft.warped_fungus_on_a_stick

# Menu system scoreboards
scoreboard objectives add rituals.menu trigger
scoreboard objectives add rituals.menu_state dummy

# Badge system scoreboards (text-based tracking only)
scoreboard objectives add rituals.badge_tier dummy
scoreboard objectives add rituals.ritual_count dummy
scoreboard objectives add rituals.join_detect minecraft.custom:minecraft.leave_game

# Ritual completion tracking (one for each ritual type)
scoreboard objectives add rituals.growth_done dummy
scoreboard objectives add rituals.strength_done dummy
scoreboard objectives add rituals.prosperity_done dummy
scoreboard objectives add rituals.protection_done dummy
scoreboard objectives add rituals.healing_done dummy
scoreboard objectives add rituals.sentry_done dummy
scoreboard objectives add rituals.farming_done dummy
scoreboard objectives add rituals.breeding_done dummy

# Total activation counter (tracks ALL ritual activations, not just unique types)
scoreboard objectives add rituals.total_activations dummy

# Per-ritual activation counters (tracks how many times each specific ritual has been performed)
scoreboard objectives add rituals.growth_count dummy
scoreboard objectives add rituals.strength_count dummy
scoreboard objectives add rituals.prosperity_count dummy
scoreboard objectives add rituals.protection_count dummy
scoreboard objectives add rituals.healing_count dummy
scoreboard objectives add rituals.sentry_count dummy
scoreboard objectives add rituals.farming_count dummy
scoreboard objectives add rituals.breeding_count dummy

# Load config (can be modified in-game with /data modify storage rituals:config)
function rituals:config/load

# Apply config to scoreboards
execute store result score #ritual_duration rituals.data run data get storage rituals:config ritual_duration
execute store result score #min_totems rituals.data run data get storage rituals:config min_totems_required
execute store result score #ritual_check_range rituals.data run data get storage rituals:config ritual_check_range
execute store result score #sentry_target_range rituals.data run data get storage rituals:config sentry_target_range
execute store result score #sentry_max_distance rituals.data run data get storage rituals:config sentry_max_distance
execute store result score #sentry_range_mult rituals.data run data get storage rituals:config sentry_range_multiplier

# Store fire sacrifice mode flag (1 = enabled, 0 = disabled)
# Check kiwi_mode first - if enabled, it overrides require_fire_sacrifice
execute store result score #kiwi_mode rituals.data if data storage rituals:config {kiwi_mode:true}
execute if score #kiwi_mode rituals.data matches 1 run data modify storage rituals:config require_fire_sacrifice set value false
execute if score #kiwi_mode rituals.data matches 0 unless data storage rituals:config {require_fire_sacrifice:false} run data modify storage rituals:config require_fire_sacrifice set value true
execute store result score #fire_sacrifice_mode rituals.data if data storage rituals:config {require_fire_sacrifice:true}

# Store debug mode flag (1 = enabled, 0 = disabled)
execute store result score #rituals_debug_mode rituals.data if data storage rituals:config {debug_mode:true}

# Load tier-specific configs
execute store result score #tier1_h_range rituals.data run data get storage rituals:config tier1_horizontal_range
execute store result score #tier2_h_range rituals.data run data get storage rituals:config tier2_horizontal_range
execute store result score #tier3_h_range rituals.data run data get storage rituals:config tier3_horizontal_range
execute store result score #tier4_h_range rituals.data run data get storage rituals:config tier4_horizontal_range
execute store result score #tier5_h_range rituals.data run data get storage rituals:config tier5_horizontal_range
execute store result score #tier6_h_range rituals.data run data get storage rituals:config tier6_horizontal_range

execute store result score #tier1_v_range rituals.data run data get storage rituals:config tier1_vertical_range
execute store result score #tier2_v_range rituals.data run data get storage rituals:config tier2_vertical_range
execute store result score #tier3_v_range rituals.data run data get storage rituals:config tier3_vertical_range
execute store result score #tier4_v_range rituals.data run data get storage rituals:config tier4_vertical_range
execute store result score #tier5_v_range rituals.data run data get storage rituals:config tier5_vertical_range
execute store result score #tier6_v_range rituals.data run data get storage rituals:config tier6_vertical_range

# NOTE: Frequency is now per-ritual, loaded dynamically by get_*_settings functions
# No longer loading generic tier frequencies

# Tier multipliers for effect strength (not range)
scoreboard players set #tier1_power rituals.data 1
scoreboard players set #tier2_power rituals.data 2
scoreboard players set #tier3_power rituals.data 3

# Constants
scoreboard players set #check_interval rituals.data 20

# System constants
scoreboard players set #-1 rituals.data -1
scoreboard players set #2 rituals.data 2
scoreboard players set #10 rituals.data 10
scoreboard players set #20 rituals.data 20
scoreboard players set #100 rituals.data 100

# Initialize global ID counter
execute unless score #global_totem_id rituals.id matches 1.. run scoreboard players set #global_totem_id rituals.id 1

# Calculate badge progress for all online players (view with /function rituals:badges/check_status)
execute as @a run function rituals:badges/calculate_badge

tellraw @a [{"text":""}]
tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"          🔮 ","color":"light_purple"},{"text":"Rituals","color":"white"},{"text":" - Fire Sacrifice Edition","color":"gray"}]
tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]
tellraw @a [{"text":"│","color":"dark_purple"}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"  Press ","color":"gray"},{"text":"L","color":"aqua"},{"text":" to open the Advancement Guide","color":"gray"}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"  Type ","color":"gray"},{"text":"/function rituals:help","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:help"},"hover_event":{"action":"show_text","value":"Click to run"}},{"text":" for commands","color":"gray"}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"  ⚡ ","color":"yellow"},{"text":"[Check Badge Status]","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:badges/check_status"},"hover_event":{"action":"show_text","value":"View your ritual progress"}},{"text":" - Track your ritual mastery!","color":"gray"}]
tellraw @a [{"text":"│","color":"dark_purple"}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"  Quick Start:","color":"yellow"}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"   • ","color":"dark_gray"},{"text":"Enable Kiwi (Easy) Mode","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/enable_kiwi_mode"},"hover_event":{"action":"show_text","value":"Disables fire sacrifice requirement"}},{"text":" (Kiwi Mode)","color":"gray"}]
# Debug Mode button - show appropriate state
execute if score #rituals_debug_mode rituals.data matches 1 run tellraw @a [{"text":"│","color":"dark_purple"},{"text":"   • ","color":"dark_gray"},{"text":"Disable Debug Mode","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/disable_debug_mode"},"hover_event":{"action":"show_text","value":"Disable debug messages and extra info"}},{"text":" (Debug)","color":"gray"}]
execute unless score #rituals_debug_mode rituals.data matches 1 run tellraw @a [{"text":"│","color":"dark_purple"},{"text":"   • ","color":"dark_gray"},{"text":"Enable Debug Mode","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function rituals:admin/enable_debug_mode"},"hover_event":{"action":"show_text","value":"Enable debug messages and extra info"}},{"text":" (Debug)","color":"gray"}]
tellraw @a [{"text":"│","color":"dark_purple"}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"  Links:","color":"yellow"}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"   ","color":"dark_gray"},{"text":"💬 ","color":"white"},{"text":"JOIN OUR ","color":"light_purple","bold":true},{"text":"DISCORD","color":"aqua","bold":true,"underlined":true,"click_event":{"action":"open_url","url":"https://discord.gg/mpThbx67J7"},"hover_event":{"action":"show_text","value":"✨ Click to join our community Discord server! ✨"}},{"text":" SERVER","color":"light_purple","bold":true},{"text":" ✨","color":"yellow"}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"   • ","color":"dark_gray"},{"text":"Modrinth","color":"blue","underlined":true,"click_event":{"action":"open_url","url":"https://modrinth.com/datapack/totem-rituals"},"hover_event":{"action":"show_text","value":"View on Modrinth"}},{"text":" | ","color":"dark_gray"},{"text":"GitHub","color":"aqua","underlined":true,"click_event":{"action":"open_url","url":"https://github.com/Underwood-Inc/rituals"},"hover_event":{"action":"show_text","value":"View source code"}}]
tellraw @a [{"text":"│","color":"dark_purple"},{"text":"   • ","color":"dark_gray"},{"text":"Galaxy","color":"light_purple","underlined":true,"click_event":{"action":"open_url","url":"https://galaxy.idling.app/"},"hover_event":{"action":"show_text","value":"Visit Galaxy"}},{"text":" | ","color":"dark_gray"},{"text":"Twitch","color":"dark_purple","underlined":true,"click_event":{"action":"open_url","url":"https://www.twitch.tv/strixun"},"hover_event":{"action":"show_text","value":"Watch on Twitch"}},{"text":" | ","color":"dark_gray"},{"text":"Website","color":"green","underlined":true,"click_event":{"action":"open_url","url":"https://idling.app/"},"hover_event":{"action":"show_text","value":"Visit idling.app"}}]
tellraw @a [{"text":"│","color":"dark_purple"}]
tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}]

