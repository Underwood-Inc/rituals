# Rituals - Fabric Mod

**Fire Sacrifice Edition - Auto-Installing Mod Version**

This is the **Fabric mod** version of Rituals. It automatically installs the datapack when you add the mod to your mods folder - no manual installation required!

---

## Installation

### Requirements
- **Minecraft**: 1.21 or later
- **Fabric Loader**: 0.15.0 or later
- **Java**: 21 or later

### Steps

1. **Install Fabric Loader**
   - Download from https://fabricmc.net/use/installer/
   - Run the installer and select Minecraft 1.21

2. **Install the Mod**
   - Download `rituals-2.0.0.jar` from releases
   - Place it in your `.minecraft/mods/` folder
   - Launch Minecraft with Fabric profile

3. **Done!**
   - The datapack is automatically loaded
   - Works for any world (new or existing)
   - No additional configuration needed

---

## Features

✨ **Mystical Totems** - Six tiers from Wood to Netherite  
🔥 **Fire Sacrifice System** - Dramatic ritual activation  
⚡ **Six Ritual Types** - Growth, Strength, Prosperity, Protection, Healing, Sentry  
🎨 **Custom Visuals** - Particles, markers, and effects  
🔧 **Fully Configurable** - Toggle features via in-game commands  

---

## Quick Start

1. Craft a totem (see in-game advancements for recipes)
2. Place totem with Right-click on ground
3. Add a ritual item (Diamond, Emerald, Arrow, etc.)
4. Drop 4 catalyst items around totem (N/S/E/W)
5. Light fire at totem base
6. Watch the magic happen! 🔥

---

## Commands

- `/function rituals:help` - Show help menu
- `/function rituals:give/all` - Get all totems (creative/op)
- `/function rituals:guidebook` - Get the in-game guide

---

## Configuration

All settings can be modified in-game:

```mcfunction
# Disable fire sacrifice (revert to auto-activation)
/data modify storage rituals:config require_fire_sacrifice set value false
/function rituals:config/reload

# Rituals are permanent until deactivated (no duration config needed)
/function rituals:config/reload
```

See `CONFIG_GUIDE.md` for all options.

---

## vs Datapack Version

| Feature | Mod | Datapack |
|---------|-----|----------|
| Installation | Drop in mods folder | Manual copy to world folder |
| Visual Style | Auto-applied | Uses vanilla totem texture |
| Multiplayer | Works on servers | Requires server setup |
| Updates | Replace jar file | Re-copy files |
| Requirements | Fabric Loader | None (vanilla) |

**Use the mod if**: You want easy installation and updates  
**Use the datapack if**: You prefer vanilla or can't use mods

---

## Compatibility

✅ **Compatible with**:
- Optifine/Sodium/Iris
- Most Fabric mods
- Vanilla servers (if server has the mod)

⚠️ **May conflict with**:
- Mods that heavily modify interaction entities
- Mods that override datapack loading

---

## Support

- **Issues**: https://github.com/yourname/rituals/issues
- **Wiki**: See included markdown guides
- **Discord**: [Your Discord link]

---

## Credits

Created with expertise in Minecraft datapack development and a passion for magical gameplay mechanics.

---

## License

MIT License - See LICENSE file

---

**Enjoy your mystical journey with Rituals!** 🔥✨


