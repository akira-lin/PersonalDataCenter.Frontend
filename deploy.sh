#!/bin/bash

# GitHub Pages 部署脚本
# 用法: ./deploy.sh <github-username> <repo-name>

set -e

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "用法: ./deploy.sh <github-username> <repo-name>"
    exit 1
fi

USERNAME=$1
REPO=$2
BRANCH="gh-pages"

echo "开始部署到 GitHub Pages..."

# 初始化 git（如果需要）
if [ ! -d ".git" ]; then
    git init
    git remote add origin "https://github.com/$USERNAME/$REPO.git"
fi

# 创建 .nojekyll 文件（GitHub Pages 需要）
touch .nojekyll

# 添加所有文件
git add .

# 提交
git commit -m "Deploy to GitHub Pages - $(date)"

# 推送
git push -u origin main:$BRANCH --force

echo "部署完成!"
echo "请访问: https://$USERNAME.github.io/$REPO/"
