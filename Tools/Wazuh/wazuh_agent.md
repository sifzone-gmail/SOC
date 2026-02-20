# Wazuh Agent Installation on Ubuntu Server

## Prerequisites
- Ubuntu 18.04 LTS or later
- Root or sudo access
- Internet connection

## Installation Steps

### 1. Download Wazuh Agent
```bash
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" > /etc/apt/sources.list.d/wazuh.list
apt-get update
```

### 2. Install the Agent
```bash
apt-get install wazuh-agent
```

### 3. Configure Agent
Edit `/var/ossec/etc/ossec.conf` and set the manager IP:
```xml
<client>
    <server>
        <address>MANAGER_IP</address>
        <port>1514</port>
        <protocol>tcp</protocol>
    </server>
</client>
```

### 4. Start the Agent
```bash
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent
```

### 5. Verify Installation
```bash
systemctl status wazuh-agent
```

## Next Steps
Register the agent in the Wazuh Manager for full integration.
