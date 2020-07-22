#!/bin/bash
wget -O terraform.zip https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip
unzip terraform.zip
chmod +x ./terraform
sudo mv -f ./terraform /usr/local/bin/terraform
terraform --version

wget -O packer.zip https://releases.hashicorp.com/packer/1.6.0/packer_1.6.0_linux_amd64.zip
unzip packer.zip
chmod +x ./packer
sudo mv -f ./packer /usr/local/bin/packer
packer --version

curl -L "$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip && unzip tflint.zip && rm tflint.zip
sudo mv -f ./tflint /usr/local/bin/tflint
tflint -v
