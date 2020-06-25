yc compute instance create \
--name reddit-full-app \
--hostname reddit-full-app \
--memory=2 \
--create-boot-disk name=disk1,size=20GB,image-name=reddit-full-1593094687 \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
