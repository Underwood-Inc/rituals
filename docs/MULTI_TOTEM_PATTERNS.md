# Multi-Totem Ritual Patterns

This document defines the **exact placement patterns** and **item requirements** for multi-totem rituals. Each pattern requires a **central totem** with a specific item that determines the ritual type, plus **surrounding totems** at specific positions, each with their own required items.

---

## 📐 Pattern Types Overview

| Pattern | Totems Required | Pattern Shape | Used By Rituals |
|---------|----------------|---------------|-----------------|
| **Star** | 1 center + 4 cardinals | Cross/Plus shape | Auto-Breeding |
| **Pentagon** | 1 center + 5 around | 5-pointed circle | XP Harvester (Not Implemented) |
| **Hexagon** | 1 center + 6 around | 6-pointed circle | (Not Implemented) |
| **Septagon** | 1 center + 7 around | 7-pointed circle | (Not Implemented) |
| **Octagon** | 1 center + 8 around | 8-pointed circle | (Not Implemented) |
| **Nonagon** | 1 center + 9 around | Circle of 9 | (Not Implemented) |

---

## ⭐ Star Pattern (4 Cardinals)

**Total Totems**: 5 (1 center + 4 cardinal directions)  
**Distance**: 5 blocks from center in each cardinal direction  
**Used By**: Auto-Breeding

### ASCII Diagram (Top View)

```
         N
         ↑
    W ← + → E
         ↓
         S

          0          (X/Z coordinates)
          |
      +5  T          ← North totem
          |
          |
   W   T──C──T   E  ← West-Center-East
    -5  | 0 | +5
          |
          |
      -5  T          ← South totem
          |
          
Legend:
  C = Central totem (Wheat)
  T = Cardinal direction totem
  ─ = 5 blocks distance horizontally
  | = 5 blocks distance vertically
```

### Isometric View
```
                 [Wheat]
                   │
           [Seed]  │  [Seed]
             │     │     │
         ┌───┴─┐ ┌─┴─┐ ┌─┴───┐
    ···· │  T  │─│ C │─│  T  │ ····
         └─────┘ └───┘ └─────┘
             │           │
          [Seed]      [Seed]
             │           │
           ┌─┴─┐       ┌─┴─┐
           │ T │       │ T │
           └───┘       └───┘
         (South)     (North)
```

### Totem Positions & Item Requirements

| Position | Coordinates (rel. to center) | Required Item | Purpose |
|----------|------------------------------|---------------|---------|
| **Center** | (0, 0, 0) | Wheat | Determines ritual (breeding) |
| **North** | (0, 0, +5) | Seeds | Plant growth |
| **East** | (+5, 0, 0) | Carrot | Root vegetables |
| **South** | (0, 0, -5) | Potato | Tubers |
| **West** | (-5, 0, 0) | Beetroot Seeds | Alternative crops |

### Setup Instructions
1. Place central totem and add **Wheat** 
2. Place totems exactly 5 blocks away in each cardinal direction
3. Add food items to each cardinal totem:
   - North: Seeds
   - East: Carrot
   - South: Potato
   - West: Beetroot Seeds
4. Fire sacrifice at center
5. Animals within range will auto-breed when fed matching food

---

## 🛡️ Octagon Pattern (8 Around Center) - NOT IMPLEMENTED

**Total Totems**: 9 (1 center + 8 octagon points)  
**Distance**: 7 blocks radius from center  
**Used By**: Forcefield, Mob Repellent

### ASCII Diagram (Top View)

```
         N
         ↑
    W ← + → E
         ↓
         S

    X= -5  -3   0  +3  +5
        |   |   |   |   |
 Z=+7       T           |    ← N (0, +7)
           ╱│╲          |
 Z=+5    T  │  T        |    ← NW, NE
          ╲ │ ╱         |
 Z=0    T───C───T       |    ← W, Center, E
          ╱ │ ╲         |
 Z=-5    T  │  T        |    ← SW, SE
           ╲│╱          |
 Z=-7       T           |    ← S (0, -7)
        |   |   |   |   |

Octagon Points (exact coordinates):
  N:  ( 0,  0,  +7)
  NE: (+5,  0,  +5)
  E:  (+7,  0,   0)
  SE: (+5,  0,  -5)
  S:  ( 0,  0,  -7)
  SW: (-5,  0,  -5)
  W:  (-7,  0,   0)
  NW: (-5,  0,  +5)
```

### Forcefield Ritual (End Crystal)

| Position | Coordinates | Required Item | Purpose |
|----------|-------------|---------------|---------|
| **Center** | (0, 0, 0) | End Crystal | Ritual type (barrier) |
| **North** | (0, 0, +7) | Glass Pane | Transparency |
| **NE** | (+5, 0, +5) | Obsidian | Strength |
| **East** | (+7, 0, 0) | Beacon | Power source |
| **SE** | (+5, 0, -5) | Chorus Fruit | End dimension energy |
| **South** | (0, 0, -7) | Purpur Block | End architecture |
| **SW** | (-5, 0, -5) | Ender Eye | Vision |
| **West** | (-7, 0, 0) | Shulker Shell | Protection |
| **NW** | (-5, 0, +5) | End Stone | Foundation |

### Mob Repellent Ritual (Zombie Head)

| Position | Coordinates | Required Item | Purpose |
|----------|-------------|---------------|---------|
| **Center** | (0, 0, 0) | Zombie Head | Ritual type (repel mobs) |
| **North** | (0, 0, +7) | Torch | Light |
| **NE** | (+5, 0, +5) | Bone | Skeleton warding |
| **East** | (+7, 0, 0) | Rotten Flesh | Zombie deterrent |
| **SE** | (+5, 0, -5) | Spider Eye | Arthropod repellent |
| **South** | (0, 0, -7) | Gunpowder | Creeper deterrent |
| **SW** | (-5, 0, -5) | Ghast Tear | Ghost warding |
| **West** | (-7, 0, 0) | Blaze Powder | Nether mob deterrent |
| **NW** | (-5, 0, +5) | Enderman deterrent | Ender pearl ward |

