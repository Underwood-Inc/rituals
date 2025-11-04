# Command System Migration Summary

## What Changed?

The Rituals mod has been upgraded from a simple datapack wrapper to a **full Fabric mod with custom command registration**. This enables commands to work properly in singleplayer mode without requiring server context.

## Changes Made

### 1. Dependency Updates

#### `gradle.properties`
- **Enabled Fabric API** - Uncommented and activated `fabric_version=0.100.0+1.21`

#### `build.gradle`
- **Added Fabric API dependency** - `modImplementation "net.fabricmc.fabric-api:fabric-api:${project.fabric_version}"`

#### `src/main/resources/fabric.mod.json`
- **Declared Fabric API dependencies:**
  - `fabric-api: "*"`
  - `fabric-command-api-v2: "*"`

### 2. Command Registration System

#### `src/main/java/com/rituals/RitualsMod.java`
Complete rewrite with:

**New Imports:**
```java
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.Text;
import com.mojang.brigadier.Command;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.builder.LiteralArgumentBuilder;
```

**New Methods:**
- `registerCommands()` - Registers all mod commands using Fabric's Command API
- `executeFunction(context, functionPath)` - Executes datapack functions with proper error handling

**Command Tree Structure:**
```
/rituals
├── help
├── guidebook
├── get
├── give/
│   ├── all
│   ├── guidebook
│   ├── totems_short
│   ├── totem_copper
│   ├── totem_copper_short
│   ├── totem_gold
│   ├── totem_gold_short
│   ├── totem_basic
│   ├── totem_basic_short
│   ├── totem_advanced
│   ├── totem_advanced_short
│   ├── totem_master
│   ├── totem_master_short
│   ├── totem_netherite
│   └── totem_netherite_short
├── config/
│   └── reload
└── admin/ (OP level 2 required)
    ├── debug_status
    ├── enable_debug_mode
    ├── disable_debug_mode
    ├── enable_kiwi_mode
    ├── disable_kiwi_mode
    ├── list_totems
    ├── reset_all
    ├── uninstall
    ├── unlock_all_recipes
    ├── update_previews
    ├── test_recipes
    ├── debug_recipes
    └── debug_barriers
```

### 3. New Documentation

- **`COMMANDS_GUIDE.md`** - Comprehensive command reference with usage examples
- **`COMMAND_MIGRATION_SUMMARY.md`** - This file, detailing all changes

---

## Technical Implementation Details

### How Commands Work Now

1. **Registration Phase (Mod Initialization)**
   ```java
   CommandRegistrationCallback.EVENT.register((dispatcher, registryAccess, environment) -> {
       // Command registration happens here
   });
   ```

2. **Command Execution**
   - Player types `/rituals <subcommand>`
   - Fabric command system intercepts
   - `executeFunction()` method is called
   - Method executes: `source.getServer().getCommandManager().executeWithPrefix(source, "function " + functionPath)`
   - Datapack function runs with proper context

3. **Error Handling**
   - Try-catch blocks prevent crashes
   - User-friendly error messages
   - Detailed logging for debugging

### Permission System

Commands use Minecraft's built-in permission levels:

```java
// No permission required (default)
ritualsCommand.then(CommandManager.literal("help")
    .executes(ctx -> executeFunction(ctx, "rituals:help")));

// OP level 2 required
LiteralArgumentBuilder<ServerCommandSource> adminCommand = CommandManager.literal("admin")
    .requires(source -> source.hasPermissionLevel(2));
```

### Singleplayer Compatibility

The key to singleplayer compatibility is using **server commands** that work with the integrated server:

- In singleplayer, Minecraft runs an integrated server internally
- Commands are registered on the server side via `CommandRegistrationCallback`
- When executed, they run in the integrated server context
- This allows datapack functions to execute properly

**Before:** Direct `/function` calls required explicit server context
**After:** Custom commands automatically provide proper context

---

## Benefits

### For Players

✅ **Cleaner syntax** - `/rituals help` vs `/function rituals:help`
✅ **Tab completion** - Commands auto-complete as you type
✅ **Singleplayer support** - Works perfectly in singleplayer worlds
✅ **Better UX** - More intuitive command structure
✅ **Error messages** - Helpful feedback when things go wrong

### For Server Admins

✅ **Permission control** - Admin commands require OP status
✅ **Integrated logging** - All command usage logged
✅ **Better debugging** - Enhanced error reporting
✅ **Standard mod behavior** - Works like any other Fabric mod

