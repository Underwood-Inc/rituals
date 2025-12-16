# ========================================
# Say Random Comment
# ========================================
# The soul weapon speaks to its wielder

execute store result score #comment_roll rituals.soul_temp run random value 1..50

# General comments
execute if score #comment_roll rituals.soul_temp matches 1 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Are we there yet?\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 2 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I hunger for more...\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 3 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Your grip is adequate. Barely.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 4 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I've seen better miners. And worse.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 5 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Do you ever wonder about the void?\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 6 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"*yawns ethereally*\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 7 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I was a dragon once. Or was that a dream?\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 8 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"The stones whisper secrets...\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 9 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Your ancestors would be... confused.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 10 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Break more rocks. It pleases me.\"","color":"gray"}]

# Mining/tool specific
execute if score #comment_roll rituals.soul_temp matches 11 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"That ore looks tasty.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 12 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Swing harder! Put your back into it!\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 13 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I miss being a sword sometimes...\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 14 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Did you know I can taste copper? It's... coppery.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 15 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"The diamond calls to me...\"","color":"gray"}]

# Philosophical
execute if score #comment_roll rituals.soul_temp matches 16 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"What is consciousness anyway?\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 17 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"If I break, do I die? Or just... nap?\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 18 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Existence is pain. Mining helps.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 19 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I think, therefore I... mine?\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 20 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"The meaning of life is 64. Per stack.\"","color":"gray"}]

# Sarcastic
execute if score #comment_roll rituals.soul_temp matches 21 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Oh good, more cobblestone. Thrilling.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 22 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"No no, take your time. It's not like I'm immortal.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 23 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Wow, you really showed that dirt block.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 24 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I could do this blindfolded. If I had eyes.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 25 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Another day, another thousand blocks...\"","color":"gray"}]

# Encouraging
execute if score #comment_roll rituals.soul_temp matches 26 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"You're getting better! I can feel it!\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 27 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Together, we are unstoppable!\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 28 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I believe in you, wielder!\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 29 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"We make a great team!\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 30 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Your dedication honors me.\"","color":"gray"}]

# Creepy/Dark
execute if score #comment_roll rituals.soul_temp matches 31 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I see what you did. All of it.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 32 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"The shadows remember your name...\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 33 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"When you sleep, I don't.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 34 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Your heartbeat is... soothing.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 35 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Don't look behind you. Just kidding. Maybe.\"","color":"gray"}]

# Random/Weird
execute if score #comment_roll rituals.soul_temp matches 36 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I just remembered I hate gravel.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 37 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"What if blocks have feelings?\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 38 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I had the weirdest dream about a crafting table...\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 39 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"La la la, mining away~\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 40 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"*hums an ancient melody*\"","color":"gray"}]

# Meta/Fourth wall
execute if score #comment_roll rituals.soul_temp matches 41 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Did someone just read my code?\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 42 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I wonder what my respawn timer is...\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 43 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Is this the main world or a backup?\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 44 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Hope the server doesn't crash...\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 45 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"My tick function is running smoothly!\"","color":"gray"}]

# Compliments/Observations
execute if score #comment_roll rituals.soul_temp matches 46 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Nice armor. Very... protective looking.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 47 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Your inventory management is... unique.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 48 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"I sense hostile entities nearby. Or maybe I'm paranoid.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 49 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"The sun is nice. I miss having skin.\"","color":"gray"}]
execute if score #comment_roll rituals.soul_temp matches 50 run tellraw @s [{"text":"","color":"dark_purple","italic":true},{"text":"[Soul] ","color":"light_purple"},{"text":"\"Remember: we're in this together. Forever.\"","color":"gray"}]

