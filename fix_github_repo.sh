#!/bin/bash

echo "🚀 Исправляем ошибки с репозиторием и загружаем файлы в GitHub..."

# 1️⃣ Переходим в папку с проектом
cd ~/professor_y_bot/bottest || { echo "❌ Ошибка: папка bottest не найдена!"; exit 1; }

# 2️⃣ Проверяем, подключен ли репозиторий
echo "📋 Проверяем подключение к GitHub..."
git remote -v

# 3️⃣ Проверяем, существует ли ветка main
echo "📋 Проверка ветки 'main'..."
if ! git rev-parse --verify main >/dev/null 2>&1; then
    echo "🔧 Ветка 'main' не найдена. Создаём её..."
    git checkout --orphan main
    git reset --hard
else
    echo "✅ Ветка 'main' найдена."
    git checkout main
fi

# 4️⃣ Удаляем ненужные файлы
echo "🗑️ Очищаем дублирующиеся файлы..."
rm -rf bottest/

# 5️⃣ Добавляем файлы в Git
echo "📝 Добавляем файлы в Git..."
git add .

# 6️⃣ Делаем коммит
echo "💬 Делаем первый коммит..."
git commit -m "Initial commit"

# 7️⃣ Отправляем файлы в GitHub
echo "📤 Отправляем файлы в GitHub..."
git push -u origin main

echo "✅ Репозиторий успешно загружен в GitHub!"
