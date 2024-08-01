Задание 5.

![image](https://github.com/user-attachments/assets/ee435f33-1e86-482e-830e-911418d6cc1a)

![image](https://github.com/user-attachments/assets/04d95709-261c-41e9-8720-277723015aec)

Задание 6.

![image](https://github.com/user-attachments/assets/ea35ef94-76ee-4913-9b52-9a6df7437b9c)

Задание 7.

![image](https://github.com/user-attachments/assets/c00fdfbf-cc69-492f-8b13-e9f2daeb506f)

![image](https://github.com/user-attachments/assets/0726f33d-7d35-4f74-904a-b6164d0748ca)

![image](https://github.com/user-attachments/assets/17b4af26-d94e-437b-a177-2ebfbadbc272)

Задание 8.

![image](https://github.com/user-attachments/assets/8be6384a-79a0-4ae5-bbbf-adefd99e3c94)

Документация по Playbook:

1. Данный Playbook устанавливает на целевую debian-family машину Clickhouse и Vector (Так как я чаще использую данное семейство ОС, то Playbook был переписан под данную ОС)
2. Задания выполняемые Playbook:
   Настройка официального репозитория Clickhouse
   Установка Clickhouse через apt из установленного репозитория
   Первичная настройка Clickhouse - создание создание default базы данных с именем logs
   Установка Vector путём загрузки deb-пакета с официального сайта
   Конфигурация Vector через template-file jinja2 (в директории templates)
