# ========================================
# Give Ritual Paste
# ========================================

function rituals:give/paste
tellraw @s [{"text":"[← Back]","color":"gray","clickEvent":{"action":"run_command","value":"/function rituals:get"},"hoverEvent":{"action":"show_text","contents":"Back to main menu"}}]

