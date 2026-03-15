# UU Plugin for Arch Linux x86

这是一个用于在 Arch Linux x86 上运行 UU 加速器插件的工具集。

## 文件说明

- `uupluginctl` - 控制器，用于更新插件和查看状态
- `uuplugind` - 守护进程（需要以 root 权限运行）
- `uuplugin-constants.sh` - 共享常量定义文件

## 使用方法

### 服务管理 (通过 systemd)
由于 `uuplugind` 需要以 root 权限运行，建议使用 systemd 服务管理：

1. **创建 systemd 服务文件** `/etc/systemd/system/uuplugin.service`：
   ```ini
   [Unit]
   Description=UU Plugin Daemon
   After=network.target

   [Service]
   Type=simple
   User=root
   WorkingDirectory=/home/windy/opt/uuplugin
   ExecStart=/home/windy/opt/uuplugin/uuplugind
   Restart=on-failure

   [Install]
   WantedBy=multi-user.target
   ```

2. **启用并启动服务**：
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl enable uuplugin
   sudo systemctl start uuplugin
   ```

3. **管理服务**：
   ```bash
   sudo systemctl stop uuplugin      # 停止服务
   sudo systemctl start uuplugin     # 启动服务
   sudo systemctl restart uuplugin   # 重启服务
   sudo systemctl status uuplugin    # 查看状态
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

1. `uuplugind` 作为守护进程在后台运行（通常通过 systemd 管理），监控插件进程
2. 如果插件崩溃，守护进程会自动重启它
3. `uupluginctl` 负责插件更新和状态查看
4. 更新功能会从远程服务器下载最新版本的插件并自动安装
5. 插件更新后，如果守护进程正在运行，会自动重启插件进程以应用更新

## 日志文件

- 控制器日志：`/tmp/uupluginctl.log`
- 守护进程日志：`/tmp/uuplugind.log`