## Домашнее задание к занятию "`Работа с данными (DDL/DML)`" -`Швецов В.С.`


***Задание 1***

1.1. Поднимите чистый инстанс MySQL версии 8.0+. Можно использовать локальный сервер или контейнер Docker.


`Решение`

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/1.jpeg)

</details>

1.2. Создайте учётную запись sys_temp.


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/2.jpeg)

</details>


1.3. Выполните запрос на получение списка пользователей в базе данных. (скриншот)


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/3.jpeg)
   
</details>


1.4. Дайте все права для пользователя sys_temp.


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/4.jpeg)
   
</details>


1.5. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/5.jpeg)
   
</details>


1.6. Переподключитесь к базе данных от имени sys_temp.
Для смены типа аутентификации с sha2 используйте запрос:

ALTER USER 'sys_test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/6.jpeg)
   
</details>


1.6_. По ссылке https://downloads.mysql.com/docs/sakila-db.zip скачайте дамп базы данных.


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/7.jpeg)
   
</details>


1.7. Восстановите дамп в базу данных.

`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/8.jpeg)
   
</details>


1.8. При работе в IDE сформируйте ER-диаграмму получившейся базы данных. При работе в командной строке используйте команду для получения всех таблиц базы данных. (скриншот)

Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/9.jpeg)
   
</details>


```

sudo mysql -u root

CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY '456';

SELECT User,Host FROM mysql.user;

GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'localhost';

show grants for 'sys_temp'@'localhost';

ALTER USER 'sys_test'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345';

system mysql -usys_temp -p456

mysql -u sys_temp -p

create dstabase sakila;

mysql -u sys_temp -p ${sakila} < sakila-schema.sql

mysql -u sys_temp -p ${sakila} < sakila-data.sql


use sakila;
show tables;

```

---

***Задание 2***

Составьте таблицу, используя любой текстовый редактор или Excel, в которой должно быть два столбца: в первом должны быть названия таблиц восстановленной базы, во втором названия первичных ключей этих таблиц. Пример: (скриншот/текст)

Название таблицы | Название первичного ключа
customer         | customer_id


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-02/2_0.jpeg)
   
</details>



