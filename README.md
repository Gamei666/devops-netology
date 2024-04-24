Задача 1 https://hub.docker.com/repository/docker/gamei/custom-nginx/general

Задача 2
![Задача 2](https://github.com/Gamei666/devops-netology/assets/67197577/d521ee19-f4f1-44a3-b589-9f131f429385)

Задача 3.1-3.4 Контейнер остановился, потому что мы послали процессу SIGINT, то есть сигнал на прерывание процесса. А так как каждый контейнер в Docker - отдельный процесс, то и контейнер был остановлен.

![image](https://github.com/Gamei666/devops-netology/assets/67197577/83c2540a-3d73-43ca-b561-b8d161dcd6fd)

Задача 3.5-3.8

![image](https://github.com/Gamei666/devops-netology/assets/67197577/64656bf4-8b89-4aff-905e-59000c864a12)

Задача 3.9-3.12 Мы поменяли порт веб-сервера Nginx внутри контейнера, но за проброс порта в контейнер отвечает Докер-Демон, который, естественно, об этом не знает, поэтому при попытке постучаться через curl с хост-машины докер направляет его на старый порт контейнера, но он уже не прослушивается нашим веб-сервером. Изменить порт у работающего контейнера можно либо копированием существующего контейнера в новый и запуском его с правильными портами, либо через правку конфигурационных файлов контейнера (требуется остановка контейнера и docker daemon). Я выбрал второй вариант.

![image](https://github.com/Gamei666/devops-netology/assets/67197577/18b2b8b9-282d-4b9d-b03e-7c89612c335e)

Задача 4

![image](https://github.com/Gamei666/devops-netology/assets/67197577/0d7bd30c-e726-4486-b59d-0442dfff553d)

Задача 5.1-5.2 При наличии файлов compose.yaml и docker-compose.yaml выполняется файл compose.yaml, так как поддержка имени docker-compose.yaml оставлена только для обратной совместимости.

![image](https://github.com/Gamei666/devops-netology/assets/67197577/68fbfe87-1c22-47cd-bc45-f8c3e7c6f065)

Задача 5.3

![image](https://github.com/Gamei666/devops-netology/assets/67197577/f1b98011-b988-4486-8c8b-6cbe0e0e79ab)


Задача 5.4-5.6

![image](https://github.com/Gamei666/devops-netology/assets/67197577/faf75f48-a00a-4ab5-8f53-af474fed5ca9)

Задача 5.7 Здесь docker compose предупреждает нас, что найдены контейнеры-сироты, то есть контейнеры, которые были подняты docker-compose ранее, но теперь описание для данных контейнеров не найдено. Docker compose предлагает перезапустить сборку с флагом, который удалит все контейнеры-сироты.

![image](https://github.com/Gamei666/devops-netology/assets/67197577/a9e01b35-ba1d-425a-8241-295d37932b81)
