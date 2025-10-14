# Code Refactoring Proposal - October 14, 2024

## Executive Summary
The codebase has grown to **100+ files** with significant code duplication across pattern rituals. This proposal outlines a refactoring strategy to reduce duplication by **~60%**, improve maintainability, and make adding new rituals **5x faster**.

---

## Audit Findings

### 1. **Activation Files - Massive Duplication** (5 files, ~350 lines total)
**Common Code (95% identical):**
```mcfunction
# Lines 7-8: Pattern validation (100% identical)
scoreboard players set #pattern_valid rituals.temp 1

# Lines 10-18: Tagging and initialization (95% identical)
tag @s add rituals.active_ritual
tag @s add rituals.<ritual_name>
scoreboard players set @s rituals.effect <ID>
scoreboard players set @s rituals.timer 0

# Lines 32-35: Central totem cleanup (100% identical)
tag @s remove rituals.pattern_help_shown
scoreboard players operation #central_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #central_id rituals.temp run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b

# Lines 37+: Supplemental totem destruction (4-6 repetitions per ritual, ~60% of file)
execute positioned <coords> run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute positioned <coords> run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
execute positioned <coords> run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
execute positioned <coords> as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break_sacrifice
```

**Unique Code (5% per ritual):**
- Particles/sounds for activation feedback (3-4 lines)
- Success message (1 line)
- Pattern positions (4-6 positions)

**Impact:** 280+ lines of duplicated code across 5 files

---

### 2. **Detection Files - Moderate Duplication** (5 files, ~350 lines total)
**Common Code (80% identical):**
```mcfunction
# Lines 12-18: Skip checks (100% identical)
execute if entity @s[tag=rituals.active_ritual] run return 0
scoreboard players operation #check_id rituals.temp = @s rituals.id
execute store result score #has_ritual_tag rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_id rituals.temp if data entity @s item.components."minecraft:custom_data".ritual_active
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Lines 29-31: Score reset (100% identical)
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0

# Lines 50-65: Score summation and activation (90% identical)
scoreboard players operation #totems_found rituals.temp = #found_n rituals.temp
scoreboard players operation #totems_found rituals.temp += #found_ne rituals.temp
...
execute if score #totems_found rituals.temp matches <N> run function rituals:ritual/patterns/<pattern>/activate_<ritual>
```

**Unique Code (20% per ritual):**
- Help messages (4-5 lines)
- Position checking calls (4-6 lines)
- Particle display colors (4-6 lines)

**Impact:** 150+ lines of duplicated code across 5 files

---

### 3. **Position Checker Files - Extreme Duplication** (24+ files, ~150 lines total)
**Common Code (100% identical structure):**
```mcfunction
# Get item from display
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_cardinal_item set from entity @s item.id

# Check item match
execute if data storage rituals:temp {check_cardinal_item:"<item>"} run scoreboard players set #found_<pos> rituals.temp 1
execute if data storage rituals:temp {check_cardinal_item:"<item>"} run tag @s add rituals.pattern_totem
```

**Unique Code:** Only the item ID and position variable change

**Impact:** 120+ lines that could be reduced to 1 macro function

---

### 4. **Tier Settings - Massive Duplication** (8+ files, ~150 lines total)
**Common Code (100% identical structure):**
```mcfunction
execute if score @s rituals.tier matches 1 run scoreboard players operation #current_h_range rituals.temp = #tier1_h_range rituals.data
execute if score @s rituals.tier matches 2 run scoreboard players operation #current_h_range rituals.temp = #tier2_h_range rituals.data
execute if score @s rituals.tier matches 3 run scoreboard players operation #current_h_range rituals.temp = #tier3_h_range rituals.data
execute if score @s rituals.tier matches 4 run scoreboard players operation #current_h_range rituals.temp = #tier4_h_range rituals.data
execute if score @s rituals.tier matches 5 run scoreboard players operation #current_h_range rituals.temp = #tier5_h_range rituals.data
execute if score @s rituals.tier matches 6 run scoreboard players operation #current_h_range rituals.temp = #tier6_h_range rituals.data
```
This repeats for h_range, v_range, and frequency settings across 8 files.

**Impact:** 150+ lines that could be reduced to 1 macro function

---

## Proposed Refactoring Strategy

### Phase 1: Create Macro-Based Core Functions (HIGH IMPACT)

