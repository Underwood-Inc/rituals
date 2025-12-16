# ========================================
# Give Scrying Glass
# ========================================
# A mystical lens that can sync soul weapon progress without a totem
# Has 5 uses before breaking
# Has enchantment glint to distinguish from vanilla spyglass

give @s minecraft:spyglass[custom_name='{"text":"✦ Scrying Glass","color":"light_purple","italic":false}',lore=['{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}','{"text":"A mystical lens attuned to souls.","color":"gray","italic":true}','{"text":"","color":"gray"}','{"text":"Uses Remaining: 5","color":"aqua"}','{"text":"","color":"gray"}','{"text":"▶ Hold Soul Weapon in OFFHAND","color":"yellow"}','{"text":"▶ Look through this glass","color":"yellow"}','{"text":"▶ Soul progress syncs!","color":"green"}','{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple"}'],enchantment_glint_override=true,custom_model_data=8675309,custom_data={rituals_scrying_glass:1b,scrying_uses:5}] 1

tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Gave Scrying Glass (5 uses)!","color":"light_purple"}]
