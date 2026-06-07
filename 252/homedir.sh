#!/bin/bash
user="$1"
if [ -z "$user" ]; then
    echo "Ошибка: укажите пользователя"
exit 1
fi
home_dir=$(grep "^$user:" /ets/passwd | cut -b: -f6)
if [ -n "home_dir" ]; then
    echo "$home_dir"
else
    echo "ошибка: пользователь $user не найден"
exit 1
fi