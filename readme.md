# Лабораторная работа N2 ()

## Выполнил

- Фамилия Имя:Klincev Andrei
- Группа: IA2403
- 18.02.2026

## Задание

1. Необходимо было установить на своё устройство вирутальную машину (гипервизор) *QUEMU* а также скачать [debian](https://www.debian.org/distrib/netinst) (для установки была выбранна версия "Маленькие диски или USB-накопители" под процессор **amd64**).
2. В консоле в корневой папке "container02" был создан образ диска для виртульной манины, размером 8GB и в формате qcow2 ```qemu-img create -f qcow2 debian.qcow2 8G ```
3. После создания образа устанвливаем его задав 2GB оперативной памяти для установки 
   ```qemu-system-x86_64 -hda debian.qcow2 -cdrom dvd/debian.iso -boot d -m 2G```
4. Устанавливаем debian с параметрами
   1. Имя компьютера: debian;
   2. Хостовое имя: debian.localhost; ![фото установки debian](images/photo_2026-02-16_09-26-22.jpg)
   3. Имя пользователя: user;
   4. Пароль пользователя: password;
5. Перезапускаем debian используя команду ```qemu-system-x86_64 -hda debian.qcow2 -m 2G -smp 2 -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::1080-:80,hostfwd=tcp::1022-:22```
   - ```qemu-system-x86_64``` - запускаем QEMU для виртуальной машины с архитектурой x86_64
   - ```-hda debian.qcow2``` - задаём виртуальный жёсткий диск
   - ```debian.qcow2``` - файл виртуального диска, который будет использоваться как основной диск гипервизора
   - ```-m 2G``` - задаём объём ОЗУ в 2 GB
   - ```-smp 2``` - количество вертуальных ядер процессора
   - ```-device e1000,netdev=net0``` - подключаем вертальную сетевую карту
   - ```-netdev user,id=net0,hostfwd=tcp::1080-:80,hostfwd=tcp::1022-:22``` - создаём сетевой интерефейс а также перенаправляем порты виртуальной для виртуальной машины
6. Устанавливаем LAMP - стек технологий для веб-серверов и приложений. (Linux, Apache, MariaDB, PHP).
   1. Переходим в супер пользователя ```su```
   2. Обновляем список пакетов ```atp update -y```
   3. Уставнавливаем программы из репозитория debian ```apt install -y apache2 php libapache2-mod-php php-mysql mariadb-server mariadb-client unzip```
       - ```apache2``` - веб серевер который принимает http запросы браузера и отдаёт страницы
       - ```php``` - нужен для работы сетевой логики
       - ```libapache2-mod-php``` - модуль Apache, позволяет запускать php скрипты внутри веб сервера
       - ```php-mysql``` - расширение php для работы с браузером
       - ```mariadb-server``` - сервер баз данных
       - ```mariadv-client``` - клиент для работы с mariadb. Позволяет подклчиться к базе данных и выполнять sql запросы
       - ```unzip``` - утилита для распакаови .zip
7. Скачевам СУБД PhpMyAdmin используя команду ```wget https://files.phpmyadmin.net/phpMyAdmin/5.2.2/phpMyAdmin-5.2.2-all-languages.zip```
8. Скачиваем wordpress ```wget https://wordpress.org/latest.zip```


## ←To be continued.