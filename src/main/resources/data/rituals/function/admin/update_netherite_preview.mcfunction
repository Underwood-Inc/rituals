# ========================================
# Update Netherite Preview
# ========================================
# Shows netherite totem as next step with enchanted text

# Create netherite preview advancement dynamically
advancement grant @s only rituals:guide/netherite_preview

# Show preview message
tellraw @s [{"text":"🔮 ","color":"dark_purple"},{"text":"Mystical Preview Unlocked! ","color":"gold","bold":true},{"text":"The next tier shimmers with possibility...","color":"gray","italic":true}]
