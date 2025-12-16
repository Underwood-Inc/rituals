# ========================================
# Apply Lore with Macro Values
# ========================================
# Uses macro to inject actual values into lore
# Called with: rituals:temp storage containing lore_level, lore_xp, lore_cap, lore_xp_needed

$data modify storage rituals:temp item.components."minecraft:custom_name" set value {"text":"✦ Soulbound Weapon [Lv.$(lore_level)]","color":"light_purple","italic":false}

$data modify storage rituals:temp item.components."minecraft:lore" set value [{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"},{"text":"Soul Level: $(lore_level)/$(lore_cap)","color":"gray"},{"text":"Soul XP: $(lore_xp)/$(lore_xp_needed)","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"},{"text":"\"Growing stronger...\"","color":"gray","italic":true},{"text":"✦ Soul-Bound Weapon ✦","color":"light_purple"}]

