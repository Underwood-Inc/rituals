# Pattern-Based Rituals - Complete Guide

This guide explains how to use the **multi-totem pattern ritual system** in the Ritualsack. These advanced rituals require multiple totems arranged in specific geometric patterns, with each totem displaying a specific required item.

---

## 🎯 Quick Start

### How Pattern Rituals Work

1. **Place Central Totem** - Put down a totem and add the **central item** (determines ritual type)
2. **Power with Redstone** - Place redstone next to the central totem to see **particle markers** showing where other totems should go
3. **Place Surrounding Totems** - Follow the particle guides to place totems at exact positions
4. **Add Required Items** - Each surrounding totem needs a specific item (shown in particle colors)
5. **Perform Fire Sacrifice** - Place 4 iron ingots (or higher tier) around the central totem and light fire (unless Kiwi Mode is enabled)
6. **Ritual Activates!** - If pattern is complete and correct:
   - Central totem remains with its item (permanently active)
   - **All surrounding totems are SACRIFICED** (completely destroyed with no drops!)
   - Ritual effect begins immediately (e.g., auto-breeding breeds at least one pair instantly)
   - Ritual runs permanently until the central totem is broken or item removed

### Visual Pattern Guides

When you **power a totem with redstone** (place redstone block/torch/lever next to it), colored particles will appear showing:
- **Where surrounding totems should be placed** (particle location)
- **What item goes on each totem** (particle color indicates item type)
- **The overall pattern shape** (wireframe connecting particles)

This makes setup MUCH easier - you don't need to memorize coordinates!

---

## 📐 Pattern Types

### ⭐ Star Pattern (4 Cardinals)

**Rituals Using This Pattern:**
- Auto-Breeding

**Total Totems:** 5 (1 center + 4 cardinals)  
**Distance:** 5 blocks in N/E/S/W directions  
**Difficulty:** ⭐ Easy

**How to Set Up:**
1. Place central totem, add **Wheat**
2. Power with redstone to see cardinal markers (green, orange, brown, red particles)
3. Place 4 totems at N/E/S/W positions (5 blocks away from center)
4. Add items to cardinals:
   - North (green particles): Seeds
   - East (orange particles): Carrot
   - South (brown particles): Potato
   - West (red particles): Beetroot Seeds
5. Fire sacrifice at center (4 iron ingots + fire)
6. Ritual activates! The 4 surrounding totems are **sacrificed** (destroyed)
7. Central totem remains - animals will auto-breed every 3 minutes (default)
8. Immediate effect: At least one breeding pair of each animal type breeds instantly on activation!

**Effect Range:** Based on central totem tier (Wood = 8 blocks, Netherite = 32 blocks)  
**Frequency:** Every 3 minutes (180 seconds / 3600 ticks) by default  
**Animals Affected:** Cows, Sheep, Pigs, Chickens, Rabbits, Horses, Wolves, Cats

![Auto-Breeding Ritual Setup](../images/breeding%20ritual.webp)

---

## 🔍 Troubleshooting

### Pattern Not Activating

**Check these things:**
1. **Central totem has correct item?** - Must be exact item for ritual type
2. **All surrounding totems in correct positions?** - Use redstone visualization to verify
3. **All surrounding totems have correct items?** - Each position needs specific item
4. **Performed fire sacrifice?** - Need catalyst items + fire at central totem
5. **Totems within height tolerance?** - All totems should be at same Y-level (±1 block OK)

### How to Use Redstone Visualization

Place any of these redstone sources next to your central totem:
- Redstone Block (permanent)
- Redstone Torch (permanent)
- Lever (toggle on/off)
- Button (temporary)
- Powered Redstone Wire

Colored particle markers will appear showing where surrounding totems should go!

### Error Messages

| Message | Meaning | Solution |
|---------|---------|----------|
| "Pattern incomplete! Found X/Y totems" | Missing totems or wrong positions | Use redstone to see where totems should be |
| "Pattern incomplete! Found X/Y totems with correct items" | Totems placed but wrong items | Check each totem has the correct item for its position |
| No message, ritual doesn't activate | Fire sacrifice requirements not met | Drop catalyst items and light fire at central totem |
| No pattern particles showing | Central totem doesn't have pattern ritual item OR not powered | Verify item is Wheat AND redstone is active |

### Particle Visualization Behavior Matrix

| Totem State | Item on Totem | Redstone Power | Particles Shown |
|-------------|---------------|----------------|-----------------|
| Empty (no item) | None | OFF | ❌ None |
| Empty (no item) | None | ON | ❌ None (tier range box only) |
| Has item | Pattern ritual item | OFF | ❌ None |
| Has item | Pattern ritual item | ON | ✅ **Pattern particles** (colored markers) |
| Has item | Regular ritual item | OFF | ❌ None |
| Has item | Regular ritual item | ON | ❌ None (tier range box only) |

**Pattern Ritual Items:** Wheat  
**Regular Ritual Items:** Emerald, Diamond, Nether Star, Iron Ingot, Netherite Block, Arrow, Diamond Hoe

---

