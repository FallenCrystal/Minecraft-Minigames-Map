scoreboard players set bw.state state -3
execute if score bw.custom_team board matches 1 run scoreboard players set bw.startcountdown board 1
execute unless score bw.custom_team board matches 1 run scoreboard players set bw.startcountdown board 10
execute if score bw.startcountdown board matches 5.. run tellraw @a[tag=bw.player] ["\u00a7e游戏即将在\u00a7c10\u00a7e秒后开始"]