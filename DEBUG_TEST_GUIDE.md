# Debug Test Guide - Auto-Farm Ritual

## What I Just Added

Added **aggressive debug output** at every step of the ritual activation. You'll now see messages showing exactly what's happening.

## Test Steps

### 1. Setup the Pattern

1. Place center totem (any tier is fine)
2. Right-click with Diamond Hoe to place it on center totem
3. Place 4 corner totems at exact positions from center:
   - **NE**: +5 blocks East, +5 blocks North (so if center is X=100, Z=100, this is X=105, Z=105)
   - **SE**: +5 blocks East, -5 blocks South (X=105, Z=95)
   - **SW**: -5 blocks West, -5 blocks South (X=95, Z=95)
   - **NW**: -5 blocks West, +5 blocks North (X=95, Z=105)
4. Place items on corners:
   - NE: **Wheat** (the crop, not seeds!)
   - SE: **Carrot**
   - SW: **Potato**
   - NW: **Beetroot** (the red vegetable, not seeds!)

### 2. Fire Sacrifice

Drop 4x Coal around the center totem:
- One coal about 2 blocks North
- One coal about 2 blocks East
- One coal about 2 blocks South
- One coal about 2 blocks West

Light fire on or near the center totem (use flint & steel).

### 3. What You Should See

If fire sacrifice works, you'll see:
```
[Totem Rituals] Fire sacrifice accepted! (consumed 4x Coal)
```

Then IMMEDIATELY you should see:
```
[Pattern Debug] Checking central item: "minecraft:diamond_hoe"
[Pattern Debug] Diamond Hoe detected! Running auto-farm detection...
[Auto-Farm] Starting pattern detection...
```

Then EITHER:
- **SUCCESS**: `[Auto-Farm] ✓ Pattern VALID! Activating ritual...`
- **FAILURE**: `[Auto-Farm] ✗ Pattern incomplete! Found X/4 corners`

If it fails, you'll see which corners are missing:
```
  NE(+5,+5):1 SE(+5,-5):0 SW(-5,-5):1 NW(-5,+5):0
  (1=found, 0=missing or wrong item)
```
- **1** = corner found with correct item
- **0** = corner missing or wrong item

### 4. Report Back

Tell me:
1. **Did you see the fire sacrifice success message?**
2. **Did you see ANY of the "[Pattern Debug]" or "[Auto-Farm]" messages?**
3. **If you saw the incomplete message, what were the corner scores?**
4. **Are you in Kiwi Mode or Fire Sacrifice mode?** (check with `/data get storage rituals:config kiwi_mode`)

## Common Issues

### "I don't see ANY debug messages"
- Fire sacrifice isn't triggering - check that:
  - Coal is placed in all 4 cardinal directions
  - Fire is lit on or very near the totem
  - You're using the correct sacrifice material for totem tier (coal works for all tiers)

### "I see Pattern Debug but it shows wrong item"
- Check that diamond hoe is actually on the center totem
- Try removing and re-placing the diamond hoe

### "Corner scores are all 0"
- Totems aren't at the right positions - use F3 to verify coordinates
- Items are wrong - make sure you're using crops, not seeds!
  - CORRECT: Wheat (the yellow crop)
  - WRONG: Wheat Seeds (the green seeds)

### "Some corners are 1, some are 0"
- Check the 0 corners - they're either missing totems or have wrong items
- Verify exact positions with F3 coordinates

## Need More Help?

Run this command to see your current position:
```
/execute at @s run tellraw @s [{"text":"Your position: ","color":"gray"},{"nbt":"Pos","entity":"@s"}]
```

Then check each corner totem position to make sure they're exactly ±5 blocks in X and Z from center.