#### 1.1 **Unified Supplemental Totem Destroyer**
**File:** `ritual/patterns/lib/destroy_supplemental_totems.mcfunction`
```mcfunction
# Macro function that takes position list from storage
# Storage format: rituals:pattern_temp {positions:[[x,y,z], [x,y,z], ...]}
$execute positioned $(x) ~ $(z) run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
$execute positioned $(x) ~ $(z) run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force
$execute positioned $(x) ~ $(z) run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 1.5 0.8
$execute positioned $(x) ~ $(z) as @e[type=interaction,tag=rituals.pattern_totem,distance=..1.5] run function rituals:totem/break_sacrifice
```
**Savings:** Eliminates 280+ lines across activation files

#### 1.2 **Unified Activation Core**
**File:** `ritual/patterns/lib/activate_core.mcfunction`
```mcfunction
# Common activation logic with macro for ritual-specific data
# Storage: rituals:activation_temp {ritual_name:"auto_breeding", effect_id:11, tags:["active_ritual","auto_breeding"]}

scoreboard players set #pattern_valid rituals.temp 1
$tag @s add $(tag1)
$tag @s add $(tag2)
$scoreboard players set @s rituals.effect $(effect_id)
scoreboard players set @s rituals.timer 0

# Central totem cleanup (always the same)
tag @s remove rituals.pattern_help_shown
scoreboard players operation #central_id rituals.temp = @s rituals.id
execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #central_id rituals.temp run data modify entity @s item.components."minecraft:custom_data".ritual_active set value 1b
```
**Savings:** Eliminates 100+ lines across activation files

#### 1.3 **Unified Position Checker**
**File:** `ritual/patterns/lib/check_position_item.mcfunction`
```mcfunction
# Macro function for checking if totem at position has correct item
# Storage: rituals:check_temp {item:"minecraft:wheat_seeds", score_var:"n"}

execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = @e[type=interaction,tag=rituals.totem,limit=1,sort=nearest] rituals.id run data modify storage rituals:temp check_item set from entity @s item.id
$execute if data storage rituals:temp {check_item:"$(item)"} run scoreboard players set #found_$(pos) rituals.temp 1
$execute if data storage rituals:temp {check_item:"$(item)"} run tag @s add rituals.pattern_totem
```
**Savings:** Eliminates 120+ lines of position checker files, **delete 24+ files**

#### 1.4 **Unified Tier Settings Loader**
**File:** `ritual/lib/load_tier_setting.mcfunction`
```mcfunction
# Macro function to load a specific setting for current tier
# Storage: rituals:tier_load {setting_prefix:"tier", setting_suffix:"_h_range", output_var:"current_h_range"}

$execute if score @s rituals.tier matches 1 run scoreboard players operation #$(output_var) rituals.temp = #$(setting_prefix)1$(setting_suffix) rituals.data
$execute if score @s rituals.tier matches 2 run scoreboard players operation #$(output_var) rituals.temp = #$(setting_prefix)2$(setting_suffix) rituals.data
$execute if score @s rituals.tier matches 3 run scoreboard players operation #$(output_var) rituals.temp = #$(setting_prefix)3$(setting_suffix) rituals.data
$execute if score @s rituals.tier matches 4 run scoreboard players operation #$(output_var) rituals.temp = #$(setting_prefix)4$(setting_suffix) rituals.data
$execute if score @s rituals.tier matches 5 run scoreboard players operation #$(output_var) rituals.temp = #$(setting_prefix)5$(setting_suffix) rituals.data
$execute if score @s rituals.tier matches 6 run scoreboard players operation #$(output_var) rituals.temp = #$(setting_prefix)6$(setting_suffix) rituals.data
```
**Savings:** Simplifies 8+ get_*_settings files from 18 lines each to 3 lines each (108+ lines saved)

#### 1.5 **Unified Detection Header**
**File:** `ritual/patterns/lib/detect_header.mcfunction`
```mcfunction
# Common detection header logic (skip checks and score reset)
# Always runs, no macro needed

# Skip detection if this ritual is already active
execute if entity @s[tag=rituals.active_ritual] run return 0

# Skip detection if the item already has ritual_active tag
scoreboard players operation #check_id rituals.temp = @s rituals.id
execute store result score #has_ritual_tag rituals.temp run execute as @e[type=item_display,tag=rituals.totem_display] if score @s rituals.id = #check_id rituals.temp if data entity @s item.components."minecraft:custom_data".ritual_active
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Reset pattern validation
scoreboard players set #pattern_valid rituals.temp 0
scoreboard players set #totems_found rituals.temp 0
```
**Savings:** Eliminates 50+ lines across detection files

---

### Phase 2: Centralize Pattern Configurations (MEDIUM IMPACT)

