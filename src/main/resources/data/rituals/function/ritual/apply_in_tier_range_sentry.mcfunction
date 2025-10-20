# Calculate range with sentry multiplier applied (2x by default)
# Call this for sentry rituals instead of apply_in_tier_range
# Sets up positioned for dx/dy/dz selectors with doubled range

# Get current tier settings (sets #current_h_range, #current_v_range, #current_freq)
function rituals:ritual/get_tier_settings

# Apply sentry range multiplier (default 2.0, stored in #sentry_range_mult)
scoreboard players operation #current_h_range rituals.temp *= #sentry_range_mult rituals.data
scoreboard players operation #current_v_range rituals.temp *= #sentry_range_mult rituals.data

# Calculate negative offset (half of range)
scoreboard players operation #neg_h rituals.temp = #current_h_range rituals.temp
scoreboard players set #-1 rituals.data -1
scoreboard players operation #neg_h rituals.temp *= #-1 rituals.data

scoreboard players operation #neg_v rituals.temp = #current_v_range rituals.temp
scoreboard players operation #neg_v rituals.temp *= #-1 rituals.data

# Calculate box size (2x range)
scoreboard players operation #box_h rituals.temp = #current_h_range rituals.temp
scoreboard players set #2 rituals.data 2
scoreboard players operation #box_h rituals.temp *= #2 rituals.data

scoreboard players operation #box_v rituals.temp = #current_v_range rituals.temp
scoreboard players operation #box_v rituals.temp *= #2 rituals.data

# Store in storage for macro use
execute store result storage rituals:temp neg_h int 1 run scoreboard players get #neg_h rituals.temp
execute store result storage rituals:temp neg_v int 1 run scoreboard players get #neg_v rituals.temp
execute store result storage rituals:temp box_h int 1 run scoreboard players get #box_h rituals.temp
execute store result storage rituals:temp box_v int 1 run scoreboard players get #box_v rituals.temp


