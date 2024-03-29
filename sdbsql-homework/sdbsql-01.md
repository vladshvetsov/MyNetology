## Домашнее задание к занятию "`Базы данных`" - `Швецов В.С.`


Легенда
Заказчик передал Вам файл в формате Excel, в котором сформирован отчёт.

На основе этого отчёта нужно выполнить следующие задания.

***Задание 1***

Опишите не менее семи таблиц, из которых состоит база данных:
* какие данные хранятся в этих таблицах;
* какой тип данных у столбцов в этих таблицах, если данные хранятся в PostgreSQL.

Приведите решение к следующему виду:

Сотрудники (
* идентификатор, первичный ключ, serial,
* фамилия varchar(50),
* ...
* идентификатор структурного подразделения, внешний ключ, integer).


`Решение`

```
***Сотрудники***
Идентификатор, первичный ключ, serial,
Фамилия, varchar(25),
Имя, varchar(25),
Отчество, varchar(25)

***Личная_карточка***
Идентификатор, первичный ключ, serial,
Идентификатор_сотрудник_id, integer,
Идентификатор_подразделение_id, integer,
Дата найма, date,
Проект integer,
Оклад integer,
Должность integer

***Оклад***
Идентификатор, первичный ключ, serial,
Оклад decimal (10,2)

***Должность***
Идентификатор, первичный ключ, serial,
Должность, varchar(50)

***Структурное_подразделение***
Идентификатор, первичный ключ, serial,
Заголовок varchar(50),
Тип подразделения integer,
Адрес integer

***Тип_подразделения***
Идентификатор, первичный ключ, serial,
Заголовок varchar(50)

***Проект***
Идентификатор, первичный ключ, serial,
Заголовок varchar(50)

***Регион***
Идентификатор, первичный ключ, serial,
Регион varchar(50)

***Город***
Идентификатор, первичный ключ, serial,
Город varchar(50)

```
