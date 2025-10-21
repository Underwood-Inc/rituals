# ========================================
# Check Hidden Advancement Unlocks
# ========================================
# Runs after badge calculation to grant hidden advancements

# ===== UNIQUE TYPE PROGRESSION =====
# First Steps - 1 ritual type
execute if score @s rituals.ritual_count matches 1 run advancement grant @s only rituals:hidden/first_ritual

# Halfway There - 4 ritual types
execute if score @s rituals.ritual_count matches 4.. run advancement grant @s only rituals:hidden/halfway_there

# Ritual Savant - 6 ritual types
execute if score @s rituals.ritual_count matches 6.. run advancement grant @s only rituals:hidden/ritual_savant

# Ritual Expert - All 8 ritual types
execute if score @s rituals.ritual_count matches 8 run advancement grant @s only rituals:hidden/all_rituals

# Starting Strong - All 8 types with Wood/Copper only (tier 1-2)
execute if score @s rituals.ritual_count matches 8 if score @s rituals.badge_tier matches ..2 run advancement grant @s only rituals:hidden/early_master

# Ultimate Ritualist - Netherite tier + all 8 types
execute if score @s rituals.badge_tier matches 6 if score @s rituals.ritual_count matches 8 run advancement grant @s only rituals:hidden/ultimate_master

# Speed Runner - 3 types before Iron tier
execute if score @s rituals.ritual_count matches 3.. if score @s rituals.badge_tier matches ..2 run advancement grant @s only rituals:hidden/speed_runner

# Pattern Master - Both pattern rituals done
execute if score @s rituals.farming_done matches 1.. if score @s rituals.breeding_done matches 1.. run advancement grant @s only rituals:hidden/pattern_master

# ===== SPECIFIC RITUAL COMPLETION =====
# Individual ritual type completions
execute if score @s rituals.growth_done matches 1.. run advancement grant @s only rituals:hidden/specific/growth_master
execute if score @s rituals.strength_done matches 1.. run advancement grant @s only rituals:hidden/specific/strength_master
execute if score @s rituals.prosperity_done matches 1.. run advancement grant @s only rituals:hidden/specific/prosperity_master
execute if score @s rituals.protection_done matches 1.. run advancement grant @s only rituals:hidden/specific/protection_master
execute if score @s rituals.healing_done matches 1.. run advancement grant @s only rituals:hidden/specific/healing_master
execute if score @s rituals.sentry_done matches 1.. run advancement grant @s only rituals:hidden/specific/sentry_master
execute if score @s rituals.farming_done matches 1.. run advancement grant @s only rituals:hidden/specific/farming_master
execute if score @s rituals.breeding_done matches 1.. run advancement grant @s only rituals:hidden/specific/breeding_master

# ===== TOTAL ACTIVATIONS =====
# Based on total ritual activations (not unique types)
execute if score @s rituals.total_activations matches 10.. run advancement grant @s only rituals:hidden/activations/novice_ritualist
execute if score @s rituals.total_activations matches 25.. run advancement grant @s only rituals:hidden/activations/adept_ritualist
execute if score @s rituals.total_activations matches 50.. run advancement grant @s only rituals:hidden/activations/expert_ritualist
execute if score @s rituals.total_activations matches 100.. run advancement grant @s only rituals:hidden/activations/legendary_ritualist

# ===== PER-RITUAL TYPE ACTIVATION COUNTS =====
# Growth Ritual milestones
execute if score @s rituals.growth_count matches 25.. run advancement grant @s only rituals:hidden/counts/growth/25
execute if score @s rituals.growth_count matches 50.. run advancement grant @s only rituals:hidden/counts/growth/50
execute if score @s rituals.growth_count matches 75.. run advancement grant @s only rituals:hidden/counts/growth/75
execute if score @s rituals.growth_count matches 100.. run advancement grant @s only rituals:hidden/counts/growth/100
execute if score @s rituals.growth_count matches 200.. run advancement grant @s only rituals:hidden/counts/growth/200
execute if score @s rituals.growth_count matches 500.. run advancement grant @s only rituals:hidden/counts/growth/500
execute if score @s rituals.growth_count matches 1000.. run advancement grant @s only rituals:hidden/counts/growth/1000

# Strength Ritual milestones
execute if score @s rituals.strength_count matches 25.. run advancement grant @s only rituals:hidden/counts/strength/25
execute if score @s rituals.strength_count matches 50.. run advancement grant @s only rituals:hidden/counts/strength/50
execute if score @s rituals.strength_count matches 75.. run advancement grant @s only rituals:hidden/counts/strength/75
execute if score @s rituals.strength_count matches 100.. run advancement grant @s only rituals:hidden/counts/strength/100
execute if score @s rituals.strength_count matches 200.. run advancement grant @s only rituals:hidden/counts/strength/200
execute if score @s rituals.strength_count matches 500.. run advancement grant @s only rituals:hidden/counts/strength/500
execute if score @s rituals.strength_count matches 1000.. run advancement grant @s only rituals:hidden/counts/strength/1000

