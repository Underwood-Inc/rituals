# ========================================
# Process a mining hit on the totem
# ========================================
# Legacy entry — prefer increment_mine_progress on the attacked totem (@s) from check_tool.
# Runs as player, at totem (position from caller execute at @s).

execute as @e[type=interaction,tag=rituals.totem,sort=nearest,limit=1,distance=..3] at @s run function rituals:totem/increment_mine_progress
