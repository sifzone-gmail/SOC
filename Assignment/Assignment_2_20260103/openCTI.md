
# OpenCTI Installation and Integration Script

```bash
#!/bin/bash

# OpenCTI Installation and Integration Setup
# Installs OpenCTI and integrates AlienVault, VirusTotal, and AbuseIPDB

set -e

echo "Starting OpenCTI installation..."

# Update system packages
sudo apt-get update && sudo apt-get upgrade -y

# Install Docker and Docker Compose
sudo apt-get install -y docker.io docker-compose

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Clone OpenCTI repository
git clone https://github.com/OpenCTI-Platform/docker.git opencti
cd opencti

# Create .env file with configuration
cat > .env << EOF
OPENCTI_ADMIN_EMAIL=admin@opencti.io
OPENCTI_ADMIN_PASSWORD=ChangeMe
OPENCTI_ADMIN_TOKEN=ChangeMe
OPENCTI_BASE_URL=http://localhost:8080
CONNECTOR_ALIENVAULT_ENABLED=true
CONNECTOR_VIRUSTOTAL_ENABLED=true
CONNECTOR_ABUSEIPDB_ENABLED=true
EOF

# Deploy OpenCTI with Docker Compose
docker-compose up -d

echo "OpenCTI installation complete!"
echo "Access at: http://localhost:8080"
echo "Configure connectors in the UI with your API keys:"
echo "- AlienVault API key"
echo "- VirusTotal API key"
echo "- AbuseIPDB API key"
```

**Note:** Update API keys in OpenCTI admin panel after deployment.
