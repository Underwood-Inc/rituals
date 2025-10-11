# Changelog

## Latest Update

### ✨ New Features

#### 🎯 Single-Totem Rituals
- Totems now work individually! No need for multiple totems
- Configurable via `/data modify storage rituals:config min_totems_required set value <number>`
- Default is set to 1 for single-totem mode
- Perfect for solo play or smaller builds

#### 🏹 Sentry Totem Effect (NEW!)
- **Trigger Item**: Arrow
- **Effect**: Auto-fires magical projectiles at hostile mobs
- **Range**: 2x normal range (10x10 horizontal, 6 up, 6 down)
- **Damage**: Scales with tier (0.5 hearts at wood, increasing per tier)
- **Speed**: Gets faster with higher tiers
- **Visual**: Beautiful flame and enchant particle effects
- **Sound**: Blaze shooting sounds for that magical feel

#### ⚙️ In-Game Configuration System
- Modify all settings without editing files!
- **View config**: `/data get storage rituals:config`
- **Modify setting**: `/data modify storage rituals:config <key> set value <value>`
- **Reload**: `/function rituals:config/reload`
- **Help**: `/function rituals:help`

##### Configurable Settings:
- Ritual duration
- Minimum totems required
- Ritual range
- Effect ranges (horizontal and vertical)
- Sentry fire rate
- Sentry damage and speed scaling
- And more!

#### 📚 Help System
- New `/function rituals:help` command
- Shows all ritual effects and commands
- Clickable links for easy access
- In-game configuration guide

### 🔧 Improvements

#### Ritual System
- Fixed ritual activation to support single totems
- Updated ritual checking logic for better performance
- Improved ritual validation

#### Range Visualization
- Redstone-powered totems display their range with particles
- Already working, now compatible with single-totem mode

### 📖 Documentation

- Added `CONFIG.md` with full configuration guide
- Added `CHANGELOG.md` (this file)
- Updated `CRAFTING_RECIPES.md` with ritual effects
- Updated all in-game messages with help links

### 🎨 Visual Changes

- Sentry projectiles use small fireballs with custom effects
- Flame and enchant particles for sentry activation
- Red dust particles for range visualization

---

## Tier System Summary

All 6 tiers now have consistent scaling:

1. **Wood** (Tier 1) - Basic power
2. **Copper** (Tier 2) - Improved effects
3. **Iron** (Tier 3) - Strong effects
4. **Gold** (Tier 4) - Very strong effects
5. **Diamond** (Tier 5) - Powerful effects
6. **Netherite** (Tier 6) - Ultimate power

---

## Ritual Effects Summary

- **Emerald**: Growth (bonemeal crops)
- **Diamond**: Strength (buff players)
- **Gold Ingot**: Prosperity (attract items/XP)
- **Iron Ingot**: Protection (damage mobs)
- **Nether Star**: Healing (regeneration)
- **Arrow**: Sentry (auto-attack) ⭐ NEW!

---

## Migration Guide

### From Multi-Totem to Single-Totem Mode

If you were using multiple totems before:
1. No changes needed! Multiple totems still work
2. Single totems now also work automatically
3. To require multiple totems again: `/data modify storage rituals:config min_totems_required set value 3`

### Testing the New Features

1. `/reload` your world
2. Place a single totem
3. Right-click with an arrow
4. Watch it auto-fire at nearby mobs!

Or try:
```
/function rituals:help
/data get storage rituals:config
```

---

## Known Issues

None currently! Report any bugs you find.

---

## Credits

- Sentry Totem effect uses Minecraft's small_fireball entity
- Config system uses data storage (Minecraft 1.21+)
- All effects scale properly with tier progression
