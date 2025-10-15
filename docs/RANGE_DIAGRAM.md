# Ritual Range Diagram

This document explains the exact range mechanics for Rituals

## Range Specifications

Totem ranges are **tier-based** and use a box-shaped area:
- **Tier 1 (Wood)**: 2×2 horizontal, 3 up/3 down (2×2×6)
- **Tier 2 (Copper)**: 3×3 horizontal, 4 up/4 down (3×3×8)
- **Tier 3 (Iron)**: 4×4 horizontal, 5 up/5 down (4×4×10)
- **Tier 4 (Gold)**: 5×5 horizontal, 6 up/6 down (5×5×12)
- **Tier 5 (Diamond)**: 6×6 horizontal, 7 up/7 down (6×6×14)
- **Tier 6 (Netherite)**: 7×7 horizontal, 8 up/8 down (7×7×16)

### Range Comparison Chart

```mermaid
graph LR
    subgraph "Tier 1: Wood"
        W[2×2×6<br/>Smallest Range]
    end
    
    subgraph "Tier 2: Copper"
        C[3×3×8<br/>+50% Volume]
    end
    
    subgraph "Tier 3: Iron"
        I[4×4×10<br/>+67% Volume]
    end
    
    subgraph "Tier 4: Gold"
        G[5×5×12<br/>+100% Volume]
    end
    
    subgraph "Tier 5: Diamond"
        D[6×6×14<br/>+133% Volume]
    end
    
    subgraph "Tier 6: Netherite"
        N[7×7×16<br/>Maximum Range<br/>+167% Volume]
    end
    
    W --> C --> I --> G --> D --> N
    
    style W fill:#8b4513,stroke:#654321,color:#fff
    style C fill:#ff8800,stroke:#cc6600,color:#fff
    style I fill:#808080,stroke:#505050,color:#fff
    style G fill:#ffff00,stroke:#cccc00,color:#000
    style D fill:#00ffff,stroke:#00cccc,color:#000
    style N fill:#8b00ff,stroke:#6600cc,color:#fff
```

### Visual Representation

```
-------------
|           |  <- not in range
|           |  <- in range (3 above)
|           |  <- in range (2 above)
|    [o]    |  <- in range (1 above) - Item display
|     |     |  <- totem fence post (ground level)
| [-][-][-] |  <- in range (1 below)
| [-][-][-] |  <- in range (2 below)
| [-][-][-] |  <- in range (3 below)
|           |  <- not in range
-------------
```

## Components

- `|` = Totem pole (fence post visual)
- `[o]` = Item displayed on top (mob head or any item)
- `[-]` = Example solid blocks showing range extent
- The 5×5 horizontal range extends 2 blocks in each direction from the totem

## Tier Differences

Higher tiers have **both larger ranges AND stronger effects**:

| Tier | Material | Range | Effect Frequency |
|------|----------|-------|------------------|
| 1 | Wood | 2×2×6 | Slowest |
| 2 | Copper | 3×3×8 | Slow |
| 3 | Iron | 4×4×10 | Moderate |
| 4 | Gold | 5×5×12 | Fast |
| 5 | Diamond | 6×6×14 | Faster |
| 6 | Netherite | 7×7×16 | Fastest |

### Effect Power Scaling

```mermaid
quadrantChart
    title Totem Tier Comparison: Power vs Cost
    x-axis Low Cost --> High Cost
    y-axis Low Power --> High Power
    quadrant-1 Best Value
    quadrant-2 Premium Power
    quadrant-3 Early Game
    quadrant-4 Balanced
    Wood: [0.1, 0.15]
    Copper: [0.25, 0.35]
    Iron: [0.45, 0.55]
    Gold: [0.65, 0.70]
    Diamond: [0.80, 0.85]
    Netherite: [0.95, 0.95]
```

### Effect Frequency Examples

**Growth Ritual:**
- Tier 1: Every 15 seconds
- Tier 6: Every 3 seconds

**Protection Ritual:**
- Tier 1: 2 damage every 9 seconds
- Tier 6: 8 damage every 1.5 seconds

**Sentry Ritual:**
- Tier 1: Fires every 9 seconds, 1.5 damage
- Tier 6: Fires every 1.5 seconds, 12 damage
- **Note**: Sentry has 2× the normal range!

## Positioning Tips

For optimal ritual placement:

1. **Farm Rituals (Growth)**: Place totem at center of 5×5 farm plot
2. **Combat Rituals (Strength/Protection)**: Place in battle arena or base entrance
3. **Collection Rituals (Prosperity)**: Place above item drop zone with 3 blocks clearance
4. **Healing Zones**: Place in animal pens or safe houses

## Technical Notes

- The range uses Minecraft's `dx`, `dy`, `dz` volume selectors
- Box is centered on the totem's position
- Effects apply to all valid targets within the volume
- Particles spawn at the corners of the range for visual feedback

---

**Remember**: Range is fixed, power scales with tier! 🔮

