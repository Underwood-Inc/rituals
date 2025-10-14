# Fire Sacrifice System - Changelog

## Version 2.0 - Fire Sacrifice Update

### 🔥 Major New Feature: Fire Sacrifice System

Rituals now require a **Fire Sacrifice** to activate! This replaces the automatic activation system with a more immersive, balanced, and intentional ritual mechanic.

#### How It Works
1. Place your totem and add a ritual item (Diamond, Emerald, etc.)
2. Drop 4 catalyst items on the ground around the totem (N/S/E/W)
3. Light fire at the totem's base
4. The offerings are consumed in dramatic fashion and the ritual activates!

#### Catalyst Costs
- **Tier 1 (Wood)**: 4× Coal
- **Tier 2 (Copper)**: 4× Copper Ingot
- **Tier 3 (Iron)**: 4× Iron Ingot
- **Tier 4 (Gold)**: 4× Gold Ingot
- **Tier 5 (Diamond)**: 4× Diamond
- **Tier 6 (Netherite)**: 4× Netherite Ingot

### ✨ New Features

#### Fire Detection System
- Detects fire at totem base (multiple positions checked)
- Supports both regular fire and soul fire
- Fire is extinguished when consumed by ritual

#### Offering Detection
- Detects dropped items in 4 cardinal directions
- Checks for correct catalyst type based on totem tier
- Items must be on ground (not in player inventory)

#### Dramatic Visual Effects
- 🔥 Flame and lava particles at totem base
- ✨ Rising pillar of energy (enchant + end_rod particles)
- 🌟 Soul fire particles at each offering location
- 💀 Fire extinguishes when consumed

#### Audio Feedback
- Portal sounds for mystical atmosphere
- Blaze sounds for fire consumption
- Enchantment sounds for ritual activation
- Chat confirmation message with consumed item details

### ⚙️ Configuration

New config option: `require_fire_sacrifice`
- **Default**: `true` (fire sacrifice enabled)
- **Legacy Mode**: Set to `false` for automatic activation

```mcfunction
# Enable fire sacrifice (default)
/data modify storage rituals:config require_fire_sacrifice set value true

# Disable (auto-activation)
/data modify storage rituals:config require_fire_sacrifice set value false

# Apply changes
/function rituals:config/reload
```

### 📁 New Files Added

#### Functions
- `data/rituals/function/ritual/fire/check_sacrifice.mcfunction` - Main fire detection
- `data/rituals/function/ritual/fire/detect_offerings.mcfunction` - Offering detection router
- `data/rituals/function/ritual/fire/consume.mcfunction` - Consumes offerings and activates ritual
- `data/rituals/function/ritual/fire/catalysts/tier1.mcfunction` - Wood tier catalysts
- `data/rituals/function/ritual/fire/catalysts/tier2.mcfunction` - Copper tier catalysts
- `data/rituals/function/ritual/fire/catalysts/tier3.mcfunction` - Iron tier catalysts
- `data/rituals/function/ritual/fire/catalysts/tier4.mcfunction` - Gold tier catalysts
- `data/rituals/function/ritual/fire/catalysts/tier5.mcfunction` - Diamond tier catalysts
- `data/rituals/function/ritual/fire/catalysts/tier6.mcfunction` - Netherite tier catalysts

#### Documentation
- `FIRE_SACRIFICE_GUIDE.md` - Complete player guide
- `CHANGELOG_FIRE_SACRIFICE.md` - This file

### 🔧 Modified Files

#### Core System
- `data/rituals/function/tick.mcfunction` - Conditional activation based on config
- `data/rituals/function/load.mcfunction` - Added fire sacrifice mode flag
- `data/rituals/function/config/load.mcfunction` - Added `require_fire_sacrifice` config
- `data/rituals/function/config/reload.mcfunction` - Apply fire sacrifice mode on reload

#### Documentation
- `README.md` - Added fire sacrifice section, updated workflow
- `CONFIG_GUIDE.md` - Documented new config option

### 🎮 Gameplay Impact

#### Balance Changes
- **Resource Sink**: Each ritual activation now has a cost
- **Intentionality**: Players choose when rituals activate
- **Progression**: Higher tiers become more valuable as you automate resource production
- **Immersion**: Rituals feel more mystical and rewarding

#### Player Strategy
- **Early Game**: Wood totems with coal are affordable for learning
- **Mid Game**: Copper/Iron totems for regular use
- **Late Game**: Diamond/Netherite for permanent powerful setups
- **Automation**: Encourages building resource farms to sustain rituals

### 🐛 Bug Fixes
- None (new feature)

### ⚡ Performance
- **Minimal Impact**: Fire detection only runs on totems with items
- **No Tick Lag**: Offerings detected instantly, no continuous checks
- **Efficient Detection**: Uses NBT matching and distance checks
- **Cleanup**: Fire and items removed immediately after consumption

### 🔮 Future Enhancements

Potential additions to the fire sacrifice system:
- Different offering patterns (pentagram, circle, cross)
- Rare/expensive catalysts for ritual boosts
- Soul fire vs regular fire provides different effects
- Offering quality affects ritual power
- Multiple catalyst types for advanced rituals

### 📖 Migration Guide

#### For Players Using Auto-Activation

If you were using the old automatic activation system:

1. **Rituals will stop auto-activating** - you must now perform fire sacrifices
2. **Gather catalyst items** for your totem tier (see costs above)
3. **Read `FIRE_SACRIFICE_GUIDE.md`** for detailed instructions
4. **OR disable fire sacrifice** to keep old behavior (see config above)

#### For Server Admins

1. **Announce the change** to your players
2. **Provide catalyst items** or resource farms for transition
3. **Consider configuration** - keep auto-activation if preferred
4. **Monitor resource economy** - adjust costs if needed (via custom loot tables)

---

**Version**: 2.0  
**Date**: October 2025  
**Minecraft Version**: 1.21+  
**Pack Format**: 48


