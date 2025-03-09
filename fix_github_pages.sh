#!/bin/bash

echo "🚀 Отключаем Jekyll и перезапускаем GitHub Pages..."

# 1️⃣ Добавляем .nojekyll, чтобы GitHub не использовал Jekyll
touch ~/professor_y_bot/bottest/.nojekyll

# 2️⃣ Добавляем изменения в Git
cd ~/professor_y_bot/bottest
git add .nojekyll
git commit -m "Disabled Jekyll for GitHub Pages"
git push origin main

# 3️⃣ Перезапускаем GitHub Pages (переключаем Source)
echo "🔄 Переключаем Source в GitHub Pages..."
curl -X POST -H "Accept: application/vnd.github+json" -H "Authorization: token GITHUB_PERSONAL_ACCESS_TOKEN"     "https://api.github.com/repos/gagarinyury/bottest/pages/builds"

echo "✅ GitHub Pages обновлён! Через 5 минут проверь: https://gagarinyury.github.io/bottest/"
