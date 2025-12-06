#!/bin/bash
ALB_URL=$(terraform output -raw alb_dns_name)
curl http://$ALB_URL/
curl http://$ALB_URL/health

