# Totem Rituals Datapack

A Minecraft datapack that introduces mystical totems and powerful ritual magic to your world. Place totems, display items upon them, and perform rituals to gain unique effects!

## Version Information

- **Minecraft Version**: 1.21+ (Pack Format 48)
- **Datapack Version**: 1.0.0
- **Author**: Created with care for the Minecraft community

## Table of Contents

- [Installation](#installation)
- [Getting Started](#getting-started)
- [Totem Tiers](#totem-tiers)
- [How to Use Totems](#how-to-use-totems)
- [Ritual Types](#ritual-types)
- [Crafting Recipes](#crafting-recipes)
- [Commands](#commands)
- [Technical Details](#technical-details)

## Installation

### Step-by-Step Installation Guide

This guide assumes you have no prior experience with Minecraft datapacks. A datapack is a special folder that adds new features to your Minecraft world.

1. **Download the Datapack**
   - If you received this as a ZIP file, you're ready to go
   - If you have the folder structure, compress it into a ZIP file first

2. **Locate Your World Save Folder**
   - Open Minecraft and note which world you want to add this to
   - Close Minecraft (important!)
   - Find your Minecraft saves folder:
     - **Windows**: Press `Win + R`, type `%appdata%\.minecraft\saves` and press Enter
     - **Mac**: Press `Cmd + Space`, type `~/Library/Application Support/minecraft/saves` and press Enter
     - **Linux**: Navigate to `~/.minecraft/saves`

3. **Install the Datapack**
   - Find the folder with your world's name
   - Open the `datapacks` folder inside (create it if it doesn't exist)
   - Place the datapack ZIP file (or folder) into this `datapacks` folder

4. **Enable the Datapack**
   - Launch Minecraft and open your world
   - You should see a message in chat: "[Totem Rituals] Datapack loaded successfully!"
   - If you don't see the message, type `/reload` in the chat and press Enter

5. **Get Started**
   - Type `/function rituals:give/all` to receive all totem items
   - You're now ready to perform rituals!

## Getting Started

### Quick Start Guide

This datapack adds a new item category called "Totems" which can be crafted and placed in your world. When you place totems with specific items displayed on them, you can activate powerful rituals. Single-totem mode is enabled by default!

**Basic Workflow:**
1. Craft totems (see [Crafting Recipes](#crafting-recipes))
2. Sneak (Shift) and right-click to place a totem
3. Right-click a placed totem with an item to display it
4. Place 3+ totems with the same item type nearby
5. The ritual automatically activates!

## Totem Tiers

There are six tiers of totems, each with increasing effect power. All totems use tier-based ranges, with higher tiers providing stronger effects and larger areas.

### Tier 1 - Wood Totem
- **Material**: Oak Planks + Sticks
- **Range**: 2×2 horizontal, 3 up, 3 down
- **Effect Power**: Basic
- **Visual**: Oak fence post with item display on top

### Tier 2 - Copper Totem
- **Material**: Copper Ingots
- **Range**: 3×3 horizontal, 4 up, 4 down
- **Effect Power**: Improved
- **Visual**: Copper-colored post

### Tier 3 - Iron Totem
- **Material**: Iron Ingots
- **Range**: 4×4 horizontal, 5 up, 5 down
- **Effect Power**: Strong
- **Visual**: Iron bars with particles

### Tier 4 - Gold Totem
- **Material**: Gold Ingots
- **Range**: 5×5 horizontal, 6 up, 6 down
- **Effect Power**: Very Strong
- **Visual**: Golden post with particles

### Tier 5 - Diamond Totem
- **Material**: Diamonds
- **Range**: 6×6 horizontal, 7 up, 7 down
- **Effect Power**: Powerful
- **Visual**: Diamond post with cyan particles

### Tier 6 - Netherite Totem
- **Material**: Netherite Ingots
- **Range**: 7×7 horizontal, 8 up, 8 down
- **Effect Power**: Maximum
- **Visual**: Netherite post with purple particles

### Range Visualization

```
      [item]  ← Item display on top
        |     ← Totem pole (fence post)
    ███████   ← 5×5×6 effect zone
    ███████     (3 blocks up, 3 down)
    ███████
```

See `RANGE_DIAGRAM.md` for detailed range specifications.

## How to Use Totems

### Placing a Totem

1. Hold a totem item in your hand
2. Look at the ground where you want to place it
3. Sneak (hold Shift) and right-click
4. The totem will appear as a vertical pole

### Adding Items to Totems

1. Hold the item you want to display
2. Right-click the totem
3. The item will appear floating above the totem
4. Only one item can be displayed per totem

### Removing Items from Totems

1. Right-click a totem that has an item displayed
2. The item will drop and can be picked up
3. The totem remains in place

### Breaking Totems

1. Punch (left-click or attack) the totem
2. The totem and any displayed item will drop
3. All visual effects will be removed

## Ritual Types

Rituals activate automatically when you have 1 or more totems displaying the same item type within range of each other. Each ritual lasts for 30 seconds and provides unique effects. Higher tier totems provide stronger effects and larger ranges.

### Growth Ritual
- **Required Item**: Emerald
- **Effect**: Accelerates crop and plant growth nearby by 30% chance per check
- **Frequency Scaling**: 
  - Tier 1: Every 15 seconds
  - Tier 2: Every 12 seconds
  - Tier 3: Every 9 seconds
  - Tier 4: Every 6.75 seconds
  - Tier 5: Every 4.5 seconds
  - Tier 6: Every 3 seconds
- **Range**: Tier-based (see Totem Tiers)
- **Visual**: Green happy villager particles

### Strength Ritual
- **Required Item**: Diamond
- **Effect**: Grants Strength and Resistance to nearby players
- **Duration**: 10-30 seconds based on tier
- **Frequency**: Every 2 seconds to 0.75 seconds based on tier
- **Range**: Tier-based (see Totem Tiers)
- **Visual**: Critical hit particles

### Prosperity Ritual
- **Required Item**: Gold Ingot
- **Effect**: Attracts nearby items and spawns experience orbs
- **Pull Speed**: 0.3 to 1.0 blocks/tick based on tier
- **XP Orbs**: 2-8 XP per spawn based on tier
- **Range**: Tier-based (see Totem Tiers)
- **Visual**: Golden dust particles

### Protection Ritual
- **Required Item**: Iron Ingot
- **Effect**: Damages hostile mobs in range periodically
- **Damage**: 2-8 half-hearts per hit based on tier
- **Frequency**: Every 9 seconds to 1.5 seconds based on tier
- **Range**: Tier-based (see Totem Tiers)
- **Visual**: Blue dust particles and magic damage

### Healing Ritual
- **Required Item**: Nether Star
- **Effect**: Applies regeneration to nearby players and animals
- **Duration**: 10-120 seconds based on tier
- **Frequency**: Every 3 seconds to 1.25 seconds based on tier
- **Range**: Tier-based (see Totem Tiers)
- **Visual**: Pink/purple dust particles

### Sentry Ritual
- **Required Item**: Arrow
- **Effect**: Fires homing magical projectiles at hostile mobs
- **Damage**: 1.5-12 half-hearts based on tier
- **Fire Rate**: Every 9 seconds to 1.5 seconds based on tier
- **Projectile Speed**: 0.4-1.2 blocks/tick based on tier
- **Range**: 2× the normal tier range
- **Visual**: Glowing projectile with trail particles

### Ritual Requirements

- **Minimum Totems**: 1 totem by default (configurable to require more)
- **Maximum Distance**: 32 blocks between totems (for multi-totem rituals)
- **Single-Totem Mode**: Enabled by default! Each totem works independently
- **Duration**: 30 seconds (600 ticks)
- **Interruption**: Removing an item from any participating totem stops the ritual

## Crafting Recipes

### Basic Totem
```
 [ Stick ]
[Stick][Oak Log][Stick]
 [Oak Log]
```

### Advanced Totem
```
    [Iron Ingot]
[Iron Ingot][Basic Totem][Iron Ingot]
    [Diamond]
```

### Master Totem
```
      [Netherite Ingot]
[Diamond Block][Advanced Totem][Emerald Block]
      [Netherite Ingot]
```

**Note**: Advanced and Master totems require the previous tier as a crafting ingredient, creating a progression system.

## Commands

### Give Commands

These commands give you totem items. They can only be used by players with operator permissions (or in creative mode).

- `/function rituals:give/all` - Gives you one of each totem tier
- `/function rituals:give/totem_basic` - Gives you a Basic Totem
- `/function rituals:give/totem_advanced` - Gives you an Advanced Totem
- `/function rituals:give/totem_master` - Gives you a Master Totem

### System Commands

- `/reload` - Reloads all datapacks (use if the datapack isn't working)

## Technical Details

### For Server Administrators

**Performance Considerations:**
- The datapack uses interaction entities for totem placement (Minecraft 1.19.4+)
- Rituals check for activation every 20 ticks (once per second)
- Effects apply at intervals (20-40 ticks) to maintain performance
- Each totem uses 3 entities: 1 interaction, 1 block display, 1 item display

**Compatibility:**
- Should work with most other datapacks
- Uses custom scoreboard objectives (all prefixed with "rituals.")
- Uses storage namespace "rituals:temp"
- Custom tags are all in the "rituals" namespace

### For Datapack Developers

**Architecture:**
- **Main Loop**: `rituals:tick` runs from `minecraft:tick`
- **Initialization**: `rituals:load` runs from `minecraft:load`
- **Entity System**: Uses interaction entities for hitbox/data, display entities for visuals
- **ID System**: Each totem gets a unique ID for linking its entities

**Scoreboards:**
- `rituals.data` - Constants and global data
- `rituals.timer` - Tick counters for cooldowns/durations
- `rituals.distance` - Totem range values
- `rituals.tier` - Totem tier (1-3)
- `rituals.effect` - Active ritual effect type (1-5)
- `rituals.temp` - Temporary calculations
- `rituals.id` - Entity linking system

**Tags:**
- `rituals.totem` - Main totem interaction entities
- `rituals.totem_visual` - Block display entities for totem visuals
- `rituals.totem_display` - Item display entities for held items
- `rituals.has_item` - Totems with items displayed
- `rituals.active_ritual` - Totems participating in a ritual
- `rituals.[ritual_type]_ritual` - Specific ritual type tags

**File Structure:**
```
data/
├── rituals/
│   ├── function/
│   │   ├── load.mcfunction
│   │   ├── tick.mcfunction
│   │   ├── give/
│   │   ├── totem/
│   │   └── ritual/
│   ├── recipe/
│   ├── predicate/
│   ├── item_modifier/
│   └── tags/
├── minecraft/
│   └── tags/
│       └── function/
└── pack.mcmeta
```

## Redstone Range Display

You can visualize a totem's effect range by powering it with redstone!

**How to use:**
1. Place a **lever**, **redstone torch**, **redstone block**, or powered **redstone wire** next to or below your totem
2. Red particles will show the exact ritual range (5×5×6 box, or 10×10×12 for Sentry totems)
3. Turn off the redstone to hide the display

**Supported redstone sources:**
- Redstone torch (always on)
- Redstone block (always on)
- Lever (toggle on/off)
- Button (temporary)
- Powered redstone wire

See `REDSTONE_RANGE_DISPLAY.md` for full details!

## Troubleshooting

### Common Issues

**Totems won't place:**
- Make sure you're sneaking (holding Shift) when you right-click
- Ensure there's empty space (air block) where you're trying to place the totem
- Check that you have the actual totem item (should have custom name and lore)

**Items won't display on totems:**
- Make sure you're right-clicking the totem, not the ground near it
- The totem can only hold one item at a time
- Try removing the current item first (right-click empty-handed)

**Rituals won't activate:**
- By default, only 1 totem is needed (check config if changed)
- Totems work individually by default (configurable to require multiple)
- Items must be placed ON the totems (floating above them)
- Wait 1 second after placing the last item (system checks every 20 ticks)

**Datapack not working:**
- Type `/reload` in chat
- Check that the datapack is in the correct folder (world/datapacks/)
- Ensure the folder structure is correct (pack.mcmeta should be at the root)
- Make sure you're using Minecraft 1.21 or later

## Future Enhancements

Planned features for future versions:
- Ritual upgrade system to extend range
- More ritual types and effects
- Ritual combinations for unique effects
- Configuration options
- Integration with advancement system
- Multi-item rituals requiring different items
- Ritual altars and structures

## Credits

Created with expertise in Minecraft datapack development and a passion for magical gameplay mechanics.

## License

This datapack is provided as-is for use in Minecraft worlds. Feel free to modify it for personal use or server use, but please provide credit if you redistribute or share modifications.

---

**Enjoy your mystical journey with Totem Rituals!**

For issues, questions, or suggestions, please contact the datapack maintainer.

