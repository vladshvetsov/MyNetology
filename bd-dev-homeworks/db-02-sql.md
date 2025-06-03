# Домашнее задание к занятию 2. `«SQL»` - `Швецов В.С.`

## Введение

Перед выполнением задания вы можете ознакомиться с 
[дополнительными материалами](https://github.com/netology-code/virt-homeworks/blob/virt-11/additional/README.md).

## Задача 1

Используя Docker, поднимите инстанс PostgreSQL (версию 12) c 2 volume, 
в который будут складываться данные БД и бэкапы.

Приведите получившуюся команду или docker-compose-манифест.

<details>

```docker
docker run --name postgre1 -d -e POSTGRES_HOST_AUTH_METHOD=trust -v C:/Temp/sql_base:/var/lib/postgresql/data -v C:/Temp/sql_backup:/tmp/backup postgres:12
```
`- e POSTGRES_HOST_AUTH_METHOD=trust` - устанавливает переменную окружения `POSTGRES_HOST_AUTH_METHOD` в значение `trust`. Это означает, что аутентификация хоста будет доверенной, что позволяет подключаться к серверу PostgreSQL без аутентификации.

`-v C:/Temp/sql_base:/var/lib/postgresql/data` - монтирует каталог `C:/Temp/sql_base` с хост-системы в каталог `/var/lib/postgresql/data` внутри контейнера. 

`-v C:/Temp/sql_backup:/tmp/backup` - монтирует каталог `C:/Temp/sql_backup` с хост-системы в каталог `/tmp/backup внутри контейнера`.

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/1.jpeg)

Это позволяет хранить данные PostgreSQL на хост-системе.

</details>

## Задача 2

В БД из задачи 1: 

- создайте пользователя test-admin-user и БД test_db;
- в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже);
- предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db;
- создайте пользователя test-simple-user;
- предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE этих таблиц БД test_db.

Таблица orders:

- id (serial primary key);
- наименование (string);
- цена (integer).

Таблица clients:

- id (serial primary key);
- фамилия (string);
- страна проживания (string, index);
- заказ (foreign key orders).

Приведите:

- итоговый список БД после выполнения пунктов выше;
- описание таблиц (describe);
- SQL-запрос для выдачи списка пользователей с правами над таблицами test_db;



<details>

Подключаемся к Docker-контейнеру:

```docker
docker exec -it postgre1 psql -U postgres
```

Создаем пользователя test_admin:
```sql
CREATE USER test_admin WITH PASSWORD '12345678';
```
Создаем БД:
```sql
CREATE DATABASE test_db;
```
Переключаем БД:
```sql
\c test_db
```

Cоздаем таблицы orders, clients:

```sql
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    наименование VARCHAR,
    цена INTEGER
);

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    фамилия VARCHAR,
    страна_проживания VARCHAR,
    заказ_id INT REFERENCES orders(id)
);

CREATE INDEX country_index ON clients (страна_проживания);
```

Предоставляем привилегии на все операции пользователю test-admin-user на таблицы БД test_db;
```sql
GRANT ALL ON orders, clients TO "test_admin";
```
Создайте пользователя test-simple-user;
```sql
CREATE USER test_user WITH PASSWORD '123456';
```
Предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE этих таблиц БД test_db.
```sql
GRANT SELECT,INSERT,UPDATE,DELETE ON orders, clients to "test_user";
```
Приведите:

- итоговый список БД после выполнения пунктов выше;
```sql
SELECT datname FROM pg_database;
```
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/2.jpeg)

- описание таблиц (describe);
```sql
\d+ clients
```
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/3.jpeg)

```sql
\d+ orders
```
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/4.jpeg)

- SQL-запрос для выдачи списка пользователей с правами над таблицами test_db:

```sql
SELECT table_name,grantee,privilege_type 
FROM information_schema.table_privileges
WHERE table_schema NOT IN ('information_schema','pg_catalog');
```
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/5.jpeg)

</details>

## Задача 3

Используя SQL-синтаксис, наполните таблицы следующими тестовыми данными:

Таблица orders

|Наименование|цена|
|------------|----|
|Шоколад| 10 |
|Принтер| 3000 |
|Книга| 500 |
|Монитор| 7000|
|Гитара| 4000|

Таблица clients

|ФИО|Страна проживания|
|------------|----|
|Иванов Иван Иванович| USA |
|Петров Петр Петрович| Canada |
|Иоганн Себастьян Бах| Japan |
|Ронни Джеймс Дио| Russia|
|Ritchie Blackmore| Russia|

Используя SQL-синтаксис:
- вычислите количество записей для каждой таблицы.

Приведите в ответе:

- запросы,
- результаты их выполнения.

<details>

