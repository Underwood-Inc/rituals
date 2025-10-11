# NBT Data Type Fix - Critical Bug

## Problem

There was a **critical data type mismatch** between:
- **Recipe outputs** (using integers: `rituals_totem: 1`)
- **Give commands** (using bytes: `rituals_totem:1b`)
- **Tick detection** (checking for bytes: `rituals_totem:1b`)

This meant:
- ❌ **Crafted totems didn't work** - couldn't be placed
- ❌ **Rituals didn't activate** - totems not recognized
- ❌ **Redstone visualization didn't work** - totems not updating

## Root Cause

In Minecraft 1.21.10:
- **Recipes (JSON files)** require integers for custom_data (e.g., `rituals_totem: 1`)
- **Commands** can use either bytes or integers
- **NBT selectors** must match the exact data type

When we fixed the recipes to use integers (to make crafting work), we forgot to update the commands and detection logic.

## Solution

### Fixed Files (26 total)

#### 1. Detection Logic
- `data/rituals/function/tick.mcfunction`
  - Now checks for **both** integer and byte formats for compatibility
  - Ensures both crafted and command-given totems work

#### 2. Give Commands (12 files)
Changed from `rituals_totem:1b` to `rituals_totem:1`:
- `totem_basic.mcfunction`
- `totem_basic_short.mcfunction`
- `totem_copper.mcfunction`
- `totem_copper_short.mcfunction`
- `totem_advanced.mcfunction`
- `totem_advanced_short.mcfunction`
- `totem_gold.mcfunction`
- `totem_gold_short.mcfunction`
- `totem_master.mcfunction`
- `totem_master_short.mcfunction`
- `totem_netherite.mcfunction`
- `totem_netherite_short.mcfunction`

#### 3. Drop Functions (12 files)
Changed from `rituals_totem:1b` to `rituals_totem:1`:
- `tier1.mcfunction` through `tier6.mcfunction`
- `tier1_short.mcfunction` through `tier6_short.mcfunction`

## Changes Made

### Before (Broken):
```mcfunction
# Recipes
"custom_data": {
  "rituals_totem": 1    ← integer
}

# Give commands
custom_data={rituals_totem:1b}  ← byte (mismatch!)

# Detection
{custom_data:{rituals_totem:1b}}  ← only finds bytes
```

### After (Fixed):
```mcfunction
# Recipes (unchanged - already correct)
"custom_data": {
  "rituals_totem": 1    ← integer
}

# Give commands (now match recipes)
custom_data={rituals_totem:1}  ← integer

# Detection (finds both)
{custom_data:{rituals_totem:1}}   ← finds integers
{custom_data:{rituals_totem:1b}}  ← finds bytes (backward compat)
```

## Testing Checklist

After `/reload`, verify:

- [x] Crafted totems can be placed
- [x] Command-given totems can be placed
- [x] Totems with items trigger rituals
- [x] Single totem activates effects
- [x] Redstone visualization works (lever/torch/block)
- [x] Breaking totems drops correct item
- [x] Dropped totems can be picked up and placed again

## Why This Matters

### Data Type Rules in Minecraft 1.21.10:
1. **JSON recipes** MUST use integers (no `b` suffix)
2. **Commands** CAN use either, but integers are preferred
3. **NBT selectors** match EXACTLY - `1` ≠ `1b`

### Impact:
- Using `1b` (byte) in recipes causes parsing errors
- Using `1` (int) in recipes requires `1` everywhere else
- Mixing types breaks detection and functionality

## Performance Note

The dual-check in `tick.mcfunction`:
```mcfunction
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{rituals_totem:1}}}}] at @s run function rituals:totem/check_place
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{rituals_totem:1b}}}}] at @s run function rituals:totem/check_place
```

Has minimal performance impact:
- Only runs on players holding the item
- Second check usually finds no matches (only for old items)
- Ensures backward compatibility with any existing totems

## Future Prevention

**Always use integers** in Minecraft 1.21.10+ for custom_data:
- ✅ `rituals_totem: 1` or `rituals_totem:1` 
- ❌ `rituals_totem: 1b` or `rituals_totem:1b`

The byte suffix (`b`) is legacy from older versions and causes issues with modern recipe parsing.

---

**Status**: ✅ FIXED - All NBT data types now consistent
**Version**: 1.21.10
**Date**: 2025-10-11
**Priority**: CRITICAL

