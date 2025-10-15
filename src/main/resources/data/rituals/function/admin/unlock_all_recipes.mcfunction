# Unlock all ritual recipes for the player

# Totem bases (regular height)
recipe give @s rituals:totem_base_wood
recipe give @s rituals:totem_base_copper
recipe give @s rituals:totem_base_iron
recipe give @s rituals:totem_base_gold
recipe give @s rituals:totem_base_diamond
recipe give @s rituals:totem_base_netherite

# Totem bases (short height)
recipe give @s rituals:totem_base_wood_short
recipe give @s rituals:totem_base_copper_short
recipe give @s rituals:totem_base_iron_short
recipe give @s rituals:totem_base_gold_short
recipe give @s rituals:totem_base_diamond_short
recipe give @s rituals:totem_base_netherite_short

# Ritual paste
recipe give @s rituals:paste

# Upgrade slates
recipe give @s rituals:upgrade_slate_copper
recipe give @s rituals:upgrade_slate_iron
recipe give @s rituals:upgrade_slate_gold
recipe give @s rituals:upgrade_slate_diamond
recipe give @s rituals:upgrade_slate_netherite

tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"All recipes unlocked!","color":"green","bold":false}]

