#!/bin/bash

# Остановка сервиса
sudo systemctl stop prometheus && echo "Сервис остановлен" || { echo "Ошибка при остановке сервиса"; exit 1; }

# Удаление юнит-файла
sudo rm -f /etc/systemd/system/prometheus.service && echo "Юнит-файл удален" || { echo "Ошибка при удалении юнит-файла"; exit 1; }

# Перезагрузка systemd
sudo systemctl daemon-reload && echo "Systemd перезагружен" || { echo "Ошибка при перезагрузке systemd"; exit 1; }

# Удаление данных Prometheus (кроме /opt)
sudo rm -rf /var/lib/prometheus && echo "Данные Prometheus удалены" || { echo "Ошибка при удалении данных"; exit 1; }