#### 2.1 **Pattern Registry**
**File:** `ritual/patterns/registry.mcfunction`
```mcfunction
# Central registry of all pattern rituals
# Loaded once at datapack load, defines all patterns in storage

# Auto-Breeding (Star Pattern)
data modify storage rituals:patterns auto_breeding set value {\
  id:"auto_breeding",\
  effect_id:11,\
  tags:["active_ritual","auto_breeding"],\
  central_item:"minecraft:wheat",\
  positions:[\
    {x:0,y:0,z:5,item:"minecraft:wheat_seeds",var:"n"},\
    {x:5,y:0,z:0,item:"minecraft:carrot",var:"e"},\
    {x:0,y:0,z:-5,item:"minecraft:potato",var:"s"},\
    {x:-5,y:0,z:0,item:"minecraft:beetroot_seeds",var:"w"}\
  ],\
  particle_color:[0.0,1.0,0.0],\
  help_messages:[\
    {text:"🌾 ",color:"gold"},\
    {text:"Auto-Breeding Pattern Setup:",bold:true,color:"yellow"}\
  ]\
}

# Enchanting Nexus (Square Pattern)
data modify storage rituals:patterns enchanting_nexus set value {...}

# ... (similar for all patterns)
```
**Benefits:**
- Single source of truth for all pattern definitions
- Easy to add new patterns (just add one entry)
- Validation and testing become easier
- Documentation auto-generation potential

**Savings:** Makes adding new patterns require ~10 lines instead of ~150 lines

---

### Phase 3: Refactor Individual Ritual Files (LOW PRIORITY, HIGH VALUE)

#### 3.1 **Streamlined Activation Files**
**Example:** `ritual/patterns/star/activate_auto_breeding.mcfunction`
```mcfunction
# ========================================
# Activate Auto-Breeding Ritual
# ========================================

# Load pattern data
data modify storage rituals:activation_temp pattern set from storage rituals:patterns auto_breeding

# Run common activation core
function rituals:ritual/patterns/lib/activate_core with storage rituals:activation_temp pattern

# UNIQUE: Visual and audio feedback
particle minecraft:heart ~ ~2 ~ 5 2 5 0.5 200 force
particle minecraft:happy_villager ~ ~2 ~ 5 2 5 0.3 150 force
particle minecraft:composter ~ ~2 ~ 4 1 4 0.1 100 force
playsound minecraft:entity.chicken.egg master @a ~ ~ ~ 2.0 1.2
playsound minecraft:entity.cow.ambient master @a ~ ~ ~ 1.5 0.8
playsound minecraft:entity.sheep.ambient master @a ~ ~ ~ 1.5 1.0

# UNIQUE: Success message
tellraw @a[distance=..32] [{"text":"💚 ","color":"green"},{"text":"Auto-Breeding","bold":true,"color":"yellow"},{"text":" ritual activated! Animals in range will now breed automatically!","color":"green"}]

# Destroy supplemental totems
function rituals:ritual/patterns/lib/destroy_supplemental_totems with storage rituals:activation_temp pattern.positions
```
**Before:** 70 lines | **After:** 20 lines | **Reduction:** 71%

#### 3.2 **Streamlined Detection Files**
**Example:** `ritual/patterns/star/detect_auto_breeding.mcfunction`
```mcfunction
# ========================================
# Detect Auto-Breeding Pattern (Star - 4 Cardinals)
# ========================================

# Common header logic
function rituals:ritual/patterns/lib/detect_header
execute if score #has_ritual_tag rituals.temp matches 1.. run return 0

# Load pattern data
data modify storage rituals:detect_temp pattern set from storage rituals:patterns auto_breeding

# UNIQUE: Show help message (only once)
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [{"text":"🌾 ","color":"gold"},{"text":"Auto-Breeding Pattern Setup:",bold":true,"color":"yellow"}]
execute unless entity @s[tag=rituals.pattern_help_shown] run tellraw @a[distance=..10] [...]
tag @s add rituals.pattern_help_shown

# Check all positions using unified checker
data modify storage rituals:check_temp set value {item:"minecraft:wheat_seeds",pos:"n"}
execute positioned ~ ~ ~5 as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/lib/check_position_item with storage rituals:check_temp

data modify storage rituals:check_temp set value {item:"minecraft:carrot",pos:"e"}
execute positioned ~5 ~ ~ as @e[type=interaction,tag=rituals.totem,tag=rituals.has_item,distance=..1.5] run function rituals:ritual/patterns/lib/check_position_item with storage rituals:check_temp

# ... (similar for other positions)

# Sum and validate
function rituals:ritual/patterns/lib/sum_positions with storage rituals:detect_temp pattern
execute if score #totems_found rituals.temp matches 4 run function rituals:ritual/patterns/star/activate_auto_breeding

# Show particle indicators for missing positions
function rituals:ritual/patterns/lib/show_missing_particles with storage rituals:detect_temp pattern
```
**Before:** 66 lines | **After:** 30 lines | **Reduction:** 55%

