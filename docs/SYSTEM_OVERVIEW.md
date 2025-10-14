# Totem Rituals - System Overview

Complete technical overview of how everything works! 🧙‍♂️

## Core Concept

Players craft mystical totem bases, place them in the world, display items on them, and powerful rituals activate! Single-totem mode is enabled by default, but you can configure it to require multiple totems.

### System Architecture Overview

```mermaid
graph TB
    subgraph "Player Actions"
        P1[Craft Totem Base]
        P2[Place Totem]
        P3[Display Item]
        P4[Light Fire]
    end
    
    subgraph "Entity System"
        E1[Interaction Entity<br/>Hitbox & Data]
        E2[Block Display<br/>Visual Pole]
        E3[Item Display<br/>Floating Item]
    end
    
    subgraph "Ritual Engine"
        R1[Detection System<br/>Every 20 ticks]
        R2[Fire Sacrifice Check]
        R3[Ritual Activation]
        R4[Effect Application]
    end
    
    subgraph "Tier System"
        T1[Wood Tier 1]
        T2[Copper Tier 2]
        T3[Iron Tier 3]
        T4[Gold Tier 4]
        T5[Diamond Tier 5]
        T6[Netherite Tier 6]
    end
    
    P1 --> P2
    P2 --> E1 & E2 & E3
    E1 -.Links via ID.-> E2 & E3
    P3 --> E3
    E3 --> R1
    P4 --> R2
    R2 --> R3
    R3 --> R4
    
    T1 --> T2 --> T3 --> T4 --> T5 --> T6
    
    style P1 fill:#3498db,stroke:#2980b9,color:#fff
    style R3 fill:#27ae60,stroke:#229954,color:#fff
    style R4 fill:#e74c3c,stroke:#c0392b,color:#fff
    style T1 fill:#8b4513,stroke:#654321,color:#fff
    style T6 fill:#8b00ff,stroke:#6600cc,color:#fff
```

---

## System Components

### 1. Totem Bases (Items)
- **Item Type**: Warped Fungus on a Stick (with `custom_model_data`)
- **6 Tiers**: Wood (1), Copper (2), Iron (3), Gold (4), Diamond (5), Netherite (6)
- **Placement**: Right-click on ground
- **Visual in Hand**: Custom model (via resource pack)

### 2. Placed Totems (Entities)
Each placed totem consists of **3 entities**:
1. **Interaction Entity** (`interaction`) - Hitbox, data storage, main controller
2. **Block Display** (`block_display`) - Visual stone wall pole
3. **Item Display** (`item_display`) - Floating item on top

All linked by unique ID stored in `rituals.id` scoreboard

### 3. Ritual System
- **Detection**: Checks every 20 ticks for 1+ totems with same item
- **Range**: 32 blocks between totems (for multi-totem mode)
- **Single-Totem Mode**: Enabled by default (configurable)
- **Duration**: 600 ticks (30 seconds)
- **Effect Area**: Tier-based ranges from 2×2×6 (Wood) to 7×7×16 (Netherite)
- **Power Scaling**: Higher tiers have larger ranges and stronger/faster effects

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

```mermaid
sequenceDiagram
    participant Player
    participant check_place
    participant place
    participant initialize
    participant visuals
    
    Player->>check_place: Right-click with totem base
    check_place->>check_place: Validates placement location
    check_place->>place: Spawns 3 entities
    place->>initialize: Links entities, assigns unique ID
    initialize->>visuals: Creates visual based on tier
    visuals->>Player: Totem placed successfully
```

### Item Display

```mermaid
flowchart TD
    A[Player Right-clicks Totem with Item] --> B[handle_interaction.mcfunction]
    B --> C[check_held_item.mcfunction]
    C --> D{Is it an upgrade slate?}
    D -->|Yes| E[Handle Upgrade Path]
    D -->|No| F[transfer_item_to_totem.mcfunction]
    F --> G[Item moves to display entity]
    G --> H[Tag totem with 'rituals.has_item']
    H --> I[Item floats above totem]
```

