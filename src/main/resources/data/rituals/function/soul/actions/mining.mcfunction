# ========================================
# Mining Action - Pickaxe XP (Full Block Tracking)
# ========================================
# Tracks ALL pickaxe blocks and awards XP based on config
# Minecraft 1.21.11 - Complete block mapping

# Debug: confirm function is being called
execute if entity @a[tag=rituals.debug] run tellraw @a[tag=rituals.debug] [{"text":"[Soul Debug] ","color":"gold"},{"text":"Mining action called for ","color":"gray"},{"selector":"@s"}]

# === SUM ALL MINED BLOCKS ===
scoreboard players set #total rituals.soul_temp 0

# Stone types (1 XP each)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobblestone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_cobblestone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_stone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_stone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobblestone_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_cobblestone_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_stone_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobblestone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_cobblestone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_stone_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_stone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobblestone_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_cobblestone_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_stone_brick_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mossy_stone_brick_wall

# Deepslate (1 XP each)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobbled_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_deepslate_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_tiles
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_deepslate_tiles
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_deepslate
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobbled_deepslate_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_deepslate_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_tile_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobbled_deepslate_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_deepslate_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_tile_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cobbled_deepslate_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_deepslate_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_brick_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_deepslate_tile_wall

# Granite/Diorite/Andesite (1 XP each)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_granite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_granite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_granite_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_granite_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_granite_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_granite_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_granite_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diorite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_diorite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diorite_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_diorite_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diorite_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_diorite_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_diorite_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_andesite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_andesite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_andesite_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_andesite_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_andesite_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_andesite_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_andesite_wall

# Tuff (1 XP each)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_tuff
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_tuff
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_tuff_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_tuff_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_tuff_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_tuff_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_tuff_brick_wall

# Calcite/Dripstone (1 XP)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_calcite
scoreboard players operation #total rituals.soul_temp += @s rituals.m_dripstone_block
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pointed_dripstone

# Sandstone (1 XP each)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cut_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sandstone_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_sandstone_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sandstone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cut_sandstone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_sandstone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_sandstone_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cut_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_red_sandstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_sandstone_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_red_sandstone_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_sandstone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cut_red_sandstone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_red_sandstone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_sandstone_wall

# Prismarine (2 XP each - multiply by 2)
scoreboard players set #prismarine rituals.soul_temp 0
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_prismarine
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_prismarine_bricks
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_dark_prismarine
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_prismarine_stairs
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_prismarine_brick_stairs
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_dark_prismarine_stairs
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_prismarine_slab
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_prismarine_brick_slab
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_dark_prismarine_slab
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_prismarine_wall
scoreboard players operation #prismarine rituals.soul_temp += @s rituals.m_sea_lantern
scoreboard players operation #prismarine rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #prismarine rituals.soul_temp

# Nether blocks (1 XP each)
scoreboard players operation #total rituals.soul_temp += @s rituals.m_netherrack
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_nether_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_nether_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_nether_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_nether_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_nether_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_brick_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_nether_brick_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_nether_brick_fence
scoreboard players operation #total rituals.soul_temp += @s rituals.m_basalt
scoreboard players operation #total rituals.soul_temp += @s rituals.m_smooth_basalt
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_basalt
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blackstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cracked_polished_blackstone_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_chiseled_polished_blackstone
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blackstone_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blackstone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blackstone_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_polished_blackstone_brick_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magma_block

# Gilded blackstone (3 XP - bonus)
scoreboard players set #gilded rituals.soul_temp 0
scoreboard players operation #gilded rituals.soul_temp += @s rituals.m_gilded_blackstone
scoreboard players operation #gilded rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #gilded rituals.soul_temp

# Glowstone (2 XP)
scoreboard players set #glow rituals.soul_temp 0
scoreboard players operation #glow rituals.soul_temp += @s rituals.m_glowstone
scoreboard players operation #glow rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #glow rituals.soul_temp

