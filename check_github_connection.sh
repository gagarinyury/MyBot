#!/bin/bash

echo "🔍 Проверка соединения с GitHub..."

# 1️⃣ Проверяем подключение по SSH
echo "🔗 Проверяем SSH-подключение к GitHub..."
ssh -T git@github.com 2>&1

# 2️⃣ Проверяем, есть ли SSH-ключи
echo "🔑 Проверяем наличие SSH-ключей..."
ls -la ~/.ssh/

# 3️⃣ Проверяем, правильно ли настроен git remote
echo "🌍 Проверяем текущий git remote..."
cd ~/professor_y_bot/bottest || { echo "❌ Ошибка: папка bottest не найдена!"; exit 1; }
git remote -v

echo "✅ Проверка соединения завершена!"
