#!/bin/bash

echo "🚀 Полностью удаляем токен из истории Git..."

# 1️⃣ Удаляем старый config.py из репозитория
cd ~/professor_y_bot
git rm --cached config.py
git commit -m "Removed leaked token from repo"
git push origin main

# 2️⃣ Удаляем токен из истории коммитов (если он там остался)
echo "🧹 Используем BFG Repo-Cleaner для удаления токена..."
wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar
java -jar bfg-1.14.0.jar --delete-files config.py

# 3️⃣ Принудительно переписываем историю и пушим
git reflog expire --expire=now --all
git gc --prune=now
git push origin --force --all

echo "✅ Токен полностью удалён из репозитория!"
