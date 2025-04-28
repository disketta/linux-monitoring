#!/bin/bash

# Параметры
PUSHGATEWAY_URL="http://localhost:9091/metrics/job/test_job"
METRIC_COUNT=${1:-100000}  # По умолчанию 100,000 метрик

# Генерация метрик
for ((i=1; i<=METRIC_COUNT; i++)); do
  echo "test_metric_$i $((RANDOM % 100))"
done | curl --data-binary @- "$PUSHGATEWAY_URL"

echo "Pushed $METRIC_COUNT metrics to Pushgateway."
