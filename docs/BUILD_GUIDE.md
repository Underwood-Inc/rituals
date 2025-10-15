# Build Guide - Rituals

This project supports **dual distribution**: both as a **Fabric mod** AND as a **standalone datapack/resourcepack**.

---

## Project Structure

```
rituals/
├── data/                          ← Datapack files (source of truth)
│   └── rituals/
├── resourcepack/                  ← Resource pack files (source of truth)
│   └── assets/
├── src/main/
│   ├── java/                      ← Mod code (minimal wrapper)
│   └── resources/                 ← Auto-synced from data/ and resourcepack/
├── build.gradle                   ← Build configuration
└── gradle.properties              ← Version info
```

**Important**: Always edit files in `data/` and `resourcepack/` folders, NOT in `src/main/resources/`. The build system automatically syncs them.

---

## Building

### Prerequisites

- Java 21 or higher
- No need to install Gradle (uses wrapper)

### Build All Distributions

```bash
# Windows
.\gradlew build

# Linux/Mac
./gradlew build
```

This creates:
- **Mod**: `build/libs/rituals-2.0.0.jar` (Fabric mod)
- **Datapack**: `build/datapacks/rituals-datapack-2.0.0.zip`
- **Resourcepack**: `build/resourcepacks/rituals-resourcepack-2.0.0.zip`

### Build Specific Distributions

```bash
# Just the mod
.\gradlew jar

# Just the datapack
.\gradlew packageDatapack

# Just the resourcepack
.\gradlew packageResourcepack
```

---

## Development Workflow

### For Datapack/Function Development

1. Edit files in `data/rituals/function/` and `resourcepack/`
2. Test in vanilla Minecraft (load datapack manually)
3. When ready to build mod, run `.\gradlew build`

### For Mod Development

1. Edit `src/main/java/com/rituals/TotemRitualsMod.java`
2. Run `.\gradlew runClient` to test in development
3. Build with `.\gradlew build`

### Running Development Client

```bash
# Launch Minecraft with the mod loaded
.\gradlew runClient
```

---

## Distribution

### For Mod Users
Give them: `build/libs/rituals-2.0.0.jar`
- Requires Fabric Loader
- Auto-installs datapack and resourcepack
- Works for any world

### For Datapack-Only Users
Give them: `build/datapacks/rituals-datapack-2.0.0.zip`
- No mods required
- Manual installation to world/datapacks folder
- Requires separate resourcepack

### For Resourcepack
Give them: `build/resourcepacks/rituals-resourcepack-2.0.0.zip`
- Manual installation to resourcepacks folder

---

## Version Management

Edit `gradle.properties`:
```properties
mod_version=2.0.0        ← Change this for new releases
minecraft_version=1.21   ← Update for new MC versions
```

---

## Cleaning Build Files

```bash
.\gradlew clean
```

This removes `build/` and `src/main/resources/` (auto-synced files).

---

## Troubleshooting

### "Files out of sync in src/main/resources"
Run `.\gradlew syncDatapack` to manually sync.

### "Task 'runClient' not found"
Make sure you have Fabric Loom plugin installed. Run `.\gradlew --refresh-dependencies`.

### "Java version mismatch"
Ensure you have Java 21+:
```bash
java -version
```

---

## CI/CD Integration

For GitHub Actions:

```yaml
- name: Build distributions
  run: ./gradlew build
  
- name: Upload mod artifact
  uses: actions/upload-artifact@v3
  with:
    name: rituals-mod
    path: build/libs/*.jar
    
- name: Upload datapack artifact
  uses: actions/upload-artifact@v3
  with:
    name: rituals-datapack
    path: build/datapacks/*.zip
```

---

**May your builds be swift and your rituals be powerful!** 🔥✨


