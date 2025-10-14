# ========================================
# Load Config - Sets default values
# ========================================
# Can be modified in-game with /data modify storage rituals:config

# ==================== GENERAL RITUAL SETTINGS ====================
data modify storage rituals:config ritual_duration set value 600
data modify storage rituals:config min_totems_required set value 1
data modify storage rituals:config ritual_check_range set value 32

# Fire Sacrifice Mode: If true, rituals require fire sacrifice (items + fire) to activate
# If false, rituals activate automatically when totems have items (legacy mode)
data modify storage rituals:config require_fire_sacrifice set value true

# Kiwi Mode: User-friendly setting for easy auto-activation (opposite of fire sacrifice)
# If true, rituals activate automatically (no fire required) - great for new players!
# If false, fire sacrifice is required (default, more challenging)
data modify storage rituals:config kiwi_mode set value false

# ==================== TIER-BASED RANGE SETTINGS ====================
# Horizontal radius in blocks from totem
data modify storage rituals:config tier1_horizontal_range set value 2
data modify storage rituals:config tier2_horizontal_range set value 3
data modify storage rituals:config tier3_horizontal_range set value 4
data modify storage rituals:config tier4_horizontal_range set value 5
data modify storage rituals:config tier5_horizontal_range set value 6
data modify storage rituals:config tier6_horizontal_range set value 7

# Vertical range (up/down from totem)
data modify storage rituals:config tier1_vertical_range set value 3
data modify storage rituals:config tier2_vertical_range set value 4
data modify storage rituals:config tier3_vertical_range set value 5
data modify storage rituals:config tier4_vertical_range set value 6
data modify storage rituals:config tier5_vertical_range set value 7
data modify storage rituals:config tier6_vertical_range set value 8

# ==================== GROWTH RITUAL ====================
# Frequency: How often to attempt growth (in ticks, lower = faster)
data modify storage rituals:config growth_tier1_frequency set value 300
data modify storage rituals:config growth_tier2_frequency set value 240
data modify storage rituals:config growth_tier3_frequency set value 180
data modify storage rituals:config growth_tier4_frequency set value 135
data modify storage rituals:config growth_tier5_frequency set value 90
data modify storage rituals:config growth_tier6_frequency set value 60

# ==================== STRENGTH RITUAL ====================
# Frequency: How often to apply buff (in ticks)
data modify storage rituals:config strength_tier1_frequency set value 40
data modify storage rituals:config strength_tier2_frequency set value 35
data modify storage rituals:config strength_tier3_frequency set value 30
data modify storage rituals:config strength_tier4_frequency set value 25
data modify storage rituals:config strength_tier5_frequency set value 20
data modify storage rituals:config strength_tier6_frequency set value 15

# Effect durations (in seconds)
data modify storage rituals:config strength_tier1_duration set value 10
data modify storage rituals:config strength_tier2_duration set value 12
data modify storage rituals:config strength_tier3_duration set value 15
data modify storage rituals:config strength_tier4_duration set value 18
data modify storage rituals:config strength_tier5_duration set value 22
data modify storage rituals:config strength_tier6_duration set value 30

# ==================== HEALING RITUAL ====================
# Frequency: How often to apply healing (in ticks)
data modify storage rituals:config healing_tier1_frequency set value 60
data modify storage rituals:config healing_tier2_frequency set value 50
data modify storage rituals:config healing_tier3_frequency set value 40
data modify storage rituals:config healing_tier4_frequency set value 35
data modify storage rituals:config healing_tier5_frequency set value 30
data modify storage rituals:config healing_tier6_frequency set value 25

# Effect durations (in seconds)
data modify storage rituals:config healing_tier1_duration set value 10
data modify storage rituals:config healing_tier2_duration set value 15
data modify storage rituals:config healing_tier3_duration set value 20
data modify storage rituals:config healing_tier4_duration set value 30
data modify storage rituals:config healing_tier5_duration set value 60
data modify storage rituals:config healing_tier6_duration set value 120

# ==================== PROSPERITY RITUAL ====================
# Frequency: How often to pull items and spawn XP (in ticks)
data modify storage rituals:config prosperity_tier1_frequency set value 20
data modify storage rituals:config prosperity_tier2_frequency set value 18
data modify storage rituals:config prosperity_tier3_frequency set value 15
data modify storage rituals:config prosperity_tier4_frequency set value 12
data modify storage rituals:config prosperity_tier5_frequency set value 10
data modify storage rituals:config prosperity_tier6_frequency set value 8

# Item pull speed (blocks per tick)
data modify storage rituals:config prosperity_tier1_pull_speed set value 0.3
data modify storage rituals:config prosperity_tier2_pull_speed set value 0.4
data modify storage rituals:config prosperity_tier3_pull_speed set value 0.5
data modify storage rituals:config prosperity_tier4_pull_speed set value 0.6
data modify storage rituals:config prosperity_tier5_pull_speed set value 0.8
data modify storage rituals:config prosperity_tier6_pull_speed set value 1.0

