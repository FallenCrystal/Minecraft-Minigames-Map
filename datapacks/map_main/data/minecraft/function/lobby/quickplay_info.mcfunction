##
## Datapack Upgrader v1.0.0 by wifi_left
## If you encounter a problem, make an issue on https://github.com/wifi-left/Datapack-Upgrader
## 
$tellraw @s [{"text":"[\u00a7a$(id)\u00a77: \u00a7$(color)$(name)\u00a7r]","clickEvent":{"action":"run_command","value":"/qp set $(id)"},"hoverEvent":{"action": "show_text","contents": {"text": "点击快速加入 \u00a7$(color)$(name)","color": "gold"}},"color":"yellow"}]