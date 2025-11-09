# ========================================
# Reload Ritual Registry
# ========================================
# Reloads the registry from storage (no reset, just refresh cache)

# Note: In datapack version, registry is always read from storage
# This function exists for consistency with mod variant

tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Registry reloaded!","color":"green"}]

