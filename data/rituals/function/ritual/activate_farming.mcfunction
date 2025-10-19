# ========================================
# Activate Auto-Farming Ritual
# ========================================

# Mark THIS totem only (not nearby totems)
function rituals:ritual/types/mark_if_farming

# Set effect type on THIS totem
scoreboard players set @s rituals.effect 7

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Auto-Farming Ritual Activated!","color":"green","bold":true}]
playsound block.crop.break block @a ~ ~ ~ 1.5 0.8
playsound block.composter.fill_success block @a ~ ~ ~ 1.5 1.2
particle happy_villager ~ ~2 ~ 5 2 5 0.1 100
particle minecraft:item minecraft:wheat_seeds ~ ~2 ~ 5 2 5 0.1 50

# Grant advancement to nearby players
advancement grant @a[distance=..32] only rituals:guide/first_ritual

# Initialize ritual timer
scoreboard players set @s rituals.timer 0