```sql
INSERT INTO orders (наименование,цена) VALUES
('Шоколад',10),
('Принтер',3000),
('Книга',500),
('Монитор',7000),
('Гитара',4000);
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/6.jpeg)


```sql
ALTER TABLE clients ALTER COLUMN заказ_id DROP NOT NULL;
```

```sql
INSERT INTO clients (фамилия,страна_проживания,заказ_id) VALUES
('Иванов Иван Иванович','USA',NULL),
('Петров Петр Петрович','Canada',NULL),
('Иоганн Себастьян Бах','Japan',NULL),
('Ронни Джеймс Дио','Russia',NULL),
('Ritchie Blackmore','Russia',NULL);
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/7.jpeg)

Количество записей для таблиц:
```sql
select count(*) from clients;
```
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/8.jpeg)

```sql
select count(*) from orders;
```
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/9.jpeg)

</details>

## Задача 4

Часть пользователей из таблицы clients решили оформить заказы из таблицы orders.

Используя foreign keys, свяжите записи из таблиц, согласно таблице:

|ФИО|Заказ|
|------------|----|
|Иванов Иван Иванович| Книга |
|Петров Петр Петрович| Монитор |
|Иоганн Себастьян Бах| Гитара |

Приведите SQL-запросы для выполнения этих операций.

Приведите SQL-запрос для выдачи всех пользователей, которые совершили заказ, а также вывод этого запроса.
 
Подсказка: используйте директиву `UPDATE`.

<details>

Запросы на изменение:

```sql
UPDATE clients
SET заказ_id = (SELECT id FROM orders WHERE наименование = 'Книга')
WHERE фамилия = 'Иванов Иван Иванович';

UPDATE clients
SET заказ_id = (SELECT id FROM orders WHERE наименование = 'Монитор')
WHERE фамилия = 'Петров Петр Петрович';

UPDATE clients
SET заказ_id = (SELECT id FROM orders WHERE наименование = 'Гитара')
WHERE фамилия = 'Иоганн Себастьян Бах';
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/10.jpeg)


```sql
select * from clients;
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/11.jpeg)

```sql
select * from orders;
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/12.jpeg)

</details>

## Задача 5

Получите полную информацию по выполнению запроса выдачи всех пользователей из задачи 4 
(используя директиву EXPLAIN).

Приведите получившийся результат и объясните, что значат полученные значения.

<details>


```sql
EXPLAIN select * from clients;
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/13.jpeg)


**Seq Scan** — означает, что используется последовательное, блок за блоком, чтение данных таблицы clients

**Cost** - некая виртуальная величина призванная оценить затратность операции. Первое значение 0.00 — затраты на получение первой строки. Второе — 18.10 — затраты на получение всех строк.

Единица измерения **cost** – «извлечение одной страницы в последовательном (sequential) порядке». То есть оценивается и время, и использование ресурсов.

**rows** — приблизительное количество возвращаемых строк при выполнении операции Seq Scan. Это значение возвращает планировщик.

**width** - это оценка PostgreSQL того, сколько, в среднем, байт содержится в одной строке, возвращенной в рамках данной операции

Вывод этой информации - ожидания планировщика.

Если дать команду analyze и повторить запрос, то количество строк будет более реалистичным, и cost поменяется - потому что БД проведёт анализ.

</details>

## Задача 6

Создайте бэкап БД test_db и поместите его в volume, предназначенный для бэкапов (см. задачу 1).

Остановите контейнер с PostgreSQL, но не удаляйте volumes.

Поднимите новый пустой контейнер с PostgreSQL.

Восстановите БД test_db в новом контейнере.

Приведите список операций, который вы применяли для бэкапа данных и восстановления. 

<details>



Создаем бэкап ролей из контейнера postgre1:

```docker
docker exec -it postgre1 pg_dumpall -U postgres --roles-only -f /tmp/backup/roles.sql
```

Создаем бэкап БД из контейнера postgre1:

```docker
docker exec -it postgre1 pg_dump -h localhost -U postgres -F t -f /tmp/backup/backup_1.tar test_db
```

Запускаем новый докер-контейнер postgre2:

```docker
docker run --name postgre2 -d -e POSTGRES_HOST_AUTH_METHOD=trust -v C:/Temp/sql2_base:/var/lib/postgresql/data -v C:/Temp/sql2_backup:/tmp/backup postgres:12
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/16.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/17.jpeg)


Создаем БД в докер-контейнере postgre2:

```docker
docker exec -it postgre2 psql -U postgres -c "CREATE DATABASE test_db WITH ENCODING='UTF-8';"
```
Восстаналвиваем роли из бэкапа:

```docker
docker exec -it postgre2 psql -U postgres -f /tmp/backup/roles.sql                   
```
Восстанавлием БД из бэкапа:

```sql
docker exec -it postgre2 pg_restore -U postgres -Ft -v -d test_db /tmp/backup/backup_1.tar
```

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/bd-dev-homeworks/db-02-sql/15.jpeg)

</details>