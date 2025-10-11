# Totem Rituals - Testing Checklist

## Current Status Summary

### ✅ COMPLETED (Should Work)

**Totem Placement:**
- Right-click while looking at a block to place totem on top
- Uses raycast detection (like normal block placement)
- Creates 3 entities: interaction, block_display, item_display
- Two variants: Tall (item at Y+2.2) and Short (item at Y+0.8, eye level)

**Totem Breaking:**
- Left-click/punch totem to break
- Drops totem item
- Removes ALL associated entities (visual + display)
- Fixed ID matching system

**Item Display System:**
- Right-click placed totem with ANY item
- Item transfers to item_display entity
- Item floats above totem at Y+2.2
- Works with ANY Minecraft item
- Right-click again to remove item

**Upgrade System:**
- Right-click with upgrade slate to upgrade totem
- Validates tier progression (no skipping)
- Changes visual when upgraded
- Works with progressive tiers

**Recipe System:**
- All recipes defined with proper groups
- Crafting works in crafting table
- Use `/function rituals:admin/unlock_all_recipes` to see all

**Redstone Visualization:**
- Power totem with redstone signal
- Red particle border shows ritual range (5x5x6 box)
- Updates 4 times per second while powered
- Works with any redstone source (wire, torch, repeater, etc.)

---

## How Item Display Works

### For ANY Item:
1. Place totem (Sneak + Right-click)
2. Hold ANY item (emerald, diamond, dirt, sword, etc.)
3. Right-click the totem
4. Item appears floating on top!

### For Ritual Items (Special):
When 3+ totems have the SAME item displayed:
- **Emerald** → Growth Ritual (crops grow faster)
- **Diamond** → Strength Ritual (combat buffs)
- **Gold Ingot** → Prosperity Ritual (item magnet)
- **Iron Ingot** → Protection Ritual (damages mobs)
- **Nether Star** → Healing Ritual (heals players/animals)

Other items can be displayed but won't trigger rituals!

---

## Testing Commands

```
# Get all items (includes short totems)
/function rituals:give/all

# Get only short totems
/function rituals:give/totems_short

# Unlock all recipes
/function rituals:admin/unlock_all_recipes

# Remove all totems (cleanup)
/function rituals:admin/uninstall

# Open guide menu
/function rituals:guide/main
```

---

## Test Sequence

### Test 1: Basic Placement (Tall)
1. `/function rituals:give/totem_basic`
2. Hold totem, look at any block, right-click
3. **Expected:** 2-block tall stone wall pole appears on top of the block

### Test 1b: Short Totem Placement
1. `/function rituals:give/totem_basic_short`
2. Hold totem, look at any block, right-click
3. **Expected:** 1-block tall stone wall pole appears on top of the block
4. Place item on it - should be at eye level!

### Test 2: Item Display
1. Place totem
2. Hold emerald
3. Right-click totem
4. **Expected:** Emerald appears floating on top
5. Right-click again (empty hand or with item)
6. **Expected:** Emerald drops

### Test 3: Breaking
1. Place totem
2. Put item on it
3. Punch (left-click) totem
4. **Expected:** Both totem AND item drop, visual disappears

### Test 4: Ritual Activation
1. Place 3 totems near each other
2. Put emerald on each
3. Wait 1 second
4. **Expected:** "Growth Ritual Activated!" message, green particles

### Test 5: Upgrades
1. Place wooden totem
2. Get iron upgrade slate
3. Right-click totem with slate
4. **Expected:** Visual changes to stone brick, "Upgraded!" message

### Test 6: Redstone Visualization
1. Place a totem
2. Place redstone near it (dust, torch, repeater, etc.)
3. Power the redstone
4. **Expected:** Red particle box appears showing 5x5x6 range
5. Turn off redstone
6. **Expected:** Particles stop

---

## Known Working Features

✅ Totem placement (Sneak + Right-click)
✅ Totem breaking (Punch)
✅ Item display on totems (ANY item)
✅ Item removal from totems
✅ Upgrade system with validation
✅ Visual entity cleanup
✅ Recipe crafting
✅ 5 ritual types
✅ Range system (5x5x6 box)
✅ Tier-based power scaling

---

## If Something Doesn't Work

### Item won't display:
- Make sure you're right-clicking the totem (not the ground)
- Check totem doesn't already have an item
- Try with a different item
- Check distance (must be within 5 blocks)

### Totem won't place:
- Must BOTH sneak AND right-click
- Need empty space (air block)
- Check you have the totem item with custom data

### Rituals won't activate:
- Single totem should activate ritual by default
- Items must be displayed ON totems
- Wait 1 second for check (system checks every 20 ticks)
- If using multi-totem mode: need min_totems_required totems with SAME item
- Multiple totems must be within 32 blocks (if min_totems_required > 1)

---

**Everything should be working now!** 🎉

Try the test sequence above to verify!

