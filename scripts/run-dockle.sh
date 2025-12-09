#!/bin/bash

echo "Запуск Dockle для аудита Docker-образа..."
LOCAL_IMAGE="localhost/$1"
dockle --ignore DKL-DI-0005 $LOCAL_IMAGE

if [ $? -eq 0 ]; then
    echo "Аудит успешно завершен. Образ соответствует best practices."
else
    echo "Обнаружены проблемы с конфигурацией. Проверьте вывод выше."
    exit 1
fi
