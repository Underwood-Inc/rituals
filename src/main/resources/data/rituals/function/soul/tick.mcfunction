# ========================================
# Soul Embodiment - Tick Function
# ========================================
# Runs every tick for passive soul XP accrual and buff effects.
# Called from the main tick.mcfunction.
#
# The soul grows through observation and existence. Having a soul
# weapon in the hotbar lets the soul passively accumulate XP.
# Offhand items act as catalysts that modify the growth rate.
#
# Buff effects (haste, speed, etc.) only apply when ACTIVELY
# holding the soul weapon in the mainhand.

# === PASSIVE XP TIMER ===
# Increment timer for all non-spectator players with a soul weapon in their hotbar.
# Uses 1.21+ `if items` with component matching to check all 9 hotbar slots.
execute as @a[gamemode=!spectator] at @s if items entity @s hotbar.* *[custom_data~{soul_embodied:1b}] run scoreboard players add @s rituals.soul_timer 1

# Read the configured interval from storage into a temp score
execute store result score #interval rituals.soul_temp run data get storage rituals:config soul_xp_interval

# Award XP to players whose timer has reached the interval, then reset
execute as @a[gamemode=!spectator] at @s if items entity @s hotbar.* *[custom_data~{soul_embodied:1b}] if score @s rituals.soul_timer >= #interval rituals.soul_temp run function rituals:soul/accrue_xp
execute as @a[gamemode=!spectator] if score @s rituals.soul_timer >= #interval rituals.soul_temp run scoreboard players set @s rituals.soul_timer 0

# Reset timer for players who no longer have a soul weapon in hotbar
execute as @a[gamemode=!spectator] unless items entity @s hotbar.* *[custom_data~{soul_embodied:1b}] run scoreboard players set @s rituals.soul_timer 0

# === XP COUNTDOWN DEBUG LOG (1/second when enabled) ===
# Toggle via ModMenu -> Soul XP -> XP Countdown Log, or soulXp.countdown in TOML
# Shows remaining seconds until next XP award in chat
execute if score #xp_countdown rituals.config matches 1 as @a[gamemode=!spectator] at @s if items entity @s hotbar.* *[custom_data~{soul_embodied:1b}] run function rituals:soul/debug_countdown

# === BUFF/DEBUFF EFFECTS (mainhand only, throttled) ===
# Effects only apply when actively wielding the soul weapon.
# Throttled to every 10 ticks (2x/sec) — effect durations prevent flickering.
scoreboard players add #soul_fx_cd rituals.temp 1
execute if score #soul_fx_cd rituals.temp matches 10.. run scoreboard players set #soul_fx_cd rituals.temp 0
execute if score #soul_fx_cd rituals.temp matches 0 as @a[gamemode=!spectator] at @s if data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run function rituals:soul/buffs/apply_effects

# === WEAPON SWAP CLEANUP ===
# Remove effects from players who stopped holding soul weapons in mainhand
execute as @a[gamemode=!spectator,tag=rituals.had_soul_weapon] at @s unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run function rituals:soul/buffs/remove_effects
execute as @a[gamemode=!spectator,tag=rituals.had_soul_weapon] unless data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tag @s remove rituals.had_soul_weapon

# Tag players currently holding soul weapons in mainhand (for buff tracking)
execute as @a[gamemode=!spectator] if data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run tag @s add rituals.had_soul_weapon

# === COOLDOWN TIMERS ===
scoreboard players remove @a[scores={rituals.soul_notify_cd=1..}] rituals.soul_notify_cd 1
scoreboard players remove @a[scores={rituals.scrying_cd=1..}] rituals.scrying_cd 1
scoreboard players remove @a[scores={rituals.soul_speak_cd=1..}] rituals.soul_speak_cd 1

# === SOUL PERSONALITY ===
# Random quirky comments (every ~30 seconds on average per player)
execute as @a[gamemode=!spectator] at @s if data entity @s SelectedItem.components."minecraft:custom_data".soul_embodied run function rituals:soul/comments/try_speak
