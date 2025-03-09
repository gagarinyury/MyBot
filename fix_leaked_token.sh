#!/bin/bash

echo "🚀 Начинаем исправление утечки токена..."

# 1️⃣ Удаляем старый токен из config.py и создаём безопасный файл
echo "🔍 Обновляем config.py..."
cat <<CONFIG > ~/professor_y_bot/config.py
import os

BOT_TOKEN = os.getenv("BOT_TOKEN")

WEBHOOK_URL = "https://gagarinyury.github.io/bottest/webhook"
WEBHOOK_PATH = "/webhook"
WEBHOOK_PORT = 8000
CONFIG

# 2️⃣ Добавляем новый токен в переменные окружения
echo "🔑 Добавляем новый токен в окружение..."
echo 'export BOT_TOKEN="8092281659:AAHapY2xFLA5lARiAMQNrP1ZVUvh5UujI-c"' >> ~/.bashrc
source ~/.bashrc

# 3️⃣ Удаляем старый токен из Git и пушим изменения
cd ~/professor_y_bot
echo "🗑️ Удаляем старый config.py из Git..."
git rm --cached config.py
git add config.py
git commit -m "Removed leaked token and updated config"
git push origin main

# 4️⃣ Чистим историю коммитов, чтобы токен не остался в старых коммитах
echo "🧹 Чистим историю коммитов..."
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch config.py' --prune-empty --tag-name-filter cat -- --all
git push origin --force --all

# 5️⃣ Перезапускаем бота с новым токеном
echo "🚀 Перезапускаем бота..."
~/professor_y_bot/restart_bot.sh

echo "✅ Исправление завершено! Новый токен установлен, старый удалён, бот перезапущен."
