# ========================================
# Add Soul Identity to Lore (Macro)
# ========================================
# Shows the soul's true name in the footer

# Get the soul's true name for the macro
data modify storage rituals:temp soul_identity set from storage rituals:temp item.components."minecraft:custom_data".soul_name
function rituals:soul/lore/add_soul_identity_macro with storage rituals:temp
data remove storage rituals:temp soul_identity


