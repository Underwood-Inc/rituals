# Fire Sacrifice Quick Reference Card

**Print this or keep it open for quick reference!** 📋

---

## Basic Steps

```
1. Place Totem         → Right-click on ground
2. Add Ritual Item     → Right-click totem with item (Diamond, Emerald, etc.)
3. Drop 4 Catalysts    → Throw items on ground (N, S, E, W of totem)
4. Light Fire          → Use Flint & Steel at totem base
5. Watch Magic!        → Offerings consumed, ritual starts
```

---

## Catalyst Costs (What to Drop)

| Totem Tier | Catalyst Item | Quantity | Total Cost |
|------------|--------------|----------|------------|
| 🪵 Wood | Coal | 4 | Very Cheap |
| 🟠 Copper | Copper Ingot | 4 | Cheap |
| ⚙️ Iron | Iron Ingot | 4 | Moderate |
| 🟡 Gold | Gold Ingot | 4 | Moderate-High |
| 💎 Diamond | Diamond | 4 | High |
| 🟣 Netherite | Netherite Ingot | 4 | Very High |

---

## Offering Placement

```
           [North]
               |
               2 blocks
               |
[West] -- [TOTEM] -- [East]
               |
               2 blocks
               |
           [South]
```

**Tips:**
- Drop items approximately 2 blocks away
- Any Y-level near ground is fine
- All 4 must be present before lighting fire

---

## Ritual Items (What Goes ON the Totem)

| Ritual Type | Item Needed | Effect |
|-------------|-------------|--------|
| 🌱 Growth | Emerald | Crop growth |
| 💪 Strength | Diamond | Buffs players |
| 💰 Prosperity | Netherite Block | Item magnet + Luck |
| 🛡️ Protection | Iron Ingot | Damages mobs |
| 💖 Healing | Nether Star | Regeneration |
| 🏹 Sentry | Arrow | Auto-turret |

---

## Fire Sources That Work

✅ Flint & Steel  
✅ Fire Charge  
✅ Flame Enchantment  
✅ Lava (sets blocks on fire)  
✅ Blaze Fireballs  
✅ Soul Fire  

---

## Troubleshooting

### Ritual Won't Activate?

- [ ] 4 catalysts dropped? (correct type for tier)
- [ ] Fire lit at totem base?
- [ ] Ritual item on totem?
- [ ] Totem not already running ritual?
- [ ] Items on GROUND (not in inventory)?

### Items Disappeared?

- Fire burned them before detection
- **Solution**: Drop items FIRST, then light fire immediately

---

## Config Toggle (Admin Only)

```mcfunction
# Disable fire sacrifice (auto-activation)
/data modify storage rituals:config require_fire_sacrifice set value false
/function rituals:config/reload

# Re-enable fire sacrifice
/data modify storage rituals:config require_fire_sacrifice set value true
/function rituals:config/reload
```

---

## Cost-Benefit Analysis

| Tier | Cost/Ritual | Range | Worth It? |
|------|------------|-------|-----------|
| Wood | 4 Coal | 2×2×7 | ★★★ Best starter |
| Copper | 4 Copper | 3×3×9 | ★★★ Great early |
| Iron | 4 Iron | 4×4×11 | ★★★ Balanced mid-game |
| Gold | 4 Gold | 5×5×13 | ★★☆ If you have gold farm |
| Diamond | 4 Diamond | 6×6×15 | ★★☆ Expensive but powerful |
| Netherite | 4 Netherite | 7×7×17 | ★☆☆ Only for permanent setups |

---

**💡 Pro Tip**: Build a "ritual chamber" with pre-placed fire sources and item storage nearby for quick sacrifices!

**📖 Full Guide**: See `FIRE_SACRIFICE_GUIDE.md`


