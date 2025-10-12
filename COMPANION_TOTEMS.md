# Companion Totems - Summon Your Minion!

Your own personal attack silverfish that NEVER dies! 🐛⚔️

## What Are Companion Totems?

**Companion Totems** are handheld totems that summon an **invulnerable silverfish minion** to fight for you! The silverfish attacks hostile mobs and scales in power with tier.

## Key Features

✅ **Invulnerable** - Cannot be killed (Invulnerable:1b)  
✅ **Tier-Based Damage** - Stronger with higher tiers  
✅ **Auto-Follow** - Teleports to you if >20 blocks away  
✅ **Auto-Despawn** - Disappears when you unequip the totem  
✅ **Persistent** - Won't despawn naturally  
✅ **Self-Healing** - Regenerates slowly  
✅ **Visual Effects** - Colored particles based on tier  

## Tier Stats

| Tier | Material | Attack Damage | Particle Color |
|------|----------|---------------|----------------|
| 1 - Wood | Stick + Spider Eyes | 2.0 ❤️ | Gray |
| 2 - Copper | Copper + Spider Eyes | 3.0 ❤️❤️ | Light Gray |
| 3 - Iron | Iron + Spider Eyes | 4.0 ❤️❤️ | White |
| 4 - Gold | Gold + Spider Eyes | 6.0 ❤️❤️❤️ | Gold |
| 5 - Diamond | Diamond + Spider Eyes | 8.0 ❤️❤️❤️❤️ | Cyan |
| 6 - Netherite | Netherite + Spider Eyes | 12.0 ❤️❤️❤️❤️❤️❤️ | Purple |

**Companion Stats:**
- Health: 20 HP (10 hearts)
- Speed: 0.35 (fast!)
- Regeneration: Passive slow heal

## Crafting Recipes

Pattern: **Spider Eye - Material - Spider Eye** (plus shaped)

```
    [Spider Eye]
[Material][Totem][Material/Stick]
    [Spider Eye]
```

### All Recipes

**Tier 1 - Wooden:**
- Top: Spider Eye
- Left: Stick
- Center: Wooden Totem (Tier 1)
- Right: Stick  
- Bottom: Spider Eye

**Tier 2 - Copper:**
- Top: Spider Eye
- Left: Copper Ingot
- Center: Copper Totem (Tier 2)
- Right: Stick
- Bottom: Spider Eye

**Tier 3 - Iron:**
- Top: Spider Eye
- Left: Iron Ingot
- Center: Iron Totem (Tier 3)
- Right: Iron Ingot
- Bottom: Spider Eye

**Tier 4 - Gold:**
- Top: Spider Eye
- Left: Gold Ingot
- Center: Gold Totem (Tier 4)
- Right: Gold Ingot
- Bottom: Spider Eye

**Tier 5 - Diamond:**
- Top: Spider Eye
- Left: Diamond
- Center: Diamond Totem (Tier 5)
- Right: Diamond
- Bottom: Spider Eye

**Tier 6 - Netherite:**
- Top: Spider Eye
- Left: Netherite Ingot
- Center: Netherite Totem (Tier 6)
- Right: Netherite Ingot
- Bottom: Spider Eye

## How to Use

1. **Craft** a Companion Totem
2. **Equip** it in your offhand (F key)
3. **Your silverfish spawns automatically!**
4. **Watch** it attack nearby hostile mobs
5. **Unequip** to despawn the companion

## Companion Behavior

### Spawning
- Automatically spawns when you equip the totem
- Spawns at your location with poof particles
- Named "Ritual Companion" (aqua text)
- You get a chat message confirmation

### Following
- Stays near you during combat
- Teleports to you if >20 blocks away
- Won't get lost in caves or terrain

### Combat
- Attacks hostile mobs automatically
- Uses silverfish AI (fast, aggressive)
- Damage scales with tier
- Can't be killed by enemies

### Despawning
- Automatically despawns when you unequip
- Poof particles on despawn
- Death sound plays
- No drops (it's magical!)

## Strategy Tips

1. **Distraction**: Let your companion tank hits while you flank
2. **Caves**: Perfect for exploring - extra mob detection
3. **Boss Fights**: Constant DPS without risk
4. **Resource Gathering**: Companion protects while you mine/build
5. **Tier 6 Power**: Netherite companion can solo most mobs!

## Visual Effects by Tier

- **Tier 1-2**: Gray particle trail (basic)
- **Tier 3**: White particles (iron gleam)
- **Tier 4**: Gold particles (treasure!)
- **Tier 5**: Cyan particles (diamond sparkle)
- **Tier 6**: Purple particles (netherite magic!)

## Comparison: Three Handheld Totem Types

| Type | Effect | Best For |
|------|--------|----------|
| **Combat Totem** | Strength + Resistance buffs to holder + allies | Group PvP, Tank builds |
| **Companion Totem** | Summons invulnerable silverfish minion | Solo play, Extra DPS |
| **Placed Totem** | Area effects (6 types: Growth, Healing, etc.) | Base defense, Farming |

## Commands

Get all Companion Totems:
```
/function rituals:give/handheld_companions
```

Get specific tier:
```
/function rituals:give/handheld_companion_wood
/function rituals:give/handheld_companion_copper
/function rituals:give/handheld_companion_iron
/function rituals:give/handheld_companion_gold
/function rituals:give/handheld_companion_diamond
/function rituals:give/handheld_companion_netherite
```

## Technical Details

- **Entity**: Silverfish
- **Tags**: `rituals.companion`
- **NBT**: `Invulnerable:1b`, `PersistenceRequired:1b`
- **Custom Model Data**: 772001-772006
- **Owner Tracking**: Uses `rituals.id` scoreboard
- **Max Distance**: 20 blocks before teleport

## FAQ

**Q: Can my companion die?**  
A: No! It's invulnerable. Only despawns when you unequip the totem.

**Q: Can I have multiple companions?**  
A: No, one companion per player. Summoning a new one replaces the old.

**Q: Does it attack other players?**  
A: No, only hostile mobs (uses `#rituals:hostile_mobs` tag).

**Q: Does it use shield durability?**  
A: Yes, like any shield item (can be repaired/enchanted).

**Q: Can I name my companion?**  
A: It's always named "Ritual Companion" (you could use an anvil on the totem before equipping).

---

Now go forth with your unstoppable minion army! 🐛⚔️ (ノ◕ヮ◕)ノ*:・゚✧