## 💡 Pro Tips

### Using Redstone Visualization

**Best Practice:** 
1. Place central totem with **Wheat**
2. Place redstone block next to it
3. Particles show exact spots for surrounding totems
4. Place totems one by one, checking particle positions
5. Remove redstone when done (optional)

**Tip:** Leave redstone in place while adding items to surrounding totems so you can reference the particle colors!

#### How Pattern Detection Works

The system **reads the item on the central totem every tick** (20 times per second) to determine which pattern to show:

- **Wheat** → Star pattern particles (4 cardinals, colored by item type)
- **Any other item** → No pattern particles (shows tier range only)

**Important Notes:**
- ✅ Particles **only appear** when totem has a pattern ritual item AND is powered with redstone
- ✅ Particles **update instantly** when you swap the central item (changes within 1 tick / 0.05 seconds)
- ❌ Regular ritual items (Emerald, Diamond, Nether Star, etc.) do **NOT** show pattern particles
- ❌ Totems without items do **NOT** show pattern particles (only tier range box)

#### Dynamic Item Swapping

You can swap items on the central totem while redstone is powered to see different patterns:

```
Wheat on totem + Redstone → Star pattern (green/yellow particles)
  ↓ (swap item)
Wheat on totem + Redstone → Star pattern (colored particles)
  ↓ (swap item)  
Emerald on totem + Redstone → No pattern (only tier range)
```

This lets you preview different ritual patterns without rebuilding!

### Flat vs Uneven Terrain

- **Flat terrain:** Easiest - all totems at same height
- **Uneven terrain:** OK if within ±1 block height difference
- **Very uneven:** Use pillars/platforms to level out totem positions

### Pattern Ritual vs Regular Ritual

| Regular Rituals | Pattern Rituals |
|----------------|-----------------|
| 1+ totems with SAME item | Multiple totems with DIFFERENT items |
| Flexible totem placement | EXACT positions required |
| Permanent until deactivated | Permanent until item removed |
| Examples: Growth, Strength, Healing | Example: Auto-Breeding |

---

## 📊 Pattern Ritual Comparison

| Ritual | Pattern | Totems | Setup Time | Difficulty | Effect Type |
|--------|---------|--------|------------|------------|-------------|
| Auto-Breeding | Star | 5 | 5 min | Easy | Permanent Area Effect |

---

## 🎨 Understanding Particle Colors

When using redstone visualization, particles show different colors for different required items:

### Auto-Breeding (Star)
- **Yellow** = Seeds
- **Orange** = Carrot
- **Tan** = Potato
- **Red** = Beetroot Seeds

---

## 🔮 Advanced: Creating Your Own Patterns

Want to add custom pattern rituals? The system is designed to be expandable!

### Pattern Detection Files

Location: `data/rituals/function/ritual/patterns/`

- `detect_central_ritual.mcfunction` - Checks central item and routes to pattern checker
- `square/detect_*.mcfunction` - Square pattern detection
- `star/detect_*.mcfunction` - Star pattern detection
- `hexagon/detect_*.mcfunction` - Hexagon pattern detection

### Pattern Visualization Files

Location: `data/rituals/function/totem/patterns/`

- `visualize_pattern.mcfunction` - Routes to correct visualization
- `visualize_square.mcfunction` - Shows square pattern particles
- `visualize_star.mcfunction` - Shows star pattern particles
- `visualize_hexagon_*.mcfunction` - Shows hexagon pattern particles

### Adding New Patterns

To add a new pattern ritual:
1. Create detection function in `patterns/[shape]/`
2. Create visualization function in `totem/patterns/`
3. Add case to `detect_central_ritual.mcfunction`
4. Add case to `visualize_pattern.mcfunction`
5. Document in `MULTI_TOTEM_PATTERNS.md`

---

## 📚 See Also

- **[MULTI_TOTEM_PATTERNS.md](MULTI_TOTEM_PATTERNS.md)** - Detailed ASCII diagrams and coordinates
- **[FIRE_SACRIFICE_GUIDE.md](FIRE_SACRIFICE_GUIDE.md)** - How to perform fire sacrifices
- **[SYSTEM_OVERVIEW.md](SYSTEM_OVERVIEW.md)** - Technical architecture documentation
- **[README.md](../README.md)** - Main datapack documentation

---

**Happy Ritualing!** 🔮✨

Remember: When in doubt, use redstone visualization to guide your totem placement!

---

## 🔗 Navigation

- **[← Back to Documentation Index](README.md)** - All guides and references
- **[← Back to Main README](../README.md)** - Project overview
- **[📚 Multi-Totem Patterns](MULTI_TOTEM_PATTERNS.md)** - Detailed pattern diagrams with coordinates
- **[🔍 Pattern Visualization](PATTERN_VISUALIZATION_BEHAVIOR.md)** - Redstone visualization system
- **[🛠️ Implementation Summary](IMPLEMENTATION_SUMMARY.md)** - Technical implementation details
- **[✨ Coming Soon Rituals](COMING_SOON_RITUALS.md)** - Future pattern rituals

---

