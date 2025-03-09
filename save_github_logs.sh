#!/bin/bash

echo "🔍 Сохраняем диагностику в файл..."

# Создаём файл для сохранения логов
LOG_FILE=~/Desktop/github_pages_diagnose.txt

# Записываем дату и время диагностики
echo "===== Диагностика GitHub Pages (Sun Mar  9 15:20:03 EET 2025) =====" > $LOG_FILE

# 1️⃣ Проверяем файлы в репозитории
echo "📂 Список файлов в репозитории:" >> $LOG_FILE
ls -la ~/professor_y_bot/bottest/ >> $LOG_FILE 2>&1

# 2️⃣ Проверяем статус GitHub Pages
echo "🌍 HTTP-ответ от GitHub Pages:" >> $LOG_FILE
curl -I https://gagarinyury.github.io/bottest/ >> $LOG_FILE 2>&1

# 3️⃣ Проверяем состояние Git
cd ~/professor_y_bot/bottest || { echo "❌ Ошибка: папка bottest не найдена!" >> $LOG_FILE; exit 1; }
echo "🔍 Текущая ветка Git:" >> $LOG_FILE
git branch >> $LOG_FILE 2>&1

echo "📋 Файлы в последнем коммите:" >> $LOG_FILE
git ls-tree -r main --name-only >> $LOG_FILE 2>&1

echo "✅ Лог диагностики сохранён в: $LOG_FILE"
