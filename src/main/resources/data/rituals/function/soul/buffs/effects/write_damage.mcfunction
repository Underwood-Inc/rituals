# Macro: sets the damage component on the player's mainhand item.
# Called with {new_damage: <int>} from try_repair, try_unbreaking, try_fragile.
$item modify entity @s weapon.mainhand {function:"set_components",components:{"minecraft:damage":$(new_damage)}}
