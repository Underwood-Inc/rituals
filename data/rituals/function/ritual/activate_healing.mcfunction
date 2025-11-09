# ========================================
# Activate Healing Ritual
# ========================================

# Mark THIS totem only (not nearby totems)
function rituals:ritual/types/mark_healing

# Set effect type on THIS totem
scoreboard players set @s rituals.effect 5

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Healing Ritual Activated!","color":"light_purple","bold":true}]
playsound block.enchantment_table.use block @a ~ ~ ~ 1.5 1.5
particle dust{color:[1.0,0.5,0.8],scale:2.0} ~ ~2 ~ 5 2 5 0.1 100

# Mark ritual as completed and update badges
function rituals:badges/mark_ritual_complete

scoreboard players set @s rituals.timer 0

