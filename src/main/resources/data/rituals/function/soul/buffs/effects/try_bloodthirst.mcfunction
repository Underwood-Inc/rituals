# ========================================
# Bloodthirst - Damage if No Combat
# ========================================
# Tracks time since last combat. If 30 seconds pass without the player
# hitting anything, applies wither effect as punishment.
#
# Uses rituals.combat_timer scoreboard (ticks since last hit).
# Reset to 0 when a mob near the player has HurtTime:10s.
# At 600 ticks (30s): apply wither. Every 200 ticks after: apply again.

# Check if player recently hit something (reset timer)
execute if entity @e[type=!player,type=!item,distance=..5,nbt={HurtTime:10s}] run scoreboard players set @s rituals.combat_timer 0

# Increment combat timer
scoreboard players add @s rituals.combat_timer 1

# At 600 ticks (30 seconds), apply wither and warning
execute if score @s rituals.combat_timer matches 600 run tellraw @s [{"text":"☠ ","color":"dark_red"},{"text":"Your weapon thirsts for blood...","color":"red","italic":true}]
execute if score @s rituals.combat_timer matches 600 run effect give @s wither 5 0 true

# Every 200 ticks (10 seconds) after the first trigger, apply again
execute if score @s rituals.combat_timer matches 800 run effect give @s wither 5 0 true
execute if score @s rituals.combat_timer matches 800 run scoreboard players set @s rituals.combat_timer 601

# Particles: dark dripping effect when timer is high
execute if score @s rituals.combat_timer matches 500.. run particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.01 1
