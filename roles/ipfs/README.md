# Ansible role `lunik.wabbit.ipfs`

[![License](https://img.shields.io/github/license/Lunik/ansible-wabbit-collection?style=flat-square)](https://github.com/Lunik/ansible-wabbit-collection/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/Lunik/ansible-wabbit-collection?style=flat-square)](https://github.com/Lunik/ansible-wabbit-collection/releases)
[![Ansible Galaxy](https://img.shields.io/badge/ansible-galaxy-black.svg?style=flat-square&logo=ansible)](https://galaxy.ansible.com/lunik/wabbit)
[![Ansible version](https://img.shields.io/badge/ansible-%3E%3D2.10-black.svg?style=flat-square&logo=ansible)](https://github.com/ansible/ansible)

Base requirements for Wabbit device

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
    - role: lunik.wabbit.ipfs
      vars:
        ipfs_gateway_hostname: ipfs.example.com"
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
| `ipfs_version` | No | String | `v0.20.0` | The version of IPFS to install |
| `ipfs_profile` | No | String | `flatfs` | Backend storage type. [See IPFS documentation](https://docs.ipfs.tech/how-to/default-profile/#available-profiles) |
| `ipfs_gateway_hostname` | No | Boolean | `ipfs.local` | Hostname where to expose the IPFS gateway |

### Context variables

Those variables from `vars/*.{yml,json}` are loaded dynamically during task
runtime of the module.

[See vars/main.yml](./vars/main.yml)

## Author Information

Tiwabbit / Guillaume MARTINEZ
