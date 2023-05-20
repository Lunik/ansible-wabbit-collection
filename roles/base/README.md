# Ansible role `lunik.wabbit.base`

[![License](https://img.shields.io/github/license/Lunik/ansible-wabbit-collection?style=flat-square)](https://github.com/Lunik/ansible-wabbit-collection/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/Lunik/ansible-wabbit-collection?style=flat-square)](https://github.com/Lunik/ansible-wabbit-collection/releases)
[![Ansible Galaxy](https://img.shields.io/badge/ansible-galaxy-black.svg?style=flat-square&logo=ansible)](https://galaxy.ansible.com/lunik/wabbit)
[![Ansible version](https://img.shields.io/badge/ansible-%3E%3D2.10-black.svg?style=flat-square&logo=ansible)](https://github.com/ansible/ansible)

Base requirements for Wabbit device

**Platforms Supported**:

| Platform | Versions |
|----------|----------|
| Fedora | all |
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
    - role: lunik.wabbit.base
      vars:
        base_user: yourself
        base_ssh_key_path: /home/yourself/.ssh/id_rsa
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
| `base_user` | Yes | String | N/A | User on wich to perform actions |
| `base_package_upgrade` | No | Boolean | `False` | Upgrade all system packages |
| `base_ssh_key_path` | Yes | String | N/A | Path on Ansible server where is store the SSH key to add to `base_user` Authorized keys |
| `base_pi_rf_device_state` | No | Object | [See defaults/main.yml](./default/main.yml) | Block or unblock wireless services (wlan, bluetooth) using `rfkill`. The remote should be in the `pi` group |

### Context variables

Those variables from `vars/*.{yml,json}` are loaded dynamically during task
runtime of the module.

[See vars/main.yml](./vars/main.yml)

## Author Information

Tiwabbit / Guillaume MARTINEZ