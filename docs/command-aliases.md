# 命令别名

命令别名是一项 Spigot 自带的功能. 使用它我们可以替换几乎所有现有的命令. 这可以将所有地图中需要 `trigger` 命令来执行的命令转换为别名来执行. 例如将 `/hub` 和 `/spawn` 注册为命令别名 使其调用 `/trigger hub`

> [!NOTE]
> 详见 https://bukkit.fandom.com/wiki/Commands.yml

## 默认配置

将其内容覆盖在服务器文件夹下的 `commands.yml` 中即可.

> [!WARNING]
> 该分叉的命令提示已更改为别名 请为您的服务器应用这些别名 否则地图可能会不工作

> [!CAUTION]
> 严禁使用 `/reload` 命令重新加载服务器配置文件. 相反, 请重新启动服务器.

```yaml
command-block-overrides: []
ignore-vanilla-permissions: false
aliases:
  spawn:
  - trigger hub
  hub:
  - trigger hub
  exit-spec:
  - trigger spec set 3
  exit-spectator:
  - trigger spec set 3
  spec:
  - trigger spec set 2
  spectator:
  - trigger spec set 2
  g-spec:
  - trigger spec set 4
  quickplay:
  - trigger quickplay $1-
  qp:
  - trigger quickplay $1-
  rej:
  - trigger rejoin
  rejoin:
  - trigger rejoin
```