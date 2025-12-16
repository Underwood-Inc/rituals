# ========================================
# Extract Player's Custom Name
# ========================================
# If player renamed in anvil, extract their name and save it

# Get the text content from the simple name component
# Anvil creates: {"text":"Player's Name","italic":true}
execute store success score #has_text rituals.temp run data get storage rituals:temp item.components."minecraft:custom_name".text

# If it has a text field, extract it
execute if score #has_text rituals.temp matches 1 run function rituals:soul/name/save_custom


