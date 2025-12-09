#!/bin/bash

echo "Запуск Dockle для аудита Docker-образа..."
dockle --ignore DKL-DI-0005 secureci-app:local
if [ $? -eq 0 ]; then
    echo "Аудит успешно завершен. Образ соответствует best practices."
else
    echo "Обнаружены проблемы с конфигурацией. Проверьте вывод выше."
    exit 1
fi
