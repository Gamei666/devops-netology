Задание 1.2 согласно gitignore необходимо хранить секреты в personal.auto.tfvars
Задание 1.3 "result": "3LES1pwvGUA5jpip",
Задание 1.4 в строчке 24 у ресурса docker_image отсуствует имя, в строчке 29 неправильно указано имя (должно начинаться только с нижнего подчёркивания или с буквы). В строчке 31 указано несуществующее имя ресурса random_string_FAKE и несуществующий ключ resulT, должно быть random_string и result соответственно.

Задание 1.5

![image](https://github.com/Gamei666/devops-netology/assets/67197577/384631bb-f463-4e45-bc18-6dd351d043e4)

Задание 1.6 Опасность ключа -auto-approve в terraform apply заключается в том, что terraform не спрашивает у нас интерактивного подтверждения и мы можем запустить что-то не то, если предварительно не проверили plan. Полезен данный ключ в CD-системах, так как туда доставляется уже протестированный код.

![image](https://github.com/Gamei666/devops-netology/assets/67197577/38670be8-aa06-405e-b365-1289ca6da47b)

Задание 1.7 Содержимое tfstate
{
  "version": 4,
  "terraform_version": "1.5.7",
  "serial": 11,
  "lineage": "37e9aa93-f719-838e-3538-f91096c40d98",
  "outputs": {},
  "resources": [],
  "check_results": null
}

Задание 1.8
Докер-образ nginx не был удалён, потому что в описании ресурса стоял ключ keep_locally = true, который сохраняет образ при terraform destroy. В документации он описан так.
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

Задание 2
Код для подъёма ВМ находиится в папке Zadanie2 в файле vmprovision.tf, код для docker remote context находится в папке terradocker.
