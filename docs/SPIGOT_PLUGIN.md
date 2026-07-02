# Spigot Plugin — Server Integrations

The **Rituals datapack** is the game. This plugin is a **thin Spigot shell** for what server communities expect: permissions, a config chest GUI, and optional hooks into Vault and PlaceholderAPI.

Nothing in the plugin is required for rituals or soul embodiment to function.

**Target:** Spigot **26.2** (`api-version: '26.2'`). Compiled against `spigot-api` only — no Paper or Adventure APIs.

---

## Permission nodes

| Node | Default | Description |
|------|---------|-------------|
| `rituals.use` | `true` | Base access to player-facing commands |
| `rituals.config` | `op` | `/rituals config` chest GUI + reload |
| `rituals.admin` | `op` | `/rituals admin …` datapack admin functions |
| `rituals.give` | `op` | `/rituals give …` |
| `rituals.soul` | `true` | `/rituals soul …` |
| `rituals.soul.rename` | `true` | Soul rename flow |
| `rituals.bypass.fire` | `op` | Reserved for future per-player fire bypass |
| `rituals.*` | `op` | Wildcard (all of the above) |

LuckPerms and other permission plugins read these Bukkit nodes automatically — no LuckPerms dependency in the JAR.

---

## Commands

All commands delegate to the **datapack** where possible (`/function rituals:…`).

| Command | Permission |
|---------|------------|
| `/rituals help` | — |
| `/rituals config` | `rituals.config` |
| `/rituals reload` | `rituals.config` |
| `/rituals give all` | `rituals.give` |
| `/rituals soul info` | `rituals.soul` |
| `/rituals admin enable_kiwi_mode` | `rituals.admin` |

---

## Config GUI

`/rituals config` opens a 27-slot chest menu:

- Kiwi mode on/off
- Fire sacrifice on/off
- Soul XP easy / hard presets
- Reload plugin + datapack config

Changes call `data modify storage rituals:config …` and `function rituals:config/reload` via the console — same as editing the datapack manually.

---

## Vault (optional)

`config.yml`:

```yaml
integrations:
  vault-enabled: true
economy:
  give-totem-set-cost: 100.0
  soul-rename-cost: 50.0
```

Requires **Vault** and an economy provider (e.g. EssentialsX). If Vault is absent or `vault-enabled: false`, costs are ignored and commands work for free.

---

## PlaceholderAPI (optional)

When PlaceholderAPI is installed:

| Placeholder | Example |
|-------------|---------|
| `%rituals_version%` | Plugin version |
| `%rituals_datapack_installed%` | `bundled` or `manual` |
| `%rituals_vault%` | `true` / `false` |

Register with `/papi parse me %rituals_version%` after install.

---

## Architecture

```text
Spigot plugin (permissions, GUI, Vault, PAPI)
        │ dispatches vanilla commands
        ▼
Rituals datapack (totems, rituals, soul embodiment)
```

Bundled datapack path in JAR: `/datapack/data/…` + `/datapack/pack.mcmeta`

---

## Replacing the old Fabric mod

| Old Fabric mod | New approach |
|--------------|--------------|
| Auto-load datapack in client | Plugin `datapack.auto-install` or manual zip |
| `/rituals` commands | Spigot plugin commands → datapack functions |
| ModMenu / TOML config | Chest GUI + `config.yml` |
| Singleplayer Fabric | Use datapack zip in vanilla 26.2 |

Fabric / client mod code has been removed from this repository.
