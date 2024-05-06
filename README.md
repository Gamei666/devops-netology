Задача 2
[vulnerabilities.csv](https://github.com/Gamei666/devops-netology/files/15214147/vulnerabilities.csv)

Задача 3 (первое значение NULL потому что в первый раз обратился не на тот порт)
![image](https://github.com/Gamei666/devops-netology/assets/67197577/f835c922-580a-4d67-a3e3-de416ee164a3)

Задача 4 При попытке обратиться через https://check-host.net/check-http глючит база данных. Видимо не выдерживает множественное количество запросов. Не нашёл параметр который надо изменить для БД чтобы этого не происходило.

![image](https://github.com/Gamei666/devops-netology/assets/67197577/0f64894c-72fa-4365-8e7f-c1f198ebc2c2)

Ссылка на форк https://github.com/Gamei666/shvirtd-example-python Bash-скрипт лежит там же

Задача 5 

Bash-скрипт (Пароль и имя пользователя берётся из файла env) здесь использую собственный образ на базе представленного в домашнем задании так как в составе исходного образа нет плагина для авторизации через caching_sha2_password.

source  /opt/backup/env
docker run \
    --network ipchecker_backend \
    --rm --entrypoint "" \
    -v /opt/backup:/backup \
    --link="ipchecker-db-1:target" \
    mysqldump \
    mysqldump --opt -h target -u"$DB_LOGIN" -p"$DB_PASSWORD" "--result-file=/backup/$(date +%Y-%m-%d-%H.%M.%S)_dumps.sql" virtd

Crontab

![image](https://github.com/Gamei666/devops-netology/assets/67197577/7a489648-bbae-47ca-bd14-ebd62ee3690b)

Дампы

![image](https://github.com/Gamei666/devops-netology/assets/67197577/391a880f-2453-4380-9fcc-45be47f03a11)

Задача 6

![image](https://github.com/Gamei666/devops-netology/assets/67197577/b2e210e6-3d1a-4f06-a5ac-621571b8a980)

