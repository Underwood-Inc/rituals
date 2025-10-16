# ========================================
# Update Diamond Preview
# ========================================
# Shows diamond totem as next step with enchanted text

# Create diamond preview advancement dynamically
advancement grant @s only rituals:guide/diamond_preview

# Show preview message
tellraw @s [{"text":"🔮 ","color":"dark_purple"},{"text":"Mystical Preview Unlocked! ","color":"gold","bold":true},{"text":"The next tier shimmers with possibility...","color":"gray","italic":true}]
