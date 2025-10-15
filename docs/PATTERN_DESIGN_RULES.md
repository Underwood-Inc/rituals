# Pattern Ritual Design Rules

## Critical Design Constraint: No Central Item Overlap

**RULE**: Never use a central totem item from one ritual as a supplementary item in another ritual.

### Why This Matters

When an item is placed on a totem, the system checks:
1. Is this totem at a supplementary position for ANY nearby pattern? → Tag it
2. Does this item trigger central totem detection? → Start ritual check

If an item is BOTH a central item AND a supplementary item, it creates ambiguity and race conditions.

### Current Central Items (DO NOT USE as Supplementary Items)

- `minecraft:diamond_hoe` - Auto-Farming central item
- `minecraft:wheat` - Auto-Breeding central item  
- `minecraft:experience_bottle` - XP Harvester central item
- `minecraft:emerald` - Growth Ritual (single-totem)
- `minecraft:diamond` - Strength Ritual (single-totem)
- `minecraft:netherite_block` - Prosperity Ritual (single-totem)
- `minecraft:iron_ingot` - Protection Ritual (single-totem)
- `minecraft:nether_star` - Healing Ritual (single-totem)
- `minecraft:arrow` - Sentry Ritual (single-totem)

### Exception: Auto-Farming Uses Wheat

The Auto-Farming ritual DOES use wheat as a supplementary item (NE corner).  
This is intentional but creates a conflict:
- Wheat at NE corner (+5,+5) from diamond hoe = Auto-Farming supplementary
- Wheat at center = Auto-Breeding central

**Mitigation**: The supplementary check system (`check_if_supplementary.mcfunction`) proactively tags wheat totems that are at corner positions relative to nearby diamond hoe totems. This prevents wheat from triggering auto-breeding detection when it's meant to be part of auto-farming.

### Best Practices for New Rituals

1. **Choose unique central items** - Items that aren't used elsewhere
2. **Use common/non-ritual supplementary items** - Seeds, basic crops, common blocks
3. **Document conflicts** - If overlap is unavoidable, document the mitigation strategy
4. **Test both orders** - Place supplementary first, then central; and central first, then supplementary

### Valid Supplementary Items (Safe to Use)

These items are NOT central items for any ritual:
- Basic crops: `carrot`, `potato`, `beetroot` (not wheat!)
- Seeds: `wheat_seeds`, `beetroot_seeds`, `pumpkin_seeds`, `melon_seeds`
- Common blocks: `dirt`, `cobblestone`, `stone`, `sand`, `gravel`
- Basic materials: `coal`, `stick`, `string`, `leather`
- Decorative: `flower`, `sapling`, `mushroom`
- Utility: `book`, `quartz`, `amethyst_shard`, `lapis_lazuli`, `glowstone_dust`

### Testing Checklist

When adding a new pattern ritual:
- [ ] Verify central item is unique
- [ ] Check supplementary items aren't central items elsewhere
- [ ] Test placing supplementary items before central item
- [ ] Test placing central item before supplementary items
- [ ] Verify pattern_totem tags are applied correctly
- [ ] Confirm no ritual conflicts occur