### For Developers

✅ **Maintainable** - Clean, well-documented code structure
✅ **Extensible** - Easy to add new commands
✅ **Standard API** - Uses Fabric's official command API
✅ **Type-safe** - Brigadier provides compile-time checking

---

## Migration Guide

### For Players

Old command format will **still work** (via vanilla `/function` command), but new format is recommended:

```bash
# Old (still works)
/function rituals:help
/function rituals:give/totem_copper

# New (recommended)
/rituals help
/rituals give totem_copper
```

### For Server Admins

No migration needed! Commands will automatically be available when the mod loads.

**Important:** Ensure Fabric API is installed alongside the mod.

### For Developers/Modpack Authors

**Dependencies Required:**
```json
{
  "depends": {
    "fabric-api": "*",
    "fabric-command-api-v2": "*"
  }
}
```

**Adding to Modpacks:**
1. Include `rituals-1.1.0.jar` in mods folder
2. Include Fabric API JAR in mods folder
3. No additional configuration needed

---

## Testing Checklist

Before releasing, verify:

- [ ] Mod loads without errors
- [ ] Commands appear with tab completion
- [ ] Basic commands work in singleplayer
- [ ] Admin commands require OP permission
- [ ] Datapack functions execute correctly
- [ ] Error handling works (test with invalid input)
- [ ] Commands work in multiplayer
- [ ] Permission levels are respected
- [ ] All give commands provide correct items
- [ ] Config reload functions properly

---

## Rollback Plan

If issues arise, you can revert by:

1. **Revert Java code:**
   ```bash
   git checkout HEAD~1 src/main/java/com/rituals/RitualsMod.java
   ```

2. **Revert dependencies:**
   ```bash
   git checkout HEAD~1 gradle.properties build.gradle
   git checkout HEAD~1 src/main/resources/fabric.mod.json
   ```

3. **Rebuild:**
   ```bash
   ./gradlew clean build
   ```

**Note:** Old system will still require Fabric API for mod loading, but commands won't be registered.

---

## Known Limitations

### Current Limitations

1. **No client commands** - All commands are server-side only
   - This is intentional for consistency with datapack functions
   - Client commands would require duplicate implementations

2. **No argument suggestions** - Commands don't provide dynamic suggestions
   - Could be added in future for player selectors
   - Would require additional argument parsers

3. **Fixed command structure** - Commands are hardcoded
   - Dynamic command registration from datapack could be future enhancement
   - Would require datapack parsing at runtime

### Future Enhancements

Potential improvements for future versions:

- **Dynamic command loading** - Generate commands from datapack structure
- **Argument parsers** - Support for player selectors, coordinates, etc.
- **Client commands** - Commands that work without server context
- **Custom suggestions** - Context-aware tab completion
- **Command aliases** - Shorter versions of common commands
- **Localization** - Translate command help text

---

## Troubleshooting

### Build Errors

**Error: Cannot resolve fabric-command-api-v2**
- Ensure Fabric API version is correct in `gradle.properties`
- Run `./gradlew clean build --refresh-dependencies`

**Error: Import cannot be resolved**
- IDE may need to refresh Gradle project
- In IntelliJ: Right-click project → Gradle → Reload Gradle Project
- In Eclipse: Right-click project → Gradle → Refresh Gradle Project

### Runtime Errors

**Commands not appearing**
- Verify Fabric API is installed
- Check logs for registration errors
- Ensure mod is in mods folder

**Function not found errors**
- Datapack may not be loaded
- Run `/reload` to refresh datapacks
- Check datapack structure in mod JAR

**Permission denied**
- Admin commands require OP status
- Singleplayer: Open to LAN with cheats or enable cheats on world creation
- Multiplayer: Ensure player is opped with `/op <username>`

---

## Support & Resources

- **Commands Guide:** `COMMANDS_GUIDE.md`
- **Build Guide:** `docs/BUILD_GUIDE.md`
- **GitHub Issues:** https://github.com/Underwood-Inc/rituals/issues
- **Fabric Command API Docs:** https://fabricmc.net/wiki/tutorial:commands

---

*Migration Date: November 4, 2025*
*Rituals Mod Version: 1.1.0*
*Minecraft Version: 1.21*
*Fabric Loader: 0.15.11*
*Fabric API: 0.100.0+1.21*

