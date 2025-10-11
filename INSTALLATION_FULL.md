# Complete Installation Guide - Totem Rituals (Datapack + Resource Pack)

**BY MERLIN'S BEARD, YE'RE ABOUT TO INSTALL THE FULL MYSTICAL EXPERIENCE!** 🧙‍♂️⚡

## What You're Installing

This addon consists of TWO parts that work together:

1. **Datapack** - The game mechanics (rituals, recipes, totems)
2. **Resource Pack** - Custom visuals (stone walls with runes, custom item textures)

## Requirements

- Minecraft Java Edition 1.21 or newer
- A world where you have operator permissions (your own worlds work fine)

---

## Step 1: Install the Datapack

### 1.1 Prepare Your World
1. Launch Minecraft
2. Note which world you want to add this to
3. **Close Minecraft completely** (important!)

### 1.2 Locate Your World Folder

**Windows:**
1. Press `Win + R`
2. Type: `%appdata%\.minecraft\saves`
3. Press Enter

**Mac:**
1. Press `Cmd + Space`
2. Type: `~/Library/Application Support/minecraft/saves`
3. Press Enter

**Linux:**
- Navigate to: `~/.minecraft/saves`

### 1.3 Install the Datapack Files
1. Find your world folder (named after your world)
2. Open the `datapacks` folder (create it if it doesn't exist)
3. Copy the entire `rituals` folder into the `datapacks` folder

Your structure should look like:
```
saves/
└── YourWorldName/
    └── datapacks/
        └── rituals/
            ├── pack.mcmeta
            └── data/
```

---

## Step 2: Install the Resource Pack

### 2.1 Locate Your Resource Packs Folder

**Windows:**
1. Press `Win + R`
2. Type: `%appdata%\.minecraft\resourcepacks`
3. Press Enter

**Mac:**
1. Press `Cmd + Space`
2. Type: `~/Library/Application Support/minecraft/resourcepacks`
3. Press Enter

**Linux:**
- Navigate to: `~/.minecraft/resourcepacks`

### 2.2 Install the Resource Pack Files
1. Copy the entire `resourcepack` folder into the `resourcepacks` folder
2. Rename it to `Totem_Rituals` (optional, but recommended)

Your structure should look like:
```
resourcepacks/
└── Totem_Rituals/
    ├── pack.mcmeta
    └── assets/
```

---

## Step 3: Enable Everything

### 3.1 Launch Minecraft
1. Open Minecraft
2. Go to **Options** → **Resource Packs**
3. Find "Totem Rituals Resource Pack" in the Available list
4. Click the arrow to move it to Selected
5. Click **Done**

### 3.2 Load Your World
1. Open the world you installed the datapack to
2. You should see in chat:
   ```
   [Totem Rituals] Datapack loaded successfully!
   ```

### 3.3 Verify Installation
Type these commands to test:
```
/function rituals:test
/function rituals:give/all
```

You should receive 3 custom totem base items!

---

## Step 4: Optional - Add Custom Textures

The resource pack includes placeholder textures. To add your own custom stone wall designs:

1. Navigate to: `resourcepacks/Totem_Rituals/assets/rituals/textures/item/`
2. Read the `TEXTURES_README.txt` file
3. Create PNG files (16x16 or higher) with the specified names:
   - `totem_wood.png` - Stone wall with brown runes
   - `totem_iron.png` - Stone wall with silver runes
   - `totem_diamond.png` - Stone wall with cyan glowing runes
   - `paste.png` - Wheat paste texture
   - `upgrade_slate_iron.png` - Stone tablet with iron runes
   - `upgrade_slate_diamond.png` - Stone tablet with diamond runes

4. Press `F3 + T` in Minecraft to reload resource packs

---

## Troubleshooting

**Datapack not loading:**
- Type `/reload` in-game
- Check `/datapack list` - should show `rituals`
- If disabled, type: `/datapack enable "file/rituals"`

**Resource pack not working:**
- Make sure it's in the Selected packs list
- Press `F3 + T` to reload
- Check the `pack.mcmeta` file exists

**Items have default textures:**
- This is normal if you haven't added custom PNG files
- The datapack will still work perfectly!
- Add textures later to get custom visuals

---

## Getting Started

Once installed, try these commands:

### Get All Items
```
/function rituals:give/all
/function rituals:give/paste
```

### Quick Start
1. Get a Wooden Totem Base
2. **Sneak + Right-click** on the ground to place it
3. Right-click it with any item (try an emerald)
4. Place 2 more totems with emeralds nearby
5. Watch the Growth Ritual activate! ✨

---

## What's Included

### Totem Bases (3 Tiers)
- **Wooden** - Tier I (basic power)
- **Iron** - Tier II (enhanced power, x2)
- **Diamond** - Tier III (maximum power, x3)

### Craftable Items
- **Paste** - Made from wheat, water, grass
- **Upgrade Slates** - Upgrade placed totems (Iron & Diamond)

### 5 Ritual Types
- **Growth** (Emeralds) - Grows crops faster
- **Strength** (Diamonds) - Combat buffs
- **Prosperity** (Gold) - Attracts items + XP
- **Protection** (Iron) - Damages hostile mobs
- **Healing** (Nether Stars) - Heals players & animals

### Upgrade System
- Craft upgrade slates with paste
- Right-click placed totems to upgrade
- Must upgrade one tier at a time (Wood→Iron→Diamond)

---

**Enjoy your mystical journey, ye magnificent wizard!** 🔮⚡

For full documentation, see README.md

