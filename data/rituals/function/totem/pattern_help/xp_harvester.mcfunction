# Display XP Harvester pattern ritual setup instructions
# Shows exactly what items are needed and where to place them

tellraw @a[distance=..16] ["",\
  {"text":"\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_purple","bold":true},\
  {"text":"💎 ","color":"light_purple"},\
  {"text":"XP HARVESTER PATTERN SETUP","bold":true,"color":"aqua"},\
  {"text":"\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n","color":"dark_purple","bold":true},\
  {"text":"Pentagon Pattern Required:\n","color":"yellow","bold":true},\
  {"text":"  • Center: ","color":"gray"},{"text":"Experience Bottle\n","color":"light_purple"},\
  {"text":"  • North (5 blocks): ","color":"gray"},{"text":"Lapis Lazuli\n","color":"blue"},\
  {"text":"  • Northeast: ","color":"gray"},{"text":"Book\n","color":"white"},\
  {"text":"  • Southeast: ","color":"gray"},{"text":"Amethyst Shard\n","color":"light_purple"},\
  {"text":"  • Southwest: ","color":"gray"},{"text":"Quartz\n","color":"white"},\
  {"text":"  • Northwest: ","color":"gray"},{"text":"Glowstone Dust\n","color":"yellow"},\
  {"text":"\n🔥 Activate: ","color":"gold"},{"text":"Fire sacrifice at center\n","color":"gray"},\
  {"text":"⚡ Power: ","color":"yellow"},{"text":"Place redstone next to center\n","color":"gray"},\
  {"text":"✨ Effect: ","color":"aqua"},{"text":"1 XP/second while powered\n","color":"gray"},\
  {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_purple","bold":true}\
]

# Mark that help has been shown (prevents spam)
tag @s add rituals.pattern_help_shown

