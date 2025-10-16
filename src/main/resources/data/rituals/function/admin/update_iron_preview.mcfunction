# ========================================
# Update Iron Preview
# ========================================
# Shows iron totem as next step with enchanted text

# Grant the iron preview advancement
advancement grant @s only rituals:guide/iron_preview

# Show preview message
tellraw @s [{"text":"🔮 ","color":"dark_purple"},{"text":"Mystical Preview Unlocked! ","color":"gold","bold":true},{"text":"The next tier shimmers with possibility...","color":"gray","italic":true}]
