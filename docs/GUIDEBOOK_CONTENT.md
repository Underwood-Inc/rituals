# In-Game Guidebook Content Reference

This document contains the complete content of the in-game guidebook for reference and editing purposes.

---

## 📖 Book Metadata

- **Title**: Totem Rituals Guide
- **Author**: Ancient Ritualist
- **Generation**: 0 (original)
- **Total Pages**: 23

---

## 📄 Page Contents

### Page 1: Title Page
```
Totem Rituals

Welcome Ritualist!

This guide teaches the ancient art of totem magic.

Press L for the full Advancement Guide!
```

### Page 2: Getting Started
```
Getting Started

1. Craft a totem
2. Right-click to place
3. Add item on top
4. Drop 4 catalysts (N/S/E/W)
5. Light fire
6. Ritual activates!

Single totem works!
```

### Page 3: Fire Sacrifice System
```
Fire Sacrifice

NEW! Rituals need fire to activate!

1. Place totem + item
2. Drop 4 catalysts around it
3. Light fire at base
4. Offerings consumed
5. Magic begins!
```

### Page 4: Catalyst Costs
```
Catalyst Costs

By Tier:

Wood: 4 Coal
Copper: 4 Copper
Iron: 4 Iron
Gold: 4 Gold
Diamond: 4 Diamond
Netherite: 4 Netherite

Higher tier = higher cost!
```

### Page 5: Totem Tiers (Part 1)
```
Totem Tiers

1. Wood - Basic
   Range: 2×2×6
2. Copper - Improved
   Range: 3×3×8
3. Iron - Strong
   Range: 4×4×10
4. Gold - Very Strong
   Range: 5×5×12
```

### Page 6: Totem Tiers (Part 2)
```
Tiers Continued

5. Diamond - Powerful
   Range: 6×6×14
6. Netherite - Ultimate
   Range: 7×7×16

Higher tier = larger range and stronger effects!
```

### Page 7: Area Effect Rituals (Part 1)
```
Area Effect Rituals

Emerald - Growth
Grows crops nearby

Diamond - Strength
Buffs players

Netherite Block
Prosperty: Items+XP

Permanent until deactivated
```

### Page 8: Area Effect Rituals (Part 2)
```
More Area Effects

Iron Ingot
Protection: Damage mobs

Nether Star
Healing: Regeneration

Arrow
Sentry: Auto-fires (2× range!)

Diamond Hoe
Auto-Farming (4+ totems)
```

### Page 9: Pattern Rituals Introduction
```
Pattern Rituals!

NEW SYSTEM!

Some rituals need multiple totems in SPECIFIC patterns with SPECIFIC items!

4 types:
- Square (4 corners)
- Star (4 cardinals)
- Hexagon (6 around)

See next pages!
```

### Page 10: Pattern Guide System
```
Pattern Guide System

1. Place central totem with pattern item
2. Power with REDSTONE
3. Colored particles show where totems go!
4. Follow particle guides
5. Add required items
6. Fire sacrifice!
```

### Page 11: Auto-Breeding Pattern
```
Auto-Breeding
Star Pattern

Central: Wheat

Cardinals (5 blocks):
N: Seeds
E: Carrot
S: Potato
W: Beetroot Seeds

Auto-breeds animals in range (permanent)
```

### Page 12: Pattern Tips
```
Pattern Tips

- Use redstone to see particle guides!
- Particles show exact positions
- Colors indicate which item
- Swap items to preview patterns
- Works on uneven terrain (±1 block)
```

### Page 16: Crafting Wood Totem
```
Crafting: Wood Totem

    [S]
 [S][P][S]
    [P]

S = Stick
P = Oak Planks

Result:
1 Wood Totem

Short: Skip top row
```

### Page 17: Crafting Iron Totem
```
Crafting: Iron Totem

    [I]
 [I][B][I]
    [B]

I = Iron Ingot
B = Iron Block

Result:
1 Iron Totem

All tiers follow this pattern!
```

### Page 18: Crafting Netherite Totem
```
Crafting: Netherite Totem

    [N]
 [N][B][N]
    [B]

N = Netherite Ingot
B = Netherite Block

Result:
1 Netherite Totem

Ultimate power!
```

### Page 19: Range Display
```
Range Display

Power totem with redstone to see range!

Red particles = tier range
Colored particles = pattern positions

Works with lever, torch, redstone block, button
```

### Page 20: Helpful Commands
```
Helpful Commands

/function rituals:help
Shows help menu

/function rituals:give/all
Get all items

/function rituals:give/guidebook
Get another book
```

