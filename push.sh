#!/bin/bash

# 主角成长手册 - 自动推送脚本
# 用法: ./push.sh "更新说明"

if [ -z "$1" ]; then
    echo "❌ 请提供更新说明"
    echo "用法: ./push.sh \"添加新功能\""
    exit 1
fi

COMMIT_MSG="$1"

echo "📋 当前Git状态:"
git status --short

echo ""
echo "➕ 添加所有更改..."
git add -A

echo ""
echo "💾 提交更改: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo ""
echo "🚀 推送到GitHub..."
git push origin HEAD:master

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 推送成功!"
    echo ""
    echo "📱 手机测试地址:"
    echo "   https://doyourbestt.github.io/protagonist-growth/"
    echo ""
else
    echo ""
    echo "❌ 推送失败"
    exit 1
fi
