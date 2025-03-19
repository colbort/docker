#!/bin/sh

# 检查 Swoole 是否已启动
if ps aux | grep "php think swoole" | grep -v grep > /dev/null; then
    echo "Swoole is already running. Skipping startup."
else
    echo "Starting Swoole server..."
    php think swoole start
fi

# 进入守护状态，防止容器退出
exec tail -f /dev/null
