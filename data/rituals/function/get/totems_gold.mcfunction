# ========================================
# Gold Totem Variant Selection
# ========================================

tellraw @s [{"text":"\n=== Gold Totem - Select Variant ===","color":"gold","bold":true}]
tellraw @s [{"text":"","color":"yellow"}]

tellraw @s [{"text":"[Tall Variant] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/totem_gold"},"hoverEvent":{"action":"show_text","contents":"2 blocks tall"}}]

tellraw @s [{"text":"[Short Variant] ","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/function rituals:give/totem_gold_short"},"hoverEvent":{"action":"show_text","contents":"1 block tall"}}]

tellraw @s [{"text":"","color":"yellow"}]
tellraw @s [{"text":"[← Back]","color":"gray","clickEvent":{"action":"run_command","value":"/function rituals:get/totems"},"hoverEvent":{"action":"show_text","contents":"Back to totem selection"}}]

