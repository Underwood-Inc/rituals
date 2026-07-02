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
2. **AMP / crash-loop fix:** add JVM argument (server **stopped** → Settings → JVM flags):
   ```
   -javaagent:plugins/rituals-plugin-2.0.0.jar
   ```
   This copies `rituals.zip` into `world/datapacks/` **before** Minecraft loads the world (required when the world already expects `file/rituals` but the zip was deleted).
3. Restart the server.
4. Plugin also installs on `onLoad` when the zip is missing and the server can start. On enable it runs `/minecraft:reload` if the zip was just written.
5. `/rituals config` — chest GUI (permission `rituals.config`)

**Verify install (console on startup):**

```
[Rituals] Rituals datapack install — server root: /AMP/Minecraft, default world: /AMP/Minecraft/world
[Rituals] Installed datapack zip -> /AMP/Minecraft/world/datapacks/rituals.zip (2529734 bytes)
[Rituals] Reloading datapacks so Rituals appears in /datapack list...
```

Then in-game: `/datapack list` should show **`file/rituals`** (zip) and/or **`file/rituals`** (folder). If the log says `NOT at ...` the path in that line is where the plugin looked — compare to your AMP file manager.

**Server won't start?** Read the console carefully:

1. **`Missing data pack file/rituals.zip`** — file must be at **`world/datapacks/rituals.zip`** (not `plugins/`, not server-root `datapacks/`). Rename `rituals-datapack-*.zip` → `rituals.zip`.

2. **`Pack declares support for format 61`** (repeated) — **other** datapacks in `world/datapacks/` are broken on 26.2, not Rituals. Remove or update those zips, or start once with **`--safeMode`** in JVM args.

3. **`Overworld settings missing` / `world_gen_settings.dat`** — usually caused by (2) after repeated failed boots. Fix (2), then restore `world` from backup or use `--safeMode` once.

While the server is **stopped**, upload from `build/server-deploy/world/datapacks/rituals.zip` to **`/AMP/Minecraft/world/datapacks/rituals.zip`** (adjust for your host path).

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
