# Handheld Totems Guide

Welcome to the Handheld Totem system, you magnificent warrior! ⚔️

## What Are Handheld Totems?

Handheld Totems are **personal, portable ritual devices** that you equip in your **offhand** (like a shield). Unlike placed totems that require ritual items, handheld totems have **fixed effects** built into them!

## Two Types of Handheld Totems

### 1. Combat Totems (Standard Handheld)
**Effect**: Grants Strength + Resistance buffs to you and nearby allies  
**Best For**: Group combat, tanking, PvP

### 2. Companion Totems (Summon Type)  
**Effect**: Summons an invulnerable silverfish minion to attack for you  
**Best For**: Solo play, extra DPS, exploration  
**See**: `COMPANION_TOTEMS.md` for full details

## Key Difference: Handheld vs Placed Totems

**Placed Totems (Ritual System):**
- Display an item (wheat, diamond, arrow, etc.)
- Item determines effect type (growth, healing, sentry, etc.)
- **Flexible** - change effect by changing displayed item
- Large area of effect
- Stationary

**Handheld Totems (Fixed Effect):**
- Equip in offhand
- Effect is **built into the item type**
- **Not flexible** - each handheld type does one thing
- Small radius or single target
- Mobile

Think of it like this:
- **Placed = Swiss Army Knife** (one tool, many functions based on what you put on it)
- **Handheld = Specialized Tool** (dedicated purpose)

## Features

- **Offhand Equipment**: Equip in your offhand slot (shield slot)
- **Personal Buffs**: Grants effects to the holder continuously
- **AoE Support**: Affects nearby players within range
- **Tier Scaling**: Higher tiers = stronger effects + larger radius
- **Visual Feedback**: Glowing crit particles around the holder

## Tiers & Ranges

| Tier | Material | Holder Effects | Ally Range | Effect Level |
|------|----------|----------------|------------|--------------|
| 1 - Wood | Wooden Totem + Sticks | Strength I, Resistance I | 1.5 blocks | I |
| 2 - Copper | Copper Totem + Copper Ingots | Strength I, Resistance I | 1.5 blocks | I |
| 3 - Iron | Iron Totem + Iron Ingots | Strength II, Resistance I | 1.5 blocks | II/I |
| 4 - Gold | Gold Totem + Gold Ingots | Strength II, Resistance II | 2.5 blocks | II |
| 5 - Diamond | Diamond Totem + Diamonds | Strength II, Resistance II | 2.5 blocks | II |
| 6 - Netherite | Netherite Totem + Netherite Ingots | Strength III, Resistance III | 2.5 blocks | III |

**Note:** Ally range is **1/4 of the placed totem range** for that tier.

## Crafting Recipes

All Handheld Totems use the **same pattern**:

```
     Material
Material  Totem  Material
     Material
```

### Visual Grid (Example: Iron Handheld Totem)

```
[   ] [Iron] [   ]
[Iron][Totem][Iron]
[   ] [Iron] [   ]
```

### All Recipes

**Tier 1 - Wooden:**
- Center: Wooden Totem (Tier 1)
- Surrounding: 4x Stick

**Tier 2 - Copper:**
- Center: Copper Totem (Tier 2)
- Surrounding: 4x Copper Ingot

**Tier 3 - Iron:**
- Center: Iron Totem (Tier 3)
- Surrounding: 4x Iron Ingot

**Tier 4 - Gold:**
- Center: Gold Totem (Tier 4)
- Surrounding: 4x Gold Ingot

**Tier 5 - Diamond:**
- Center: Diamond Totem (Tier 5)
- Surrounding: 4x Diamond

**Tier 6 - Netherite:**
- Center: Netherite Totem (Tier 6)
- Surrounding: 4x Netherite Ingot

## How to Use

1. **Craft** a Handheld Totem of your desired tier
2. **Equip** it in your offhand slot (F key by default)
3. **Hold** it while in combat
4. **Stay near allies** to share the buffs (within range)

## Effects Applied

### Strength
- Increases melee damage
- Level I: +3 damage
- Level II: +6 damage
- Level III: +9 damage

### Resistance
- Reduces incoming damage
- Level I: 20% damage reduction
- Level II: 40% damage reduction
- Level III: 60% damage reduction

### Duration
Effects reapply every 3 seconds while holding the totem, ensuring continuous uptime.

## Strategy Tips

1. **Tank Builds**: Use Netherite Handheld Totem for maximum survivability
2. **Group Combat**: Stand near allies to share buffs with entire party
3. **Quick Switch**: Keep in inventory and swap to offhand when needed
4. **PvP**: Excellent for arena combat and group battles
5. **PvE**: Perfect for boss fights and dungeon raids

## Comparison: Handheld vs Placed Totems

| Feature | Handheld Totem | Placed Totem |
|---------|----------------|--------------|
| **Mobility** | ✅ Move freely | ❌ Stationary |
| **Range** | Small (1-2.5 blocks) | Large (4-14 blocks) |
| **Effects** | Combat only (Strength/Resistance) | All 6 ritual types |
| **Setup Time** | Instant (equip) | Requires placement |
| **Durability** | Uses shield durability | Permanent until broken |
| **Team Support** | Small group | Large area |

## Commands

Get all Handheld Totems for testing:
```
/function rituals:give/handheld_totems
```

Get a specific tier:
```
/function rituals:give/handheld_totem_wood
/function rituals:give/handheld_totem_copper
/function rituals:give/handheld_totem_iron
/function rituals:give/handheld_totem_gold
/function rituals:give/handheld_totem_diamond
/function rituals:give/handheld_totem_netherite
```

## Visual Indicators

When holding a Handheld Totem, you'll see:
- 🌟 **Crit particles** around your character (scales with tier)
- 💫 **Strength icon** in your effect bar (red potion icon)
- 🛡️ **Resistance icon** in your effect bar (orange potion icon)

## Technical Details

- **Item Base**: Shield
- **Custom Model Data**: 771001-771006
- **NBT Tags**: `rituals_handheld:1`, `handheld_tier:[1-6]`
- **Detection**: Slot -106b (offhand)
- **Update Frequency**: Every tick (20 times/second)

---

Now go forth and become an unstoppable force on the battlefield! ᕙ(⇀‸↼‶)ᕗ

