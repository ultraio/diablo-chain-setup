# Diablo Chain - Multinode testnet on OVH dedicated servers (Oct 2021)

This repo is based on [Multinode testnet-benchmark on OVH dedicated servers (June 2020)](https://github.com/ultraio/testnet-benchmark), with several updates. 

**Currently haproxy is not used**.  

## Table of Contents

- [Diablo Chain - Multinode testnet on OVH dedicated servers (Oct 2021)](#diablo-chain---multinode-testnet-on-ovh-dedicated-servers-oct-2021)
  - [Table of Contents](#table-of-contents)
  - [Architecture](#architecture)
  - [Code structure](#code-structure)
  - [Pre-requisites to use this project](#pre-requisites-to-use-this-project)
    - [1. Clone the project.](#1-clone-the-project)
    - [2. Install Ansible](#2-install-ansible)
    - [3. Create `github_token`](#3-create-github_token)
    - [4. Create Private Key](#4-create-private-key)
    - [5. Test](#5-test)
  - [Bootstrap of Multinode Test Network](#bootstrap-of-multinode-test-network)
    - [1. Clean & Purge](#1-clean--purge)
    - [2. Create file tree, deploy config and files, create containers.](#2-create-file-tree-deploy-config-and-files-create-containers)
    - [3. Start Nodes](#3-start-nodes)
    - [4. Bootup](#4-bootup)
    - [5. Check Logs](#5-check-logs)
  - [Monitoring](#monitoring)
  - [Update](#update)
    - [e.g. Update nodeos version](#eg-update-nodeos-version)

## Architecture

| HOSTNAME        | LOCATION | PUBLIC DNS                  | CNAME | WIREGUARD IP |
| --------------- | -------- | --------------------------- | ----- | ------------ |
| diablo-france-1 | France   | ns3177211.ip-51-210-113.eu  |       | 192.168.1.1  |
| diablo-france-2 | France   | ns3162930.ip-51-91-116.eu   |       | 192.168.1.2  |
| diablo-canada-1 | Canada   | ns548590.ip-51-79-82.net    |       | 192.168.2.1  |
| diablo-canada-2 | Canada   | ns572376.ip-51-161-119.net  |       | 192.168.2.2  |
| diablo-us-1     | US       | ns1011418.ip-135-148-169.us |       | 192.168.3.1  |
| diablo-us-2     | US       | ns1011426.ip-135-148-169.us |       | 192.168.3.2  |

- Servers are named with the following pattern: \<location in three letters\>-\<ovh server type\>.
- Every server is communicating with each otherr through Wireguard (= VPN tunnel).
- Every server diablo-*-1 hosts a nodeos producer listening on Wireguard private IP.
- Every server diablo-*-1 hosts one nodeos api listening on Wireguard private IP + listening HTTP (tcp/8888).

## Code structure
Files under `files/currently-not-used/` are originally under `files/` in [Multinode testnet-benchmark on OVH dedicated servers (June 2020)](https://github.com/ultraio/testnet-benchmark), but they are currently not used.   

```
.
├── README.md
├── ansible-inventory
├── ansible-task-api.yaml
├── ansible-tasks-main.yaml
├── ansible-vars.yaml
├── files
│   ├── blackbox.yaml
│   ├── blackbox_exporter.service
│   ├── bootup.sh
│   ├── config.ini.api.j2
│   ├── config.ini.producer.j2
│   ├── currently-not-used
│   │   ├── benchmark-testnet.pub
│   │   ├── haproxy
│   │   │   ├── certbot-haproxy.sh.j2
│   │   │   ├── dhparam
│   │   │   └── haproxy.cfg.j2
│   │   └── sshd_config
│   ├── eosio.bios.1.8.3
│   │   ├── eosio.bios.abi
│   │   └── eosio.bios.wasm
│   ├── genesis.json
│   ├── iptables.sh.j2
│   ├── jail.local
│   ├── librdkafka
│   │   ├── librdkafka++.so.1
│   │   └── librdkafka.so.1
│   ├── node_exporter.service
│   ├── nodeos_api.service.j2
│   ├── nodeos_producer.service
│   ├── start.sh
│   ├── tmp
│   ├── systemd_exporter.service
│   └── ultra.conf.j2
├── scripts
│   └── get_asset.sh
├── ssh-config
└── wrapper.sh
```

Files:

- `ansible-inventory` list of servers by role per environment
- `ansible-task*.yaml` ansible tasks
- `ansible-vars.yaml` ports that different nodeos instances will use, config variables for wireguard
- `files/bootup.sh` the script that initialises the different settings in the blockchain (e.g. ultra coin value)
- `files/config.ini.(api|producer).j2` template for the nodeos api/producer
- `files/genesis.json` the config file used on the first startup of a nodeos instance to create the local db
- `files/currently-not-used/haproxy/*` config of haproxy
- `files/iptables.sh.j2` iptables rules
- `files/jail.local` fail2ban config file
- `files/node_exporter.service`: systemd service configuration of node-exporter
- `files/nodeos_(api|producer).service`: systemd service configuration of nodeos api & producer
- `files/start.sh` the command executed by the nodeos containers at startup.
- `files/tmp` directory not pushed into git repo where eosio binaries and contracts will be put before copying them to remote servers
- `files/ultra.conf.j2` wireguard configuration
- `ssh-config` the ssh config file to pass with ssh via `-F`option
- `wrapper.sh` the wrapper to launch tasks

## Pre-requisites to use this project

### 1. Clone the project.

Clone the project into your `~/ultra` folder.

```
git clone git@github.com:ultraio/diablo-chain-setup.git
```

### 2. Install Ansible

[https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

### 3. Create `github_token`

At the root of project, create a file `github_token` with gitub access token.


### 4. Create Private Key

Create private key file `~/.ssh/benchmark-testnet.rsa` with ssh private key to connect to root@\<server\> via ssh. Otherwise update `ssh-config` in root of the project accordingly (Note: `devops.rsa` will work as well). Don't forget to update `~/ssh/benchmark-testnet.rsa` with correct permissions: `chmod 400 ~/.ssh/benchmark-testnet.rsa`.

### 5. Test 

Test SSH connection.

```bash
#1st test
local# ssh -F ./ssh-config diablo-france-1

#2nd test
local# MODULE=ping ./wrapper.sh ansible all_eos
```

## Bootstrap of Multinode Test Network

Please keep in mind that when using these commands it will wipe the existing chain entirely.

These commands should not be used unless we're rebooting a fresh chain.

---

### 1. Clean & Purge

If not starting from a fresh install, the older install must be removed like the following:
```
local# ./wrapper.sh stop-and-erase
```

### 2. Create file tree, deploy config and files, create containers.  
In `wrapper.sh`, nodeos binaries version for producer, nodeos binaries version for api, and `eosio.contracts` version are specified as `PRODUCER_BIN_VERSION`, `API_BIN_VERSION`, and `CONTRACTS_VERSION` variable, respectively.
```
local# ./wrapper.sh bootup
```

### 3. Start Nodes

Start all the nodeos (3 nodeos-producer, 6 nodeos-api).
```
local# ./wrapper.sh start-all
```
At this point, only the first producer on `diablo-france-1` should produce blocks.  
Log in to `diablo-france-1`  and check the logs.
```
local# ssh -F ./ssh-config diablo-france-1
diablo-france-1# journalctl -u nodeos_producer -f
```

### 4. Bootup

Run `bootup.sh` to create account, deploy system contracts, etc. on the blockchain.  
All producers but the first one should produce blocks as well. The first producer name should be changed then the producer shoud be restarted to produce blocks again.
```
diablo-france-1# cd /root/nodeos-bootstrap
diablo-france-1# ./bootup.sh
diablo-france-1# service nodeos_producer restart
```

### 5. Check Logs

Make sure that there are lines like this in the logs
```
diablo-france-1# journalctl -u nodeos_producer -f
...
Nov 01 02:09:35 diablo-france-1 start.sh[11693]: info  2021-11-01T02:09:35.308 nodeos    producer_plugin.cpp:604       on_incoming_block    ] Received block 874d1eb1eb2a7620... #156 @ 2021-11-01T02:09:35.500 signed by produceracc3 [trxs: 0, lib: 108, conf: 0, latency: -191 ms]
Nov 01 02:09:35 diablo-france-1 start.sh[11693]: info  2021-11-01T02:09:35.902 nodeos    producer_plugin.cpp:2908      produce_block        ] Produced block 20f62acff61d7ca7... #157 @ 2021-11-01T02:09:36.000 signed by produceracc1 [trxs: 0, lib: 120, confirmed: 24]
...
```
The important part is "signed by produceraccX", where X must be between 1-3 to confirm every node producer is actually producing block as expected. Producers produce 12 blocks every 6 seconds in turn. 

## Monitoring

Via
* node-exporter: for the monitoring of the hosts
* systemd-exporter: for the monitoring of the systemd services

## Update

### e.g. Update nodeos version

0 - Edit `PRODUCER_BIN_VERSION`, `API_BIN_VERSION`, and `CONTRACTS_VERSION` variables in `wrapper.sh`.

1 - Erase & setup new testnet following part [Bootstrap of multinode testnet](#bootstrap-of-multinode-testnet).
