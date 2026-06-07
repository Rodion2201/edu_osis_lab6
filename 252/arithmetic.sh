#!/bin/bash
if [ $# -ne 3 ]; then
  echo "Использование: $0 число1 число2 операция"
  exit 1
fi
num1="$1"
num2="$2"
op="$3"
if ! [[ $num1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ $num2 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Ошибка: аргументы должны быть числами"
  exit 1
fi
case "$op" in
  "+") echo "$num1 + $num2" | bc ;;
  "-") echo "$num1 - $num2" | bc ;;
  "*") echo "$num1 * $num2" | bc ;;
  "/")
    if [ "$num2" = "0" ] || [ "$num2" = "0.0" ]; then
      echo "Ошибка: деление на ноль"
      exit 1
    fi
    echo "scale=4; $num1 / $num2" | bc
    ;;
  *) echo "Неизвестная операция" ;;
esac