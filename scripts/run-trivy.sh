#!/bin/bash
echo "Запуск сканирования Trivy..."
IMAGE_NAME=$1
TRIVY_SEVERITY="HIGH,CRITICAL"

# Сканируем образ
trivy image --severity $TRIVY_SEVERITY --exit-code 1 $IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "Критических уязвимостей не обнаружено"
else
    echo "Обнаружены критические уязвимости!"
    exit 1
fi
