# ========================================
# Give Scrying Glass
# ========================================
# A mystical lens that can sync soul weapon progress without a totem
# Has 5 uses before breaking
# Has enchantment glint to distinguish from vanilla spyglass

give @s minecraft:spyglass[custom_name='{"text":"✦ Scrying Glass","color":"light_purple","italic":false}',lore=['{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","italic":false}','{"text":"A mystical lens attuned to souls.","color":"gray","italic":true}','{"text":"","italic":false}','{"text":"Uses Remaining: 5","color":"aqua","italic":false}','{"text":"","italic":false}','{"text":"▶ Hold Soul Weapon in OFFHAND","color":"yellow","italic":false}','{"text":"▶ Look through this glass","color":"yellow","italic":false}','{"text":"▶ Soul progress syncs!","color":"green","italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","italic":false}'],enchantment_glint_override=true,custom_data={rituals_scrying_glass:1b,scrying_uses:5}] 1

tellraw @s [{"text":"[Rituals] ","color":"gold","bold":true},{"text":"Gave Scrying Glass (5 uses)!","color":"light_purple"}]
