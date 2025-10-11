# Configuration Guide

## In-Game Configuration

The Totem Rituals datapack includes a powerful in-game configuration system that lets you customize settings without editing files!

### Viewing Current Config

```
/data get storage rituals:config
```

### Modifying Settings

Use the following command structure:
```
/data modify storage rituals:config <setting> set value <value>
```

After making changes, reload the config:
```
/function rituals:config/reload
```

---

## Available Settings

### Ritual Settings

#### `min_totems_required`
- **Type:** Integer
- **Default:** `1`
- **Description:** Minimum number of totems needed to activate a ritual (set to 1 for single-totem mode)
- **Example:** `/data modify storage rituals:config min_totems_required set value 3`

#### `ritual_duration`
- **Type:** Integer (ticks)
- **Default:** `600` (30 seconds)
- **Description:** How long rituals stay active
- **Example:** `/data modify storage rituals:config ritual_duration set value 1200`

#### `ritual_range`
- **Type:** Integer (blocks)
- **Default:** `32`
- **Description:** Maximum distance between totems for multi-totem rituals
- **Example:** `/data modify storage rituals:config ritual_range set value 50`

### Range Settings

#### `horizontal_range`
- **Type:** Integer (blocks)
- **Default:** `5`
- **Description:** Horizontal range of ritual effects (creates a 5x5 area)
- **Example:** `/data modify storage rituals:config horizontal_range set value 10`

#### `vertical_up`
- **Type:** Integer (blocks)
- **Default:** `3`
- **Description:** How many blocks up rituals affect
- **Example:** `/data modify storage rituals:config vertical_up set value 5`

#### `vertical_down`
- **Type:** Integer (blocks)
- **Default:** `3`
- **Description:** How many blocks down rituals affect
- **Example:** `/data modify storage rituals:config vertical_down set value 5`

### Sentry Totem Settings

#### `sentry_range_multiplier`
- **Type:** Double
- **Default:** `2.0`
- **Description:** Multiplier for Sentry Totem range (2.0 = double range)
- **Example:** `/data modify storage rituals:config sentry_range_multiplier set value 3.0d`

#### `sentry_fire_rate`
- **Type:** Integer (ticks)
- **Default:** `40` (2 seconds)
- **Description:** How often sentries fire projectiles
- **Example:** `/data modify storage rituals:config sentry_fire_rate set value 20`

#### `sentry_base_damage`
- **Type:** Double (half-hearts)
- **Default:** `1.0` (0.5 hearts)
- **Description:** Base damage of sentry projectiles at tier 1
- **Example:** `/data modify storage rituals:config sentry_base_damage set value 2.0d`

#### `sentry_damage_per_tier`
- **Type:** Double
- **Default:** `0.5`
- **Description:** Additional damage per tier level
- **Example:** `/data modify storage rituals:config sentry_damage_per_tier set value 1.0d`

#### `sentry_projectile_speed`
- **Type:** Double
- **Default:** `1.0`
- **Description:** Base speed multiplier for projectiles
- **Example:** `/data modify storage rituals:config sentry_projectile_speed set value 1.5d`

#### `sentry_speed_per_tier`
- **Type:** Double
- **Default:** `0.15`
- **Description:** Speed increase per tier level
- **Example:** `/data modify storage rituals:config sentry_speed_per_tier set value 0.2d`

---

## Example Configurations

### Easy Mode (Single Totem, Long Duration, Large Range)
```
/data modify storage rituals:config min_totems_required set value 1
/data modify storage rituals:config ritual_duration set value 1200
/data modify storage rituals:config horizontal_range set value 10
/data modify storage rituals:config vertical_up set value 5
/data modify storage rituals:config vertical_down set value 5
/function rituals:config/reload
```

### Hard Mode (Multiple Totems Required, Short Duration)
```
/data modify storage rituals:config min_totems_required set value 5
/data modify storage rituals:config ritual_duration set value 300
/data modify storage rituals:config horizontal_range set value 3
/function rituals:config/reload
```

### Sentry Defense Mode (Fast-Firing, High Damage)
```
/data modify storage rituals:config sentry_fire_rate set value 10
/data modify storage rituals:config sentry_base_damage set value 3.0d
/data modify storage rituals:config sentry_damage_per_tier set value 1.0d
/data modify storage rituals:config sentry_range_multiplier set value 3.0d
/function rituals:config/reload
```

---

## Tips

- Always reload config after making changes!
- Changes take effect immediately for new rituals
- Existing active rituals may need to be reactivated
- Use `/data get storage rituals:config` to verify your changes
- Back up your world before making major changes

---

## Support

For help in-game, use:
```
/function rituals:help
```

