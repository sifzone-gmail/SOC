# OpenCTI Installation Guide for Ubuntu Server

## Prerequisites
- Ubuntu Server 20.04 LTS or higher
- Docker and Docker Compose installed
- At least 4GB RAM
- Internet connection

## Installation Steps

### 1. Install Docker
```bash
sudo apt update
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER
```

### 2. Clone OpenCTI Repository
```bash
cd /opt
sudo git clone https://github.com/OpenCTI-Platform/docker.git
cd docker
```

### 3. Configure Environment
```bash
sudo cp .env.sample .env
sudo nano .env
```
Update the following variables:
- `OPENCTI_ADMIN_TOKEN` - Generate a strong token
- `OPENCTI_ADMIN_PASSWORD` - Set admin password
- `RABBIT_ESPASSWORD` - Set RabbitMQ password

```bash
sudo cat > .env << EOF
OPENCTI_ADMIN_EMAIL=admin@opencti.io
OPENCTI_ADMIN_PASSWORD=ChangeMePlease
OPENCTI_ADMIN_TOKEN=$(cat /proc/sys/kernel/random/uuid)
OPENCTI_BASE_URL=http://localhost:8080
OPENCTI_HEALTHCHECK_ACCESS_KEY=$(cat /proc/sys/kernel/random/uuid)
MINIO_ROOT_USER=$(cat /proc/sys/kernel/random/uuid)
MINIO_ROOT_PASSWORD=$(cat /proc/sys/kernel/random/uuid)
RABBITMQ_DEFAULT_USER=guest
RABBITMQ_DEFAULT_PASS=guest
ELASTIC_MEMORY_SIZE=4G
CONNECTOR_HISTORY_ID=$(cat /proc/sys/kernel/random/uuid)
CONNECTOR_EXPORT_FILE_STIX_ID=$(cat /proc/sys/kernel/random/uuid)
CONNECTOR_EXPORT_FILE_CSV_ID=$(cat /proc/sys/kernel/random/uuid)
CONNECTOR_IMPORT_FILE_STIX_ID=$(cat /proc/sys/kernel/random/uuid)
CONNECTOR_EXPORT_FILE_TXT_ID=$(cat /proc/sys/kernel/random/uuid)
CONNECTOR_IMPORT_DOCUMENT_ID=$(cat /proc/sys/kernel/random/uuid)
CONNECTOR_ANALYSIS_ID=$(cat /proc/sys/kernel/random/uuid)
SMTP_HOSTNAME=localhost
EOF
```

### 4. Start OpenCTI
```bash
sudo docker-compose up -d
```

### 5. Verify Installation
```bash
sudo docker-compose ps
```

## Access OpenCTI
- URL: `http://localhost:8080`
- Default username: `admin@opencti.io`
- Password: From `.env` file

## Additional Resources
- [Official Documentation](https://docs.opencti.io)
- [GitHub Repository](https://github.com/OpenCTI-Platform/opencti)
