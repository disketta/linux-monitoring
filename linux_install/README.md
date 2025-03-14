# VirtualBox

## Tasks

### Почему мы выбрали **Debian**
  - Мы выбрали образ Debian, потому что у него пакетный менеджер такой же как в Ubuntu, а это значит: большое сообщество в интернете и можно найти ответ почти на любой вопрос, я уже молчу про Qwen и ChatGPT
  - Системные требования очень низкие, после запуска RAM не превышает = `270Мб`
---
### Установка VirtualBox. Часть 0

- Скачайте последнюю версию VirtualBox с официального сайта
- Установите VirtualBox
---
### Установка Debian. Часть 1

- Для установки берем чистый образ [Debian Netinst 12.9.0 (amd64)](https://www.debian.org/CD/netinst/) и ставим без Desktop Environment (DE)
- Для **VirtualBox** выбираем следующие параметры:
  - **RAM**: `1536Mb`
  - **HDD**: `10Gb`
  - **CPU**: `2 Cores`
- Далее при установке выбираем: установка через **GUI**
- Выбираем обязательно английский язык
- Выбираем разделение по разделам
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/Debian%20Install%201.png" alt="Выбрать следующие пункты" width="450">
- Записываем изменения на диск
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/Debian%20Install%202.png" alt="Выбрать следующие пункты" width="450">
- Форматируем разделы
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/Debian%20Install%203.png" alt="Выбрать следующие пункты" width="450">
- Оставляем дефолтный пакетный менеджер **apt**
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/Debian%20Install%204.png" alt="Выбрать следующие пункты" width="450">
- Отказываемся от участия в сборе анонимной статистики
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/Debian%20install%205.png" alt="Выбрать следующие пункты" width="450">
- В дальнейшем нужно будет снять все галочки и поставить, как на скрине ниже (нас интересует чистый терминальный Debian)
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/Debian%20Install%206.jpg" alt="Выбрать следующие пункты" width="450"> 
- Здесь система предлагает вам выбрать устройство, на которое будет установлен загрузчик GRUB (нас интересует наш диск)
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/Debian%20install%207.png" alt="Выбрать следующие пункты" width="450"> 
---
- После первого запуска машины нужно добавить вашего пользователя в группу `sudo`, чтобы была возможность использовать команду `sudo` под вашим пользователем (это делается в рамках безопасности)
  - Чтобы добавить пользователя в группу `sudo`, выполните:
     ```bash
     sudo usermod -aG sudo имя_пользователя
     ```
     Например:
     ```bash
     sudo usermod -aG sudo user1
     ```
- Далее [доустановите](https://github.com/lamjob1993/linux-monitoring/blob/main/linux_install/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%BE%D0%B2.md) дополнительные пакеты по ходу выполнения курса с [необходимым ПО](https://github.com/lamjob1993/linux-monitoring/blob/main/linux_install/%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%BE%D0%B2.md): **curl**, **net-tools** и прочие пакеты
---
### Клонирование Debian. Часть 2

- Выключаем виртуальную машину Debian
- Теперь заходим в сетевые настройки нашей виртуалки и ставим только бридж (мост)
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/VirtualBox%20(%D0%BA%D0%BB%D0%BE%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%202).png" alt="Выбрать следующие пункты" width="750"> 
- Клонируем 2 раза виртуальную машину Debian со следующими настройками и получаем 3 машины
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/VirtualBox%20(%D0%BA%D0%BB%D0%BE%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5).png" alt="Выбрать следующие пункты" width="750"> 
- Переименуйте их по порядку 1, 2, 3
- Запустите 3 виртуальные машины одновременно и войдите в профиль пользователя
  - Проверьте какие выдались IP адреса каждой машине и перепишите их в блокнот (должны выдаться разные IP из одной маски подсети)
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/2%20machines%20ip_a.png" alt="Выбрать следующие пункты" width="750"> 
- Сделайте ping трех машин друг до друга (слева на скриншоте указано два клона пингующих друг друга), сделайте пинг этих клонов с хостовой системы Windows (справа на скриншоте пинг двух клонов)
  - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/Ping%20All.png" alt="Выбрать следующие пункты" width="750"> 
- Во избежание ошибок с IP адресами в режиме моста (бридж), недоступности хостов по команде `ping` или недоступности интернета по пингу DNS: `ya.ru` - переустановите Debian еще раз по инструкции с полным удалением диска
  - Если проблема сохраняется - идите дальше с одной Debian машиной в режиме NAT и не задерживайтесь
    - Три Debian машины понадобятся при поднятии федерации и далее по репозиторию
---
### Установка MobaXterm. Часть 3

- [Скачайте крякнутую программу](https://rutracker.org/forum/viewtopic.php?t=6511089) для удаленного администрирования серверов **MobaXterm** с торрента
- Если не умеете лечить инсталлятор, то [возьмите демо-версию](https://mobaxterm.mobatek.net/) с официального сайта, она с ограничениями, но работает
- Запустите **Mobaxterm** и подключитесь к трем виртуалкам по SSH одновременно
- После подключения задействуйте мультиоконный (MultiExec) режим:
  - Одновременно на трех машинах запустятся три терминала
  - Одновременно исполните команду `top` и проверьте потребление RAM
  - На скриншоте одновременное исполнение команды `sudo systemctl status prometheus.service` на трех машинах сразу
    - <img src="https://github.com/lamjob1993/linux-monitoring/blob/main/.files/.bucket/MultiExec.png" alt="Выбрать следующие пункты" width="750">
- С данного этапа на ваши машины Debian вы будете заходить из-под VirtualBox только в фоновом режиме (клик правой кнопкой на запуск в фоне) и только через **MobaXterm**
--- 
### Установка Microsoft Visual Studio Code. Часть 4

- Скачайте и установите последнюю версию [Microsoft Visual Studio Code](https://code.visualstudio.com/)
- За время прохождения репозитория учимся пользоваться только Nano, чтобы набивать практику
- По репозиторию нам понадобится этот IDE, когда пойдут конфиги побольше
