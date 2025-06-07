
# Домашнее задание к занятию 4 «Оркестрация группой Docker контейнеров на примере Docker Compose»

### Инструкция к выполению

1. Для выполнения заданий обязательно ознакомьтесь с [инструкцией](https://github.com/netology-code/devops-materials/blob/master/cloudwork.MD) по экономии облачных ресурсов. Это нужно, чтобы не расходовать средства, полученные в результате использования промокода.
2. Практические задачи выполняйте на личной рабочей станции или созданной вами ранее ВМ в облаке.
3. Своё решение к задачам оформите в вашем GitHub репозитории в формате markdown!!!
4. В личном кабинете отправьте на проверку ссылку на .md-файл в вашем репозитории.

## Задача 1

Сценарий выполнения задачи:
- Установите docker и docker compose plugin на свою linux рабочую станцию или ВМ.
- Если dockerhub недоступен создайте файл /etc/docker/daemon.json с содержимым: ```{"registry-mirrors": ["https://mirror.gcr.io", "https://daocloud.io", "https://c.163.com/", "https://registry.docker-cn.com"]}```
- Зарегистрируйтесь и создайте публичный репозиторий  с именем "custom-nginx" на https://hub.docker.com (ТОЛЬКО ЕСЛИ У ВАС ЕСТЬ ДОСТУП);
- скачайте образ nginx:1.21.1;
- Создайте Dockerfile и реализуйте в нем замену дефолтной индекс-страницы(/usr/share/nginx/html/index.html), на файл index.html с содержимым:
```
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I will be DevOps Engineer!</h1>
</body>
</html>
```
- Соберите и отправьте созданный образ в свой dockerhub-репозитории c tag 1.0.0 (ТОЛЬКО ЕСЛИ ЕСТЬ ДОСТУП). 
- Предоставьте ответ в виде ссылки на https://hub.docker.com/<username_repo>/custom-nginx/general .


### Ответ

<details>

```

docker build -t custom-nginx:1.0.0 .
docker login
docker tag custom-nginx:1.0.0 100gramm/custom-nginx:1.0.0
docker push 100gramm/custom-nginx:1.0.0

```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/1.jpeg)
   
https://hub.docker.com/r/100gramm/custom-nginx




</details>

## Задача 2
1. Запустите ваш образ custom-nginx:1.0.0 командой docker run в соответвии с требованиями:
- имя контейнера "ФИО-custom-nginx-t2"
- контейнер работает в фоне
- контейнер опубликован на порту хост системы 127.0.0.1:8080
2. Не удаляя, переименуйте контейнер в "custom-nginx-t2"
3. Выполните команду ```date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; docker logs custom-nginx-t2 -n1 ; docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html```
4. Убедитесь с помощью curl или веб браузера, что индекс-страница доступна.

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

### Ответ


<details>

```

docker run --name SVS-custom-nginx-t2 -p 8080:80 -d 100gramm/custom-nginx:1.0.0

docker rename SVS-custom-nginx-t2 custom-nginx-t2

```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/2.jpeg)
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/3.jpeg)
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/4.jpeg)

</details>


## Задача 3
1. Воспользуйтесь docker help или google, чтобы узнать как подключиться к стандартному потоку ввода/вывода/ошибок контейнера "custom-nginx-t2".
2. Подключитесь к контейнеру и нажмите комбинацию Ctrl-C.
3. Выполните ```docker ps -a``` и объясните своими словами почему контейнер остановился.
4. Перезапустите контейнер
5. Зайдите в интерактивный терминал контейнера "custom-nginx-t2" с оболочкой bash.
6. Установите любимый текстовый редактор(vim, nano итд) с помощью apt-get.
7. Отредактируйте файл "/etc/nginx/conf.d/default.conf", заменив порт "listen 80" на "listen 81".
8. Запомните(!) и выполните команду ```nginx -s reload```, а затем внутри контейнера ```curl http://127.0.0.1:80 ; curl http://127.0.0.1:81```.
9. Выйдите из контейнера, набрав в консоли  ```exit``` или Ctrl-D.
10. Проверьте вывод команд: ```ss -tlpn | grep 127.0.0.1:8080``` , ```docker port custom-nginx-t2```, ```curl http://127.0.0.1:8080```. Кратко объясните суть возникшей проблемы.
11. * Это дополнительное, необязательное задание. Попробуйте самостоятельно исправить конфигурацию контейнера, используя доступные источники в интернете. Не изменяйте конфигурацию nginx и не удаляйте контейнер. Останавливать контейнер можно. [пример источника](https://www.baeldung.com/linux/assign-port-docker-container)
12. Удалите запущенный контейнер "custom-nginx-t2", не останавливая его.(воспользуйтесь --help или google)

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.


### Ответ

<details>


1. Воспользуйтесь docker help или google, чтобы узнать как подключиться к стандартному потоку ввода/вывода/ошибок контейнера "custom-nginx-t2".

docker attach custom-nginx-t2

3. Выполните ```docker ps -a``` и объясните своими словами почему контейнер остановился.

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/5.jpeg)

Ctrl-C отправляет SIGINT, который прервет работу приложения. Обычно это приводит к прерыванию, но решение об этом принимает приложение.
А это значит что мы отправили прерывание работы контейнеру.

5. Зайдите в интерактивный терминал контейнера "custom-nginx-t2" с оболочкой bash.
6. Установите любимый текстовый редактор(vim, nano итд) с помощью apt-get.
7. Отредактируйте файл "/etc/nginx/conf.d/default.conf", заменив порт "listen 80" на "listen 81".

