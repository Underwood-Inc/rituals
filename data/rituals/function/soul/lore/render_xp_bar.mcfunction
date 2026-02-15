# ========================================
# Render Proportional XP Progress Bar
# ========================================
# Inserts a visual 10-segment XP bar into lore at index 3.
# Each segment represents 10% of XP progress toward next level.
#
# Uses score-based dispatch for the bar shape (█ filled, ░ empty)
# and macro substitution for the percentage number.
#
# Expects:
#   Score:   #bar_filled rituals.soul_temp (0-10, clamped)
#   Storage: rituals:temp { bar_percent: <int> }
#
# Called via: function rituals:soul/lore/render_xp_bar with storage rituals:temp

$execute if score #bar_filled rituals.soul_temp matches ..0 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"░░░░░░░░░░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 1 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"█","color":"green","italic":false},{"text":"░░░░░░░░░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 2 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"██","color":"green","italic":false},{"text":"░░░░░░░░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 3 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"███","color":"green","italic":false},{"text":"░░░░░░░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 4 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"████","color":"green","italic":false},{"text":"░░░░░░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 5 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"█████","color":"green","italic":false},{"text":"░░░░░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 6 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"██████","color":"green","italic":false},{"text":"░░░░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 7 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"███████","color":"green","italic":false},{"text":"░░░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 8 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"████████","color":"green","italic":false},{"text":"░░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 9 run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"█████████","color":"green","italic":false},{"text":"░","color":"dark_gray","italic":false},{"text":" $(bar_percent)%","color":"gray","italic":false}]
$execute if score #bar_filled rituals.soul_temp matches 10.. run data modify storage rituals:temp new_lore insert 3 value [{"text":"  ","italic":false},{"text":"██████████","color":"green","italic":false},{"text":" $(bar_percent)%","color":"green","italic":false}]
