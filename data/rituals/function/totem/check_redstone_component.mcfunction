# Helper function to check a specific redstone component at multiple positions
# Parameters: $block (block type), $state (block state like [powered=true])
# Checks 8 positions: 4 adjacent horizontally + 4 at one block below

$execute if block ~1 ~ ~ $(block)$(state) run tag @s add rituals.redstone_powered
$execute if block ~-1 ~ ~ $(block)$(state) run tag @s add rituals.redstone_powered
$execute if block ~ ~ ~1 $(block)$(state) run tag @s add rituals.redstone_powered
$execute if block ~ ~ ~-1 $(block)$(state) run tag @s add rituals.redstone_powered
$execute if block ~1 ~-1 ~ $(block)$(state) run tag @s add rituals.redstone_powered
$execute if block ~-1 ~-1 ~ $(block)$(state) run tag @s add rituals.redstone_powered
$execute if block ~ ~-1 ~1 $(block)$(state) run tag @s add rituals.redstone_powered
$execute if block ~ ~-1 ~-1 $(block)$(state) run tag @s add rituals.redstone_powered

