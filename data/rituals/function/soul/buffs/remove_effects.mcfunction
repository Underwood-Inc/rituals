# ========================================
# Remove Soul Buff Effects
# ========================================
# Called when player stops holding soul weapon
# Removes all attribute modifiers

# Remove all soul-related attribute modifiers
attribute @s minecraft:player.block_break_speed modifier remove rituals:soul_haste
attribute @s minecraft:player.block_interaction_range modifier remove rituals:soul_reach
attribute @s minecraft:player.entity_interaction_range modifier remove rituals:soul_reach_entity
attribute @s minecraft:player.luck modifier remove rituals:soul_luck
attribute @s minecraft:player.luck modifier remove rituals:soul_unlucky
attribute @s minecraft:player.movement_speed modifier remove rituals:soul_swift
attribute @s minecraft:player.movement_speed modifier remove rituals:soul_heavy
attribute @s minecraft:player.attack_damage modifier remove rituals:soul_strong
attribute @s minecraft:player.armor modifier remove rituals:soul_tough