# Effect durations (in seconds)
data modify storage rituals:config prosperity_tier1_duration set value 10
data modify storage rituals:config prosperity_tier2_duration set value 12
data modify storage rituals:config prosperity_tier3_duration set value 14
data modify storage rituals:config prosperity_tier4_duration set value 16
data modify storage rituals:config prosperity_tier5_duration set value 18
data modify storage rituals:config prosperity_tier6_duration set value 20

# XP orb values
data modify storage rituals:config prosperity_tier1_xp set value 2
data modify storage rituals:config prosperity_tier2_xp set value 2
data modify storage rituals:config prosperity_tier3_xp set value 4
data modify storage rituals:config prosperity_tier4_xp set value 4
data modify storage rituals:config prosperity_tier5_xp set value 6
data modify storage rituals:config prosperity_tier6_xp set value 8

# ==================== PROTECTION RITUAL ====================
# Frequency: How often to damage mobs and apply fire resistance (in ticks)
data modify storage rituals:config protection_tier1_frequency set value 180
data modify storage rituals:config protection_tier2_frequency set value 140
data modify storage rituals:config protection_tier3_frequency set value 100
data modify storage rituals:config protection_tier4_frequency set value 70
data modify storage rituals:config protection_tier5_frequency set value 50
data modify storage rituals:config protection_tier6_frequency set value 30

# Damage to hostile mobs
data modify storage rituals:config protection_tier1_damage set value 2.0
data modify storage rituals:config protection_tier2_damage set value 3.0
data modify storage rituals:config protection_tier3_damage set value 4.0
data modify storage rituals:config protection_tier4_damage set value 5.0
data modify storage rituals:config protection_tier5_damage set value 6.0
data modify storage rituals:config protection_tier6_damage set value 8.0

# Effect durations (in seconds)
data modify storage rituals:config protection_tier1_duration set value 10
data modify storage rituals:config protection_tier2_duration set value 12
data modify storage rituals:config protection_tier3_duration set value 15
data modify storage rituals:config protection_tier4_duration set value 17
data modify storage rituals:config protection_tier5_duration set value 19
data modify storage rituals:config protection_tier6_duration set value 20

# ==================== SENTRY RITUAL ====================
# Fire rate: How often to fire projectiles (in ticks, lower = faster)
data modify storage rituals:config sentry_tier1_fire_rate set value 180
data modify storage rituals:config sentry_tier2_fire_rate set value 140
data modify storage rituals:config sentry_tier3_fire_rate set value 100
data modify storage rituals:config sentry_tier4_fire_rate set value 70
data modify storage rituals:config sentry_tier5_fire_rate set value 50
data modify storage rituals:config sentry_tier6_fire_rate set value 30

# Range multiplier (sentry range is this times normal range)
data modify storage rituals:config sentry_range_multiplier set value 2

# Projectile speed (blocks per tick)
data modify storage rituals:config sentry_tier1_projectile_speed set value 0.4
data modify storage rituals:config sentry_tier2_projectile_speed set value 0.5
data modify storage rituals:config sentry_tier3_projectile_speed set value 0.6
data modify storage rituals:config sentry_tier4_projectile_speed set value 0.7
data modify storage rituals:config sentry_tier5_projectile_speed set value 0.9
data modify storage rituals:config sentry_tier6_projectile_speed set value 1.2

# Projectile damage (half-hearts) - Increased 50% for better usefulness
# NOTE: Values hardcoded in sentry.mcfunction as x10 integers
data modify storage rituals:config sentry_tier1_damage set value 1.5
data modify storage rituals:config sentry_tier2_damage set value 3.0
data modify storage rituals:config sentry_tier3_damage set value 4.5
data modify storage rituals:config sentry_tier4_damage set value 6.0
data modify storage rituals:config sentry_tier5_damage set value 9.0
data modify storage rituals:config sentry_tier6_damage set value 12.0

# Projectile targeting range and max distance
data modify storage rituals:config sentry_target_range set value 30
data modify storage rituals:config sentry_max_distance set value 50

# ==================== AUTO-BREEDING RITUAL ====================
# Frequency: How often to attempt breeding (in ticks, 3 minutes = 3600 ticks)
data modify storage rituals:config breeding_tier1_frequency set value 3600
data modify storage rituals:config breeding_tier2_frequency set value 3000
data modify storage rituals:config breeding_tier3_frequency set value 2400
data modify storage rituals:config breeding_tier4_frequency set value 1800
data modify storage rituals:config breeding_tier5_frequency set value 1200
data modify storage rituals:config breeding_tier6_frequency set value 600

tellraw @a [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Config loaded! Use ","color":"yellow"},{"text":"/function rituals:help","color":"green","click_event":{"action":"suggest_command","command":"/function rituals:help"},"hover_event":{"action":"show_text","value":[{"text":"Click for help"}]}},{"text":" for help","color":"yellow"}]

