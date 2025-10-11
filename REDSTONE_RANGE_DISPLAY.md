# Redstone Range Display

## Overview

You can visualize a totem's ritual effect range by powering it with redstone! Red particles will appear showing the exact area where the ritual effects are applied.

## How to Enable

Power the totem with **any redstone component**:

### ✅ Works with:
- **Redstone Torch** - Place next to or below totem
- **Redstone Block** - Place next to or below totem
- **Redstone Wire** - Run powered wire next to or below totem
- **Lever** - Attach to totem or adjacent block, flip to ON
- **Button** - Press button (displays while active)

### 📍 Where to Place:
Redstone components are detected in these positions:
- **Adjacent** (all 4 horizontal sides)
- **Below** (1 block down)
- **Diagonal below** (corners, 1 block down)

## Visual Display

When powered, you'll see:
- 🔴 **Red dust particles** forming a rectangular border
- Shows the **5×5×6 block area** (or 10×10×12 for Sentry totems)
- Particles appear every tick while powered
- Instantly disappears when redstone is turned off

## Range Details

### Standard Totems
- **Horizontal**: 5 blocks in each direction (5×5 square)
- **Up**: 3 blocks above totem
- **Down**: 3 blocks below totem
- **Total**: 5×5×6 box = 150 blocks

### Sentry Totems (Arrow)
- **Horizontal**: 10 blocks in each direction (10×10 square)
- **Up**: 6 blocks above totem
- **Down**: 6 blocks below totem
- **Total**: 10×10×12 box = 1200 blocks (2x standard range)

## Example Setups

### Simple Toggle (Lever)
```
Place lever on any adjacent block
Flip ON = range shown
Flip OFF = range hidden
```

### Permanent Display (Redstone Block)
```
Place redstone block next to or below totem
Range always visible
Remove block to hide
```

### Temporary Display (Button)
```
Place button on adjacent block
Press = range shows for ~1 second
Great for quick checks!
```

### Underground Wire
```
Run powered redstone wire under the totem
Clean look, no visible redstone
Use lever/button elsewhere to control
```

## Tips

- 💡 Use **levers** for toggleable displays
- 💡 Use **redstone blocks** for permanent displays
- 💡 Use **buttons** for quick peek at range
- 💡 Place redstone **below** the totem to hide it
- 💡 Great for planning your ritual room layouts
- 💡 Helps visualize multi-totem overlap zones

## Troubleshooting

**Range not showing?**
- Check redstone is actually powered (wire should be lit)
- Ensure redstone is within 1 block of totem
- Try placing redstone block directly adjacent
- Make sure totem is properly placed (has interaction entity)

**Range showing when it shouldn't?**
- Remove or turn off ALL redstone within 1 block
- Check for hidden redstone wire below
- Look for wall-mounted levers/torches in adjacent blocks

## Performance Note

The particle display runs every tick while powered. If you have many totems with permanent redstone displays, it may affect performance slightly. Use toggleable displays (levers) for better performance.

---

**Quick Start:** Place a lever next to your totem, flip it on, see the range! 🔴✨

