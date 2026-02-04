# ========================================
# Build Scrying Glass Lore (Macro)
# ========================================
# Creates properly formatted lore array with uses count
# Called with: $(scrying_uses)

# Build lore array with proper JSON text components
data modify storage rituals:temp scrying_lore set value []

# Header
data modify storage rituals:temp scrying_lore append value {"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","italic":false}

# Description
data modify storage rituals:temp scrying_lore append value {"text":"A mystical lens attuned to souls.","color":"gray","italic":true}

# Spacer
data modify storage rituals:temp scrying_lore append value {"text":"","italic":false}

# Uses count (injected via macro)
$data modify storage rituals:temp scrying_lore append value {"text":"Uses Remaining: $(scrying_uses)","color":"aqua","italic":false}

# Spacer
data modify storage rituals:temp scrying_lore append value {"text":"","italic":false}

# Instructions
data modify storage rituals:temp scrying_lore append value {"text":"▶ Hold Soul Weapon in OFFHAND","color":"yellow","italic":false}
data modify storage rituals:temp scrying_lore append value {"text":"▶ Look through this glass","color":"yellow","italic":false}
data modify storage rituals:temp scrying_lore append value {"text":"▶ Soul progress syncs!","color":"green","italic":false}

# Footer
data modify storage rituals:temp scrying_lore append value {"text":"━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","italic":false}

