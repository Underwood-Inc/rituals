# ========================================
# Detect Anvil Rename
# ========================================
# Anvil renames create: {"text":"Player Name","italic":true}
# Our format is an array: [{...},{...},{...}]
# 
# Key detection: Anvil ALWAYS adds italic:1b at root level
# Our array format does NOT have italic at root level

# Check if custom_name has italic:1b at root (anvil signature)
execute if data storage rituals:temp item.components."minecraft:custom_name"{italic:1b} run function rituals:soul/name/extract_player_rename

# Also check for italic:true (different NBT representation)
execute if data storage rituals:temp item.components."minecraft:custom_name"{italic:true} run function rituals:soul/name/extract_player_rename


