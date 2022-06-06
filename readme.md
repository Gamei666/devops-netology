Задание I. Полный хеш коммита aefea aefead2207ef7e2aa5dc81a34aedf0cad4c32545 комментарий "Upadate Changelog.md" найдено с помощью команды git show aefea

Задание II. Коммит 85024d3 соответсвует тегу v0.12.23 получено с помощью команды git show 85024d3

Задание III. У коммита b8d720 2 родителя, первый - 56cd7859e05c36c06b56d013b55a252d0bb7e158, второй - 9ea88f22fc6269854151c571162c5bcf958bee2b, найдено с помощью команды git show b8d720^1 b8d720^2 

Задание IV. Получено с помощью git log --graph v0.12.23..v0.12.24
* commit b14b74c4939dcab573326f4e3ee2a62e23e12f89
| Author: Chris Griggs <cgriggs@hashicorp.com>
| Date:   Tue Mar 10 08:59:20 2020 -0700
|
|     [Website] vmc provider links
|
* commit 3f235065b9347a758efadc92295b540ee0a5e26e
| Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
| Date:   Thu Mar 19 10:39:31 2020 -0400
|
|     Update CHANGELOG.md
|
* commit 6ae64e247b332925b872447e9ce869657281c2bf
| Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
| Date:   Thu Mar 19 10:20:10 2020 -0400
|
|     registry: Fix panic when server is unreachable
|
|     Non-HTTP errors previously resulted in a panic due to dereferencing the
|     resp pointer while it was nil, as part of rendering the error message.
|     This commit changes the error message formatting to cope with a nil
|     response, and extends test coverage.
|
|     Fixes #24384
|
* commit 5c619ca1baf2e21a155fcdb4c264cc9e24a2a353
| Author: Nick Fagerlund <nick.fagerlund@gmail.com>
| Date:   Wed Mar 18 12:30:20 2020 -0700
|
|     website: Remove links to the getting started guide's old location
|
|     Since these links were in the soon-to-be-deprecated 0.11 language section, I
|     think we can just remove them without needing to find an equivalent link.
|
* commit 06275647e2b53d97d4f0a19a0fec11f6d69820b5
| Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
| Date:   Wed Mar 18 10:57:06 2020 -0400
|
|     Update CHANGELOG.md
|
* commit d5f9411f5108260320064349b757f55c09bc4b80
| Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
| Date:   Tue Mar 17 13:21:35 2020 -0400
|
|     command: Fix bug when using terraform login on Windows
|
* commit 4b6d06cc5dcb78af637bbb19c198faff37a066ed
| Author: Pam Selle <pam@hashicorp.com>
| Date:   Tue Mar 10 12:04:50 2020 -0400
|
|     Update CHANGELOG.md
|
* commit dd01a35078f040ca984cdd349f18d0b67e486c35
| Author: Kristin Laemmert <mildwonkey@users.noreply.github.com>
| Date:   Thu Mar 5 16:32:43 2020 -0500
|
|     Update CHANGELOG.md
|
* commit 225466bc3e5f35baa5d07197bbc079345b77525e
  Author: tf-release-bot <terraform@hashicorp.com>
  Date:   Thu Mar 5 21:12:06 2020 +0000

      Cleanup after v0.12.23 release

Задание V. Функция providerSource была создана в коммите 8c928e83589d90a031f811fae52a81be7153e82f найдено с помощью git log --oneline -S"func providerSource"

Задание VI. Нашёл файл plugins.go, в HEAD коммите в котором содержится функция "globalPluginDirs" с помощью grep. С помощью git log -L :"func globalPluginDirs":plugins.go нашёл все коммиты с изменениями этой функции, а именно:
78b122055 Remove config.go and update things using its aliases
52dbf9483 keep .terraform.d/plugins for discovery
41ab0aef7 Add missing OS_ARCH dir to global plugin paths
66ebff90c move some more plugin search path logic to command
8364383c3 Push plugin discovery down into command package

Задание VII. Так как функции syncronizedwriters больше нет в последних версиях, то нашёл первый коммит с ней (5ac311e2a) с помощью git log --oneline -S"func synchronizedWriters", затем переключился на него, с помощью git grep -n "func synchronizedWriters" нашёл файл (synchronized_writers.go), номер строки (15), где есть эта функция, а затем с помощью git blame -L 15 synchronized_writers.go нашёл имя автора (Martin Atkins)


