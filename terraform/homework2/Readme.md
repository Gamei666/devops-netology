Задание 1.4 Ошибка в наименовании платформы, вместо standart должно быть standard, также не существует версии v4, максимум v3. Список платформ можно посмотреть здесь https://yandex.cloud/ru/docs/compute/concepts/vm-platforms, в строке cores ошибка, YCloud не позволяет создавать машины с 1 vCPU

Задание 1.5

![image](https://github.com/Gamei666/devops-netology/assets/67197577/caddfe7d-8ca9-4f8a-948a-17137d422e63)
![image](https://github.com/Gamei666/devops-netology/assets/67197577/b2c4f07b-e7f4-46c9-8d43-28a1ab163c9b)

1.6 Параметр preemtible равен флагу "прерываемая" при создании ВМ через веб-интерфейс. Core Fraction означает долю vCPU. Использование этих значений при обучении помогает сэкономить деньги с гранта.

Задание 7
1. local.test_list.1
2. ![image](https://github.com/Gamei666/devops-netology/assets/67197577/083616cf-3241-4b2b-a051-bb653d9b98d2)
3. local.test_map.admin
4. "${local.test_map.admin} is ${keys(local.test_map)[0]} for ${local.test_list.2} server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} vcpu, ${local.servers.production.ram} ram and ${length(local.servers.production.disks)} virtual disks"

Задание 8.
1. ![image](https://github.com/Gamei666/devops-netology/assets/67197577/5f975910-a348-4a04-8233-a017fa44d298)
2. var.test.1.dev2.0





