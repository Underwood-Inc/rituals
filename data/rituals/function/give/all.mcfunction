# Give all totem items to the executing player
function rituals:give/totem_basic
function rituals:give/totem_copper
function rituals:give/totem_advanced
function rituals:give/totem_gold
function rituals:give/totem_master
function rituals:give/totem_netherite
function rituals:give/totems_short
function rituals:give/handheld_totems
function rituals:give/handheld_companions
function rituals:give/paste
function rituals:give/upgrade_slates
function rituals:give/guidebook
tellraw @s [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Gave all items + Guidebook!","color":"green","bold":false}]
