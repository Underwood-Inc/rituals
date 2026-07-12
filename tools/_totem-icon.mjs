/** Item model id helpers for Rituals totem icons. */

export function itemModelId(totemId, short) {
  return short ? `totem_${totemId}_short` : `totem_${totemId}`;
}

export function placedItemModelId(totemId, short) {
  return short ? `totem_${totemId}_placed_short` : `totem_${totemId}_placed`;
}

export function namespacedItemModel(totemId, short) {
  return `rituals:${itemModelId(totemId, short)}`;
}

export function namespacedPlacedItemModel(totemId, short) {
  return `rituals:${placedItemModelId(totemId, short)}`;
}
