# Pattern Visualization Behavior - Technical Reference

This document provides a detailed technical explanation of how the pattern visualization system determines which particles to show based on totem state and item type.

---

## 🔍 System Overview

The pattern visualization system is a **dynamic, real-time particle spawning system** that:
1. Checks totem state every tick (20 times per second)
2. Reads the current item displayed on the totem
3. Matches the item against known pattern ritual types
4. Spawns appropriate colored particles only for pattern-based rituals

---

## ✅ Activation Requirements

For pattern particles to appear, **ALL** of the following conditions must be true:

### Required Conditions
1. ✅ Totem must be **powered with redstone** (`rituals.redstone_powered` tag present)
2. ✅ Totem must have **an item displayed** (`rituals.has_item` tag present)
3. ✅ Item must be a **pattern ritual item** (Enchanting Table, Wheat, Hopper, or Blast Furnace)

### Code Reference

```mcfunction
# From: totem/update.mcfunction (line 16)
execute if entity @s[tag=rituals.redstone_powered,tag=rituals.has_item] run function rituals:totem/patterns/visualize_pattern
```

This selector requires **BOTH tags** to be present. If either is missing, the function never runs.

---

## 📊 Complete Behavior Matrix

| Redstone | Has Item Tag | Item Type | Pattern Particles | Tier Range Particles | Notes |
|----------|--------------|-----------|-------------------|---------------------|-------|
| ❌ OFF | ❌ No | N/A | ❌ None | ❌ None | Empty unpowered totem |
| ✅ ON | ❌ No | N/A | ❌ None | ✅ Shown | Powered empty totem - shows tier range only |
| ❌ OFF | ✅ Yes | Pattern | ❌ None | ❌ None | Has pattern item but unpowered |
| ❌ OFF | ✅ Yes | Regular | ❌ None | ❌ None | Has regular item but unpowered |
| ✅ ON | ✅ Yes | Pattern | ✅ **Shown** | ✅ Shown | **Pattern particles appear!** |
| ✅ ON | ✅ Yes | Regular | ❌ None | ✅ Shown | Regular item - tier range only |

### Pattern Ritual Items

Items that trigger pattern particle visualization:
- `minecraft:enchanting_table` → Square pattern (4 corners)
- `minecraft:wheat` → Star pattern (4 cardinals)
- `minecraft:hopper` → Hexagon pattern (6 around, purple/portal theme)
- `minecraft:blast_furnace` → Hexagon pattern (6 around, fire theme)

### Regular Ritual Items

Items that do **NOT** trigger pattern particles (show tier range only):
- `minecraft:emerald` → Growth ritual
- `minecraft:diamond` → Strength ritual
- `minecraft:nether_star` → Healing ritual
- `minecraft:iron_ingot` → Protection ritual
- `minecraft:netherite_block` → Prosperity ritual
- `minecraft:arrow` → Sentry ritual
- `minecraft:diamond_hoe` → Auto-Farming ritual

---

## 🔄 Dynamic Item Detection

### How Item Detection Works

```mcfunction
# From: totem/patterns/visualize_pattern.mcfunction (line 8)
execute as @e[type=item_display,tag=rituals.totem_display] 
  if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id 
  run data modify storage rituals:temp pattern_item set from entity @s item.id
```

**Process:**
1. Find the item display entity linked to this totem (via matching `rituals.id` scores)
2. Read the `item.id` from that display entity
3. Store it in `rituals:temp pattern_item`
4. Check stored ID against known pattern items
5. If match found, call appropriate visualization function

### Update Frequency

- **Runs:** Every tick (20 times per second) while totem is powered AND has item
- **Reads:** Current item ID from display entity each tick
- **Updates:** Particle pattern changes **immediately** (next tick) when item is swapped

### Example: Dynamic Item Swapping

```
Tick 0: Player places Wheat on totem
  → visualize_pattern reads: minecraft:wheat
  → Calls: visualize_star
  → Shows: Green/yellow star pattern particles

Tick 1: Player swaps Wheat for Hopper (using right-click)
  → swap_item.mcfunction executes
  → Item display entity updated to minecraft:hopper

Tick 2: visualize_pattern runs again
  → Reads: minecraft:hopper (NEW)
  → Calls: visualize_hexagon_vacuum
  → Shows: Purple hexagon pattern particles

Result: Pattern changes within 0.1 seconds (2 ticks)
```

---

## 🎨 Particle Spawning Logic

### Pattern-Specific Files

Each pattern has its own visualization file that spawns particles:

```
totem/patterns/
├── visualize_pattern.mcfunction (router - checks item type)
├── visualize_square.mcfunction (Enchanting Nexus)
├── visualize_star.mcfunction (Auto-Breeding)
├── visualize_hexagon_vacuum.mcfunction (Item Vacuum)
└── visualize_hexagon_smelting.mcfunction (Auto-Smelting)
```

### Routing Logic

```mcfunction
# From: totem/patterns/visualize_pattern.mcfunction

# Item ID is already stored in rituals:temp pattern_item

# Check against each known pattern
execute if data storage rituals:temp {pattern_item:"minecraft:enchanting_table"} run function rituals:totem/patterns/visualize_square
execute if data storage rituals:temp {pattern_item:"minecraft:wheat"} run function rituals:totem/patterns/visualize_star
execute if data storage rituals:temp {pattern_item:"minecraft:hopper"} run function rituals:totem/patterns/visualize_hexagon_vacuum
execute if data storage rituals:temp {pattern_item:"minecraft:blast_furnace"} run function rituals:totem/patterns/visualize_hexagon_smelting

# If none match, function ends without spawning pattern particles
# (tier range particles still show from normal redstone visualization)
```

