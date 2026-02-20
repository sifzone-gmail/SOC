# Installing Ansible

## Prerequisites

- Python 3.9 or later
- pip package manager
- Ubuntu Server 20.04 LTS or later

## Installation on Ubuntu Server

### Using apt (Recommended)

```bash
sudo apt update
sudo apt install ansible
```

### Using pip

```bash
sudo apt install python3-pip
pip install ansible
```

## Verify Installation

```bash
ansible --version
```

## Create a project folder on your filesystem.

```bash
mkdir ansible_quickstart && cd ansible_quickstart
```

## Configuration

Create or edit `/etc/ansible/ansible.cfg`:

```ini
[defaults]
host_key_checking = False
inventory = ./inventory
```

## Next Steps

- Create an inventory file
- Configure SSH keys for remote hosts
- Run your first playbook

## Documentation

For more information, visit [Ansible Documentation](https://docs.ansible.com/)


## Creating an Inventory File

Create a file named `inventory`:

```ini
[webservers]
web1.example.com
web2.example.com

[databases]
db1.example.com
```

## Configuring SSH Keys

Generate SSH keys on your control node:

```bash
ssh-keygen -t rsa -b 4096
```

Copy the public key to remote hosts:

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub user@remote_host
```

## Running Your First Playbook

Create a file named `playbook.yml`:

```yaml
---
- hosts: webservers
    tasks:
        - name: Update system packages
            apt:
                update_cache: yes
```

Execute the playbook:

```bash
ansible-playbook playbook.yml
```