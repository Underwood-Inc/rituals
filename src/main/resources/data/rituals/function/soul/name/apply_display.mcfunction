# ========================================
# Apply Display Name with Level (Macro)
# ========================================
# Builds: ✦ {soul_display_name} [Lv.{level}]
# CRITICAL: This is a macro function! Variables must be set in storage BEFORE calling!
# Required storage values: soul_display_name, display_level, item

# Apply formatted name with COLORS: ✦ (purple) | name (purple) | [Lv.#] (gray)
$data modify storage rituals:temp item.components."minecraft:custom_name" set value [{"text":"✦ ","color":"light_purple","italic":false},{"text":"$(soul_display_name)","color":"light_purple","italic":false},{"text":" [Lv.$(display_level)]","color":"gray","italic":false}]

# Debug output
execute if entity @a[tag=rituals.debug] run tellraw @a[tag=rituals.debug] [{"text":"[Soul Display] ","color":"gold"},{"text":"Applied name: ","color":"gray"},{"nbt":"item.components.\"minecraft:custom_name\"","storage":"rituals:temp","interpret":true}]
