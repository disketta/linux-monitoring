#!/bin/bash

# Запуск Prometheus
sudo systemctl start prometheus && echo "Prometheus успешно запущен" || { echo "Ошибка при запуске Prometheus"; exit 1; }

# Проверка статуса
systemctl status prometheus | grep "active (running)" && echo "Сервис активен" || { echo "Сервис не активен"; exit 1; }

# Проверка веб-интерфейса
curl -s -o /dev/null -w "%{http_code}" http://localhost:9090/api/v1/status/config | grep "200" && echo "Веб-интерфейс доступен" || { echo "Веб-интерфейс недоступен"; exit 1; }
