# UU Plugin for Steam Deck

这是一个用于在 Steam Deck 上运行 UU 加速器插件的工具集。

## 文件说明

- `uupluginctl` - 控制器，用于启动、停止、更新和查看状态
- `uuplugind` - 守护进程
- `uuplugin-constants.sh` - 常量

## 使用方法

### 启动服务
```bash
./uupluginctl start
```

### 停止服务
```bash
./uupluginctl stop
```

### 检查状态
```bash
./uupluginctl status
```

### 更新插件
```bash
./uupluginctl update
```

## 工作原理

1. `uupluginctl` 负责管理守护进程的生命周期和插件更新
2. `uuplugind` 作为守护进程在后台运行，监控插件进程
3. 如果插件崩溃，守护进程会自动重启它
4. 更新功能会从远程服务器下载最新版本的插件并自动安装

## 日志文件

- 控制器日志：`/tmp/uupluginctl.log`
- 守护进程日志：`/tmp/uuplugind.log`