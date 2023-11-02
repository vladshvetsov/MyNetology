# Домашнее задание к занятию 1 «Disaster recovery и Keepalived»

### Цель задания
В результате выполнения этого задания вы научитесь:
1. Настраивать отслеживание интерфейса для протокола HSRP;
2. Настраивать сервис Keepalived для использования плавающего IP

------

### Чеклист готовности к домашнему заданию

1. Установлена программа Cisco Packet Tracer
2. Установлена операционная система Ubuntu на виртуальную машину и имеется доступ к терминалу
3. Сделан клон этой виртуальной машины, они находятся в одной подсети и имеют разные IP адреса
4. Просмотрены конфигурационные файлы, рассматриваемые на лекции, которые находятся по [ссылке](1/)


------


### Задание 1
- Дана [схема](1/hsrp_advanced.pkt) для Cisco Packet Tracer, рассматриваемая в лекции.
- На данной схеме уже настроено отслеживание интерфейсов маршрутизаторов Gi0/1 (для нулевой группы)
- Необходимо аналогично настроить отслеживание состояния интерфейсов Gi0/0 (для первой группы).
- Для проверки корректности настройки, разорвите один из кабелей между одним из маршрутизаторов и Switch0 и запустите ping между PC0 и Server0.

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-01/1.jpg)

</details>

- На проверку отправьте получившуюся схему в формате pkt и скриншот, где виден процесс настройки маршрутизатора.

<details>

![Схема в формате pkt](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-01/hsrp_advanced.pkt)


![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-01/2.jpg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-01/3.jpeg)

</details>

------


### Задание 2
- Запустите две виртуальные машины Linux, установите и настройте сервис Keepalived как в лекции, используя пример конфигурационного [файла](1/keepalived-simple.conf).
- Настройте любой веб-сервер (например, nginx или simple python server) на двух виртуальных машинах

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-01/2_0.jpeg)
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-01/2_01.jpeg)

</details>

- Напишите Bash-скрипт, который будет проверять доступность порта данного веб-сервера и существование файла index.html в root-директории данного веб-сервера.

```
#!/bin/bash

if [[ $(netstat -tulpn | grep LISTEN | grep :80) ]] && [[ -f /var/www/html/index.nginx-debian.html ]]; then
exit 0
else
exit 1
fi
```

- Настройте Keepalived так, чтобы он запускал данный скрипт каждые 3 секунды и переносил виртуальный IP на другой сервер, если bash-скрипт завершался с кодом, отличным от нуля (то есть порт веб-сервера был недоступен или отсутствовал index.html). Используйте для этого секцию vrrp_script

```
global_defs {
    script_user root
    enable_script_security
}

vrrp_script testing_server {
    script "/etc/keepalived/test_server.sh"
    interval 3
}

vrrp_instance VI_1 {
        state MASTER
        interface eth1
        virtual_router_id 15
        priority 255
        advert_int 1

        virtual_ipaddress {
                192.168.123.15/24
        }

        track_script {
           testing_server
        }
}
```


<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-01/2_1.jpeg)
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-01/2.2.jpeg)



</details>

- На проверку отправьте получившейся bash-скрипт и конфигурационный файл keepalived, а также скриншот с демонстрацией переезда плавающего ip на другой сервер в случае недоступности порта или файла index.html

