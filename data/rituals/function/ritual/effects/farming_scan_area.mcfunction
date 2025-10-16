# Scan 15x6x15 area for fully grown crops
# Called positioned at corner of scan area (-7,-3,-7 from totem)

# Scan Y level 0 (same as totem)
execute positioned ~ ~3 ~ run function rituals:ritual/effects/farming_scan_layer
# Scan Y level -1
execute positioned ~ ~2 ~ run function rituals:ritual/effects/farming_scan_layer
# Scan Y level -2
execute positioned ~ ~1 ~ run function rituals:ritual/effects/farming_scan_layer
# Scan Y level +1
execute positioned ~ ~4 ~ run function rituals:ritual/effects/farming_scan_layer
# Scan Y level +2
execute positioned ~ ~5 ~ run function rituals:ritual/effects/farming_scan_layer
# Scan Y level +3
execute positioned ~ ~6 ~ run function rituals:ritual/effects/farming_scan_layer


