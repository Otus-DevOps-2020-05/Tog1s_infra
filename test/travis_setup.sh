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

wget -O tflint.zip https://github.com/terraform-linters/tflint/releases/download/v0.18.0/tflint_linux_amd64.zip
unzip tflint.zip
chmod +x ./tflint
sudo mv -f ./tflint /usr/local/bin/tflint
tflint -v
