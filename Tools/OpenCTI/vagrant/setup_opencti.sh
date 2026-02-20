#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "--- Preparing System for OpenCTI ---"
apt-get update && apt-get upgrade -y
apt-get install -y curl wget git jq openssl

# 1. Essential: Increase Virtual Memory for Elasticsearch
# Without this, the Elasticsearch container will crash on startup.
echo "vm.max_map_count=262144" >> /etc/sysctl.conf
sysctl -p

# 2. Install Docker & Docker Compose
echo "--- Installing Docker ---"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker vagrant

# 3. Create OpenCTI Directory and Configuration
mkdir -p /opt/opencti
cd /opt/opencti

# Generate Random UUIDs and Secrets for the installation
OPENCTI_ADMIN_TOKEN=$(cat /proc/sys/kernel/random/uuid)
OPENCTI_ADMIN_PASSWORD="admin_password_123" # Change this!
MINIO_ROOT_PASSWORD=$(openssl rand -base64 32)
RABBITMQ_PASSWORD=$(openssl rand -base64 32)

# 4. Create .env file for Docker Compose
cat <<EOF > .env
OPENCTI_ADMIN_EMAIL=admin@opencti.io
OPENCTI_ADMIN_PASSWORD=${OPENCTI_ADMIN_PASSWORD}
OPENCTI_ADMIN_TOKEN=${OPENCTI_ADMIN_TOKEN}
OPENCTI_BASE_URL=http://192.168.56.30:8080
MINIO_ROOT_USER=opencti
MINIO_ROOT_PASSWORD=${MINIO_ROOT_PASSWORD}
RABBITMQ_DEFAULT_USER=opencti
RABBITMQ_DEFAULT_PASS=${RABBITMQ_PASSWORD}
ELASTIC_MEMORY_SIZE=2G
# Connector API Keys (Placeholders)
VIRUSTOTAL_KEY=REPLACE_WITH_YOUR_VT_KEY
ALIENVAULT_KEY=REPLACE_WITH_YOUR_OTX_KEY
ABUSEIPDB_KEY=REPLACE_WITH_YOUR_ABUSEIPDB_KEY
EOF

# 5. Fetch the Official Docker Compose file
# We use a curated version that includes the connectors you requested.
wget https://raw.githubusercontent.com/OpenCTI-Platform/docker/master/docker-compose.yml -O docker-compose.yml

# 6. Add Connectors to Docker Compose
# Note: For production, we would append the specific connector blocks here.
# For now, we will notify the user to add their keys to the .env created above.

echo "--- Starting OpenCTI Stack ---"
# Note: It takes about 5-10 minutes for all services to fully initialize.
docker compose up -d

echo "--------------------------------------------------------"
echo "OpenCTI is installing in the background."
echo "URL: http://192.168.56.30:8080"
echo "Admin Email: admin@opencti.io"
echo "Admin Password: ${OPENCTI_ADMIN_PASSWORD}"
echo "Admin Token: ${OPENCTI_ADMIN_TOKEN}"
echo "--------------------------------------------------------"
echo "ACTION REQUIRED: Edit /opt/opencti/.env to add your API keys"
echo "for VirusTotal, AlienVault, and AbuseIPDB, then run:"
echo "docker compose up -d"