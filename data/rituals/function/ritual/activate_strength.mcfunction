# ========================================
# Activate Strength Ritual
# ========================================

# Mark THIS totem only (not nearby totems)
function rituals:ritual/types/mark_if_diamond

# Set effect type on THIS totem
scoreboard players set @s rituals.effect 2

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Strength Ritual Activated!","color":"aqua","bold":true}]
playsound block.enchantment_table.use block @a ~ ~ ~ 1.5 0.8
particle crit ~ ~2 ~ 5 2 5 0.1 100

scoreboard players set @s rituals.timer 0

