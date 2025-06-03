## Домашнее задание к занятию "`SQL. Часть 1`" - `Швецов В.С.`


Задание можно выполнить как в любом IDE, так и в командной строке.

***Задание 1***

Получите уникальные названия районов из таблицы с адресами, которые начинаются на “K” и заканчиваются на “a” и не содержат пробелов.


`Решение`

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-03/1.jpeg)

</details>

```

select distinct district  
from address 
where district like 'K%a' and district not like '% %';

```


---

***Задание 2***

Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года включительно и стоимость которых превышает 10.00.


`Решение`

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-03/2.jpeg)

</details>

```
select * 
from payment 
where amount > 10 and payment_date between '2005-06-15 00:00:00' and '2005-06-18 23:59:59'
order by payment_date;

```


---

***Задание 3***

Получите последние пять аренд фильмов.


`Решение`

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-03/3.jpeg)

</details>

```
select * 
from rental order by rental_id desc 
limit 5;

```


---

***Задание 4***

Одним запросом получите активных покупателей, имена которых Kelly или Willie.

Сформируйте вывод в результат таким образом:

все буквы в фамилии и имени из верхнего регистра переведите в нижний регистр,
замените буквы 'll' в именах на 'pp'.


`Решение`


<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sdbsql-homework/sdbsql-03/4.jpeg)

</details>

```
select lower (replace(first_name, 'L', 'p')), lower (last_name) 
from customer 
where first_name like 'Kelly' or first_name like 'Willie';


```