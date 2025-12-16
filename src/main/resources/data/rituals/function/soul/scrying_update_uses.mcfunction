# ========================================
# Update Scrying Glass Uses (Macro)
# ========================================
$item replace entity @s weapon.mainhand with minecraft:spyglass[custom_name='{"text":"✦ Scrying Glass","color":"light_purple","italic":false}',lore=['{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","italic":false}','{"text":"A mystical lens attuned to souls.","color":"gray","italic":true}','{"text":"","italic":false}','{"text":"Uses Remaining: $(new_uses)","color":"aqua","italic":false}','{"text":"","italic":false}','{"text":"▶ Hold Soul Weapon in OFFHAND","color":"yellow","italic":false}','{"text":"▶ Look through this glass","color":"yellow","italic":false}','{"text":"▶ Soul progress syncs!","color":"green","italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","italic":false}'],enchantment_glint_override=true,custom_data={rituals_scrying_glass:1b,scrying_uses:$(new_uses)}] 1

$tellraw @s [{"text":"  ","color":"gray"},{"text":"($(new_uses) uses remaining)","color":"dark_gray","italic":true}]
