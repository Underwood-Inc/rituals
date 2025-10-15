# ========================================
# Remove All Detection Beams
# ========================================
# Called when ritual is activated (items consumed)
# Removes beacon blocks and markers

# Remove all beam markers and their associated blocks
execute as @e[type=marker,tag=rituals.beam_marker] at @s run function rituals:visual/remove_beam_at_marker

# Clean up any orphaned markers
kill @e[type=marker,tag=rituals.beam_marker]

