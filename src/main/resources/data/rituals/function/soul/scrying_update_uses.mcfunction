# ========================================
# Update Scrying Glass Uses (Macro)
# ========================================
$item replace entity @s weapon.mainhand with minecraft:spyglass[custom_name='{"text":"✦ Scrying Glass","color":"light_purple","italic":false}',lore=['{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}','{"text":"A mystical lens attuned to souls.","color":"gray","italic":true}','{"text":"","color":"gray"}','{"text":"Uses Remaining: $(new_uses)","color":"aqua"}','{"text":"","color":"gray"}','{"text":"▶ Hold Soul Weapon in OFFHAND","color":"yellow"}','{"text":"▶ Look through this glass","color":"yellow"}','{"text":"▶ Soul progress syncs!","color":"green"}','{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}'],enchantment_glint_override=true,custom_model_data=8675309,custom_data={rituals_scrying_glass:1b,scrying_uses:$(new_uses)}] 1

$tellraw @s [{"text":"  ","color":"gray"},{"text":"($(new_uses) uses remaining)","color":"dark_gray","italic":true}]
