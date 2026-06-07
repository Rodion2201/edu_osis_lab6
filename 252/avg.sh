#!/bin/bash
sum=0
count=0
for arg in "$@"; do
  if [[ $arg =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    sum=$(echo "$sum + $arg" | bc)
    count=$((count + 1))
  else
    echo "Предупреждение: $arg — не число, пропускаем" >&2
  fi
done
if [ $count -eq 0 ]; then
  echo "Ошибка: нет чисел для расчёта"
  exit 1
fi
echo "scale=4; $sum / $count" | bc