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
