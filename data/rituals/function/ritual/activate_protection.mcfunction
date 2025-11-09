# ========================================
# Activate Protection Ritual
# ========================================

# Mark THIS totem only (not nearby totems)
function rituals:ritual/types/mark_protection

# Set effect type on THIS totem
scoreboard players set @s rituals.effect 4

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Protection Ritual Activated!","color":"blue","bold":true}]
playsound block.enchantment_table.use block @a ~ ~ ~ 1.5 0.5
particle dust{color:[0.5,0.7,1.0],scale:1.5} ~ ~2 ~ 5 2 5 0.1 100

# Mark ritual as completed and update badges
function rituals:badges/mark_ritual_complete

scoreboard players set @s rituals.timer 0

