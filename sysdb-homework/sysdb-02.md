## Домашнее задание к занятию "`Кеширование Redis/memcached`" - `Швецов В.С.`

***Задание 1. Кеширование***

Приведите примеры проблем, которые может решить кеширование.

Приведите ответ в свободной форме.

`Решение`


* Кеширование может существенно ускорить время загрузки веб-страниц. Данные из кеша будут доступны, без необходимости повторной загрузки с сервера, что значительно сократит время ожидания.

* Кеширование - мощный инструмент для оптимизации производительности и масштабирования приложений

* Кеширование уменьшает нагрузку на сервер за счет сокращения количества запросов к базе данных или к другим ресурсам. Это позволяет серверу обрабатывать больше запросов одновременно и улучшает его общую производительность.


---

***Задание 2. Memcached***

Установите и запустите memcached.

Приведите скриншот systemctl status memcached, где будет видно, что memcached запущен.


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-02/2.jpeg)
   
</details>

---

***Задание 3. Удаление по TTL в Memcached***

Запишите в memcached несколько ключей с любыми именами и значениями, для которых выставлен TTL 5.

Приведите скриншот, на котором видно, что спустя 5 секунд ключи удалились из базы.


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-02/3.jpeg)
   
</details>

---

***Задание 4. Запись данных в Redis***

Запишите в Redis несколько ключей с любыми именами и значениями.

Через redis-cli достаньте все записанные ключи и значения из базы, приведите скриншот этой операции.


`Решение`

<details>

 ![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-02/4.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-02/4_1.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-02/4_2.jpeg)

   
</details>

---

***Задание 5*. Работа с числами***

Запишите в Redis ключ key5 со значением типа "int" равным числу 5. Увеличьте его на 5, чтобы в итоге в значении лежало число 10.

Приведите скриншот, где будут проделаны все операции и будет видно, что значение key5 стало равно 10.


`Решение`

<details>
   
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sysdb-homework/sysdb-02/5.jpeg)

</details>