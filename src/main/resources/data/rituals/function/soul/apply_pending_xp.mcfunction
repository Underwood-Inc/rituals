# ========================================
# Channel Wielder's Soul Energy into Weapon
# ========================================
# The totem acts as a conduit, transferring stored soul energy
# from the wielder into the weapon to strengthen its bond.
# Modifies the item in storage rituals:temp item
# Player UUID in rituals:temp interacting_uuid (macro)

# Get the wielder's stored soul energy - UUID targeted
$scoreboard players operation #xp_to_apply rituals.soul_temp = @a[nbt={UUID:$(interacting_uuid)}] rituals.soul_xp_gain

# Only proceed if there is XP to apply
execute unless score #xp_to_apply rituals.soul_temp matches 1.. run return fail

# Get current XP from the item in storage
execute store result score #item_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp

# Channel stored soul energy into the weapon
scoreboard players operation #item_xp rituals.soul_temp += #xp_to_apply rituals.soul_temp

# Write back to storage
data modify storage rituals:temp item.components."minecraft:custom_data".soul_xp set value 0
execute store result storage rituals:temp item.components."minecraft:custom_data".soul_xp int 1 run scoreboard players get #item_xp rituals.soul_temp

# Also update total XP
execute store result score #total_xp rituals.soul_temp run data get storage rituals:temp item.components."minecraft:custom_data".soul_xp_total
scoreboard players operation #total_xp rituals.soul_temp += #xp_to_apply rituals.soul_temp
execute store result storage rituals:temp item.components."minecraft:custom_data".soul_xp_total int 1 run scoreboard players get #total_xp rituals.soul_temp

# Clear the wielder's spent soul energy and sync tag - UUID targeted
$scoreboard players set @a[nbt={UUID:$(interacting_uuid)}] rituals.soul_xp_gain 0
$tag @a[nbt={UUID:$(interacting_uuid)}] remove rituals.soul_pending_sync
