# DEPRECATED — use set_moderate or set_standard instead.
# Kept for backward compatibility, maps to MODERATE (1200 ticks = 1 minute).
data modify storage rituals:config soul_xp_interval set value 1200
tellraw @s [{"text":"[Rituals] ","color":"gold"},{"text":"XP rate preset: ","color":"green"},{"text":"MODERATE (1m)","color":"aqua","bold":true},{"text":" (\"medium\" is now \"moderate\")","color":"gray"}]
scoreboard players set @a rituals.soul_timer 0
