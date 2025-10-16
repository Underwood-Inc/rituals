# ========================================
# Update Gold Preview
# ========================================
# Shows gold totem as next step with enchanted text

# Create gold preview advancement dynamically
advancement grant @s only rituals:guide/gold_preview

# Show preview message
tellraw @s [{"text":"🔮 ","color":"dark_purple"},{"text":"Mystical Preview Unlocked! ","color":"gold","bold":true},{"text":"The next tier shimmers with possibility...","color":"gray","italic":true}]
