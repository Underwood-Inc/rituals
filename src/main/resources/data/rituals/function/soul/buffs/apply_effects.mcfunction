# ========================================
# Apply Active Buff/Debuff Effects (BALANCED)
# ========================================
# Runs every tick for players holding soul weapons
# Effects scale with stack level, respects max levels

# Store item data to temp for checking
data modify storage rituals:temp held_item set from entity @s SelectedItem

# === EXTRACT BUFF LEVELS (for scaling) ===
# Default all to 0
scoreboard players set #haste_lvl rituals.soul_temp 0
scoreboard players set #reach_lvl rituals.soul_temp 0
scoreboard players set #lucky_lvl rituals.soul_temp 0
scoreboard players set #swift_lvl rituals.soul_temp 0
scoreboard players set #strong_lvl rituals.soul_temp 0
scoreboard players set #tough_lvl rituals.soul_temp 0
scoreboard players set #repair_lvl rituals.soul_temp 0
scoreboard players set #magnetic_lvl rituals.soul_temp 0
scoreboard players set #soulfire_lvl rituals.soul_temp 0
scoreboard players set #lifesteal_lvl rituals.soul_temp 0
scoreboard players set #heavy_lvl rituals.soul_temp 0
scoreboard players set #unlucky_lvl rituals.soul_temp 0
scoreboard players set #hungry_lvl rituals.soul_temp 0
scoreboard players set #fragile_lvl rituals.soul_temp 0
scoreboard players set #clumsy_lvl rituals.soul_temp 0

# Get actual levels from buff data
execute store result score #haste_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.haste
execute store result score #reach_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.reach
execute store result score #lucky_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.lucky
execute store result score #swift_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.swift
execute store result score #strong_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.strong
execute store result score #tough_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.tough
execute store result score #repair_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.repair
execute store result score #magnetic_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.magnetic
execute store result score #soulfire_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.soulfire
execute store result score #lifesteal_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_buff_levels.lifesteal
execute store result score #heavy_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_debuff_levels.heavy
execute store result score #unlucky_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_debuff_levels.unlucky
execute store result score #hungry_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_debuff_levels.hungry
execute store result score #fragile_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_debuff_levels.fragile
execute store result score #clumsy_lvl rituals.soul_temp run data get storage rituals:temp held_item.components."minecraft:custom_data".soul_debuff_levels.clumsy

# === APPLY SCALED BUFF EFFECTS ===

# Haste - +10% mining speed per level (max 30%)
execute if score #haste_lvl rituals.soul_temp matches 1 run attribute @s minecraft:player.block_break_speed modifier add rituals:soul_haste 0.10 add_multiplied_base
execute if score #haste_lvl rituals.soul_temp matches 2 run attribute @s minecraft:player.block_break_speed modifier add rituals:soul_haste 0.20 add_multiplied_base
execute if score #haste_lvl rituals.soul_temp matches 3 run attribute @s minecraft:player.block_break_speed modifier add rituals:soul_haste 0.30 add_multiplied_base

# Glow - Make nearby entities glow (no stacking, just on/off)
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_buffs[{id:"glow"}] run effect give @e[distance=..10,type=!player] minecraft:glowing 2 0 true

# Magnetic - Attract items (range increases with level: 5/7 blocks)
execute if score #magnetic_lvl rituals.soul_temp matches 1 as @e[type=item,distance=3..5] run tp @s ^ ^ ^-0.2
execute if score #magnetic_lvl rituals.soul_temp matches 2 as @e[type=item,distance=3..7] run tp @s ^ ^ ^-0.25

