# Current Ritual System Overview

## ✅ CURRENTLY IMPLEMENTED RITUALS (9 Total)

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
- **Note**: No longer grants XP (use XP Harvester ritual instead)

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
- **Effect**: Automatically harvests and replants fully grown crops
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

#### 9. XP Harvester Ritual ✨
- **Central Item**: `Experience Bottle`
- **Pattern**: Pentagon (5 around)
- **Layout**: 5 totems in pentagon pattern around center
  ```
  Positions:
  - North: (0,5)
  - Northeast: (5,2)
  - Southeast: (3,-4)
  - Southwest: (-3,-4)
  - Northwest: (-5,2)
  ```
- **Required Items**: Any 5 items on surrounding totems (consumed on activation)
- **Effect**: Generates XP directly to players in range
- **XP Rate**: **Scales with tier!**
  - Tier 1 (Wood): 1 XP/second
  - Tier 2 (Copper): 2 XP/second
  - Tier 3 (Iron): 3 XP/second
  - Tier 4 (Gold): 4 XP/second
  - Tier 5 (Diamond): 5 XP/second
  - Tier 6 (Netherite): 6 XP/second
- **Range**: Tier-based from center (larger at higher tiers)
- **Requires**: Redstone power to operate (performance optimization)
- **Min Totems**: 6 (1 center + 5 pentagon)

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

**Total Implemented**: 9 rituals
- 6 standard single-Rituals
- 3 advanced multi-totem pattern rituals

**Status**: Fully functional with tier scaling, pattern detection, visual guides, and balanced XP harvester rates!

