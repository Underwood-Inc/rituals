# ========================================
# Kill all range markers for this totem
# ========================================
# Called when totem is powered OFF

# Store totem ID
scoreboard players operation #marker_id rituals.temp = @s rituals.id

# Kill all markers with matching ID
execute as @e[type=area_effect_cloud,tag=rituals.range_marker] if score @s rituals.id = #marker_id rituals.temp run kill @s


