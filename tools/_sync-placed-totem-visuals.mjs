/**
 * Regenerates totem tier visual mcfunctions — original 3-part block_display geometry only.
 * Wide base, slim shaft, wide cap (oak_log / tier block). Unchanged since Rituals 1.x.
 */
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const catalog = JSON.parse(fs.readFileSync(path.join(root, 'tools/totem-source.json'), 'utf8'));
const visualsDir = path.join(root, 'data/rituals/function/totem/visuals');

const BLOCK_SNBT = {
  wood: '{Name:"minecraft:oak_log",Properties:{axis:"y"}}',
  copper: '{Name:"minecraft:cut_copper"}',
  iron: '{Name:"minecraft:iron_block"}',
  gold: '{Name:"minecraft:gold_block"}',
  diamond: '{Name:"minecraft:diamond_block"}',
  netherite: '{Name:"minecraft:netherite_block"}',
};

const BLOCK_STORAGE = {
  wood: '{Name:"minecraft:oak_log",Properties:{axis:"y"}}',
  copper: '{Name:"minecraft:cut_copper"}',
  iron: '{Name:"minecraft:iron_block"}',
  gold: '{Name:"minecraft:gold_block"}',
  diamond: '{Name:"minecraft:diamond_block"}',
  netherite: '{Name:"minecraft:netherite_block"}',
};

const TALL = {
  base: { scale: 0.8, height: 0.3, offset: -0.4 },
  shaft: { translation: [-0.25, 0.3, -0.25], scale: [0.5, 1.4, 0.5] },
  cap: { translation: [-0.4, 1.7, -0.4], scale: [0.8, 0.3, 0.8] },
};

const SHORT = {
  base: { scale: 0.8, height: 0.2, offset: -0.4 },
  shaft: { translation: [-0.25, 0.2, -0.25], scale: [0.5, 0.6, 0.5] },
  cap: { translation: [-0.4, 0.8, -0.4], scale: [0.8, 0.2, 0.8] },
};

function vec3([x, y, z]) {
  return `[${x}f,${y}f,${z}f]`;
}

function spawnBlock(lines, blockSnbt, translation, scale) {
  const [sx, sy, sz] = scale;
  const [tx, ty, tz] = translation;
  lines.push(
    `summon block_display ~ ~ ~ {Tags:["rituals.totem_visual","rituals.new_visual"],block_state:${blockSnbt},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:${vec3([tx, ty, tz])},scale:${vec3([sx, sy, sz])}}}`,
  );
  lines.push('scoreboard players operation @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] rituals.id = @s rituals.id');
  lines.push('tag @e[type=block_display,tag=rituals.new_visual,limit=1,sort=nearest] remove rituals.new_visual');
}

function writeTierMcfunction(totem, short) {
  const tier = totem.tier;
  const layout = short ? SHORT : TALL;
  const blockSnbt = BLOCK_SNBT[totem.id];
  const blockStorage = BLOCK_STORAGE[totem.id];
  if (!blockSnbt) throw new Error(`Missing block state for ${totem.id}`);
  const suffix = short ? '_short' : '';
  const displayName = totem.id.charAt(0).toUpperCase() + totem.id.slice(1);

  const lines = [
    '# ========================================',
    `# Spawn visual for Tier ${tier} (${displayName}) totem${short ? ' — short' : ''}`,
    '# ========================================',
    '# 3-part totem: wider base, slim middle, wider top',
    '',
    '# Base (wider, at bottom)',
    `data modify storage rituals:temp block set value ${blockStorage}`,
    `data modify storage rituals:temp scale set value ${layout.base.scale}`,
    `data modify storage rituals:temp height set value ${layout.base.height}`,
    `data modify storage rituals:temp offset set value ${layout.base.offset}`,
    'function rituals:totem/visuals/spawn_display with storage rituals:temp',
    '',
    '# Middle pole (slim)',
  ];
  spawnBlock(lines, blockSnbt, layout.shaft.translation, layout.shaft.scale);
  lines.push('', '# Top cap (wider, at top)');
  spawnBlock(lines, blockSnbt, layout.cap.translation, layout.cap.scale);
  lines.push('');

  fs.writeFileSync(path.join(visualsDir, `tier${tier}${suffix}.mcfunction`), `${lines.join('\n')}\n`);
}

for (const totem of catalog.totems) {
  writeTierMcfunction(totem, false);
  writeTierMcfunction(totem, true);
}

console.log(`Synced block_display totem visuals for ${catalog.totems.length} tiers under ${visualsDir}`);
