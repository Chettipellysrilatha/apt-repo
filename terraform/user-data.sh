#!/bin/bash
yum update -y
curl -sL https://rpm.nodesource.com/setup_16.x | bash -
yum install -y nodejs git

# Create app directory
mkdir -p /opt/app
cd /opt/app

# Create server.js
cat << 'EOF' > server.js
const express = require("express");
const app = express();

app.get("/", (req, res) => res.send("Hello from Private EC2 API"));
app.get("/health", (req, res) => res.send("ok"));

app.listen(8080, () => console.log("Server running on port 8080"));
EOF

npm init -y
npm install express

nohup node server.js > app.log 2>&1 &
