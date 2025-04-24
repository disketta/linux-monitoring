#!/bin/bash

# Парсим логи Prometheus и сохраняем строки с "info" в файл
journalctl -u prometheus.service --since "1 minute ago" | grep "info" >> /opt/linux-monitoring/prometheus/prometheus.log
