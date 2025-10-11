# Single Totem Mode

## Overview

**Single-totem mode is ENABLED by default!** Each totem can activate rituals independently without needing other totems nearby.

## How It Works

1. **Place a totem** anywhere in your world
2. **Right-click with an item** (emerald, diamond, arrow, etc.)
3. **Ritual activates immediately!** No need for multiple totems

## Supported Items

ALL ritual effects work with single totems:

- 🟢 **Emerald**: Growth (crops)
- 💎 **Diamond**: Strength (players)
- 🟡 **Gold Ingot**: Prosperity (items/XP)
- ⚪ **Iron Ingot**: Protection (damage mobs)
- ⭐ **Nether Star**: Healing (regeneration)
- 🏹 **Arrow**: Sentry (auto-attack, 2x range!)

## Effect Range

Each totem affects a **5x5x6 block area**:
- 5 blocks horizontal (in each direction from totem)
- 3 blocks up
- 3 blocks down

**Sentry totems have 2x range**: 10x10x12 blocks!

### Visualizing Range

Power a totem with redstone (lever, torch, wire, etc.) to see red particles showing the exact effect area! See `REDSTONE_RANGE_DISPLAY.md` for details.

## Multi-Totem Mode (Optional)

If you want to require multiple totems like the old system:

```
/data modify storage rituals:config min_totems_required set value 3
/function rituals:config/reload
```

Then you'll need 3 totems within 32 blocks, all with the same item type.

To go back to single-totem mode:

```
/data modify storage rituals:config min_totems_required set value 1
/function rituals:config/reload
```

## Benefits

### Single-Totem Mode (Default)
✅ Easier to use for solo play
✅ Less resource-intensive
✅ Perfect for small builds
✅ Great for beginners
✅ Each totem is independent

### Multi-Totem Mode (Optional)
✅ More challenging
✅ Requires planning and coordination
✅ Creates larger ritual circles
✅ Better for multiplayer
✅ More immersive ritual feeling

## In-Game Help

Get the guidebook:
```
/function rituals:give/guidebook
```

Or use the help command:
```
/function rituals:help
```

## Configuration

View all settings:
```
/data get storage rituals:config
```

Key setting for totem requirements:
- `min_totems_required`: How many totems needed to activate (default: 1)

See `CONFIG.md` for all configuration options!

---

**TL;DR:** Place one totem, add an item, get magic! 🔮✨

