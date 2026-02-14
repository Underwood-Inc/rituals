# ========================================
# Apply Bonus Enchantment on Ascension
# ========================================
# 50% chance on ascension to add a random enchantment.
# Type-agnostic: ANY enchantment can land on ANY soul item.
# This is a gamble — you might get Sharpness on a shovel
# or Aqua Affinity on a sword. You earned it, you keep it.
# Runs as the central totem. Item is on the item_display entity.

# === INCREMENT BONUS ENCHANT COUNTER ===
execute as @e[type=item_display,tag=rituals.totem_display,distance=..2,limit=1] store result score #bonus_count rituals.soul_temp run data get entity @s item.components."minecraft:custom_data".soul_bonus_enchants
scoreboard players add #bonus_count rituals.soul_temp 1
execute store result entity @e[type=item_display,tag=rituals.totem_display,distance=..2,limit=1] item.components."minecraft:custom_data".soul_bonus_enchants int 1 run scoreboard players get #bonus_count rituals.soul_temp

# === COPY ITEM TO STORAGE FOR MODIFICATION ===
execute as @e[type=item_display,tag=rituals.totem_display,distance=..2,limit=1] run data modify storage rituals:temp item set from entity @s item

# === ENSURE ENCHANTMENTS COMPONENT EXISTS ===
execute unless data storage rituals:temp item.components."minecraft:enchantments" run data modify storage rituals:temp item.components."minecraft:enchantments" set value {}

# === ROLL RANDOM ENCHANTMENT (1-40) ===
execute store result score #ench_roll rituals.soul_temp run random value 1..40

# === DISPATCH TO ENCHANTMENT HANDLER ===
# Each handler: reads current level, caps at max, increments, writes back, sets enchant_name
execute if score #ench_roll rituals.soul_temp matches 1 run function rituals:soul/enchants/apply_sharpness
execute if score #ench_roll rituals.soul_temp matches 2 run function rituals:soul/enchants/apply_smite
execute if score #ench_roll rituals.soul_temp matches 3 run function rituals:soul/enchants/apply_bane_of_arthropods
execute if score #ench_roll rituals.soul_temp matches 4 run function rituals:soul/enchants/apply_knockback
execute if score #ench_roll rituals.soul_temp matches 5 run function rituals:soul/enchants/apply_fire_aspect
execute if score #ench_roll rituals.soul_temp matches 6 run function rituals:soul/enchants/apply_looting
execute if score #ench_roll rituals.soul_temp matches 7 run function rituals:soul/enchants/apply_sweeping_edge
execute if score #ench_roll rituals.soul_temp matches 8 run function rituals:soul/enchants/apply_efficiency
execute if score #ench_roll rituals.soul_temp matches 9 run function rituals:soul/enchants/apply_fortune
execute if score #ench_roll rituals.soul_temp matches 10 run function rituals:soul/enchants/apply_silk_touch
execute if score #ench_roll rituals.soul_temp matches 11 run function rituals:soul/enchants/apply_unbreaking
execute if score #ench_roll rituals.soul_temp matches 12 run function rituals:soul/enchants/apply_mending
execute if score #ench_roll rituals.soul_temp matches 13 run function rituals:soul/enchants/apply_power
execute if score #ench_roll rituals.soul_temp matches 14 run function rituals:soul/enchants/apply_punch
execute if score #ench_roll rituals.soul_temp matches 15 run function rituals:soul/enchants/apply_flame
execute if score #ench_roll rituals.soul_temp matches 16 run function rituals:soul/enchants/apply_infinity
execute if score #ench_roll rituals.soul_temp matches 17 run function rituals:soul/enchants/apply_quick_charge
execute if score #ench_roll rituals.soul_temp matches 18 run function rituals:soul/enchants/apply_multishot
execute if score #ench_roll rituals.soul_temp matches 19 run function rituals:soul/enchants/apply_piercing
execute if score #ench_roll rituals.soul_temp matches 20 run function rituals:soul/enchants/apply_loyalty
execute if score #ench_roll rituals.soul_temp matches 21 run function rituals:soul/enchants/apply_channeling
execute if score #ench_roll rituals.soul_temp matches 22 run function rituals:soul/enchants/apply_riptide
execute if score #ench_roll rituals.soul_temp matches 23 run function rituals:soul/enchants/apply_impaling
execute if score #ench_roll rituals.soul_temp matches 24 run function rituals:soul/enchants/apply_protection
execute if score #ench_roll rituals.soul_temp matches 25 run function rituals:soul/enchants/apply_fire_protection
execute if score #ench_roll rituals.soul_temp matches 26 run function rituals:soul/enchants/apply_blast_protection
execute if score #ench_roll rituals.soul_temp matches 27 run function rituals:soul/enchants/apply_projectile_protection
execute if score #ench_roll rituals.soul_temp matches 28 run function rituals:soul/enchants/apply_feather_falling
execute if score #ench_roll rituals.soul_temp matches 29 run function rituals:soul/enchants/apply_respiration
execute if score #ench_roll rituals.soul_temp matches 30 run function rituals:soul/enchants/apply_aqua_affinity
execute if score #ench_roll rituals.soul_temp matches 31 run function rituals:soul/enchants/apply_thorns
execute if score #ench_roll rituals.soul_temp matches 32 run function rituals:soul/enchants/apply_depth_strider
execute if score #ench_roll rituals.soul_temp matches 33 run function rituals:soul/enchants/apply_frost_walker
execute if score #ench_roll rituals.soul_temp matches 34 run function rituals:soul/enchants/apply_soul_speed
execute if score #ench_roll rituals.soul_temp matches 35 run function rituals:soul/enchants/apply_swift_sneak
execute if score #ench_roll rituals.soul_temp matches 36 run function rituals:soul/enchants/apply_luck_of_the_sea
execute if score #ench_roll rituals.soul_temp matches 37 run function rituals:soul/enchants/apply_lure
execute if score #ench_roll rituals.soul_temp matches 38 run function rituals:soul/enchants/apply_wind_burst
execute if score #ench_roll rituals.soul_temp matches 39 run function rituals:soul/enchants/apply_density
execute if score #ench_roll rituals.soul_temp matches 40 run function rituals:soul/enchants/apply_breach

# === WRITE MODIFIED ITEM BACK TO ENTITY ===
execute as @e[type=item_display,tag=rituals.totem_display,distance=..2,limit=1] run data modify entity @s item set from storage rituals:temp item

# === VISUAL CELEBRATION ===
particle minecraft:totem_of_undying ~ ~2 ~ 0.5 1 0.5 1 100 force
particle minecraft:enchanted_hit ~ ~1.5 ~ 0.5 0.5 0.5 0.5 50 force
playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 2.0 1.0
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.5 0.5

# === ANNOUNCE (enchant_name set by handler, #ench_level has the new level) ===
tellraw @a[distance=..32] [{"text":"   ","color":"gray"},{"text":"★ BONUS: ","color":"gold","bold":true},{"nbt":"enchant_name","storage":"rituals:temp","color":"aqua"},{"text":" ","color":"aqua"},{"score":{"name":"#ench_level","objective":"rituals.soul_temp"},"color":"aqua"},{"text":"!","color":"aqua"}]

# === CLEANUP ===
data remove storage rituals:temp enchant_name
data remove storage rituals:temp item