# Reach - +0.5 block range per level (max +1.5)
execute if score #reach_lvl rituals.soul_temp matches 1 run attribute @s minecraft:player.block_interaction_range modifier add rituals:soul_reach 0.5 add_value
execute if score #reach_lvl rituals.soul_temp matches 1 run attribute @s minecraft:player.entity_interaction_range modifier add rituals:soul_reach_entity 0.5 add_value
execute if score #reach_lvl rituals.soul_temp matches 2 run attribute @s minecraft:player.block_interaction_range modifier add rituals:soul_reach 1.0 add_value
execute if score #reach_lvl rituals.soul_temp matches 2 run attribute @s minecraft:player.entity_interaction_range modifier add rituals:soul_reach_entity 1.0 add_value
execute if score #reach_lvl rituals.soul_temp matches 3 run attribute @s minecraft:player.block_interaction_range modifier add rituals:soul_reach 1.5 add_value
execute if score #reach_lvl rituals.soul_temp matches 3 run attribute @s minecraft:player.entity_interaction_range modifier add rituals:soul_reach_entity 1.5 add_value

# Repair - 0.5% chance per tick per level to repair 1 durability (max 1.5%/tick)
execute if score #repair_lvl rituals.soul_temp matches 1.. run function rituals:soul/buffs/effects/try_repair

# Lucky - +0.5 luck per level (max +1.0)
execute if score #lucky_lvl rituals.soul_temp matches 1 run attribute @s minecraft:player.luck modifier add rituals:soul_luck 0.5 add_value
execute if score #lucky_lvl rituals.soul_temp matches 2 run attribute @s minecraft:player.luck modifier add rituals:soul_luck 1.0 add_value

# Swift - +3% movement speed per level (max +9%)
execute if score #swift_lvl rituals.soul_temp matches 1 run attribute @s minecraft:player.movement_speed modifier add rituals:soul_swift 0.03 add_multiplied_base
execute if score #swift_lvl rituals.soul_temp matches 2 run attribute @s minecraft:player.movement_speed modifier add rituals:soul_swift 0.06 add_multiplied_base
execute if score #swift_lvl rituals.soul_temp matches 3 run attribute @s minecraft:player.movement_speed modifier add rituals:soul_swift 0.09 add_multiplied_base

# Strong - +0.5 attack damage per level (max +2.0)
execute if score #strong_lvl rituals.soul_temp matches 1 run attribute @s minecraft:player.attack_damage modifier add rituals:soul_strong 0.5 add_value
execute if score #strong_lvl rituals.soul_temp matches 2 run attribute @s minecraft:player.attack_damage modifier add rituals:soul_strong 1.0 add_value
execute if score #strong_lvl rituals.soul_temp matches 3 run attribute @s minecraft:player.attack_damage modifier add rituals:soul_strong 1.5 add_value
execute if score #strong_lvl rituals.soul_temp matches 4 run attribute @s minecraft:player.attack_damage modifier add rituals:soul_strong 2.0 add_value

# Tough - +1 armor per level (max +3)
execute if score #tough_lvl rituals.soul_temp matches 1 run attribute @s minecraft:player.armor modifier add rituals:soul_tough 1.0 add_value
execute if score #tough_lvl rituals.soul_temp matches 2 run attribute @s minecraft:player.armor modifier add rituals:soul_tough 2.0 add_value
execute if score #tough_lvl rituals.soul_temp matches 3 run attribute @s minecraft:player.armor modifier add rituals:soul_tough 3.0 add_value

# Nimble - Jump boost (no stacking)
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_buffs[{id:"nimble"}] run effect give @s minecraft:jump_boost 2 0 true

# Soulfire - 10% chance per level to ignite hit target (handled in combat event, placeholder)
# This would need combat detection - skipping for datapack safety

# Lifesteal - 5% of damage healed per level (handled in combat event, placeholder)
# This would need combat detection - skipping for datapack safety

# XP Boost - handled in XP gain calculation
# Looting - handled in loot calculation (complex, needs loot tables)
# Unbreaking - handled in durability loss calculation

# Night vision - 15 second duration for smooth effect
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_buffs[{id:"nightvision"}] run effect give @s minecraft:night_vision 15 0 true

# Water breathing - 10 second duration to prevent flickering
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_buffs[{id:"waterbreath"}] run effect give @s minecraft:water_breathing 10 0 true

# Fire resistance - 10 second duration to prevent flickering
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_buffs[{id:"fireresist"}] run effect give @s minecraft:fire_resistance 10 0 true

