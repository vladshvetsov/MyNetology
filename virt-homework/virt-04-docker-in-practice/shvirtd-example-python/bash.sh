#!/bin/bash

REPO_URL="https://github.com/vladshvetsov/virt-homework-virt-04-docker-in-practice-shvirtd-example-python"
TARGET_DIR="/opt/my_project"

if [ -d "$TARGET_DIR" ]; then
  echo "Обновление репозитория..."
  cd $TARGET_DIR
  git pull
else
  echo "Клонирование репозитория..."
  git clone $REPO_URL $TARGET_DIR
  cd $TARGET_DIR
fi

echo "Запуск проекта..."
docker compose up -d

echo "Данные скопированы"