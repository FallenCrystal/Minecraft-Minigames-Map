##
## Datapack Upgrader v1.0.0 by wifi_left
## If you encounter a problem, make an issue on https://github.com/wifi-left/Datapack-Upgrader
## 
tellraw @a [{"text":"冬泳怪鸽","color":"#1E90FF","bold":true},"\u00a7a 游戏结束！ 原因：人数过多，已跳过此小游戏。"]
scoreboard players set pw.state state 0
execute if entity @a[team=pw.play,tag=play.total] run function small_games/total/next_game
gamemode adventure @a[team=pw.play]
gamemode adventure @a[team=pw.wait]

execute as @a[team=pw.wait] run function poolwar/join
execute as @a[team=pw.play] run function poolwar/join

tellraw @a[team=pw.play] ["\u00a7e没有正确返回？输入 \u00a7b/spawn \u00a7e返回大厅！"]

scoreboard players reset * pw.max
scoreboard players reset * drown
