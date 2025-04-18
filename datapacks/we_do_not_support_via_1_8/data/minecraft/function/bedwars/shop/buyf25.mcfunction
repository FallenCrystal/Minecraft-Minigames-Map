##
## Datapack Upgrader v1.0.0 by wifi_left
## If you encounter a problem, make an issue on https://github.com/wifi-left/Datapack-Upgrader
## 
execute as @s at @s store result score @s bw.tmp.ir run clear @s iron_ingot 0
execute as @s at @s store result score @s bw.tmp.gd run clear @s gold_ingot 0
execute as @s at @s store result score @s bw.tmp.dm run clear @s diamond 0
execute as @s at @s store result score @s bw.tmp.em run clear @s emerald 0
## Buy.-25

scoreboard players set bw.buy.sharpness.tmp board 0
execute as @s[team=bw.green] if score bw.sharpness.green board matches 1.. run scoreboard players set bw.buy.sharpness.tmp board 1
execute as @s[team=bw.red] if score bw.sharpness.red board matches 1.. run scoreboard players set bw.buy.sharpness.tmp board 1
execute as @s[team=bw.yellow] if score bw.sharpness.yellow board matches 1.. run scoreboard players set bw.buy.sharpness.tmp board 1
execute as @s[team=bw.blue] if score bw.sharpness.blue board matches 1.. run scoreboard players set bw.buy.sharpness.tmp board 1

execute if score @s bw.tmp.ir matches 10.. run clear @s iron_ingot 10
execute unless score @s bw.tmp.ir matches 10.. run tellraw @s ["\u00a7c你的资源不够买这个东西!"]
execute unless score @s bw.tmp.ir matches 10.. run playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0 1
execute if score @s bw.tmp.ir matches 10.. run tellraw @s ["\u00a7a你购买了\u00a76Stone Sword * 1"]
clear @s wooden_sword
execute if score @s bw.tmp.ir matches 10.. if score bw.buy.sharpness.tmp board matches 0 run give @s stone_sword[can_place_on={predicates:[{blocks:"#minecraft:bwplace"}],show_in_tooltip:false},can_break={predicates:[{blocks:"#minecraft:bedblocks"}],show_in_tooltip:false}] 1
execute if score @s bw.tmp.ir matches 10.. if score bw.buy.sharpness.tmp board matches 1 run give @s stone_sword[can_place_on={predicates:[{blocks:"#minecraft:bwplace"}],show_in_tooltip:false},can_break={predicates:[{blocks:"#minecraft:bedblocks"}],show_in_tooltip:false},enchantments={sharpness:1}] 1
