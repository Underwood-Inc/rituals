# ========================================
# Check Scrying Glass Use
# ========================================
# Detects right-click on scrying glass

# Check if player is actively using the spyglass (looking through it)
execute if data entity @s {using_item:1b} run function rituals:soul/scrying_glass_use
