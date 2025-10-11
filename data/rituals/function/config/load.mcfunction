# ========================================
# Load Config - Sets default values
# ========================================
# Can be modified in-game with /data modify storage rituals:config

# Ritual Settings
data modify storage rituals:config ritual_duration set value 600
data modify storage rituals:config min_totems_required set value 1
data modify storage rituals:config ritual_range set value 32

# Tier-Based Range Settings (horizontal radius in blocks)
data modify storage rituals:config tier1_horizontal_range set value 2
data modify storage rituals:config tier2_horizontal_range set value 3
data modify storage rituals:config tier3_horizontal_range set value 4
data modify storage rituals:config tier4_horizontal_range set value 5
data modify storage rituals:config tier5_horizontal_range set value 6
data modify storage rituals:config tier6_horizontal_range set value 7

# Tier-Based Vertical Range (up/down from totem)
data modify storage rituals:config tier1_vertical_range set value 3
data modify storage rituals:config tier2_vertical_range set value 4
data modify storage rituals:config tier3_vertical_range set value 5
data modify storage rituals:config tier4_vertical_range set value 6
data modify storage rituals:config tier5_vertical_range set value 7
data modify storage rituals:config tier6_vertical_range set value 8

# Tier-Based Effect Frequency (in ticks between applications)
data modify storage rituals:config tier1_frequency set value 20
data modify storage rituals:config tier2_frequency set value 15
data modify storage rituals:config tier3_frequency set value 10
data modify storage rituals:config tier4_frequency set value 8
data modify storage rituals:config tier5_frequency set value 5
data modify storage rituals:config tier6_frequency set value 3

# Sentry Totem Settings
data modify storage rituals:config sentry_range_multiplier set value 2.0d
data modify storage rituals:config sentry_fire_rate set value 40
data modify storage rituals:config sentry_base_damage set value 1.0d
data modify storage rituals:config sentry_projectile_speed set value 1.0d

# Damage scaling per tier (wood=1, copper=2, iron=3, gold=4, diamond=5, netherite=6)
data modify storage rituals:config sentry_damage_per_tier set value 0.5d

# Speed scaling per tier
data modify storage rituals:config sentry_speed_per_tier set value 0.15d

tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Config loaded! Use ","color":"yellow"},{"text":"/function rituals:help","color":"green","clickEvent":{"action":"suggest_command","value":"/function rituals:help"},"hoverEvent":{"action":"show_text","value":"Click for help"}},{"text":" for help","color":"yellow"}]

