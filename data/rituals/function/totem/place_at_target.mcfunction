# Actually place the totem at current position
# Get next ID
scoreboard players add #global_totem_id rituals.id 1

# Summon totem interaction entity (for clicking/breaking) - wide and tall to cover entire totem visual
summon interaction ~ ~ ~ {width:2.0f,height:2.5f,Tags:["rituals.totem","rituals.new_totem"],response:1b}

# Summon text_display for the label at eye level, slightly forward so it renders in front
summon text_display ~ ~1.5 ~ {Tags:["rituals.totem_label","rituals.new_label"],text:'{"text":""}',billboard:"center",background:0,see_through:0b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0.6f],scale:[1f,1f,1f]}}

# Add barrier for collision (invisible, unbreakable in survival)
# Place barriers ABOVE the ground, not replacing it
setblock ~ ~1 ~ barrier
# Only place second barrier for tall totems (not short variants)
execute as @p unless score @s rituals.temp matches 1 run setblock ~ ~2 ~ barrier

# Initialize
execute as @e[type=interaction,tag=rituals.new_totem,limit=1,sort=nearest] run function rituals:totem/initialize

# Remove item from player
execute as @p if entity @s[gamemode=!creative] run item modify entity @s weapon.mainhand rituals:decrement

# Effects
playsound block.stone.place block @a ~ ~ ~ 1.0 0.8
particle happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 10

tellraw @p [{"text":"[Totem Rituals] ","color":"gold","bold":true},{"text":"Totem placed!","color":"green"}]
advancement grant @p only rituals:guide/place_totem

# Reset distance
scoreboard players set @p rituals.distance 0