# Prosperity Ritual milestones
execute if score @s rituals.prosperity_count matches 25.. run advancement grant @s only rituals:hidden/counts/prosperity/25
execute if score @s rituals.prosperity_count matches 50.. run advancement grant @s only rituals:hidden/counts/prosperity/50
execute if score @s rituals.prosperity_count matches 75.. run advancement grant @s only rituals:hidden/counts/prosperity/75
execute if score @s rituals.prosperity_count matches 100.. run advancement grant @s only rituals:hidden/counts/prosperity/100
execute if score @s rituals.prosperity_count matches 200.. run advancement grant @s only rituals:hidden/counts/prosperity/200
execute if score @s rituals.prosperity_count matches 500.. run advancement grant @s only rituals:hidden/counts/prosperity/500
execute if score @s rituals.prosperity_count matches 1000.. run advancement grant @s only rituals:hidden/counts/prosperity/1000

# Protection Ritual milestones
execute if score @s rituals.protection_count matches 25.. run advancement grant @s only rituals:hidden/counts/protection/25
execute if score @s rituals.protection_count matches 50.. run advancement grant @s only rituals:hidden/counts/protection/50
execute if score @s rituals.protection_count matches 75.. run advancement grant @s only rituals:hidden/counts/protection/75
execute if score @s rituals.protection_count matches 100.. run advancement grant @s only rituals:hidden/counts/protection/100
execute if score @s rituals.protection_count matches 200.. run advancement grant @s only rituals:hidden/counts/protection/200
execute if score @s rituals.protection_count matches 500.. run advancement grant @s only rituals:hidden/counts/protection/500
execute if score @s rituals.protection_count matches 1000.. run advancement grant @s only rituals:hidden/counts/protection/1000

# Healing Ritual milestones
execute if score @s rituals.healing_count matches 25.. run advancement grant @s only rituals:hidden/counts/healing/25
execute if score @s rituals.healing_count matches 50.. run advancement grant @s only rituals:hidden/counts/healing/50
execute if score @s rituals.healing_count matches 75.. run advancement grant @s only rituals:hidden/counts/healing/75
execute if score @s rituals.healing_count matches 100.. run advancement grant @s only rituals:hidden/counts/healing/100
execute if score @s rituals.healing_count matches 200.. run advancement grant @s only rituals:hidden/counts/healing/200
execute if score @s rituals.healing_count matches 500.. run advancement grant @s only rituals:hidden/counts/healing/500
execute if score @s rituals.healing_count matches 1000.. run advancement grant @s only rituals:hidden/counts/healing/1000

# Sentry Ritual milestones
execute if score @s rituals.sentry_count matches 25.. run advancement grant @s only rituals:hidden/counts/sentry/25
execute if score @s rituals.sentry_count matches 50.. run advancement grant @s only rituals:hidden/counts/sentry/50
execute if score @s rituals.sentry_count matches 75.. run advancement grant @s only rituals:hidden/counts/sentry/75
execute if score @s rituals.sentry_count matches 100.. run advancement grant @s only rituals:hidden/counts/sentry/100
execute if score @s rituals.sentry_count matches 200.. run advancement grant @s only rituals:hidden/counts/sentry/200
execute if score @s rituals.sentry_count matches 500.. run advancement grant @s only rituals:hidden/counts/sentry/500
execute if score @s rituals.sentry_count matches 1000.. run advancement grant @s only rituals:hidden/counts/sentry/1000

# Auto-Farming Ritual milestones
execute if score @s rituals.farming_count matches 25.. run advancement grant @s only rituals:hidden/counts/farming/25
execute if score @s rituals.farming_count matches 50.. run advancement grant @s only rituals:hidden/counts/farming/50
execute if score @s rituals.farming_count matches 75.. run advancement grant @s only rituals:hidden/counts/farming/75
execute if score @s rituals.farming_count matches 100.. run advancement grant @s only rituals:hidden/counts/farming/100
execute if score @s rituals.farming_count matches 200.. run advancement grant @s only rituals:hidden/counts/farming/200
execute if score @s rituals.farming_count matches 500.. run advancement grant @s only rituals:hidden/counts/farming/500
execute if score @s rituals.farming_count matches 1000.. run advancement grant @s only rituals:hidden/counts/farming/1000

# Auto-Breeding Ritual milestones
execute if score @s rituals.breeding_count matches 25.. run advancement grant @s only rituals:hidden/counts/breeding/25
execute if score @s rituals.breeding_count matches 50.. run advancement grant @s only rituals:hidden/counts/breeding/50
execute if score @s rituals.breeding_count matches 75.. run advancement grant @s only rituals:hidden/counts/breeding/75
execute if score @s rituals.breeding_count matches 100.. run advancement grant @s only rituals:hidden/counts/breeding/100
execute if score @s rituals.breeding_count matches 200.. run advancement grant @s only rituals:hidden/counts/breeding/200
execute if score @s rituals.breeding_count matches 500.. run advancement grant @s only rituals:hidden/counts/breeding/500
execute if score @s rituals.breeding_count matches 1000.. run advancement grant @s only rituals:hidden/counts/breeding/1000

