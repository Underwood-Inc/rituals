# ========================================
# Badge Display Configuration
# ========================================
# Configures how badges are displayed (no teams!)

# Initialize badge config storage if not exists
execute unless data storage rituals:config badge_config run data modify storage rituals:config badge_config set value {display_mode:"manual",show_in_tab:true,action_bar_frequency:100,show_tier_only:false}

# Load config values to scoreboards
execute store result score #badge_display_mode rituals.data run data get storage rituals:config badge_config.display_mode
execute store result score #badge_show_tab rituals.data if data storage rituals:config {badge_config:{show_in_tab:true}}
execute store result score #badge_action_bar_freq rituals.data run data get storage rituals:config badge_config.action_bar_frequency
execute store result score #badge_tier_only rituals.data if data storage rituals:config {badge_config:{show_tier_only:true}}

# Display modes:
# "manual" - Only show when player runs check_status command
# "tab" - Show in tab list using scoreboards
# "actionbar" - Periodic action bar notifications
# "both" - Tab + action bar

