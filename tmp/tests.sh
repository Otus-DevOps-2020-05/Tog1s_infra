#!/bin/bash
echo "Packer Validate"
packer validate -var-file=packer/variables.json.example packer/app.json
packer validate -var-file=packer/variables.json.example packer/db.json

echo "Ansible Lint"
cd ansible/playbooks && ansible-lint

echo "Terraform Tests"
cd $TRAVIS_BUILD_DIR/terraform/prod && terraform init
terraform validate
tflint
cd $TRAVIS_BUILD_DIR/terraform/stage && terraform init
terraform validate
tflint
