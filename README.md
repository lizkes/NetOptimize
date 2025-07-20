# NetOptimize

基于 KernelSU 的网络性能优化模块，通过 sysctl 在 Android 启动后自动应用一组调优参数，以提升吞吐量并降低时延。

## 功能亮点

- 启用 **BBR** 拥塞控制算法 (`net.ipv4.tcp_congestion_control=bbr`)
- 切换默认队列算法至 **fq_codel** (`net.core.default_qdisc=fq_codel`)
- 扩大 TCP/UDP 读写缓冲区及 backlog 限制

## 目录结构

```text
.
├─ boot-completed.sh   # 主脚本，负责循环调用 apply_sysctl 并应用网络优化
├─ module.prop         # KernelSU 模块描述文件
└─ NetOptimize.zip     # 已打包的可刷入模块（可选）
```

## 安装方法

1. 确保设备已刷入并启用 [KernelSU](https://github.com/tiann/KernelSU)。
2. 通过 KernelSU Manager 选择 `NetOptimize.zip` 模块并刷入
3. 重启设备后，网络优化即自动生效。

## 使用说明

- 若需自定义 sysctl 参数，可修改 `boot-completed.sh` 后重新打包 `NetOptimize.zip`。
- 查看当前网络相关内核参数：
  ```bash
  sysctl -a | grep -E "(tcp_|net_)"
  ```

## 更新日志

| 版本 | 变更     |
| ---- | -------- |
| v1.0 | 初始版本 |

## 许可协议

MIT License

## 致谢

- [KernelSU](https://github.com/tiann/KernelSU) 项目
- 所有为开源社区做出贡献的开发者 