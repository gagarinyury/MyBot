#!/bin/bash

echo "🔍 Проверяем GitHub Pages..."

# 1️⃣ Проверяем, есть ли index.html в репозитории
echo "📂 Проверяем файлы в репозитории..."
ls -la ~/professor_y_bot/bottest/

# 2️⃣ Проверяем статус GitHub Pages
echo "🌍 Проверяем HTTP-ответ страницы..."
curl -I https://gagarinyury.github.io/bottest/

# 3️⃣ Проверяем текущую ветку и файлы Git
cd ~/professor_y_bot/bottest || { echo "❌ Ошибка: папка bottest не найдена!"; exit 1; }
echo "🔍 Текущая ветка Git:"
git branch

echo "📋 Файлы в коммите:"
git ls-tree -r main --name-only

echo "✅ Проверка завершена!"