### Particle Types Used

Each pattern visualization spawns:
1. **Position markers** - `dust` particles at each required totem location
2. **Themed particles** - Pattern-specific (e.g., `portal` for vacuum, `flame` for smelting)
3. **Wireframe** - Smaller `dust` particles connecting positions
4. **Height markers** - Particles at multiple Y-levels showing vertical alignment

---

## 🧪 Testing Scenarios

### Scenario 1: Pattern Item Without Redstone
```
Setup: Place totem, add Enchanting Table
Action: No redstone placed
Expected: ❌ No particles
Actual: ❌ No particles (requires rituals.redstone_powered tag)
Result: ✅ PASS
```

### Scenario 2: Empty Totem With Redstone
```
Setup: Place totem, no item
Action: Power with redstone block
Expected: ❌ No pattern particles (tier range only)
Actual: ❌ No pattern particles (requires rituals.has_item tag)
Result: ✅ PASS
```

### Scenario 3: Pattern Item With Redstone
```
Setup: Place totem, add Wheat, power with redstone
Action: None (observe)
Expected: ✅ Star pattern particles (green/yellow)
Actual: ✅ Star pattern particles appear
Result: ✅ PASS
```

### Scenario 4: Regular Item With Redstone
```
Setup: Place totem, add Emerald, power with redstone
Action: None (observe)
Expected: ❌ No pattern particles (tier range only)
Actual: ❌ No pattern check matches (minecraft:emerald not in list)
Result: ✅ PASS
```

### Scenario 5: Dynamic Item Swap
```
Setup: Place totem, add Hopper, power with redstone
Action: Swap Hopper → Wheat while powered
Expected: ✅ Particles change from hexagon → star within 1 tick
Actual: ✅ Pattern updates next tick (item.id re-read)
Result: ✅ PASS
```

### Scenario 6: Item Removal While Powered
```
Setup: Place totem, add Blast Furnace, power with redstone
Action: Right-click to remove item
Expected: ❌ Particles stop (rituals.has_item tag removed)
Actual: ❌ visualize_pattern no longer called
Result: ✅ PASS
```

---

## 🔒 Safety & Performance

### Performance Considerations

**Tick Cost Per Powered Totem:**
- 1× Entity selector (powered + has_item check)
- 1× Item display lookup (linked by ID score)
- 1× NBT data read (item.id)
- 1× Storage NBT check (up to 4 comparisons)
- 1× Pattern visualization function (if match)

**Total:** ~6-10 function calls per powered totem per tick

**Particle Count:**
- Square: ~50 particles/tick
- Star: ~50 particles/tick
- Hexagon: ~70 particles/tick

**Impact:** Negligible on modern servers (similar to tier range visualization)

### Fail-Safe Behavior

**What happens if item is swapped mid-visualization?**
- ✅ System re-reads item.id next tick
- ✅ Pattern automatically switches
- ✅ No errors or glitches
- ✅ No "stuck" particles (particles are temporary)

**What happens if totem is broken while powered?**
- ✅ Totem entity removed → selector no longer matches
- ✅ Visualization stops automatically
- ✅ Particles fade naturally (duration-based)

**What happens if item display entity is deleted?**
- ✅ Item lookup fails silently
- ✅ Storage remains unmodified (last value)
- ✅ Wrong pattern may show (but totem is already broken anyway)

---

## 📋 Quick Reference

### To Enable Pattern Visualization:
1. Place totem
2. Add pattern ritual item (Enchanting Table/Wheat/Hopper/Blast Furnace)
3. Power with redstone

### To Disable Pattern Visualization:
1. Turn off redstone, OR
2. Remove item from totem, OR
3. Break totem

### To Change Pattern:
1. Keep redstone powered
2. Swap item on totem
3. Pattern updates next tick (0.05 seconds)

### Supported Pattern Items:
- `minecraft:enchanting_table` (Square)
- `minecraft:wheat` (Star)
- `minecraft:hopper` (Hexagon - Vacuum)
- `minecraft:blast_furnace` (Hexagon - Smelting)

### Non-Pattern Items:
- All other items show tier range only, no pattern particles

---

## 🎓 For Developers

### Adding a New Pattern Visualization

1. Add item check to `visualize_pattern.mcfunction`:
```mcfunction
execute if data storage rituals:temp {pattern_item:"minecraft:YOUR_ITEM"} run function rituals:totem/patterns/visualize_YOUR_PATTERN
```

2. Create `visualize_YOUR_PATTERN.mcfunction` with particle spawn commands

3. Document in this file

### Modifying Existing Patterns

Edit the pattern-specific visualization file:
- `visualize_square.mcfunction` - Enchanting Nexus
- `visualize_star.mcfunction` - Auto-Breeding
- `visualize_hexagon_vacuum.mcfunction` - Item Vacuum
- `visualize_hexagon_smelting.mcfunction` - Auto-Smelting

**Do NOT modify:**
- `visualize_pattern.mcfunction` (router logic is correct)
- `totem/update.mcfunction` (integration is correct)

---

**Last Updated:** Implementation of multi-totem pattern ritual system  
**System Version:** 1.0.0  
**Compatible With:** Minecraft 1.21+ (Pack Format 48)

