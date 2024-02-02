## Домашнее задание к занятию "`Индексы`" -


***Задание 1***

Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

`Решение`

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-05/1.jpeg)

</details>

```

SELECT table_schema AS 'DataBase' , 
CONCAT(ROUND((SUM(index_length) * 100 / SUM(data_length)), 2), ' ', '%' ) AS 'index/size'
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'sakila';

```


---

***Задание 2***

Выполните explain analyze следующего запроса:

```
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
```

перечислите узкие места;
оптимизируйте запрос: внесите корректировки по использованию операторов, при необходимости добавьте индексы.

`Решение`




SELECT CONCAT(c.last_name, ' ', c.first_name) AS name, SUM(p.amount)
FROM payment p
join rental r on r.rental_date = p.payment_date 
join customer c on c.customer_id = r.customer_id
join inventory i on i.inventory_id = r.inventory_id
WHERE cast(p.payment_date as date) = '2005-07-30' and cast(p.payment_date as date) < '2005-07-31'
GROUP BY c.customer_id;


<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-05/2.jpeg)

</details>


```