### Ritual Activation Flow

```mermaid
flowchart TB
    Start[tick.mcfunction<br/>Every 20 ticks] --> Check[check_activation.mcfunction]
    Check --> Count[Count nearby totems with items]
    Count --> MinCheck{Meets minimum<br/>totem requirement?}
    MinCheck -->|No| End[Return]
    MinCheck -->|Yes| Detect[detect_type.mcfunction]
    Detect --> ItemCheck[Identifies displayed item type]
    ItemCheck --> Validate[types/check_ritual.mcfunction]
    Validate --> Fire{Fire sacrifice<br/>requirements met?}
    Fire -->|No| End
    Fire -->|Yes| Activate[activate_ritual.mcfunction]
    Activate --> Mark[Mark totems as active]
    Mark --> Timer[Start 600 tick timer]
    Timer --> Active[Ritual Active!]
    
    style Start fill:#3498db,stroke:#2980b9,color:#fff
    style Active fill:#27ae60,stroke:#229954,color:#fff
    style End fill:#95a5a6,stroke:#7f8c8d,color:#fff
```

### Ritual Effects Application

```mermaid
sequenceDiagram
    participant Tick System
    participant update_active
    participant effects/ritual
    participant Particles
    participant complete
    
    loop Every Tick
        Tick System->>update_active: Run on active ritual totems
        update_active->>update_active: Increment timer
        update_active->>effects/ritual: Apply ritual effects
        effects/ritual->>Particles: Spawn visual feedback
        update_active->>update_active: Check if 600 ticks elapsed
        alt Timer >= 600 ticks
            update_active->>complete: End ritual
            complete->>complete: Cleanup tags & scores
        end
    end
```

### Totem Upgrade Process

```mermaid
flowchart LR
    A[Player Right-clicks<br/>with Upgrade Slate] --> B[check_held_item.mcfunction]
    B --> C[upgrade.mcfunction]
    C --> D{Valid tier<br/>progression?}
    D -->|No +1 exactly| E[upgrade_failed.mcfunction]
    E --> F[Error message]
    D -->|Yes +1 tier| G[apply_upgrade.mcfunction]
    G --> H[Update tier scoreboard]
    H --> I[Replace block display]
    I --> J[Success feedback]
    
    style A fill:#3498db,stroke:#2980b9,color:#fff
    style F fill:#e74c3c,stroke:#c0392b,color:#fff
    style J fill:#27ae60,stroke:#229954,color:#fff
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

### Wood (Tier 1)
- **Range**: 2×2 horizontal, 3 up/down
- **Particles**: Minimal
- **Power**: Basic

### Copper (Tier 2)
- **Range**: 3×3 horizontal, 4 up/down
- **Particles**: Copper-colored
- **Power**: Improved

### Iron (Tier 3)
- **Range**: 4×4 horizontal, 5 up/down
- **Particles**: Silver dust
- **Power**: Strong

### Gold (Tier 4)
- **Range**: 5×5 horizontal, 6 up/down
- **Particles**: Golden dust
- **Power**: Very Strong

### Diamond (Tier 5)
- **Range**: 6×6 horizontal, 7 up/down
- **Particles**: Cyan dust
- **Power**: Powerful

### Netherite (Tier 6)
- **Range**: 7×7 horizontal, 8 up/down
- **Particles**: Purple dust
- **Power**: Maximum

---

## Ritual Effects Detailed

### Growth (Emerald)
- **Frequency**: 300 to 60 ticks based on tier (15s to 3s)
- **Action**: Random block in tier-based range, 30% chance
- **Targets**: Crops (wheat, carrot, potato, beetroot, cocoa, berries, stems)
- **Scaling**: Faster checks at higher tiers

### Strength (Diamond)
- **Frequency**: 40 to 15 ticks based on tier (2s to 0.75s)
- **Buffs**: Strength + Resistance
- **Targets**: Players in tier-based range
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

