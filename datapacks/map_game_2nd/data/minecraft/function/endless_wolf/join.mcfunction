##
## Datapack Upgrader v1.0.0 by wifi_left
## If you encounter a problem, make an issue on https://github.com/wifi-left/Datapack-Upgrader
## 
tellraw @s ["\n\u00a7e游戏公开测试中...遇到BUG请及时反馈！\n"]
title @s title [{"text":"\u00a7l吸血鬼之夜","color":"#8b038b"}]
title @s subtitle ["\u00a77Vampire Night"]
gamemode adventure @s[gamemode=spectator]
execute in overworld run tp @s -373 20.1 624 -90 0
execute at @s run playsound entity.player.levelup player @s ~ ~ ~ 10 2 1
tellraw @s[tag=GOABLE.SPEC] ["\n\u00a77  你已开启\u00a7b全局旁观者模式\u00a77。\n  \u00a77由于你进入游戏后会变为旁观模式，请使用 \u00a76/spawn\u00a77 返回大厅。\n  ",{"text":"\u00a7a\u00a7l点击此处，或者使用 \u00a76\u00a7l/exit-spectator \u00a7a\u00a7l退出全局旁观者模式","bold":true,"clickEvent": {"action": "run_command","value": "/exit-spectator"},"hoverEvent": {"action": "show_text","contents": "\u00a7c点击此处退出全局旁观者模式"}},"\n"]
execute as @s[tag=GOABLE.SPEC] at @s run gamemode spectator
team join wait.endwolf
effect clear @s
effect give @s instant_health 1 25 true
clear @s
execute if score endwolf.state state matches 1.. run function minecraft:endless_wolf/spec
