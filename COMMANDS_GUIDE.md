# Rituals Mod - Command Reference Guide

## Overview

The Rituals mod provides custom commands that work in **both singleplayer and multiplayer** environments. All commands are prefixed with `/rituals` and automatically execute the corresponding datapack functions.

## Command Structure

All commands follow this pattern:
```
/rituals <category> [subcommand]
```

---

## Basic Commands

### Help & Information

#### `/rituals help`
Displays comprehensive help information about available commands and mod features.

**Usage:** `/rituals help`
**Permissions:** None required
**Aliases:** None

---

#### `/rituals guidebook`
Provides access to the in-game guidebook with detailed ritual information.

**Usage:** `/rituals guidebook`
**Permissions:** None required

---

#### `/rituals get`
Retrieves ritual-related items or information.

**Usage:** `/rituals get`
**Permissions:** None required

---

## Give Commands

The `give` category provides various totem items and the guidebook.

### General

- `/rituals give all` - Gives all available totems
- `/rituals give guidebook` - Gives the ritual guidebook
- `/rituals give totems_short` - Gives all short variant totems

### Copper Totems

- `/rituals give totem_copper` - Gives a tall copper totem
- `/rituals give totem_copper_short` - Gives a short copper totem

### Gold Totems

- `/rituals give totem_gold` - Gives a tall gold totem
- `/rituals give totem_gold_short` - Gives a short gold totem

### Iron Totems (Basic Tier)

- `/rituals give totem_basic` - Gives a tall basic/iron totem
- `/rituals give totem_basic_short` - Gives a short basic/iron totem

### Diamond Totems (Advanced Tier)

- `/rituals give totem_advanced` - Gives a tall advanced/diamond totem
- `/rituals give totem_advanced_short` - Gives a short advanced/diamond totem

### Netherite Totems

- `/rituals give totem_netherite` - Gives a tall netherite totem
- `/rituals give totem_netherite_short` - Gives a short netherite totem

### Master Totems

- `/rituals give totem_master` - Gives a tall master totem
- `/rituals give totem_master_short` - Gives a short master totem

**Permissions:** None required for give commands
**Note:** Items are given to the command executor

---

## Configuration Commands

### `/rituals config reload`
Reloads the ritual configuration from the TOML file and pushes updated values to the datapack scoreboards/storage.

**Usage:** `/rituals config reload`
**Permissions:** Operator level 2 (OP) required
**Use Case:** Apply configuration changes made to `rituals.toml` without restarting

---

### `/rituals config xp_interval <value>`
Sets the soul XP rate — how often the soul gains passive XP while a soul-embodied item is in the player's hotbar. Accepts either a **preset name** or a **custom tick count**.

**Usage:**
```
/rituals config xp_interval easy         # 30 seconds per XP
/rituals config xp_interval hard         # 3 minutes per XP (default)
/rituals config xp_interval impossible   # 60 minutes per XP
/rituals config xp_interval 100          # Custom: 5 seconds (100 ticks)
```

**Permissions:** Operator level 2 (OP) required
**Saves to:** `rituals.toml` and pushes to datapack immediately
**Minimum custom value:** 20 ticks (1 second)

**Available presets:**

| Preset | Interval |
|---|---|
| `trivial` | 10 seconds |
| `easy` | 30 seconds |
| `moderate` | 1 minute |
| `standard` | 2 minutes |
| `hard` *(default)* | 3 minutes |
| `tough` | 5 minutes |
| `grueling` | 8 minutes |
| `brutal` | 10 minutes |
| `punishing` | 15 minutes |
| `extreme` | 20 minutes |
| `insane` | 30 minutes |
| `nightmare` | 45 minutes |
| `impossible` | 60 minutes |

**Note:** For datapack-only servers (no mod), use the equivalent `/function` commands instead:
```
/function rituals:config/soul_xp/set_easy
/function rituals:config/soul_xp/set_hard
```
For custom values: `/data modify storage rituals:config soul_xp_interval set value <ticks>` then `/function rituals:config/soul_xp/set_interval`

---

## Admin Commands

All admin commands require **operator permissions (level 2)**.

### Debug Commands

- `/rituals admin debug_status` - Shows current debug mode status
- `/rituals admin enable_debug_mode` - Enables debug mode for troubleshooting
- `/rituals admin disable_debug_mode` - Disables debug mode
- `/rituals admin debug_recipes` - Debugs recipe-related issues
- `/rituals admin debug_barriers` - Debugs barrier placements for rituals

### Kiwi Mode

- `/rituals admin enable_kiwi_mode` - Enables Kiwi mode (special feature)
- `/rituals admin disable_kiwi_mode` - Disables Kiwi mode

### Totem Management

- `/rituals admin list_totems` - Lists all active totems in the world

### Recipe Management

