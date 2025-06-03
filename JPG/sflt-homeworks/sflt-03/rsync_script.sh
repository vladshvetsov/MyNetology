#!/bin/bash
S_DIR="/home/vlad"
T_DIR="/tmp/backup"
rsync -avc "$_DIR" "$T_DIR" > /dev/null 2>> /var/log/rsync_script.log

if [ $? -eq 0]; then
    echo "[$(date)]  Резервное копирование удачно" >> /var/log/rsync_script.log
else 
    echo "[$(date)]  Резервное копирование ОШИБКА" >> /var/log/rsync_script.log
fi    