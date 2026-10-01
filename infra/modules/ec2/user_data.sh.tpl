#!/bin/bash
set -eu
exec > /var/log/user-data.log 2>&1

dnf install -y docker git
systemctl enable --now docker

git clone ${repo_url} /opt/app-src
cd /opt/app-src/app
docker build -t api-reservas:latest .

docker run -d --name api-reservas --restart unless-stopped \
  -p ${app_port}:3000 \
  -e PORT=3000 \
  -e DB_SSL=true \
  -e DB_HOST=${db_host} \
  -e DB_PORT=${db_port} \
  -e DB_NAME=${db_name} \
  -e DB_USER=${db_username} \
  -e DB_PASSWORD=${db_password} \
  api-reservas:latest