#### 3.3 **Delete Position Checker Files**
All 24+ individual position checker files can be deleted and replaced with the single macro function.

---

### Phase 4: Simplify Tier Settings (LOW EFFORT, HIGH IMPACT)

#### 4.1 **Refactor All get_*_settings Functions**
**Example:** `ritual/get_breeding_settings.mcfunction`
**Before:**
```mcfunction
# 18 lines of repeated if-score-matches commands
```
**After:**
```mcfunction
# Get breeding frequency for current tier
data modify storage rituals:tier_load set value {setting_prefix:"breeding_tier",setting_suffix:"_frequency",output_var:"current_freq"}
function rituals:ritual/lib/load_tier_setting with storage rituals:tier_load
```
**Before:** 18 lines | **After:** 3 lines | **Reduction:** 83%

Apply to all 8+ get_*_settings functions.

---

## Implementation Benefits

### Quantitative Benefits:
- **Code Reduction:** ~600 lines eliminated (~60% of pattern ritual code)
- **File Reduction:** ~24+ position checker files deleted
- **New Ritual Cost:** 150+ lines → ~30 lines (80% reduction)
- **Maintenance:** Update 1 function instead of 5+ files for common logic changes
- **Testing:** Centralized logic = fewer test cases

### Qualitative Benefits:
- **Consistency:** All rituals use same core logic, reducing bugs
- **Readability:** Activation files focus on what's unique
- **Extensibility:** New patterns just need registry entry + unique visuals
- **Documentation:** Registry serves as self-documentation
- **Performance:** No runtime impact (macros resolve at execution)

---

## Implementation Plan

### Step 1: Create Library Functions (No Breaking Changes)
1. Create `ritual/patterns/lib/` directory
2. Implement all macro functions
3. Test macro functions in isolation
4. No changes to existing code yet

### Step 2: Refactor One Pattern (Proof of Concept)
1. Choose simplest pattern (e.g., Auto-Breeding)
2. Refactor activation + detection files
3. Test thoroughly
4. Compare before/after

### Step 3: Roll Out to Remaining Patterns
1. Apply refactoring to other 4 patterns
2. Test each pattern individually
3. Integration testing

### Step 4: Cleanup
1. Delete unused position checker files
2. Update documentation
3. Final integration test

### Step 5: Tier Settings Refactor
1. Create unified tier loader
2. Refactor all get_*_settings files
3. Test all rituals

---

## Risk Assessment

### Low Risk:
- ✅ Macro functions are well-supported in 1.20.5+
- ✅ No changes to storage formats
- ✅ No changes to external APIs
- ✅ Incremental rollout allows testing

### Medium Risk:
- ⚠️ Macro syntax errors are harder to debug
- **Mitigation:** Extensive testing of macro functions
- ⚠️ Storage manipulation more complex
- **Mitigation:** Comprehensive documentation

### Zero Risk:
- ❌ No performance impact (macros expand at runtime)
- ❌ No compatibility issues (internal refactor only)

---

## Recommendations

### Immediate Actions (High ROI):
1. **Implement unified supplemental totem destroyer** (Phase 1.1)
   - Saves 280+ lines immediately
   - Low complexity, high impact
2. **Implement unified position checker** (Phase 1.3)
   - Deletes 24+ files
   - Medium complexity, high impact
3. **Implement tier settings loader** (Phase 1.4)
   - Saves 108+ lines
   - Low complexity, medium impact

### Medium-Term Actions (Medium ROI):
4. **Refactor activation files** (Phase 3.1)
   - High complexity, high impact
   - Do after testing lib functions
5. **Create pattern registry** (Phase 2.1)
   - Medium complexity, high future value

### Long-Term Actions (Quality of Life):
6. **Refactor detection files** (Phase 3.2)
7. **Documentation auto-generation from registry**
8. **Pattern visualization tools**

---

## Conclusion

This refactoring will transform the codebase from a sprawling 100+ file system with 60% duplication into a lean, maintainable architecture centered around reusable macro functions and centralized configuration. Adding new pattern rituals will go from a 150-line, 3+ file task to a 30-line, single-entry task.

The investment of ~4-6 hours of refactoring will pay dividends in:
- **Faster feature development** (5x speedup for new patterns)
- **Easier maintenance** (1 place to fix bugs instead of 5+)
- **Better code quality** (DRY principles, single source of truth)
- **Improved testability** (centralized logic)

**Recommendation:** Begin with Phase 1 (macro functions) as it provides immediate value with minimal risk.

