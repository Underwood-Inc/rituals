# ========================================
# Reload Config from storage
# ========================================
# Re-applies config values from storage WITHOUT resetting them to defaults

# Apply config to scoreboards
execute store result score #ritual_duration rituals.data run data get storage rituals:config ritual_duration
execute store result score #min_totems rituals.data run data get storage rituals:config min_totems_required
execute store result score #ritual_check_range rituals.data run data get storage rituals:config ritual_check_range
execute store result score #sentry_target_range rituals.data run data get storage rituals:config sentry_target_range
execute store result score #sentry_max_distance rituals.data run data get storage rituals:config sentry_max_distance
execute store result score #sentry_range_mult rituals.data run data get storage rituals:config sentry_range_multiplier

# Apply fire sacrifice mode flag (1 = enabled, 0 = disabled)
execute store result score #fire_sacrifice_mode rituals.data if data storage rituals:config {require_fire_sacrifice:true}

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

tellraw @s [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Config reloaded!","color":"green"}]

