# ========================================
# Copper Totem Variant Selection
# ========================================

tellraw @s [{"text":"\n=== Copper Totem - Select Variant ===","color":"#FF6347","bold":true}]
tellraw @s [{"text":"","color":"yellow"}]

tellraw @s [{"text":"[Tall Variant] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/totem_copper"},"hoverEvent":{"action":"show_text","contents":"2 blocks tall"}}]

tellraw @s [{"text":"[Short Variant] ","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/totem_copper_short"},"hoverEvent":{"action":"show_text","contents":"1 block tall"}}]

tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"[← Back]","color":"gray","clickEvent":{"action":"run_command","value":"/function rituals:get/totems"},"hoverEvent":{"action":"show_text","contents":"Back to totem selection"}}]

