# ========================================
# Show Action Bar Message (Macro)
# ========================================
# Uses macro to display formatted badge in action bar

$title @s actionbar [{"text":"⚡ ","color":"yellow"},{"text":"Rituals: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.ritual_count"},"color":"aqua"},{"text":"/8 | ","color":"dark_gray"},{"text":"$(tier_name)","color":"$(tier_color)"}]

