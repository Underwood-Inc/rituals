# ========================================
# Activate Sentry Ritual
# ========================================

# Mark THIS totem only (not nearby totems)
function rituals:ritual/types/mark_if_arrow

# Set effect type on THIS totem
scoreboard players set @s rituals.effect 6

# Visual feedback
tellraw @a[distance=..32] [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Sentry Totem Activated!","color":"red","bold":true}]
playsound entity.arrow.shoot block @a ~ ~ ~ 1.5 0.8
playsound block.beacon.activate block @a ~ ~ ~ 0.5 1.5
particle flame ~ ~2 ~ 0.5 1 0.5 0.1 50
particle enchant ~ ~2 ~ 1 1 1 0.3 100

# Grant advancement
advancement grant @a[distance=..5] only rituals:guide/fire_sacrifice

# Mark ritual as completed and update badges
function rituals:badges/mark_ritual_complete

scoreboard players set @s rituals.timer 0

