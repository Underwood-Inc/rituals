# ========================================
# Show Soul Embodiment Pattern Help
# ========================================
# Displays setup guide when awakeable tool is placed on totem
# Runs AS and AT the totem (interaction entity)

# Mark this totem so we don't spam messages
tag @s add rituals.soul_help_shown

# Show chat guide
tellraw @a[distance=..10] [{"text":""}]
tellraw @a[distance=..10] [{"text":"✦ ","color":"dark_purple","bold":true},{"text":"Soul Embodiment Ritual Detected!","color":"light_purple","bold":true}]
tellraw @a[distance=..10] [{"text":"  Place totems ","color":"gray"},{"text":"5 blocks","color":"yellow"},{"text":" away in cardinal directions:","color":"gray"}]
tellraw @a[distance=..10] [{"text":"  • North (+Z): ","color":"gray"},{"text":"Soul Sand","color":"#8B6914","bold":true}]
tellraw @a[distance=..10] [{"text":"  • East (+X): ","color":"gray"},{"text":"Ender Pearl","color":"#0A7A7A","bold":true}]
tellraw @a[distance=..10] [{"text":"  • South (-Z): ","color":"gray"},{"text":"Glowstone Dust","color":"#FFCC00","bold":true}]
tellraw @a[distance=..10] [{"text":"  • West (-X): ","color":"gray"},{"text":"Amethyst Shard","color":"#9966CC","bold":true}]
tellraw @a[distance=..10] [{"text":"  Then light fire at the central totem!","color":"gold"}]

# Play notification sound
playsound minecraft:block.amethyst_block.chime block @a[distance=..10] ~ ~ ~ 1.0 1.0

# Show visual particles at expected totem positions (5 blocks in each cardinal direction)
# North (+Z) - Soul Sand (brown/orange)
particle minecraft:dust{color:[0.55,0.41,0.08],scale:1.5} ~ ~1.5 ~5 0.3 0.5 0.3 0 5 force
# East (+X) - Ender Pearl (teal)
particle minecraft:dust{color:[0.04,0.48,0.48],scale:1.5} ~5 ~1.5 ~ 0.3 0.5 0.3 0 5 force
# South (-Z) - Glowstone Dust (yellow)
particle minecraft:dust{color:[1.0,0.8,0.0],scale:1.5} ~ ~1.5 ~-5 0.3 0.5 0.3 0 5 force
# West (-X) - Amethyst Shard (purple)
particle minecraft:dust{color:[0.6,0.4,0.8],scale:1.5} ~-5 ~1.5 ~ 0.3 0.5 0.3 0 5 force

# Central totem glow
particle minecraft:soul ~ ~2.5 ~ 0.2 0.2 0.2 0.01 8 force
