# Helper function for pressure plate detection
# Checks all pressure plate types in horizontal positions

# Stone pressure plates
execute if block ~1 ~ ~ stone_pressure_plate[powered=true] run tag @s add rituals.redstone_check
execute if block ~-1 ~ ~ stone_pressure_plate[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~ ~1 stone_pressure_plate[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~ ~-1 stone_pressure_plate[powered=true] run tag @s add rituals.redstone_check
execute if block ~1 ~-1 ~ stone_pressure_plate[powered=true] run tag @s add rituals.redstone_check
execute if block ~-1 ~-1 ~ stone_pressure_plate[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~1 stone_pressure_plate[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~-1 stone_pressure_plate[powered=true] run tag @s add rituals.redstone_check

# All wood pressure plates (oak, spruce, birch, jungle, acacia, dark_oak, crimson, warped, mangrove, cherry, bamboo)
execute if block ~1 ~ ~ #wooden_pressure_plates[powered=true] run tag @s add rituals.redstone_check
execute if block ~-1 ~ ~ #wooden_pressure_plates[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~ ~1 #wooden_pressure_plates[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~ ~-1 #wooden_pressure_plates[powered=true] run tag @s add rituals.redstone_check
execute if block ~1 ~-1 ~ #wooden_pressure_plates[powered=true] run tag @s add rituals.redstone_check
execute if block ~-1 ~-1 ~ #wooden_pressure_plates[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~1 #wooden_pressure_plates[powered=true] run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~-1 #wooden_pressure_plates[powered=true] run tag @s add rituals.redstone_check

# Weighted pressure plates - just check if they exist (any power level triggers)
execute if block ~1 ~ ~ light_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~-1 ~ ~ light_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~ ~ ~1 light_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~ ~ ~-1 light_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~1 ~-1 ~ light_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~-1 ~-1 ~ light_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~1 light_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~-1 light_weighted_pressure_plate run tag @s add rituals.redstone_check

execute if block ~1 ~ ~ heavy_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~-1 ~ ~ heavy_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~ ~ ~1 heavy_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~ ~ ~-1 heavy_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~1 ~-1 ~ heavy_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~-1 ~-1 ~ heavy_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~1 heavy_weighted_pressure_plate run tag @s add rituals.redstone_check
execute if block ~ ~-1 ~-1 heavy_weighted_pressure_plate run tag @s add rituals.redstone_check

