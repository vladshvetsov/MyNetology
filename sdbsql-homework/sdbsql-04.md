## Домашнее задание к занятию "`SQL. Часть 2`" - `Швецов В.С.`


***Задание 1***


Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

фамилия и имя сотрудника из этого магазина;
город нахождения магазина;
количество пользователей, закреплённых в этом магазине.

`Решение`

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-04/1.jpeg)

</details>

```

SELECT concat (s.first_name  , ' ', s.last_name) as Имя , c.city, count (c2.customer_id) as Количество 
FROM staff s 
JOIN address a  ON s.address_id = a.address_id 
JOIN city c  ON a.city_id = c.city_id 
JOIN store s2 ON s2.store_id = s.store_id 
JOIN customer c2 ON s2.store_id = c2.store_id 
GROUP BY s.first_name , s.last_name , c.city 
HAVING Количество > 300;

```

---

***Задание 2***

Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

`Решение`

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-04/2.jpeg)

</details>

```
SELECT  count (`length`) 
FROM film 
WHERE `length` > (SELECT avg (`length`) FROM film);
```

---


