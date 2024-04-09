# Домашнее задание к занятию 1. «`Типы и структура СУБД`» - `Швецов В.С.`

## Введение

Перед выполнением задания вы можете ознакомиться с 
[дополнительными материалами](https://github.com/netology-code/virt-homeworks/tree/virt-11/additional).

## Задача 1

Архитектор ПО решил проконсультироваться у вас, какой тип БД 
лучше выбрать для хранения определённых данных.

Он вам предоставил следующие типы сущностей, которые нужно будет хранить в БД:

- электронные чеки в json-виде,
<details>

**MongoDB — оптимальное решение для работы с JSON форматом.**

Встроенная NoSQL база данных, которая основывается на концепции документоориентированного хранения данных. MongoDB хранит документы в формате JSON, что делает ее идеальным выбором для работы с JSON данными. Она также обеспечивает хорошую производительность и масштабируемость при обработке больших объемов JSON-документов.


</details>



- склады и автомобильные дороги для логистической компании,

<details>

**Реляционные базы данных , такие как PostgreSQL или MySQL, как наиболее универсальный и распространенный вариант**

Преимущества реляционных баз данных включают:

1. Структурированность данных: Реляционные базы данных предоставляют четкую структуру для хранения данных, что подходит для информации о складах и дорогах.

2. Способность управлять сложными отношениями: Если есть несколько типов сущностей (например, склады и дороги) с определенными связями между ними, реляционные базы данных легко моделируют такие отношения.

3. Язык запросов SQL: SQL является мощным языком запросов, что делает легким выполнение сложных запросов для анализа данных.

4. Поддержка транзакций: Реляционные базы данных обеспечивают поддержку транзакций, что важно для целостности данных в логистической системе.


</details>

- генеалогические деревья,

<details>

**Графовых БД - Amazon Neptune** 

Графовые базы данных хорошо подходят для моделирования и хранения связей между данными, что делает их идеальным выбором для представления генеалогических отношений.

В графовой базе данных каждый человек может быть представлен узлом, а отношения между людьми (родственные связи) - ребрами графа. Это позволяет эффективно организовывать и обрабатывать данные о родственных отношениях, уровнях предков и потомков.



</details>

- кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации,

<details>

**Redis, Memcached** 

In-memory database (IMDB) – это вид БД, который хранит все свои данные в оперативной памяти компьютера, а не на диске, как в традиционных базах данных. Это позволяет существенно ускорить операции чтения и записи данных.

Выбор между Redis и Memcached зависит от конкретных потребностей:

- Используйте Redis, если вам нужна богатая функциональность, поддержка разнообразных типов данных и возможность сохранения данных на диск. Он отлично подходит для приложений, которые требуют сложного кеширования и обработки данных.

- Используйте Memcached, если вы ищете простое и быстрое решение для кеширования данных и не требуете сохранности данных между перезапусками. Он может быть идеальным выбором для приложений, где скорость доступа к данным имеет первостепенное значение.

</details>

- отношения клиент-покупка для интернет-магазина.

<details>

**PostgreSQL или MySQL, как наиболее универсальный и распространенный вариант**

Обычно используются реляционные базы данных. Это связано с тем, что реляционные базы данных хорошо подходят для моделирования структурированных данных с явными связями между различными сущностями.

</details>

Выберите подходящие типы СУБД для каждой сущности и объясните свой выбор.



## Задача 2

Вы создали распределённое высоконагруженное приложение и хотите классифицировать его согласно 
CAP-теореме. Какой классификации по CAP-теореме соответствует ваша система, если 
(каждый пункт — это отдельная реализация вашей системы и для каждого пункта нужно привести классификацию):

- данные записываются на все узлы с задержкой до часа (асинхронная запись);

CAP : AP -- PACELC : PA EL

- при сетевых сбоях система может разделиться на 2 раздельных кластера;

CAP : AP -- PACELC : PA EL

- система может не прислать корректный ответ или сбросить соединение.

CAP : CP -- PACELC : PC EC

Согласно PACELC-теореме как бы вы классифицировали эти реализации?



## Задача 3

Могут ли в одной системе сочетаться принципы BASE и ACID? Почему?


<details>

Принципы BASE (Basically Available, Soft state, Eventually consistent) и ACID (Atomicity, Consistency, Isolation, Durability) представляют различные подходы к построению систем управления данными, и они имеют разные цели. Обычно они противоположны друг другу, и их применение зависит от требований конкретной системы.

ACID ориентирован на обеспечение надежности и целостности данных. Системы, использующие принципы ACID, стремятся к тому, чтобы транзакции были атомарными, консистентными, изолированными и долговечными. Этот подход подходит для систем, где важна точность и непрерывность данных, таких как банковские системы или системы управления инвентарем.

BASE, с другой стороны, фокусируется на обеспечении более высокой доступности и масштабируемости за счет уменьшения требований к согласованности данных. Системы, использующие принципы BASE, могут временно нарушать консистентность данных, но обеспечивают их согласованность в конечном итоге. Этот подход подходит для распределенных систем, где важны высокая доступность и горизонтальное масштабирование.

В некоторых случаях системы могут комбинировать элементы обоих подходов в зависимости от конкретных требований для различных компонентов. Это известно как гибридный подход. Например, в распределенных базах данных часто используется комбинация ACID для локальных транзакций и BASE для глобальной масштабируемости и доступности. Однако, важно учитывать, что реализация гибридных систем может быть сложной и требует внимательного проектирования и согласования.

</details>


## Задача 4

Вам дали задачу написать системное решение, основой которого бы послужили:

- фиксация некоторых значений с временем жизни,
- реакция на истечение таймаута.

Вы слышали о key-value-хранилище, которое имеет механизм Pub/Sub. 
Что это за система? Какие минусы выбора этой системы?


<details>

Описанные требования вполне подходят для реализации с использованием key-value-хранилища с механизмом Pub/Sub (публикация-подписка). Примером такой системы может быть Redis, который широко используется в подобных сценариях.

**Key-value-хранилище с механизмом Pub/Sub:**

- Key-Value Хранилище (Redis): Это база данных, которая хранит данные в формате ключ-значение, где каждому ключу соответствует некоторое значение.

- Механизм Pub/Sub (Публикация-Подписка): Это позволяет клиентам подписываться на события (публикации) и получать уведомления, когда происходят изменения в данных, связанные с определенными ключами.

Преимущества использования такой системы:

- Реакция на изменения в реальном времени: Pub/Sub позволяет вашему приложению реагировать на изменения данных мгновенно, без необходимости постоянно опрашивать хранилище.

- Простота интеграции: Redis, как key-value-хранилище с Pub/Sub, предоставляет простой и эффективный способ реализации данной функциональности.

- Гибкость и масштабируемость: Redis обладает высокой производительностью и может масштабироваться горизонтально при необходимости.

Минусы использования такой системы:

- Ограниченность по функциональности: Key-value-хранилища с Pub/Sub обычно предоставляют базовые возможности, и они могут быть не подходящими для сложных сценариев с обширными требованиями к запросам или транзакциям.

- Необходимость в дополнительной обработке ошибок: При использовании Pub/Sub необходимо учитывать возможность потери сообщений или дублирования событий. Дополнительные меры безопасности и обработки ошибок могут потребоваться для обеспечения надежности системы.

- Сложности в обеспечении согласованности данных: В системах с Pub/Sub может возникнуть сложность в обеспечении согласованности данных между различными частями системы, особенно при масштабировании.

</details>