## Домашнее задание к занятию «Отказоустойчивость в облаке» - 'Швецов В.С.'


 ---

## Задание 1 

Возьмите за основу [решение к заданию 1 из занятия «Подъём инфраструктуры в Яндекс Облаке»](https://github.com/netology-code/sdvps-homeworks/blob/main/7-03.md#задание-1).

1. Теперь вместо одной виртуальной машины сделайте terraform playbook, который:

- создаст 2 идентичные виртуальные машины. Используйте аргумент [count](https://www.terraform.io/docs/language/meta-arguments/count.html) для создания таких ресурсов;
- создаст [таргет-группу](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_target_group). Поместите в неё созданные на шаге 1 виртуальные машины;
- создаст [сетевой балансировщик нагрузки](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer), который слушает на порту 80, отправляет трафик на порт 80 виртуальных машин и http healthcheck на порт 80 виртуальных машин.

Рекомендуем изучить [документацию сетевого балансировщика нагрузки](https://cloud.yandex.ru/docs/network-load-balancer/quickstart) для того, чтобы было понятно, что вы сделали.

2. Установите на созданные виртуальные машины пакет Nginx любым удобным способом и запустите Nginx веб-сервер на порту 80.

3. Перейдите в веб-консоль Yandex Cloud и убедитесь, что: 

- созданный балансировщик находится в статусе Active,
- обе виртуальные машины в целевой группе находятся в состоянии healthy.

4. Сделайте запрос на 80 порт на внешний IP-адрес балансировщика и убедитесь, что вы получаете ответ в виде дефолтной страницы Nginx.

*В качестве результата пришлите:*

*1. Terraform Playbook.*

<details>

![main.tf](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-04/main.tf)

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-04/1.jpeg)
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-04/2.jpeg)
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-04/3.jpeg)
![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-04/4.jpeg)

</details>


*2. Скриншот статуса балансировщика и целевой группы.*

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-04/5.jpeg)

</details>

*3. Скриншот страницы, которая открылась при запросе IP-адреса балансировщика.*

<details>

![Screnshot](https://github.com/vladshvetsov/MyNetology/blob/main/JPG/sflt-homeworks/sflt-04/6.jpeg)


</details>

---
