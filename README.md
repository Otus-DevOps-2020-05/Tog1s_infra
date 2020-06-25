# Tog1s_infra
Tog1s Infra repository

## ДЗ №3

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

## ДЗ №4

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

## ДЗ №5

- Создан образ VM с помощью packer (packer/ubuntu16.json)
- В шаблон интегрированы bash скрипты для установки ruby и mongodb (packer/scripts)
- Проверена работоспособность образа
- Самостоятельное задание. Выполнено параметризирование шаблона (packer/variables.json.example)
- Самостоятельное задание. Добавлены переменные в файл (packer/variables.json.example)
- Дополнительное задание. Выполнена конфигурация bake-образа (packer/immutable.json)
- Дополнительное задание. Создан скрипт для создания VM create-reddit-vm.sh (config-scripts/create-reddit-vm.sh)
- Проверена работоспособность bake-образа, после создания машины приложение отвечает по порту 9292
