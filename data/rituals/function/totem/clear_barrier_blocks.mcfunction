# ========================================
# Remove collision barrier blocks for this totem
# ========================================
# Runs as and at the totem interaction entity

execute if block ~ ~ ~ barrier run setblock ~ ~ ~ air
execute if block ~ ~1 ~ barrier run setblock ~ ~1 ~ air
