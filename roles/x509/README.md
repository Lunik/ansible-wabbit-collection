# Ansible role `lunik.wabbit.x509`

[![License](https://img.shields.io/github/license/Lunik/ansible-wabbit-collection?style=flat-square)](https://github.com/Lunik/ansible-wabbit-collection/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/Lunik/ansible-wabbit-collection?style=flat-square)](https://github.com/Lunik/ansible-wabbit-collection/releases)
[![Ansible Galaxy](https://img.shields.io/badge/ansible-galaxy-black.svg?style=flat-square&logo=ansible)](https://galaxy.ansible.com/lunik/wabbit)
[![Ansible version](https://img.shields.io/badge/ansible-%3E%3D2.10-black.svg?style=flat-square&logo=ansible)](https://github.com/ansible/ansible)

Base requirements for Wabbit device

**Platforms Supported**:

| Platform | Versions |
|----------|----------|
| all | all |

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
    - role: lunik.wabbit.x509
      vars:
        x509_org_country_name: FR
        x509_org_email_address: yourself@yourcompany.com
        x509_org_locality_name: France
        x509_org_organization_name: YourCompany

        x509_org_root_ca_key_path: /tmp/rootCA.key
        x509_org_root_ca_key_passphrase: "{{ lookup('password', '/tmp/rootCA.key.passphrase') }}"
        x509_org_root_ca_cert_path: /tmp/rootCA.cert

        x509_org_intermediate_ca: []
          - name: app
            key_path: /tmp/appCA.key
            key_passphrase: "{{ lookup('password', '/tmp/appCA.key.passphrase') }}"
            cert_path: /tmp/appCA.cert

        x509_app_certificates_path: /tmp/app
        x509_app_certificates:
          - common_name: example.org
            ca: app
            expiration: +365d
            alt_names:
              - exemple.fr

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
| `x509_org_country_name` | Yes | String | N/A | Country Name for certificates |
| `x509_org_email_address` | Yes | String | N/A | Email address for certificates |
| `x509_org_locality_name` | Yes | String | N/A | Locality for certificates |
| `x509_org_organization_name` | Yes | String | N/A | Organization name for certificates |
| `x509_org_root_ca_key_path` | Yes | String | N/A | Path where to store the root CA private key |
| `x509_org_root_ca_key_passphrase` | Yes | String | N/A | Root CA private key passphrase |
| `x509_org_root_ca_cert_path` | Yes | String | N/A | Path where to store the root CA certificate |
| `x509_org_intermediate_ca` | No | List(Object) | N/A | List of intermediate certificates. [See defaults/main.yml](./default/main.yml) |
| `x509_app_certificates_path` | Yes | String | N/A | Path where to store generated certificates |
| `x509_app_certificates` | No | List(Object) | N/A | List of certificates. [See defaults/main.yml](./default/main.yml) |

### Context variables

Those variables from `vars/*.{yml,json}` are loaded dynamically during task
runtime of the module.

[See vars/main.yml](./vars/main.yml)

## Author Information

Tiwabbit / Guillaume MARTINEZ