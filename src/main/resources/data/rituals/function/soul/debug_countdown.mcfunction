# ========================================
# Debug: XP Countdown Logger
# ========================================
# Shows remaining seconds until next XP award (1/second).
# Runs as player with soul weapon in hotbar.
# Only called when #xp_countdown rituals.config = 1.

# Only log once per second (every 20 ticks)
scoreboard players operation #cd_mod rituals.soul_temp = @s rituals.soul_timer
scoreboard players operation #cd_mod rituals.soul_temp %= #20 rituals.data
execute unless score #cd_mod rituals.soul_temp matches 0 run return 0

# Read interval into local temp score
execute store result score #cd_interval rituals.soul_temp run data get storage rituals:config soul_xp_interval

# Calculate remaining ticks and convert to seconds
scoreboard players operation #cd_remaining rituals.soul_temp = #cd_interval rituals.soul_temp
scoreboard players operation #cd_remaining rituals.soul_temp -= @s rituals.soul_timer
scoreboard players operation #cd_remaining rituals.soul_temp /= #20 rituals.data

# Show timer value and remaining seconds
tellraw @s [{"text":"[Soul XP] ","color":"dark_purple"},{"text":"Timer: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.soul_timer"},"color":"yellow"},{"text":" / ","color":"gray"},{"score":{"name":"#cd_interval","objective":"rituals.soul_temp"},"color":"yellow"},{"text":" ticks | ","color":"gray"},{"score":{"name":"#cd_remaining","objective":"rituals.soul_temp"},"color":"aqua","bold":true},{"text":"s until XP","color":"gray"}]
