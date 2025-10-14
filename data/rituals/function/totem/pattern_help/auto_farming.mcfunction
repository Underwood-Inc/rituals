# Display Auto-Farming pattern ritual setup instructions
# Shows exactly what items are needed and where to place them

tellraw @a[distance=..16] ["",\
  {"text":"\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_green","bold":true},\
  {"text":"🚜 ","color":"yellow"},\
  {"text":"AUTO-FARMING PATTERN SETUP","bold":true,"color":"green"},\
  {"text":"\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n","color":"dark_green","bold":true},\
  {"text":"Square Pattern Required:\n","color":"yellow","bold":true},\
  {"text":"  • Center: ","color":"gray"},{"text":"Diamond Hoe\n","color":"aqua"},\
  {"text":"  • NE Corner (+5,+5): ","color":"gray"},{"text":"Wheat\n","color":"gold"},\
  {"text":"  • SE Corner (+5,-5): ","color":"gray"},{"text":"Carrot\n","color":"gold"},\
  {"text":"  • SW Corner (-5,-5): ","color":"gray"},{"text":"Potato\n","color":"gold"},\
  {"text":"  • NW Corner (-5,+5): ","color":"gray"},{"text":"Beetroot\n","color":"gold"},\
  {"text":"\n🔥 Activate: ","color":"gold"},{"text":"Fire sacrifice at center\n","color":"gray"},\
  {"text":"✨ Effect: ","color":"green"},{"text":"Auto-harvest & replant crops\n","color":"gray"},\
  {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_green","bold":true}\
]

# Mark that help has been shown (prevents spam)
tag @s add rituals.pattern_help_shown


