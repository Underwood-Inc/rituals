# ========================================
# Display help info
# ========================================

tellraw @s {"text":"========================================","color":"gold"}
tellraw @s [{"text":"Totem Rituals ","color":"gold","bold":true},{"text":"Help","color":"white"}]
tellraw @s {"text":"========================================","color":"gold"}
tellraw @s ""
tellraw @s [{"text":"🔮 ","color":"light_purple"},{"text":"Getting Started:","color":"yellow","bold":true}]
tellraw @s [{"text":"  • Get guidebook: ","color":"gray"},{"text":"/function rituals:give/guidebook","color":"green","clickEvent":{"action":"suggest_command","value":"/function rituals:give/guidebook"},"hoverEvent":{"action":"show_text","value":"Click to run"}}]
tellraw @s [{"text":"  • Press ","color":"gray"},{"text":"L","color":"aqua","bold":true},{"text":" to open Advancement Guide","color":"gray"}]
tellraw @s [{"text":"  • Get all items: ","color":"gray"},{"text":"/function rituals:give/all","color":"green","clickEvent":{"action":"suggest_command","value":"/function rituals:give/all"},"hoverEvent":{"action":"show_text","value":"Click to run"}}]
tellraw @s ""
tellraw @s [{"text":"⚙️  ","color":"gray"},{"text":"Config Commands:","color":"yellow","bold":true}]
tellraw @s [{"text":"  • Reload config: ","color":"gray"},{"text":"/function rituals:config/reload","color":"green","clickEvent":{"action":"suggest_command","value":"/function rituals:config/reload"},"hoverEvent":{"action":"show_text","value":"Click to run"}}]
tellraw @s [{"text":"  • Edit config: ","color":"gray"},{"text":"/data get storage rituals:config","color":"green","clickEvent":{"action":"suggest_command","value":"/data get storage rituals:config"},"hoverEvent":{"action":"show_text","value":"Click to view config"}}]
tellraw @s [{"text":"  • Modify value: ","color":"gray"},{"text":"/data modify storage rituals:config <key> set value <value>","color":"green","clickEvent":{"action":"suggest_command","value":"/data modify storage rituals:config "},"hoverEvent":{"action":"show_text","value":"Click to start command"}}]
tellraw @s ""
tellraw @s [{"text":"📜 ","color":"white"},{"text":"Ritual Effects:","color":"yellow","bold":true}]
tellraw @s [{"text":"  • ","color":"gray"},{"text":"Emerald","color":"green"},{"text":": Growth (crops)","color":"gray"}]
tellraw @s [{"text":"  • ","color":"gray"},{"text":"Diamond","color":"aqua"},{"text":": Strength (players)","color":"gray"}]
tellraw @s [{"text":"  • ","color":"gray"},{"text":"Gold Ingot","color":"gold"},{"text":": Prosperity (items/XP)","color":"gray"}]
tellraw @s [{"text":"  • ","color":"gray"},{"text":"Iron Ingot","color":"gray"},{"text":": Protection (damage mobs)","color":"gray"}]
tellraw @s [{"text":"  • ","color":"gray"},{"text":"Nether Star","color":"light_purple"},{"text":": Healing (regeneration)","color":"gray"}]
tellraw @s [{"text":"  • ","color":"gray"},{"text":"Arrow","color":"red"},{"text":": Sentry (auto-attack)","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"✨ ","color":"yellow"},{"text":"Single-Totem Mode:","color":"yellow","bold":true}]
tellraw @s [{"text":"  • All rituals work with ","color":"gray"},{"text":"ONE","color":"green","bold":true},{"text":" totem by default!","color":"gray"}]
tellraw @s [{"text":"  • Just place, add item, enjoy!","color":"gray"}]
tellraw @s [{"text":"  • See ","color":"gray"},{"text":"SINGLE_TOTEM_MODE.md","color":"aqua"},{"text":" for details","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"🔴 ","color":"red"},{"text":"Range Display:","color":"red","bold":true}]
tellraw @s [{"text":"  • Power totem with ","color":"gray"},{"text":"redstone","color":"red"},{"text":" to show range!","color":"gray"}]
tellraw @s [{"text":"  • Works with: lever, torch, block, wire, button","color":"gray"}]
tellraw @s [{"text":"  • See ","color":"gray"},{"text":"REDSTONE_RANGE_DISPLAY.md","color":"aqua"},{"text":" for details","color":"gray"}]
tellraw @s ""
tellraw @s {"text":"========================================","color":"gold"}

