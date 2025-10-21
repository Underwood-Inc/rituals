# Current Ritual System Overview

## ✅ CURRENTLY IMPLEMENTED RITUALS (8 Total)

### Standard Single-Rituals
These work with 1+ totems displaying the same item. Fire sacrifice required to activate.

#### 1. Growth Ritual 🌱
- **Item**: `Emerald`
- **Effect**: Bonemeals crops/plants in range
- **Frequency**: 15s → 3s (tier 1→6)
- **Range**: Tier-based (2×2 to 7×7 horizontal)
- **Min Totems**: 1+

#### 2. Strength Ritual 💪
- **Item**: `Diamond`
- **Effect**: Grants Strength + Resistance buffs to players
- **Frequency**: 2s → 0.75s (tier 1→6)
- **Duration**: 10-30s based on tier
- **Range**: Tier-based
- **Min Totems**: 1+

#### 3. Prosperity Ritual 💰
- **Item**: `Netherite Block`
- **Effect**: Attracts items + grants Luck effect to players
- **Pull Speed**: 0.3 to 1.0 blocks/tick based on tier
- **Luck Level**: 0-2 based on tier (helps with loot drops)
- **Range**: Tier-based
- **Min Totems**: 1+

#### 4. Protection Ritual ⚔️
- **Item**: `Iron Ingot`
- **Effect**: Damages hostile mobs periodically
- **Damage**: 2-8 HP based on tier
- **Frequency**: 9s → 1.5s (tier 1→6)
- **Range**: Tier-based
- **Min Totems**: 1+

#### 5. Healing Ritual 💖
- **Item**: `Nether Star`
- **Effect**: Applies Regeneration to players and animals
- **Duration**: 10-120s based on tier
- **Frequency**: 3s → 1.25s (tier 1→6)
- **Bonus**: Absorption at tier 3+
- **Range**: Tier-based
- **Min Totems**: 1+

#### 6. Sentry Ritual 🏹
- **Item**: `Arrow`
- **Effect**: Fires homing magical projectiles at enemies
- **Targets**: Hostile mobs in range
- **Range**: Tier-based
- **Min Totems**: 1+

---

### Multi-Totem Pattern Rituals (3)
These require specific geometric patterns with multiple totems. Fire sacrifice at center required.

#### 7. Auto-Farming Ritual 🚜
- **Central Item**: `Diamond Hoe`
- **Pattern**: Square (4 corners)
- **Layout**: 4 totems at corners, 5 blocks diagonal from center
  ```
  Positions:
  NE (+5,+5): Wheat
  SE (+5,-5): Carrot
  SW (-5,-5): Potato
  NW (-5,+5): Beetroot
  ```
- **Required Items**: Wheat, Carrot, Potato, Beetroot (consumed on activation)
- **Effect**: Automatically harvests and replants fully grown crops every 5 seconds
- **Supported Crops**:
  - Wheat (age 7)
  - Carrots (age 7)
  - Potatoes (age 7)
  - Beetroots (age 3)
  - Nether Wart (age 3)
  - Pumpkins (from stems age 7)
  - Melons (from stems age 7)
  - Sweet Berries (age 3)
  - Cocoa Beans (age 2)
- **Range**: Tier-based from center
- **Min Totems**: 5 (1 center + 4 corners)
- **Note**: ⚠️ Wheat is also the central item for Auto-Breeding, but the system correctly tags it as supplementary when placed at corner positions near a diamond hoe

#### 8. Auto-Breeding Ritual 🐄
- **Central Item**: `Wheat`
- **Pattern**: Star (4 cardinals)
- **Layout**: 4 totems at cardinal directions, 5 blocks from center
  ```
  Positions: North (0,5), East (5,0), South (0,-5), West (-5,0)
  ```
- **Required Items**:
  - North: `Seeds`
  - East: `Carrot`
  - South: `Potato`
  - West: `Beetroot Seeds`
- **Effect**: Automatically breeds animals in range when breeding conditions met
- **Range**: Tier-based from center
- **Min Totems**: 5 (1 center + 4 cardinals)

---

## 🎯 Pattern Ritual Features

### Visual Pattern Guides
Power your central totem with redstone (place redstone block/torch/lever next to it) to see:
- Colored particle markers showing where each surrounding totem should be placed
- Different colors for each position
- Enchanting particle effects to indicate the pattern type

### How Pattern Rituals Work
1. Place central totem with the ritual item
2. (Optional) Power with redstone to see particle guide
3. Place surrounding totems in the correct pattern
4. Place required items on surrounding totems
5. Perform fire sacrifice at center totem
6. Pattern is validated and ritual activates if correct
7. Items are consumed and ritual runs permanently until stopped

---

## 🚧 PLANNED/NOT IMPLEMENTED (5 More)

These are defined in the system but not yet coded:

- **Flight Zone** (Elytra) - Septagon pattern (7 totems)
- **Weather Control** (Lightning Rod) - Septagon pattern (7 totems)
- **Forcefield** (End Crystal) - Octagon pattern (8 totems)
- **Mob Repellent** (Zombie Head) - Octagon pattern (8 totems)
- **Time Warp** (Clock) - Nonagon pattern (9 totems)

---

## Totem Tiers & Ranges

| Tier | Material | Horizontal Range | Vertical Range |
|------|----------|------------------|----------------|
| 1 | Wood | 2×2 | 3 blocks |
| 2 | Copper | 3×3 | 4 blocks |
| 3 | Iron | 4×4 | 5 blocks |
| 4 | Gold | 5×5 | 6 blocks |
| 5 | Diamond | 6×6 | 7 blocks |
| 6 | Netherite | 7×7 | 8 blocks |

---

## Summary

**Total Implemented**: 8 rituals
- 6 standard single-rituals
- 2 advanced multi-totem pattern rituals

**Status**: Fully functional with tier scaling, pattern detection, and visual guides!

