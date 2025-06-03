## Домашнее задание к занятию "`ELK`" - `Швецов В.С.`
***Задание 1. Elasticsearch***

Установите и запустите Elasticsearch, после чего поменяйте параметр cluster_name на случайный.

Приведите скриншот команды 'curl -X GET 'localhost:9200/_cluster/health?pretty', сделанной на сервере с установленным Elasticsearch. Где будет виден нестандартный cluster_name.

`Решение`

<details>

   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/1.jpeg)
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/1_1.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/1_2.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/1_3.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/1_4.jpeg)


</details>

---

***Задание 2. Kibana***

Установите и запустите Kibana.

Приведите скриншот интерфейса Kibana на странице http://<ip вашего сервера>:5601/app/dev_tools#/console, где будет выполнен запрос GET /_cluster/health?pretty.


`Решение`
<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/2.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/2_1.jpeg)

</details>



---

***Задание 3. Logstash***

Установите и запустите Logstash и Nginx. С помощью Logstash отправьте access-лог Nginx в Elasticsearch.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx.


`Решение`

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/3_1.jpeg)


![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/3_2.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/3_3.jpeg)

</details>

---

***Задание 4. Filebeat***

Установите и запустите Filebeat. Переключите поставку логов Nginx с Logstash на Filebeat.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx, которые были отправлены через Filebeat.


`Решение`

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-03/4.jpeg)

</details>
