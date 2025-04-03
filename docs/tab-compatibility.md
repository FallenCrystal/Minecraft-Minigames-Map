# Tab 插件兼容性

[Tab](https://github.com/NEZNAMY/TAB) 是一个很好的插件. 它包括修改Tab中的header和footer. 玩家的名称, 附加的占位符以及其它功能.

但它拥有的很多功能实际上与地图冲突. 该教程将说明您必须禁用什么功能, 可以保留的功能, 或启用它之后有什么效果.

## 功能列表

这些命名是来自于Tab插件的配置文件的, 以便您可以快速找到需要禁用的功能.

- `header-footer`: 启用它将不会对地图造成任何影响.
- `tablist-name-formatting`: 建议禁用. 地图会修改玩家的前后缀, 以显示他们正在游玩什么地图. 可以启用此功能, 但您将看不见其它玩家在游玩什么游戏.
- `scoreboard-teams`: **必须禁用**. 该功能将会导致在客户端层面上分配到与预期不符的计分板队伍. 这将导致客户端显示的内容完全混乱. **即使它只是整理玩家在列表中的排序**
- `belowname-objective`: 建议禁用. 该功能将阻止玩家看到其它玩家的血量或分数等信息.
- `bossbar`: 启用它将不会对地图造成任何影响.
- `per-world-playerlist`: **必须禁用**. 原因如readme中描述的隐身插件导致的问题一致.
- `scoreboard`: **必须禁用**. 该功能将覆盖玩家看到的计分板, 而游戏有自己的计分板.
- `global-playerlist`: 如果您已启用该功能, 请根据下文调整您的配置文件.
- `layout`: 与 `tablist-name-formatting` 的原因相同

## 禁用某项功能

> [!TIP]
> 从未使用过条件占位符? 在 [Tab的Wiki](https://github.com/NEZNAMY/TAB/wiki/Feature-guide:-Conditional-placeholders) 中找到有关配置和使用它的更多信息.

> [!IMPORTANT]
> 这段内容仅适用于当您的服务器是群组服 (如 使用了Velocity作为代理), 且您的代理服务器上安装了Tab  
> 如果您正在运行单个服务器实例, 简单地禁用需要禁用的功能即可

> [!CAUTION]
> 严禁在单个实例上挂载跟此地图无关的世界


将条件填入功能配置文件下的 `disable-condition` 即可在特定条件下禁用该功能.

条件占位符提供了非常强大的可自定义性, 几乎可以涵盖您会遇到的所有情况.

### 短写法

> [!IMPORTANT]
> 短写法仅适用于您填入的内容 **一定是** 条件占位符 (如示例中的 `disable-condition`), 您不能在其它地方这么写.

示例:

```yaml
    disable-condition: "%server%=minigame"
```

应用该条件时, 当玩家所处服务器的在配置文件的名称为 "minigame" 时, 指定的功能将被禁用.

我个人不推荐这种短写法. 因为它即不方便管理, 也无法通过外部直接获取条件的输出. 

它的好处是可以立即见效, 而无需您完整地学习条件占位符的写法.

### 注册条件占位符 (完整写法, 推荐)

您可以在Tab配置文件下的 `conditions` 下添加新的条件占位符. 它的写法如下:

```yaml
    <条件名称>:
        conditions: # 可以是多个条件
        - '<条件1>'
        type: AND # 可以是 AND 或 OR. 当条件只有一个时, 不需要指定类型.
        # 仅当您需要将该条件占位符用于输出时才需要定义
        yes: 'true' # 默认为true. 如果条件满足, 使用占位符 %condition:条件名称% 时返回的值
        no: 'false' # 默认为false. 与 yes 类似, 但当条件不满足时输出.
```

假设我们有一个名为 "minigame" 的服务器, 我们可以添加一个条件占位符来表示玩家是否在小游戏服中:

```yaml
    in_minigame:
        conditions:
        - '%server%=minigame'
```

我们就会得到一个名为 `in_minigame` 的条件占位符.

> [!TIP]
> 如果您有多个小游戏服务器, 且它们以相同的模板命名 (如 `minigame-01`, `minigame-02` 等), 您可以使用 `|-` 条件来判断字符串是否以指定的内容为开头, 而非使用 `=` 来进行完全匹配. 
> 例子:
> ```yaml
>    in_minigame:
>        conditions:
>        - '%server%|-minigame-'
> ```

然后我们就可以为指定的模块应用该条件了. 如:

```yaml
    disable-condition: 'in_minigame'
```

这样 当您在小游戏服务器时, 该模块就会被禁用.

### 为每个功能都添加额外的条件占位符

您可能会希望为每个功能的启用和禁用都添加更精细的控制.

您可以额外为其定义一些条件占位符. 例如:

```yaml
conditions:
    disable-scoreboard-teams:
        conditions:
        - '%condition:in-minigame%=true'
        - '%i-wanna-disable-scoreboard-teams%=true'
        type: OR
    in-minigame:
        conditions:
        - '%server%=minigame'
```

然后将 `disable-scoreboard-teams` 条件应用到 `disable-condition` 中:

```yaml
scoreboard-teams:
    disable-condition: 'disable-scoreboard-teams'
```

当以下任意条件被满足时, 服务器将不会为这些玩家启用 `scoreboard-teams` 功能:
- 在一个名为 `minigame` 的服务器上.
- 假设拥有 `i-wanna-disable-scoreboard-teams` 这个占位符, 且它返回了 `true`.


## 在代理上配置 `global-playerlist`

要做到这一点有两种方法, 但它们的原理不太一样. 请选择一个适合您的情况来实现.

### 方法一: 每个服务器都是独立的

这种情况适用于:
- 您有多个服务器, 您希望每个服务器都有自己的服务器组
- 您希望玩家只能看到当前玩家所在的服务器上的其它玩家
- 但您希望在大厅或一些服务器中看到其它所有玩家

首先, 启用 `isolate-unlisted-servers`:

```yaml
    isolate-unlisted-servers: true
```

这将为每个未在 `server-groups` 下定义的服务器都分配单独的组.
这将导致玩家只能看到当前玩家所在的服务器上的其它玩家.

其次, 配置 `spy-servers`:

在该列表上的服务器中的玩家可以看到服务器上的所有玩家.

```yaml
    spy-servers:
      - "Lobby"
```

只有当玩家在 Lobby 服务器上时, 他们才能看到所有服务器上的玩家.

### 方法二: 为小游戏服务器配置组

> [!CAUTION]
> 您只能为每个使用了该地图的小游戏服务器都配置独立的组. 其它小游戏服务器上的玩家 **不能** 在同一个组中.


这种情况适用于:
- 您希望只有小游戏服务器才看不到其它服务器上的玩家
- 您不想过度编辑配置文件

例如:

```yaml
    server-groups:
      minigame:
      - "minigame"
```

至此, `minigame` 中游玩的玩家只能看到其它在minigame上游玩的玩家. 
