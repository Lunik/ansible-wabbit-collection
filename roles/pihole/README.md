# Ansible role `lunik.wabbit.pihole`

[![License](https://img.shields.io/github/license/Lunik/ansible-wabbit-collection?style=flat-square)](https://github.com/Lunik/ansible-wabbit-collection/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/Lunik/ansible-wabbit-collection?style=flat-square)](https://github.com/Lunik/ansible-wabbit-collection/releases)
[![Ansible Galaxy](https://img.shields.io/badge/ansible-galaxy-black.svg?style=flat-square&logo=ansible)](https://galaxy.ansible.com/lunik/wabbit)
[![Ansible version](https://img.shields.io/badge/ansible-%3E%3D2.10-black.svg?style=flat-square&logo=ansible)](https://github.com/ansible/ansible)

Install and configure piHole

**Platforms Supported**:

| Platform | Versions |
|----------|----------|
| Raspian | all |

## ⚠️ Requirements

Ansible >= 7.

### Ansible role dependencies

None.

## ⚡ Installation

### Install with Ansible Galaxy

```shell
ansible-galaxy collection install lunik.wabbit
```

### ✏️ Example Playbook

Basic usage is:

```yaml
- hosts: all
  roles:
    - role: lunik.wabbit.pihole
      vars:
        pihole_static_ip:
          ip_address: 192.168.42.10
          subnet_mask: 24
          routers: 192.168.42.1
          domain_name_servers: 127.0.0.1
```

## ⚙️ Role Variables

Variables are divided in three types.

The **default vars** section shows you which variables you may
override in your ansible inventory. As a matter of fact, all variables should
be defined there for explicitness, ease of documentation as well as overall
role manageability.

The **context variables** are shown in section below hint you
on how runtime context may affects role execution.

### Default variables

Role default variables from `defaults/main.yml`.

| Variable Name | Required | Type | Default | Description |
|---------------|----------|------|---------|-------------|
| `pihole_webpassword` | No | String | `password` | Password for the PiHole web UI |
| `pihole_hostname` | No | String | `{{ inventory_hostname }}` | Hostname for the web UI |
| `pihole_https_enabled` | No | Boolean | `False` | Enable HTTPS on the web UI |
| `pihole_https_pem_path` | if `pihole_https_enabled` | String | N/A | Path of the TLS PEM for enabling HTTPS on the web UI |
| `pihole_https_ca_path` | if `pihole_https_enabled` | String | N/A | Path of the TLS CA Cert for enabling HTTPS on the web UI |
| `pihole_dns_entries` | No | List(Object) | `[]` | List of custom local DNS entries. [See defaults/main.yml](./default/main.yml) |
| `pihole_dhcp_enabled` | No | Boolean | `False` | Enable PiHole DHCP server |
| `pihole_dhcp_config` | if `pihole_dhcp_enabled` | Object | N/A | Configure the DHCP server. [See defaults/main.yml](./default/main.yml) |
| `pihole_dhcp_static_leases` | No | List(Object) | `[]` | List of DHCP static leases. [See defaults/main.yml](./default/main.yml) |
| `pihole_static_ip` | Yes | Object | N/A | DHCPCD static IP config in case of DHCP server is KO. [See defaults/main.yml](./default/main.yml) |
| `pihole_adlists` | No | List(String) | [See defaults/main.yml](./default/main.yml) | List of PiHole ad lists. |
| `pihole_gravity_comment` | No | String | `Managed by Ansible` | Comment in PiHole gravity objects. |
| `pihole_domainlist` | No | List(Object) | [] | Custom PiHole gavity domains. [See defaults/main.yml](./default/main.yml) |

### Context variables

Those variables from `vars/*.{yml,json}` are loaded dynamically during task
runtime of the module.

[See vars/main.yml](./vars/main.yml)

## Author Information

Tiwabbit / Guillaume MARTINEZ