### Page 21: Advanced Tips
```
Advanced Tips

- Pattern rituals need exact item per totem
- Regular rituals need same item
- Fire sacrifice required by default
- Can disable in config
- See docs/ folder for ASCII diagrams!
```

### Page 22: Configuration
```
Configuration

Customize settings:

/data get storage rituals:config

Key settings:
require_fire_sacrifice
min_totems_required
max_totem_distance
```

### Page 23: Closing
```
Happy Ritualing!

May your totems shine bright and your patterns align true!

For detailed guides:
- docs/PATTERN_RITUALS_GUIDE.md
- docs/FIRE_SACRIFICE_GUIDE.md

- Ancient Ritualist
```

---

## 🎨 Color Scheme

The guidebook uses color-coded pages for visual organization:

| Color | Used For | Pages |
|-------|----------|-------|
| Dark Purple | Title, Pattern Intro, Closing | 1, 9, 11, 18, 23 |
| Black | Getting Started | 2 |
| Gold | Fire Sacrifice, Pattern Guide, Commands | 3, 10, 20 |
| Dark Red | Catalyst Costs | 4 |
| Dark Green | Totem Tiers | 5 |
| Aqua | Totem Tiers (continued) | 6 |
| Green | Area Effects (Growth, Breeding) | 7, 12 |
| Blue | Area Effects (Protection), Config | 8, 22 |
| Dark Aqua | Item Vacuum | 13 |
| Red | Auto-Smelting, Range Display | 14, 19 |
| Yellow | Pattern Tips | 15 |
| Dark Gray / Gray | Crafting Recipes | 16, 17 |

---

## 📊 Content Coverage

### ✅ Covered Topics
- Fire sacrifice system and catalyst costs
- All 6 totem tiers with ranges
- 7 area effect rituals (Growth, Strength, Prosperity, Protection, Healing, Sentry, Auto-Farming)
- 1 pattern-based ritual (Auto-Breeding)
- Redstone pattern visualization system
- Basic crafting recipes
- Range display system
- Commands and configuration

### ⚠️ Condensed Topics (See External Docs)
- Detailed crafting recipes (see CRAFTING_RECIPES.md)
- ASCII pattern diagrams (see MULTI_TOTEM_PATTERNS.md)
- Complete ritual specifications (see PATTERN_RITUALS_GUIDE.md)
- Upgrade system details (mentioned but not detailed)
- Ritual paste crafting (removed to save space)
- Multi-totem mode configuration (mentioned briefly)

### ❌ Not Covered (Too Advanced/Detailed)
- Custom pattern creation
- Technical architecture
- Performance considerations
- Advancement tree details
- Build/compilation instructions

---

## 📝 Editing Guidelines

### When Updating the Guidebook:

1. **Keep it concise** - Book pages are limited to ~256 characters each
2. **Use color strategically** - Related topics should use similar colors
3. **Prioritize critical info** - Fire sacrifice and pattern rituals are must-haves
4. **Reference external docs** - For detailed guides, point to markdown files
5. **Test in-game** - Verify colors render correctly and text fits on pages
6. **Update this document** - Keep this reference file in sync with the actual book

### Character Limits Per Page:
- **Safe limit**: 200-220 characters
- **Maximum**: ~250 characters (may cause issues)
- **Formatting counts**: `\n` counts as 2 characters

### JSON Formatting:
```json
'{"text":"Your text here\\n\\nNew paragraph","color":"dark_purple","bold":true}'
```

Remember: `\n` = newline, `\"` = escaped quote

---

## 🔄 Version History

### Current Version (Pattern Rituals Update)
- Added fire sacrifice system (Pages 3-4)
- Added pattern rituals introduction (Pages 9-15)
- Added all 4 pattern ritual recipes
- Added redstone pattern visualization
- Condensed crafting recipes to save space
- Updated ritual list with Auto-Farming
- Updated tips with pattern-specific advice
- Updated closing with doc references

### Previous Version
- Basic ritual system
- 6 totem tiers
- 6 area effect rituals
- All crafting recipes in detail
- Ritual paste crafting
- Upgrade slate info
- Multi-totem mode config

---

## 💡 Future Considerations

If more pages are needed:
- Could split into Volume 1 (Basics) and Volume 2 (Advanced Patterns)
- Could create separate "Pattern Guide" book
- Could make interactive tellraw guide instead of static book

For now, 23 pages covers all critical information while staying manageable!

---

**Last Updated**: Pattern Rituals System Implementation  
**Book Format Version**: 1.21+ (written_book format)

