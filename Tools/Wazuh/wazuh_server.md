
# Wazuh Server Installation on Ubuntu Server

## Prerequisites

- Ubuntu Server 20.04 LTS or later
- Minimum 2GB RAM, 2 CPU cores
- Root or sudo access
- Internet connectivity

## Installation Steps

### 1. Update System Packages

```bash
sudo apt-get update
sudo apt-get upgrade -y
```

### 2. Install Java

```bash
sudo apt-get install openjdk-11-jdk -y
java -version
```

### 3. Install Elasticsearch

```bash
curl -s https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update
sudo apt-get install elasticsearch=7.14.0 -y
```

### 4. Install Wazuh Manager

```bash
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | sudo tee /etc/apt/sources.list.d/wazuh.list
sudo apt-get update
sudo apt-get install wazuh-manager -y
```

### 5. Install Kibana

```bash
sudo apt-get install kibana=7.14.0 -y
```

### 6. Start Services

```bash
sudo systemctl start wazuh-manager
sudo systemctl start elasticsearch
sudo systemctl start kibana
sudo systemctl enable wazuh-manager elasticsearch kibana
```

### 7. Access Wazuh Dashboard

Open browser and navigate to: `https://your-server-ip:5601`

Default credentials: `admin` / `admin`

## Verification

```bash
sudo systemctl status wazuh-manager
sudo systemctl status elasticsearch
sudo systemctl status kibana
```
