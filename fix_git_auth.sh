#!/bin/bash

echo "🔍 Проверяем текущий URL репозитория..."
cd ~/professor_y_bot/bottest || { echo "❌ Ошибка: папка bottest не найдена!"; exit 1; }
git remote -v

echo "🔧 Переключаем на SSH..."
git remote set-url origin git@github.com:gagarinyury/bottest.git

echo "📋 Проверяем, изменился ли URL..."
git remote -v

echo "🚀 Пробуем пушить файлы снова..."
git add .
git commit -m "Fix: switched to SSH authentication"
git push -u origin main

echo "✅ Готово! Теперь Git должен использовать SSH."
