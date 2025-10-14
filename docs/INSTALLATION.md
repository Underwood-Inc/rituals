# Installation Guide - Totem Rituals Datapack

This guide will walk you through installing the Totem Rituals datapack step by step, assuming you have no prior experience with Minecraft datapacks.

## What is a Datapack?

A datapack is a folder containing special files that add new features to Minecraft without requiring any mods. They work in vanilla (unmodified) Minecraft and can be easily installed and removed.

## Requirements

- Minecraft Java Edition version 1.21 or newer
- A world where you have operator permissions (single-player worlds automatically have this)

## Installation Steps

### Step 1: Prepare the Datapack

If you downloaded this as a ZIP file, keep it as is. If you have a folder, you can use it directly or compress it to ZIP format.

### Step 2: Find Your World

1. Launch Minecraft
2. Take note of which world you want to add this datapack to
3. Close Minecraft completely (important!)

### Step 3: Locate Your Saves Folder

The location depends on your operating system:

#### Windows
1. Press `Windows Key + R` on your keyboard
2. Type: `%appdata%\.minecraft\saves`
3. Press Enter

#### Mac
1. Press `Command + Space` to open Spotlight
2. Type: `~/Library/Application Support/minecraft/saves`
3. Press Enter

#### Linux
1. Open your file manager
2. Navigate to: `~/.minecraft/saves`
3. If hidden folders aren't showing, press `Ctrl + H`

### Step 4: Install the Datapack

1. You should now see a list of folders, each named after one of your worlds
2. Find and open the folder with the name of your chosen world
3. Look for a folder called `datapacks`
   - If it doesn't exist, create it (right-click → New Folder → name it "datapacks")
4. Copy or move the Totem Rituals datapack into this `datapacks` folder
   - You can place either the ZIP file or the unzipped folder

### Step 5: Load the Datapack

1. Launch Minecraft
2. Open the world you installed the datapack to
3. Look at the chat - you should see: 
   ```
   [Totem Rituals] Datapack loaded successfully!
   [Totem Rituals] Use /function rituals:give/all to get totem items
   ```
4. If you don't see this message:
   - Open chat (press `T`)
   - Type: `/reload`
   - Press Enter

### Step 6: Get Your First Totems

1. Open chat (press `T`)
2. Type: `/function rituals:give/all`
3. Press Enter
4. Check your inventory - you should now have three totems!

## Verification

To verify the installation worked correctly:

1. Take a Basic Totem from your inventory
2. Right-click on the ground to place it
3. A wooden totem pole should appear
4. Right-click it while holding any item
5. The item should appear floating above the totem

If all of these work, congratulations! The datapack is installed correctly.

## Troubleshooting

### "Unknown function" Error

**Problem**: When you type the command, it says "Unknown or incomplete command"

**Solution**:
1. Type `/reload` and try again
2. Check that the datapack folder is in the correct location
3. Make sure the world is the one you installed the datapack to

### No Load Message Appears

**Problem**: The world loads but you don't see the success message

**Solution**:
1. Type `/datapack list` to see all installed datapacks
2. Look for "rituals" in the enabled list
3. If it's in the disabled list, type: `/datapack enable "file/rituals"`
4. If it's not listed at all, the datapack is in the wrong location

### Totems Won't Place

**Problem**: Holding a totem and right-clicking does nothing

**Solution**:
1. Make sure you received the totem from the give command (it should have colored text)
2. Right-click while looking at the ground where you want to place the totem
3. Make sure you're clicking on an air block (empty space)

### Pack Format Error

**Problem**: The datapack says it was made for a different version

**Solution**:
- This datapack requires Minecraft 1.21 or newer
- Update your Minecraft version
- Or download an older version of this datapack compatible with your version

## Uninstalling

To remove the datapack:

1. Close Minecraft completely
2. Go back to your world's `datapacks` folder (see Step 3)
3. Delete the Totem Rituals folder or ZIP file
4. Launch Minecraft and open the world

**Note**: Any placed totems will disappear when you remove the datapack.

## Updating

To update to a newer version:

1. Close Minecraft
2. Delete the old datapack from the `datapacks` folder
3. Copy the new version into the `datapacks` folder
4. Launch Minecraft and open the world
5. Type `/reload` if the update message doesn't appear

## Need More Help?

If you're still having issues:

1. Double-check each step in this guide
2. Make sure you're using Minecraft Java Edition (not Bedrock Edition)
3. Verify your Minecraft version is 1.21 or newer (check the bottom-left of the title screen)
4. Try creating a new test world and installing there to isolate the issue

## Additional Resources

For more information on using the datapack after installation, see:
- `README.md` - Full feature documentation
- In-game help: Type `/function rituals:give/all` to get started

---

Happy crafting and may your rituals be powerful! 🔮

