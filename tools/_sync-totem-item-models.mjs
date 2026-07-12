/**
 * Adds minecraft:item_model to totem recipes and /give functions from tools/totem-source.json.
 * Run: node tools/_sync-totem-item-models.mjs
 */
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { namespacedItemModel } from './_totem-icon.mjs';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const catalog = JSON.parse(fs.readFileSync(path.join(root, 'tools/totem-source.json'), 'utf8'));

const recipeDir = path.join(root, 'data/rituals/recipe');
const giveDir = path.join(root, 'data/rituals/function/give');

let recipeUpdates = 0;
let giveUpdates = 0;

for (const totem of catalog.totems) {
  for (const variant of totem.variants) {
    const model = namespacedItemModel(totem.id, Boolean(variant.short));

    const recipePath = path.join(recipeDir, `${variant.recipe}.json`);
    const recipe = JSON.parse(fs.readFileSync(recipePath, 'utf8'));
    recipe.result.components ??= {};
    if (recipe.result.components['minecraft:item_model'] !== model) {
      recipe.result.components['minecraft:item_model'] = model;
      fs.writeFileSync(recipePath, `${JSON.stringify(recipe, null, 2)}\n`);
      recipeUpdates++;
    }

    const givePath = path.join(giveDir, `${variant.give}.mcfunction`);
    let give = fs.readFileSync(givePath, 'utf8');
    const component = `minecraft:item_model="${model}"`;
    if (give.includes(component)) {
      continue;
    }
    if (!give.includes('warped_fungus_on_a_stick[')) {
      throw new Error(`Unexpected give format in ${givePath}`);
    }
    give = give.replace(
      /warped_fungus_on_a_stick\[/,
      `warped_fungus_on_a_stick[${component},`,
    );
    fs.writeFileSync(givePath, give);
    giveUpdates++;
  }
}

console.log(`Synced item_model on ${recipeUpdates} recipe(s) and ${giveUpdates} give function(s).`);
