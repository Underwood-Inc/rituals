# ========================================
# Scrying Glass - Charge Tick
# ========================================
# Called each tick while player is zoomed with scrying glass
# Triggers sync after 60 ticks (~3 seconds) of continuous zoom

# Ensure score exists
execute unless score @s rituals.scrying_charge matches 0.. run scoreboard players set @s rituals.scrying_charge 0

# Increment charge
scoreboard players add @s rituals.scrying_charge 1

# Show charging feedback (every 20 ticks = 1 second)
execute if score @s rituals.scrying_charge matches 20 run tellraw @s [{"text":"✦ ","color":"dark_purple"},{"text":"The glass begins to resonate...","color":"gray","italic":true}]
execute if score @s rituals.scrying_charge matches 40 run tellraw @s [{"text":"✦ ","color":"dark_purple"},{"text":"Soul energies gathering...","color":"light_purple","italic":true}]

# Trigger sync at 60 ticks (3 seconds)
execute if score @s rituals.scrying_charge matches 60 run function rituals:soul/scrying_glass_use

# Reset charge after triggering
execute if score @s rituals.scrying_charge matches 60.. run scoreboard players set @s rituals.scrying_charge 0

