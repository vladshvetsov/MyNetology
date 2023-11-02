## Домашнее задание к занятию "`Резервное копирование`" - `Швецов В.С.`

***Задание 1***

* Составьте команду rsync, которая позволяет создавать зеркальную копию домашней директории пользователя в директорию /tmp/backup
* Необходимо исключить из синхронизации все директории, начинающиеся с точки (скрытые)
* Необходимо сделать так, чтобы rsync подсчитывал хэш-суммы для всех файлов, даже если их время модификации и размер идентичны в источнике и приемнике.
* На проверку направить скриншот с командой и результатом ее выполнения

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-03/1.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-03/1-1.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-03/2.jpeg)

</details>

---

***Задание 2***

* Написать скрипт и настроить задачу на регулярное резервное копирование домашней директории пользователя с помощью rsync и cron.
* Резервная копия должна быть полностью зеркальной
* Резервная копия должна создаваться раз в день, в системном логе должна появляться запись об успешном или неуспешном выполнении операции
* Резервная копия размещается локально, в директории /tmp/backup
* На проверку направить файл crontab и скриншот с результатом работы утилиты.

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-03/3.jpeg)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-03/4.jpeg)


</details>