# Saturation - tiny chance for saturation (0.5% per tick per level)
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_buffs[{id:"saturation"}] store result score #sat_roll rituals.soul_temp run random value 1..200
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_buffs[{id:"saturation"}] if score #sat_roll rituals.soul_temp matches 1 run effect give @s minecraft:saturation 1 0 true

# === APPLY SCALED DEBUFF EFFECTS ===

# Heavy - -3% movement per level (max -6%)
execute if score #heavy_lvl rituals.soul_temp matches 1 run attribute @s minecraft:player.movement_speed modifier add rituals:soul_heavy -0.03 add_multiplied_base
execute if score #heavy_lvl rituals.soul_temp matches 2 run attribute @s minecraft:player.movement_speed modifier add rituals:soul_heavy -0.06 add_multiplied_base

# Unlucky - -0.5 luck per level (max -1.0)
execute if score #unlucky_lvl rituals.soul_temp matches 1 run attribute @s minecraft:player.luck modifier add rituals:soul_unlucky -0.5 add_value
execute if score #unlucky_lvl rituals.soul_temp matches 2 run attribute @s minecraft:player.luck modifier add rituals:soul_unlucky -1.0 add_value

# Hungry - 1/400 chance per tick for hunger effect (1/200 at level 2)
execute if score #hungry_lvl rituals.soul_temp matches 1 store result score #hunger_roll rituals.soul_temp run random value 1..400
execute if score #hungry_lvl rituals.soul_temp matches 1 if score #hunger_roll rituals.soul_temp matches 1 run effect give @s minecraft:hunger 3 0 true
execute if score #hungry_lvl rituals.soul_temp matches 2 store result score #hunger_roll rituals.soul_temp run random value 1..200
execute if score #hungry_lvl rituals.soul_temp matches 2 if score #hunger_roll rituals.soul_temp matches 1 run effect give @s minecraft:hunger 3 0 true

# Cursed - Bad omen rarely (1/6000 per tick = ~once per 5 min avg)
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_debuffs[{id:"cursed"}] store result score #curse_roll rituals.soul_temp run random value 1..6000
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_debuffs[{id:"cursed"}] if score #curse_roll rituals.soul_temp matches 1 run effect give @s minecraft:bad_omen 600 0 true

# Clumsy - Mining fatigue sometimes (1/600 per tick at lvl 1, 1/300 at lvl 2)
execute if score #clumsy_lvl rituals.soul_temp matches 1 store result score #clumsy_roll rituals.soul_temp run random value 1..600
execute if score #clumsy_lvl rituals.soul_temp matches 1 if score #clumsy_roll rituals.soul_temp matches 1 run effect give @s minecraft:mining_fatigue 3 0 true
execute if score #clumsy_lvl rituals.soul_temp matches 2 store result score #clumsy_roll rituals.soul_temp run random value 1..300
execute if score #clumsy_lvl rituals.soul_temp matches 2 if score #clumsy_roll rituals.soul_temp matches 1 run effect give @s minecraft:mining_fatigue 3 0 true

# Paranoid - Random spooky sounds (1/1200 per tick = ~once per minute)
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_debuffs[{id:"paranoid"}] store result score #paranoid_roll rituals.soul_temp run random value 1..1200
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_debuffs[{id:"paranoid"}] if score #paranoid_roll rituals.soul_temp matches 1 run function rituals:soul/buffs/effects/spooky_sound

# Loud - Alert nearby mobs (1/400 per tick)
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_debuffs[{id:"loud"}] store result score #loud_roll rituals.soul_temp run random value 1..400
execute if data storage rituals:temp held_item.components."minecraft:custom_data".soul_debuffs[{id:"loud"}] if score #loud_roll rituals.soul_temp matches 1 as @e[type=#minecraft:raiders,distance=..32] run data modify entity @s target set from entity @p UUID

# Bloodthirst - Damage player if no combat in 30 seconds (tracked separately)
# Would need a separate combat tracker - complex for datapack

# Cleanup
data remove storage rituals:temp held_item

