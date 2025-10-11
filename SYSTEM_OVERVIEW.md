# Totem Rituals - System Overview

Complete technical overview of how everything works! 🧙‍♂️

## Core Concept

Players craft mystical totem bases, place them in the world, display items on them, and powerful rituals activate! Single-totem mode is enabled by default, but you can configure it to require multiple totems.

---

## System Components

### 1. Totem Bases (Items)
- **Item Type**: Warped Fungus on a Stick (with `custom_model_data`)
- **3 Tiers**: Wood (1), Iron (2), Diamond (3)
- **Placement**: Sneak + Right-click on ground
- **Visual in Hand**: Custom model (via resource pack)

### 2. Placed Totems (Entities)
Each placed totem consists of **3 entities**:
1. **Interaction Entity** (`interaction`) - Hitbox, data storage, main controller
2. **Block Display** (`block_display`) - Visual stone wall pole
3. **Item Display** (`item_display`) - Floating item on top

All linked by unique ID stored in `rituals.id` scoreboard

### 3. Ritual System
- **Detection**: Checks every 20 ticks for 3+ totems with same item
- **Range**: 32 blocks between totems (for multi-totem mode)
- **Single-Totem Mode**: Enabled by default (configurable)
- **Duration**: 600 ticks (30 seconds)
- **Effect Area**: 5×5×6 block box centered on each totem
- **Power Scaling**: Tier I (×1), Tier II (×2), Tier III (×3)

### 4. Upgrade System
- **Slates**: Crafted with paste + totem base
- **Usage**: Right-click placed totem with slate
- **Validation**: Checks tier difference = exactly +1
- **Visual Update**: Replaces block_display with new tier

---

## Technical Architecture

### Scoreboards
```
rituals.data     - Constants and global values
rituals.timer    - Cooldowns and durations
rituals.tier     - Totem tier (1-3)
rituals.effect   - Active ritual type (1-5)
rituals.temp     - Temporary calculations
rituals.id       - Entity linking system
```

### Entity Tags
```
rituals.totem              - Main interaction entity
rituals.totem_visual       - Block display visual
rituals.totem_display      - Item display holder
rituals.has_item           - Totem with displayed item
rituals.active_ritual      - Totem in active ritual
rituals.[type]_ritual      - Specific ritual type marker
```

### Custom Data Structure
```json
{
  "rituals_totem": 1,        // Marks totem base items
  "totem_tier": 1-3,         // Tier level
  "rituals_paste": 1,        // Marks paste items
  "rituals_upgrade": 1,      // Marks upgrade slates
  "upgrade_to_tier": 2-3     // Target tier for upgrade
}
```

---

## Data Flow

### Totem Placement
```
1. Player: Sneak + Right-click with totem base
2. check_place.mcfunction: Validates placement
3. place.mcfunction: Spawns 3 entities
4. initialize.mcfunction: Links entities, assigns ID
5. visuals/tierX.mcfunction: Creates visual based on tier
```

### Item Display
```
1. Player: Right-click totem with item
2. handle_interaction.mcfunction: Detects interaction
3. check_held_item.mcfunction: Determines if upgrade or item
4. transfer_item_to_totem.mcfunction: Moves item to display
5. Tag totem with "rituals.has_item"
```

### Ritual Activation
```
1. tick.mcfunction: Runs check every 20 ticks
2. check_activation.mcfunction: Counts nearby totems with items
3. detect_type.mcfunction: Identifies item type
4. types/check_[ritual].mcfunction: Validates ritual requirements
5. activate_[ritual].mcfunction: Marks totems, starts timer
```

### Ritual Effects
```
1. update_active.mcfunction: Runs on active ritual totems
2. effects/[ritual].mcfunction: Applies effects in 5×5×6 box
3. Particles and sounds for feedback
4. complete.mcfunction: Cleanup after 600 ticks
```

### Totem Upgrade
```
1. Player: Right-click totem with upgrade slate
2. check_held_item.mcfunction: Detects upgrade slate
3. upgrade.mcfunction: Validates tier progression
4. apply_upgrade.mcfunction: Updates tier, replaces visual
5. upgrade_failed.mcfunction: Error feedback if invalid
```

---

## Performance Optimizations

1. **Tick Optimization**: Checks run every 20 ticks, not every tick
2. **Conditional Execution**: Early returns prevent unnecessary processing
3. **Targeted Selectors**: Specific entity tags reduce search scope
4. **Box Selectors**: `dx/dy/dz` more efficient than `distance=..`
5. **Entity Linking**: ID system prevents scanning all entities

---

## Visual Tiers

### Wood (Tier I)
- **Pole**: Cobblestone Wall
- **Color**: Brown/tan
- **Particles**: None
- **Power**: ×1

### Iron (Tier II)
- **Pole**: Stone Brick Wall
- **Color**: Gray
- **Particles**: Silver dust
- **Power**: ×2

### Diamond (Tier III)
- **Pole**: Blackstone Wall
- **Color**: Dark/black
- **Particles**: Cyan dust
- **Power**: ×3

---

## Ritual Effects Detailed

### Growth (Emerald)
- **Frequency**: Every 20 ticks
- **Action**: Random block in 5×5×6 box
- **Targets**: Crops, saplings
- **Scaling**: 1/2/3 attempts per tick based on tier

### Strength (Diamond)
- **Frequency**: Every 40 ticks
- **Buffs**: Strength + Resistance
- **Targets**: Players in 5×5×6 box
- **Scaling**: Level increases with tier

### Prosperity (Gold)
- **Frequency**: Every 20 ticks
- **Action**: Pull items, spawn XP
- **Targets**: Items in 5×5×6 box
- **Scaling**: Pull speed increases with tier

### Protection (Iron)
- **Frequency**: Every 20 ticks
- **Damage**: 2/3/4 per second
- **Targets**: Hostile mobs in 5×5×6 box
- **Scaling**: Damage increases with tier

### Healing (Nether Star)
- **Frequency**: Every 40 ticks
- **Effect**: Regeneration (+ Absorption at tier 3)
- **Targets**: Players and animals in 5×5×6 box
- **Scaling**: Level increases with tier

---

## File Structure

### Datapack
```
data/rituals/
├── function/
│   ├── load.mcfunction
│   ├── tick.mcfunction
│   ├── give/          (Item distribution)
│   ├── totem/         (Placement, interaction)
│   ├── ritual/        (Detection, effects)
│   └── admin/         (Management tools)
├── recipe/            (Crafting)
├── predicate/         (Conditions)
├── item_modifier/     (Item manipulation)
└── tags/              (Entity/item groups)
```

### Resource Pack
```
resourcepack/
├── pack.mcmeta
└── assets/
    ├── minecraft/models/item/    (Vanilla overrides)
    └── rituals/
        ├── models/item/           (Custom models)
        └── textures/item/         (Custom textures)
```

---

## Expansion Points

The system is designed to be easily expandable:

1. **New Rituals**: Add to `detect_type.mcfunction`
2. **New Tiers**: Add tier 4+ with new visuals
3. **Range Upgrades**: Modify box size in effect functions
4. **New Items**: Add recipes with custom_data tags
5. **Multi-Item Rituals**: Check multiple item types

---

**For implementation details, see the inline comments in each function file!** 📚

