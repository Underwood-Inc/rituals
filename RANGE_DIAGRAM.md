# Ritual Range Diagram

This document explains the exact range mechanics for Totem Rituals.

## Range Specifications

All totems use the same **box-shaped range**:
- **Horizontal**: 5 blocks × 5 blocks (centered on totem)
- **Vertical**: 3 blocks above totem, 3 blocks below totem
- **Total**: 5×5×6 block volume

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

While all totems use the same **range**, the tier affects the **power** of ritual effects:

| Tier | Visual | Effect Power |
|------|--------|--------------|
| I (Basic) | Oak fence | Standard strength |
| II (Advanced) | Iron bars | 2x strength |
| III (Master) | End rod | 3x strength |

### Effect Power Examples

**Strength Ritual:**
- Tier I: Strength I + Resistance I
- Tier II: Strength II + Resistance I  
- Tier III: Strength III + Resistance II

**Protection Ritual:**
- Tier I: 2 damage/second to mobs
- Tier II: 3 damage/second to mobs
- Tier III: 4 damage/second to mobs

**Growth Ritual:**
- Tier I: 1 growth attempt per second
- Tier II: 2 growth attempts per second
- Tier III: 3 growth attempts per second

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