# End blocks (2 XP each)
scoreboard players set #end rituals.soul_temp 0
scoreboard players operation #end rituals.soul_temp += @s rituals.m_end_stone
scoreboard players operation #end rituals.soul_temp += @s rituals.m_end_stone_bricks
scoreboard players operation #end rituals.soul_temp += @s rituals.m_end_stone_brick_stairs
scoreboard players operation #end rituals.soul_temp += @s rituals.m_end_stone_brick_slab
scoreboard players operation #end rituals.soul_temp += @s rituals.m_end_stone_brick_wall
scoreboard players operation #end rituals.soul_temp += @s rituals.m_purpur_block
scoreboard players operation #end rituals.soul_temp += @s rituals.m_purpur_pillar
scoreboard players operation #end rituals.soul_temp += @s rituals.m_purpur_stairs
scoreboard players operation #end rituals.soul_temp += @s rituals.m_purpur_slab
scoreboard players operation #end rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #end rituals.soul_temp

# Quartz (2 XP each)
scoreboard players set #quartz rituals.soul_temp 0
scoreboard players operation #quartz rituals.soul_temp += @s rituals.m_quartz_block
scoreboard players operation #quartz rituals.soul_temp += @s rituals.m_chiseled_quartz_block
scoreboard players operation #quartz rituals.soul_temp += @s rituals.m_quartz_bricks
scoreboard players operation #quartz rituals.soul_temp += @s rituals.m_quartz_pillar
scoreboard players operation #quartz rituals.soul_temp += @s rituals.m_smooth_quartz
scoreboard players operation #quartz rituals.soul_temp += @s rituals.m_quartz_stairs
scoreboard players operation #quartz rituals.soul_temp += @s rituals.m_smooth_quartz_stairs
scoreboard players operation #quartz rituals.soul_temp += @s rituals.m_quartz_slab
scoreboard players operation #quartz rituals.soul_temp += @s rituals.m_smooth_quartz_slab
scoreboard players operation #quartz rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #quartz rituals.soul_temp

# Bricks/Terracotta/Concrete (1 XP each) - just add to total
scoreboard players operation #total rituals.soul_temp += @s rituals.m_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brick_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mud_bricks
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mud_brick_stairs
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mud_brick_slab
scoreboard players operation #total rituals.soul_temp += @s rituals.m_mud_brick_wall
scoreboard players operation #total rituals.soul_temp += @s rituals.m_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_white_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_orange_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magenta_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_blue_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_yellow_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lime_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pink_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gray_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_gray_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cyan_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purple_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_green_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_black_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_white_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_orange_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magenta_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_blue_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_yellow_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lime_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pink_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gray_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_gray_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cyan_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purple_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_green_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_black_glazed_terracotta
scoreboard players operation #total rituals.soul_temp += @s rituals.m_white_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_orange_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_magenta_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_blue_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_yellow_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_lime_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_pink_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_gray_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_light_gray_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_cyan_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_purple_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_blue_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_brown_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_green_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_red_concrete
scoreboard players operation #total rituals.soul_temp += @s rituals.m_black_concrete

# === ORES (BONUS XP) ===
# Coal ore (2 XP)
scoreboard players set #ores rituals.soul_temp 0
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_coal_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_deepslate_coal_ore
scoreboard players operation #ores rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #ores rituals.soul_temp

# Copper ore (2 XP)
scoreboard players set #ores rituals.soul_temp 0
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_copper_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_deepslate_copper_ore
scoreboard players operation #ores rituals.soul_temp *= #2 rituals.data
scoreboard players operation #total rituals.soul_temp += #ores rituals.soul_temp

# Iron ore (3 XP)
scoreboard players set #ores rituals.soul_temp 0
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_iron_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_deepslate_iron_ore
scoreboard players operation #ores rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #ores rituals.soul_temp

