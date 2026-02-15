# ========================================
# Remove Soul Buff Effects
# ========================================
# Called when player stops holding soul weapon
# Removes all attribute modifiers and clears potion effects

# Remove all soul-related attribute modifiers
# attribute @s minecraft:block_break_speed modifier remove rituals:soul_haste
attribute @s minecraft:block_interaction_range modifier remove rituals:soul_reach
attribute @s minecraft:entity_interaction_range modifier remove rituals:soul_reach_entity
attribute @s minecraft:luck modifier remove rituals:soul_luck
attribute @s minecraft:luck modifier remove rituals:soul_unlucky
attribute @s minecraft:movement_speed modifier remove rituals:soul_swift
attribute @s minecraft:movement_speed modifier remove rituals:soul_heavy
attribute @s minecraft:attack_damage modifier remove rituals:soul_strong
attribute @s minecraft:armor modifier remove rituals:soul_tough
attribute @s minecraft:luck modifier remove rituals:soul_looting

# Clear potion effects granted by soul buffs
# NOTE: This also clears these effects if obtained from other sources (potions, etc.)
# This is a known vanilla datapack limitation - no way to track effect source.
effect clear @s minecraft:night_vision
effect clear @s minecraft:water_breathing
effect clear @s minecraft:fire_resistance
effect clear @s minecraft:jump_boost

# Reset bloodthirst combat timer when weapon is unequipped
scoreboard players set @s rituals.combat_timer 0