---

## 🕐 Nonagon Pattern (9 Around Center - Circle)

**Total Totems**: 10 (1 center + 9 surrounding)  
**Distance**: 8 blocks radius from center  
**Used By**: Time Warp

### ASCII Diagram (Top View)

```
         N
         ↑
    W ← + → E
         ↓
         S

    X= -6  -4   0  +4  +6
        |   |   |   |   |
 Z=+8       T           |    ← N (0, +8)
         ╱ │ ╲          |
 Z=+6   T  │  T         |    ← NNW, NNE
       ╱   │   ╲        |
 Z=+3 T    │    T       |    ← WNW, ENE
      │    │    │       |
 Z=0  T────C────T       |    ← W, CENTER, E
      │    │    │       |
 Z=-3 T    │    T       |    ← WSW, ESE
       ╲   │   ╱        |
 Z=-6   T  │  T         |    ← SSW, SSE
         ╲ │ ╱          |
 Z=-8       T           |    ← S (0, -8)
        |   |   |   |   |

Circle Points (9 totems around center at 8 block radius):
  N:   ( 0,  0,  +8)  - 0°
  NNE: (+4,  0,  +7)  - 40°
  ENE: (+7,  0,  +4)  - 80°
  E:   (+8,  0,   0)  - 120°
  ESE: (+7,  0,  -4)  - 160°
  SSE: (+4,  0,  -7)  - 200°
  S:   ( 0,  0,  -8)  - 240°
  SSW: (-4,  0,  -7)  - 280°
  WSW: (-7,  0,  -4)  - 320°
  W:   (-8,  0,   0)  - 360°
  (Wait, that's 10 points... let me use 9)
```

Actually, for a proper circle of 9 totems, approximate coordinates at 8 block radius:

### Time Warp Ritual (Clock)

| Position | Angle | Coordinates (approx) | Required Item | Purpose |
|----------|-------|---------------------|---------------|---------|
| **Center** | - | (0, 0, 0) | Clock | Ritual type (time) |
| **1** | 0° | (0, 0, +8) | Daylight Sensor | Day detection |
| **2** | 40° | (+5, 0, +6) | Redstone Torch | Power |
| **3** | 80° | (+8, 0, +3) | Repeater | Delay |
| **4** | 120° | (+8, 0, -3) | Comparator | Timing |
| **5** | 160° | (+5, 0, -6) | Observer | Detection |
| **6** | 200° | (0, 0, -8) | Moon (Quartz) | Night |
| **7** | 240° | (-5, 0, -6) | Star (Nether Star) | Celestial |
| **8** | 280° | (-8, 0, -3) | Sun (Gold Block) | Solar |
| **9** | 320° | (-8, 0, +3) | Hourglass (Sand) | Time passage |

---

## 🔬 Pattern Detection Rules

All patterns follow these validation rules:

### Position Tolerance
- Totems must be within **±1 block** of exact coordinates (allows for terrain variation)
- Y-coordinate (height) must be **exactly the same** as central totem or ±1 block

### Item Validation
- Each totem must have the **exact required item** displayed
- Central totem item determines the ritual type
- If any required totem is missing or has wrong item, ritual fails

### Activation Sequence
1. Place all totems in pattern with correct items
2. Perform fire sacrifice on **central totem**
3. System detects pattern based on central item
4. System validates all surrounding totem positions
5. System validates all surrounding totem items
6. If all valid, ritual activates
7. If invalid, error message explains what's missing

---

## 📊 Pattern Complexity Comparison

```
Pattern Difficulty Ranking:

Easy:   Square (4)    ████░░░░░░
        Star (4)      ████░░░░░░

Medium: Pentagon (5)  ██████░░░░
        Hexagon (6)   ███████░░░

Hard:   Septagon (7)  ████████░░
        Octagon (8)   █████████░

Expert: Nonagon (9)   ██████████
```

---

## 🎯 Quick Reference Chart

| Ritual | Central Item | Pattern | Total Totems | Radius | Difficulty |
|--------|-------------|---------|--------------|--------|------------|
| Enchanting Nexus | Enchanting Table | Square | 5 | 4 blocks | ⭐ Easy |
| Auto-Breeding | Wheat | Star | 5 | 5 blocks | ⭐ Easy |
| XP Harvester | Experience Bottle | Pentagon | 6 | 6 blocks | ⭐⭐ Medium |
| Item Vacuum | Hopper | Hexagon | 7 | 6 blocks | ⭐⭐ Medium |
| Auto-Smelting | Blast Furnace | Hexagon | 7 | 6 blocks | ⭐⭐ Medium |
| Flight Zone | Elytra | Septagon | 8 | 7 blocks | ⭐⭐⭐ Hard |
| Weather Control | Lightning Rod | Septagon | 8 | 7 blocks | ⭐⭐⭐ Hard |
| Forcefield | End Crystal | Octagon | 9 | 7 blocks | ⭐⭐⭐ Hard |
| Mob Repellent | Zombie Head | Octagon | 9 | 7 blocks | ⭐⭐⭐ Hard |
| Time Warp | Clock | Nonagon | 10 | 8 blocks | ⭐⭐⭐⭐ Expert |

---

**Note**: All patterns assume flat terrain. For uneven terrain, totems can be ±1 block vertically from center totem.

**Tip**: Use the redstone visualization system! Power the central totem with redstone to see particle markers showing exactly where surrounding totems should be placed!

