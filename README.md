# apt-repo
# Apt DevOps Assignment – One-Click Deployment

## Architecture

Client → ALB (public subnets) → Target Group → ASG → EC2 (private subnets)
          ↑
        Internet
          ↑
   IGW + NAT Gateway (egress)

- VPC with 2 public + 2 private subnets
- Public ALB (HTTP + HTTPS) → Target Group (port 8080)
- ASG in private subnets (no public IP)
- EC2 app on port 8080 with `/` and `/health`
- IAM role for EC2: SSM + CloudWatchAgent (minimal)
- No hardcoded secrets, no SSH open to world

## Prerequisites

- AWS account & credentials configured
- Terraform >= 1.3
- ACM certificate in the chosen region

## Deployment (One-Click)

```bash
cd scripts
./deploy.sh
