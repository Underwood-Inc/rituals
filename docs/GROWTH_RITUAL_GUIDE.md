# Growth Ritual System Guide 🌱

This guide explains how the Growth Ritual works and how to add new crops/plants to the system.

## How the Growth Ritual Works ⚙️

The Growth Ritual applies bonemeal effects to crops in a tier-based range with different frequencies and success chances.

### Range Settings 📏
- **Tier 1 (Wood)**: 2x2 horizontal, 3 vertical (5x7x5 box)
- **Tier 2 (Copper)**: 3x3 horizontal, 4 vertical (7x9x7 box)  
- **Tier 3 (Iron)**: 4x4 horizontal, 5 vertical (9x11x9 box)
- **Tier 4 (Gold)**: 5x5 horizontal, 6 vertical (11x13x11 box)
- **Tier 5 (Diamond)**: 6x6 horizontal, 7 vertical (13x15x13 box)
- **Tier 6 (Netherite)**: 7x7 horizontal, 8 vertical (15x17x15 box)

### Frequency Settings ⏰
- **Tier 1**: Every 300 ticks (15 seconds)
- **Tier 2**: Every 240 ticks (12 seconds)
- **Tier 3**: Every 180 ticks (9 seconds)
- **Tier 4**: Every 135 ticks (6.75 seconds)
- **Tier 5**: Every 90 ticks (4.5 seconds)
- **Tier 6**: Every 60 ticks (3 seconds)

### Success Chance Per Tier 🎲
- **Tier 1-3 (Wood/Copper/Iron)**: 60% chance - Reliable early game progression
- **Tier 4 (Gold)**: 50% chance
- **Tier 5 (Diamond)**: 40% chance
- **Tier 6 (Netherite)**: 30% chance - Lower success rate compensates for massive range

## Currently Supported Crops 🌾

The system supports these crops through the `#minecraft:crops` tag and specific growth functions:

### Basic Crops
- Wheat (`wheat`)
- Carrots (`carrots`) 
- Potatoes (`potatoes`)
- Beetroots (`beetroots`)

### Advanced Crops
- Saplings (`#minecraft:saplings`)
- Pumpkin Stems (`pumpkin_stem`)
- Melon Stems (`melon_stem`)
- Sweet Berry Bushes (`sweet_berry_bush`)
- Cocoa (`cocoa`)

## How to Add New Plants/Crops 🌿

To add new crops to the growth ritual system, follow these steps:

### Step 1: Add to the Crops Tag 🏷️

Create or modify `src/main/resources/data/rituals/tags/block/crops.json`:

```json
{
  "values": [
    "minecraft:wheat",
    "minecraft:carrots", 
    "minecraft:potatoes",
    "minecraft:beetroots",
    "minecraft:pumpkin_stem",
    "minecraft:melon_stem",
    "minecraft:sweet_berry_bush",
    "minecraft:cocoa",
    "minecraft:YOUR_NEW_CROP_HERE"
  ]
}
```

### Step 2: Create Growth Function ⚙️

Create a new file `src/main/resources/data/rituals/function/ritual/effects/grow_YOUR_CROP.mcfunction`:

```mcfunction
# Grow YOUR_CROP by ONE stage only
execute if block ~ ~ ~ your_crop[age=6] run return run setblock ~ ~ ~ your_crop[age=7] replace
execute if block ~ ~ ~ your_crop[age=5] run return run setblock ~ ~ ~ your_crop[age=6] replace
execute if block ~ ~ ~ your_crop[age=4] run return run setblock ~ ~ ~ your_crop[age=5] replace
execute if block ~ ~ ~ your_crop[age=3] run return run setblock ~ ~ ~ your_crop[age=4] replace
execute if block ~ ~ ~ your_crop[age=2] run return run setblock ~ ~ ~ your_crop[age=3] replace
execute if block ~ ~ ~ your_crop[age=1] run return run setblock ~ ~ ~ your_crop[age=2] replace
execute if block ~ ~ ~ your_crop[age=0] run return run setblock ~ ~ ~ your_crop[age=1] replace
```

**Note:** Adjust the age values based on your crop's growth stages. Most crops have 8 stages (0-7), but some may have different ranges.

### Step 3: Add to do_bonemeal.mcfunction 🔧

Add this line to `src/main/resources/data/rituals/function/ritual/effects/do_bonemeal.mcfunction`:

```mcfunction
execute align xyz if block ~ ~ ~ your_crop run function rituals:ritual/effects/grow_YOUR_CROP
```

### Step 4: Test Your Implementation 🧪

1. Place a totem with the Growth ritual
2. Plant your new crop within the totem's range
3. Wait for the growth attempts and verify the crop grows by one stage
4. Check that particles and effects appear when growth occurs

## System Mechanics ⚙️

The growth ritual works by:

1. **Scanning** the tier-based range every few seconds
2. **Checking** each block for crops using `#minecraft:crops` tag
3. **Applying** tier-based random chance (30-60% based on tier)
4. **Growing** crops by exactly one growth stage (not instant maturity)
5. **Showing** particles and effects when growth occurs

The system is designed so **higher tiers have larger ranges but lower success rates**, creating a balanced progression where early tiers are reliable but limited, while late tiers cover massive areas but require more attempts to succeed.

## Troubleshooting 🔧

### Common Issues

**Crop not growing:**
- Check that your crop is included in the `#minecraft:crops` tag
- Verify your growth function handles all age stages correctly
- Ensure the growth function is called in `do_bonemeal.mcfunction`

**Growth too fast/slow:**
- Adjust the frequency values in `config/load.mcfunction`
- Modify the success chance predicates in `growth_scan_z.mcfunction`

**Particles not showing:**
- Check that your growth function is being called
- Verify the particle commands in `do_bonemeal.mcfunction` are working

### Debug Mode

Enable debug mode to see growth attempts in real-time:

```mcfunction
/data modify storage rituals:config debug_mode set value true
```

This will show timer information and growth attempts in chat for nearby players.

## Examples 📝

### Adding Nether Wart

1. **Add to crops tag:**
```json
"minecraft:nether_wart"
```

2. **Create growth function:**
```mcfunction
# Grow nether wart by ONE stage only
execute if block ~ ~ ~ nether_wart[age=2] run return run setblock ~ ~ ~ nether_wart[age=3] replace
execute if block ~ ~ ~ nether_wart[age=1] run return run setblock ~ ~ ~ nether_wart[age=2] replace
execute if block ~ ~ ~ nether_wart[age=0] run return run setblock ~ ~ ~ nether_wart[age=1] replace
```

3. **Add to do_bonemeal:**
```mcfunction
execute align xyz if block ~ ~ ~ nether_wart run function rituals:ritual/effects/grow_nether_wart
```

### Adding Bamboo

1. **Add to crops tag:**
```json
"minecraft:bamboo"
```

2. **Create growth function:**
```mcfunction
# Grow bamboo by ONE stage only
execute if block ~ ~ ~ bamboo[age=0] run return run setblock ~ ~ ~ bamboo[age=1] replace
```

3. **Add to do_bonemeal:**
```mcfunction
execute align xyz if block ~ ~ ~ bamboo run function rituals:ritual/effects/grow_bamboo
```

---

*This guide covers the complete process of adding new crops to the Growth Ritual system. For more information about the Rituals mod, see the main [README.md](../README.md).*
