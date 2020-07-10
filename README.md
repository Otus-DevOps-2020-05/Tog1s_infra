# Tog1s_infra
Tog1s Infra repository

## ДЗ №3 Запуск VM в YC

### Задание

bastion_IP = 84.201.135.97

someinternalhost_IP = 10.130.0.16

### Самостоятельное задание

```bash
ssh -i ~/.ssh/appuser -A -tt appuser@84.201.135.97 ssh appuser@10.130.0.16
```

### Дополнительное задание

В конфиг нужно прописать хост bastion и someinternalhost с ProxyJump.

```
Host bastion
  User appuser
  Port 22
  HostName 84.201.135.97

Host someinternalhost
  User appuser
  Port 22
  HostName 10.130.0.16
  ProxyJump bastion
```

### Дополнительное задание с сертификатом

Сертификат обновлен для:

[https://84.201.135.97.sslip.io](https://84.201.135.97.sslip.io)

## ДЗ №4 Практика управления ресурсами YC

testapp_IP=130.193.38.104

testapp_port=9292

### Самостоятельное задание

Добавлены скрипты:

install_ruby.sh

install_mongodb.sh

deploy.sh

### Дополнительное задание

```bash
yc compute instance create \
--name reddit-app \
--hostname reddit-app \
--memory=4 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
--metadata-from-file user-data=./startup.yaml
```

## ДЗ №5 Подготовка базового образа VM при помощи Packer.

- Создан образ VM с помощью packer (packer/ubuntu16.json)
```bash
packer build -var-file "variables.json" ubuntu16.json
```
- В шаблон интегрированы bash скрипты для установки ruby и mongodb (packer/scripts)
- Проверена работоспособность образа
- Самостоятельное задание. Выполнено параметризирование шаблона (packer/variables.json.example)
- Самостоятельное задание. Добавлены переменные в файл (packer/variables.json.example)
- Дополнительное задание. Выполнена конфигурация bake-образа (packer/immutable.json)
- Дополнительное задание. Создан скрипт для создания VM create-reddit-vm.sh (config-scripts/create-reddit-vm.sh)
- Проверена работоспособность bake-образа, после создания машины приложение отвечает по порту 9292

## ДЗ №6 Практика IaC с использованием Terraform

- Создан шаблон terraform (terraform/main.tf).
- Созданы файлы с переменными.
- С помощью terraform развернута VM с работающим приложением.

### Самостоятельные задания

- Определена input переменная для приватного ключа.
- Определена default переменная для зоны. При использовании объекта default можно не объявлять переменную в tfvars.
- Отфармотированны все файлы с помощью terraform fmt.
- Создан файл terraform.tfvars.example.

### Задание со **

- Создан Load Balancer с целевой группой, проверена работоспособность балансировщика.
- Создана группа из нескольких инстаннсов в одном балансировщике.
  - Описание каждого инстанса в коде увеличивает объём кода и вероятность ошибки при описании каждого инстанса. Декларативный подход позволит избежать ошибок и быстро масштабировать инфраструктуру.
- Добавлена переменная count для масштабирования сервиса.

## ДЗ №7 Создание Terraform модулей для управления компонентами инфраструктуры.

- Проверена работа зависимостей ресурсов на примере VPC.
- Добавлены packer шаблоны образов app.json и db.json.
- Основная конфигурация разбита на два модуля (app и db).
- Добавлены конфигурации stage и prod окружений.

### Задание со *

Пример файла для YC terraform/stage/backend.tf.example

После внесения конфигурации bucket'a необходимо выполнить комманду:
```bash
terraform init
```
Это создаст конфигурацию бакета в дирректории .terraform, после применения конфигурации terraform автоматически отправит tfstate в бакет.

Добавлена переменная provision_enable для управления провижонером. Реализовано через Null Provider.

При парралельном запуске в облаке возникает конфликт.

### Задание со **

- Добавлены provisioner в модули app и db.
- Настроена конфигурация MongoDB на основной сетевой интерфейс
- При создании машины app автоматически добавляется перемнная окружения DATABASE_URL с внутренним IP адресом инстанса db.

## ДЗ №8 Знакомство с Ansible

Клонирование репозитория с помощью playbook проходит успешно но не вносит изменений так как директория с приложением существует. После удаления директории повторный запуск playybook проходит успешно с внесением изменений в директорию юзера, так как директории с прилоожением уже не существует.
```bash
appserver                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

### Задание со *
