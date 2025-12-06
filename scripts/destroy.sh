#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../terraform"

echo "===> Terraform destroy"
terraform destroy -auto-approve

