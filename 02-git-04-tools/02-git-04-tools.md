## Домашнее задание к занятию `«Инструменты Git»` - `Швецов В.С.`

### Цель задания

В результате выполнения задания вы:

* научитесь работать с утилитами Git;
* потренируетесь решать типовые задачи, возникающие при работе в команде. 


------

## Задание

В клонированном репозитории:

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.

 aefead2207ef7e2aa5dc81a34aedf0cad4c32545 Update CHANGELOG.md
                           
  `git show aefea`

2. Ответьте на вопросы.

* Какому тегу соответствует коммит `85024d3`?

 tag: v0.12.23
            
  `git show 85024d3`

* Сколько родителей у коммита `b8d720`? Напишите их хеши.

 56cd7859e05c36c06b56d013b55a252d0bb7e158
  `git show b8d720^1`

   9ea88f22fc6269854151c571162c5bcf958bee2b               
  `git show b8d720^2`                         

  `git show b8d720^3 - уже не выдал результата`
  
* Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами  v0.12.23 и v0.12.24.

 b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links                      
  3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md                              
  6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable ... Fixes #24384                        
  5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location Since these...                
  06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md                                     
  d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows                        
  4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md                      
  dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
                  
  `git log v0.12.23..v0.12.24`

* Найдите коммит, в котором была создана функция `func providerSource`, её определение в коде выглядит так: `func providerSource(...)` (вместо троеточия перечислены аргументы).

 8c928e83589d90a031f811fae52a81be7153e82f main: Consult local directories as potential mirrors of ... This fixes TestInitProvidersVendored             
  `git log -S 'func providerSource('`


* Найдите все коммиты, в которых была изменена функция `globalPluginDirs`.

78b1220558 Remove config.go and update things using its aliases                 
  52dbf94834 keep .terraform.d/plugins for discovery                    
  41ab0aef7a Add missing OS_ARCH dir to global plugin paths                  
  66ebff90cd move some more plugin search path logic to command                    
  8364383c35 Push plugin discovery down into command package

  `git grep -p 'globalPluginDirs' - проверил в каких файлах имеется данная функция`                     
  `git log -s -L :globalPluginDirs:plugins.go --oneline - затем проверял изменения по файлам - из всех 3х файлов было найдено только тут`
  
* Кто автор функции `synchronizedWriters`? 

Author: Martin Atkins <mart@degeneration.co.uk>                    
  `git log -S 'synchronizedWriters' - поиск где была создана функция и выбор саммого ранего коммита`

