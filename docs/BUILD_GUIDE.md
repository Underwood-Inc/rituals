# Build Guide — Rituals (Datapack + Spigot Plugin)

**Minecraft 26.2** · datapack format **107.1**

| Artifact | Purpose |
|----------|---------|
| `rituals-datapack-*.zip` | Core gameplay — vanilla, Spigot, or any host with datapacks |
| `rituals-plugin-*.jar` | Optional Spigot plugin — permissions, config GUI, Vault, PlaceholderAPI |

The datapack works **without** the plugin. The plugin bundles the same datapack and adds server integrations only.

---

## Prerequisites

- **JDK 25** (Minecraft 26.2 / Spigot API; Gradle wrapper uses the toolchain)
- **Gradle** — use the included wrapper: `gradlew` / `gradlew.bat`
- **Minecraft 26.2 Spigot** server to test the plugin

---

## Build everything

```powershell
# Windows (repo root)
.\gradlew.bat build
```

```bash
# Linux / macOS
./gradlew build
```

Outputs:

- `build/datapacks/rituals-datapack-2.0.0.zip`
- `plugin/build/libs/rituals-plugin-2.0.0.jar`

### Build only one artifact

```powershell
.\gradlew.bat packageDatapack    # datapack zip only
.\gradlew.bat :plugin:build       # Spigot plugin JAR only
```

---

## Server install (Spigot 26.2)

### Datapack only

1. Copy `rituals-datapack-*.zip` → `world/datapacks/`
2. `/reload`

### Datapack + plugin (recommended for networks)

1. Place `rituals-plugin-*.jar` in `plugins/`
2. Restart (or `/reload` — restart preferred on first install)
3. Plugin auto-copies bundled datapack to `world/datapacks/rituals/` when `datapack.auto-install: true` in `plugins/Rituals/config.yml`
4. `/rituals config` — chest GUI (permission `rituals.config`)

### Soft dependencies (optional)

| Plugin | Purpose | Required? |
|--------|---------|-------------|
| **Vault** + economy plugin | Charge for `/rituals give` / rename when enabled in config | No |
| **PlaceholderAPI** | `%rituals_version%`, `%rituals_vault%`, etc. | No |
| **LuckPerms** | Uses normal Bukkit permission nodes — no hard dependency | No |

---

## Development

- Edit gameplay in **`data/`** (source of truth)
- Edit integrations in **`plugin/src/main/java/`**
- Plugin build syncs `data/` + `pack.mcmeta` into the JAR automatically (`syncDatapackIntoResources`)
- Compile dependency: `org.spigotmc:spigot-api:26.2-R0.1-SNAPSHOT` (see `gradle.properties`)

Version: `gradle.properties` → `datapack_version=2.0.0`

---

## No Java? (datapack zip only)

Zip manually from repo root:

```powershell
Compress-Archive -Path pack.mcmeta, data -DestinationPath build/datapacks/rituals-datapack-2.0.0.zip -Force
```

The Spigot plugin **requires** JDK 25 + Gradle to compile.