```

Docker exec -it custom-nginx-t2 bash
apt update

apt install nano 

nano /etc/nginx/conf.d/default.conf

```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/6.jpeg)


10. Проверьте вывод команд: ```ss -tlpn | grep 127.0.0.1:8080``` , ```docker port custom-nginx-t2```, ```curl http://127.0.0.1:8080```. Кратко объясните суть возникшей проблемы.

```
Мы изменили порт приложения которое работает в контейнере,но port-forvarding все еще казывает 80.

```

12. Удалите запущенный контейнер "custom-nginx-t2", не останавливая его.(воспользуйтесь --help или google)

```

docker rm -f custom-nginx-t2

```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/7.jpeg)



</details>

## Задача 4


- Запустите первый контейнер из образа ***centos*** c любым тегом в фоновом режиме, подключив папку  текущий рабочий каталог ```$(pwd)``` на хостовой машине в ```/data``` контейнера, используя ключ -v.
- Запустите второй контейнер из образа ***debian*** в фоновом режиме, подключив текущий рабочий каталог ```$(pwd)``` в ```/data``` контейнера. 
- Подключитесь к первому контейнеру с помощью ```docker exec``` и создайте текстовый файл любого содержания в ```/data```.
- Добавьте ещё один файл в текущий каталог ```$(pwd)``` на хостовой машине.
- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в ```/data``` контейнера.


В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.


### Ответ

<details>

```
docker run -it -v $(pwd):/data -d centos:centos7 &
docker run -it -v $(pwd):/data -d debian &
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/8.jpeg)

```
docker exec -it 66402ade94f7 bash -c "echo 'Hello from CentOS' > /data/centos_file.txt" touch host.txt
docker exec -it ac9b720526c3 bash -c "ls -l /data"
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/8.jpeg)

</details>


## Задача 5

1. Создайте отдельную директорию(например /tmp/netology/docker/task5) и 2 файла внутри него.
"compose.yaml" с содержимым:
```
version: "3"
services:
  portainer:
    network_mode: host
    image: portainer/portainer-ce:latest
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```
"docker-compose.yaml" с содержимым:
```
version: "3"
services:
  registry:
    image: registry:2

    ports:
    - "5000:5000"
```

И выполните команду "docker compose up -d". Какой из файлов был запущен и почему? (подсказка: https://docs.docker.com/compose/compose-application-model/#the-compose-file )

2. Отредактируйте файл compose.yaml так, чтобы были запущенны оба файла. (подсказка: https://docs.docker.com/compose/compose-file/14-include/)

3. Выполните в консоли вашей хостовой ОС необходимые команды чтобы залить образ custom-nginx как custom-nginx:latest в запущенное вами, локальное registry. Дополнительная документация: https://distribution.github.io/distribution/about/deploying/
4. Откройте страницу "https://127.0.0.1:9000" и произведите начальную настройку portainer.(логин и пароль адмнистратора)
5. Откройте страницу "http://127.0.0.1:9000/#!/home", выберите ваше local  окружение. Перейдите на вкладку "stacks" и в "web editor" задеплойте следующий компоуз:

```
version: '3'

services:
  nginx:
    image: 127.0.0.1:5000/custom-nginx
    ports:
      - "9090:80"
```
6. Перейдите на страницу "http://127.0.0.1:9000/#!/2/docker/containers", выберите контейнер с nginx и нажмите на кнопку "inspect". В представлении <> Tree разверните поле "Config" и сделайте скриншот от поля "AppArmorProfile" до "Driver".

7. Удалите любой из манифестов компоуза(например compose.yaml).  Выполните команду "docker compose up -d". Прочитайте warning, объясните суть предупреждения и выполните предложенное действие. Погасите compose-проект ОДНОЙ(обязательно!!) командой.

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод, файл compose.yaml , скриншот portainer c задеплоенным компоузом.


### Ответ

<details>

```
mkdir -p /tmp/netology/docker/task5
cd /tmp/netology/docker/task5
touch compose.yaml
touch docker-compose.yaml
nano compose.yaml 

nano docker-compose.yaml
docker compose up -d

```
Docker Compose работает с 2 типами файлов (compose.yaml и docker-compose.yaml),но в последней версии приоритет отдается compose.yaml.При запуске Docker Compose, он об этом и сообщает


Изменяем файл compose.yaml и дописываем в него возможность запускать второй compose файл через include/

```
nano compose.yaml

version: "3"
include:
  - docker-compose.yaml
services:
  portainer:
    image: portainer/portainer-ce:latest
    network_mode: host
    ports:
      - "9000:9000"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/11.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/12.jpeg)


Выходим в хостовую машину и пушим нужный нам образ в локальный репозиторий(Иначе пункт 5.5 не выполнить)



```

docker tag 100gramm/custom-nginx:1.0.0  localhost:5000/custom-nginx:latest
docker push  localhost:5000/custom-nginx:latest

```
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/13.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/14.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/15.jpeg)


![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/16.jpeg)

В последнем пункте мы видим, что после удаления манифеста у нас выскочило предупреждение - что сревисы запущенные чеерз docker compose отличаются от тех что находятся в текущем манифесте и предлагает нам или имсправить проблему с файлом или удлаишь личшии контейнеры (которые отсутствую в текущем манифесте).

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/virt-homework/virt-03-docker-intro/17.jpeg)

</details>

---

### Правила приема

Домашнее задание выполните в файле readme.md в GitHub-репозитории. В личном кабинете отправьте на проверку ссылку на .md-файл в вашем репозитории.

