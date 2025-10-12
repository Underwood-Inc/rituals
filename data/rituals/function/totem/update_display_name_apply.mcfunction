# Apply the name to the interaction entity
# Parameters: $tier_name, $effect_name
# CustomNameVisible:0b means it only shows when player looks directly at it
# Using plain text format (no JSON) to avoid displaying raw JSON

$data merge entity @s {CustomName:'"$(tier_name) Totem - $(effect_name)"',CustomNameVisible:0b}