- `/rituals admin unlock_all_recipes` - Unlocks all ritual recipes for players
- `/rituals admin test_recipes` - Tests recipe functionality
- `/rituals admin update_previews` - Updates totem preview displays

### System Commands

- `/rituals admin reset_all` - Resets all ritual data (use with caution!)
- `/rituals admin uninstall` - Prepares the mod for clean removal

**Permissions:** Operator level 2 (OP) required
**Warning:** Some admin commands can modify or reset important data. Use with caution!

---

## Technical Details

### Command Registration

Commands are registered using Fabric's Command API v2, which ensures they work in both singleplayer and multiplayer environments. Each command executes its corresponding datapack function using Minecraft's function system.

### Permission Levels

- **Level 0 (Default):** Basic commands (help, get, give, guidebook, soul info/rename)
- **Level 2 (Operator):** Admin commands AND config commands (reload, xp_interval)

### Singleplayer Support

All commands work in singleplayer mode without requiring a dedicated server. The mod automatically registers commands with Minecraft's integrated server when you create or load a world.

### Command Execution Flow

1. Player executes `/rituals <subcommand>`
2. Fabric command handler intercepts the command
3. Command handler executes corresponding datapack function via `/function rituals:<path>`
4. Datapack function executes its logic
5. Result is returned to the player

---

## Examples

### Getting Started
```
/rituals help                    # View all available commands
/rituals guidebook               # Get the guidebook
/rituals give totem_copper       # Get a copper totem to start
```

### Setting Up Rituals
```
/rituals give totems_short       # Get all short totems for testing
/rituals config reload           # Reload config if you made changes
```

### Troubleshooting (OP Required)
```
/rituals admin debug_status      # Check debug mode status
/rituals admin enable_debug_mode # Enable debug output
/rituals admin list_totems       # See all active totems
```

### Administration (OP Required)
```
/rituals admin unlock_all_recipes   # Unlock all recipes for testing
/rituals admin update_previews      # Refresh totem previews
/rituals admin reset_all            # Reset everything (careful!)
```

---

## Troubleshooting

### Commands Not Working in Singleplayer

If commands aren't working in singleplayer:

1. **Verify Fabric API is installed** - The mod requires Fabric API
2. **Check mod is loaded** - Look for "Rituals - Fire Sacrifice Edition" in the mods list
3. **Verify world is loaded** - Commands only work when in a world
4. **Check console logs** - Look for any error messages during mod initialization

### Permission Errors

If you get permission errors for admin commands:

1. **Enable cheats** - Singleplayer: Open to LAN with cheats enabled, or create world with cheats
2. **Verify OP status** - Multiplayer: Ensure you're opped on the server (`/op <username>`)

### Function Not Found Errors

If you get "function not found" errors:

1. **Verify datapack is loaded** - Run `/datapack list` to see loaded datapacks
2. **Reload datapacks** - Run `/reload` to refresh all datapacks
3. **Check mod installation** - Ensure the mod JAR is in the mods folder

---

## Migration from Old Command System

If you were previously using `/function rituals:*` commands directly:

### Old Format → New Format

```
/function rituals:help              → /rituals help
/function rituals:guidebook         → /rituals guidebook
/function rituals:give/totem_copper → /rituals give totem_copper
/function rituals:config/reload     → /rituals config reload
/function rituals:admin/debug_status → /rituals admin debug_status
```

### Benefits of New System

- ✅ **Tab completion** - Commands auto-complete as you type
- ✅ **Better UX** - Cleaner, more intuitive command structure
- ✅ **Singleplayer support** - Works perfectly in singleplayer worlds
- ✅ **Permission control** - Admin commands protected by OP level
- ✅ **Error handling** - Better error messages if something goes wrong

---

## Support

For issues, bugs, or feature requests:
- **GitHub:** https://github.com/Underwood-Inc/rituals/issues
- **Documentation:** See the `docs/` folder for detailed guides

---

## Technical Notes for Developers

### Adding New Commands

To add new commands, edit `src/main/java/com/rituals/RitualsMod.java`:

```java
ritualsCommand.then(CommandManager.literal("your_command")
    .executes(ctx -> executeFunction(ctx, "rituals:your_function")));
```

### Command Structure

Commands use Brigadier's command system:
- `LiteralArgumentBuilder` - Creates command nodes
- `.then()` - Adds subcommands
- `.executes()` - Defines execution logic
- `.requires()` - Sets permission requirements

### Datapack Function Execution

Commands execute datapack functions via:
```java
source.getServer().getCommandManager().executeWithPrefix(source, "function " + functionPath);
```

This ensures proper context (player, position, permissions) is maintained.

---

*Last Updated: February 2026*
*Mod Version: 1.4.5*
*Minecraft Version: 1.21.11*