# Redstone/Nether Quartz ore (3 XP)
scoreboard players set #ores rituals.soul_temp 0
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_redstone_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_deepslate_redstone_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_nether_quartz_ore
scoreboard players operation #ores rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #ores rituals.soul_temp

# Gold ore (4 XP)
scoreboard players set #ores rituals.soul_temp 0
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_gold_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_deepslate_gold_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_nether_gold_ore
scoreboard players operation #ores rituals.soul_temp *= #4 rituals.data
scoreboard players operation #total rituals.soul_temp += #ores rituals.soul_temp

# Lapis ore (4 XP)
scoreboard players set #ores rituals.soul_temp 0
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_lapis_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_deepslate_lapis_ore
scoreboard players operation #ores rituals.soul_temp *= #4 rituals.data
scoreboard players operation #total rituals.soul_temp += #ores rituals.soul_temp

# Diamond ore (10 XP)
scoreboard players set #ores rituals.soul_temp 0
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_diamond_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_deepslate_diamond_ore
scoreboard players operation #ores rituals.soul_temp *= #10 rituals.data
scoreboard players operation #total rituals.soul_temp += #ores rituals.soul_temp

# Emerald ore (12 XP)
scoreboard players set #ores rituals.soul_temp 0
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_emerald_ore
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_deepslate_emerald_ore
scoreboard players set #12 rituals.data 12
scoreboard players operation #ores rituals.soul_temp *= #12 rituals.data
scoreboard players operation #total rituals.soul_temp += #ores rituals.soul_temp

# Ancient debris (25 XP)
scoreboard players set #ores rituals.soul_temp 0
scoreboard players operation #ores rituals.soul_temp += @s rituals.m_ancient_debris
scoreboard players operation #ores rituals.soul_temp *= #25 rituals.data
scoreboard players operation #total rituals.soul_temp += #ores rituals.soul_temp

# Obsidian (3 XP)
scoreboard players set #obs rituals.soul_temp 0
scoreboard players operation #obs rituals.soul_temp += @s rituals.m_obsidian
scoreboard players operation #obs rituals.soul_temp += @s rituals.m_crying_obsidian
scoreboard players operation #obs rituals.soul_temp *= #3 rituals.data
scoreboard players operation #total rituals.soul_temp += #obs rituals.soul_temp

# Reinforced deepslate (5 XP)
scoreboard players set #reinf rituals.soul_temp 0
scoreboard players operation #reinf rituals.soul_temp += @s rituals.m_reinforced_deepslate
scoreboard players operation #reinf rituals.soul_temp *= #5 rituals.data
scoreboard players operation #total rituals.soul_temp += #reinf rituals.soul_temp

# === CALCULATE XP DELTA ===
# Initialize player's prev_mined if undefined
execute unless score @s rituals.prev_mined matches -2147483648.. run scoreboard players set @s rituals.prev_mined 0

# Store current total
scoreboard players operation @s rituals.pickaxe_mined = #total rituals.soul_temp

# Calculate gain since last check
scoreboard players operation #xp_gain rituals.soul_temp = @s rituals.pickaxe_mined
scoreboard players operation #xp_gain rituals.soul_temp -= @s rituals.prev_mined

# Debug: show calculated values
execute if entity @a[tag=rituals.debug] run tellraw @a[tag=rituals.debug] [{"text":"[Soul Debug] ","color":"gold"},{"text":"Pickaxe total: ","color":"gray"},{"score":{"name":"#total","objective":"rituals.soul_temp"},"color":"aqua"},{"text":" | prev: ","color":"gray"},{"score":{"name":"@s","objective":"rituals.prev_mined"},"color":"yellow"},{"text":" | gain: ","color":"gray"},{"score":{"name":"#xp_gain","objective":"rituals.soul_temp"},"color":"green"}]

# === AWARD XP ===
execute if score #xp_gain rituals.soul_temp matches 1.. run function rituals:soul/award_xp
scoreboard players operation @s rituals.prev_mined = @s rituals.pickaxe_mined

