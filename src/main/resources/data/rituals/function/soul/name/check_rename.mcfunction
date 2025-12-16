# ========================================
# Check if Player Renamed Soul Weapon
# ========================================
# Detects anvil renames and preserves player's custom name
# Runs before applying our formatted name during sync

# === MIGRATION: Ensure soul_display_name exists ===
# For old weapons that don't have soul_display_name, copy from soul_name
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_display_name if data storage rituals:temp item.components."minecraft:custom_data".soul_name run data modify storage rituals:temp item.components."minecraft:custom_data".soul_display_name set from storage rituals:temp item.components."minecraft:custom_data".soul_name

# Fallback: If still no display name, use "Soulbound Weapon"
execute unless data storage rituals:temp item.components."minecraft:custom_data".soul_display_name run data modify storage rituals:temp item.components."minecraft:custom_data".soul_display_name set value "Soulbound Weapon"

# === DETECT ANVIL RENAME ===
# Our format is an array: [{"text":"✦ ",...},{"text":"Name",...},{"text":" [Lv.#]",...}]
# Anvil rename creates simple object: {"text":"Custom Name","italic":true}

# Check if custom_name is an array (our format) by trying to access index [0]
execute store success score #is_array rituals.temp run data get storage rituals:temp item.components."minecraft:custom_name"[0]

# If NOT an array (score = 0), it might be a player rename
execute if score #is_array rituals.temp matches 0 run function rituals:soul/name/extract_rename

