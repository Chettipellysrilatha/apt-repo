#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../terraform"

echo "===> Terraform init"
terraform init -upgrade

echo "===> Terraform apply"
terraform apply -auto-approve

echo "===> Deployment complete. ALB DNS:"
terraform output -raw alb_dns_name

