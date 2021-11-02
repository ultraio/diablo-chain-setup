# Diablo Chain - Multinode testnet on OVH dedicated servers (Oct 2021)

This repo is based on [Multinode testnet-benchmark on OVH dedicated servers (June 2020)](https://github.com/ultraio/testnet-benchmark), with several updates.  
**Currently wireguard and haproxy are not used**.  

## Architecture

| HOSTNAME    | LOCATION            | PUBLIC DNS                  | CNAME                | WIREGUARD IP |
| ----------- | ------------------- | --------------------------- | -------------------- | ------------ |
| bhs-infra-1 | Bauharnois (Canada) | ns548590.ip-51-79-82.net    |                      |              |
| bhs-infra-2 | Bauharnois (Canada) | ns572376.ip-51-161-119.net  |                      |              |
| rbx-infra-1 | Roubaix (France)    | ns3177211.ip-51-210-113.eu  |                      |              |
| rbx-infra-2 | Roubaix (France)    | ns3162930.ip-51-91-116.eu   |                      |              |
| vin-infra-1 | Vint Hill (USA)     | ns1011418.ip-135-148-169.us |                      |              |
| vin-infra-2 | Vint Hill (USA)     | ns1011426.ip-135-148-169.us |                      |              |

- Servers are named with the following pattern: \<location in three letters\>-\<ovh server type\>.
- Every server is communicating with each other.
- Every server *-infra-1 hosts a nodeos producer.
- Every server *-infra-2 hosts two nodeos api listening HTTP (tcp/8888 and tcp/8889).


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
│   │   ├── iptables.sh.j2
│   │   ├── sshd_config
│   │   └── ultra.conf.j2
│   ├── genesis.json
│   ├── jail.local
│   ├── node_exporter.service
│   ├── nodeos_api.service.j2
│   ├── nodeos_producer.service
│   ├── start.sh
│   └── systemd_exporter.service
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
- `files/currently-not-used/iptables.sh.j2` iptables rules
- `files/jail.local` fail2ban config file
- `files/node_exporter.service`: systemd service configuration of node-exporter
- `files/nodeos_(api|producer).service`: systemd service configuration of nodeos api & producer
- `files/start.sh` the command executed by the nodeos containers at startup.
- `files/tmp` directory not pushed into git repo where eosio bins, contracts & libs will be put before copying them to remote servers
- `files/currently-not-used/ultra.conf.j2` wireguard configuration
- `ssh-config` the ssh config file to pass with ssh via `-F`option
- `wrapper.sh` the wrapper to launch tasks

## Pre-requisites to use this project

1- Clone the project
```
git@github.com:ultraio/diablo-chain-setup.git
```

2- [Install ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

3- Create private key file `~/.ssh/benchmark-testnet.rsa` with ssh private key to connect to root@\<server\> via ssh. Otherwise update `ssh-config` in root of the project accordingly (Note: `devops.rsa` will work as well). Don't forget to update `~/ssh/benchmark-testnet.rsa` with correct permissions: `chmod 400 ~/.ssh/benchmark-testnet.rsa`

4- Test SSH connection
```
#1st test
local# ssh -F ./ssh-config bhs-infra-1

#2nd test
local# MODULE=ping ./wrapper.sh ansible all_eos
```

## Bootstrap of multinode testnet

0- If not starting from a fresh install, the older install must be removed like the following:
```
local# ./wrapper.sh stop-and-erase
```

1- Create file tree, deploy config and files, create containers.  
docker image in Google Cloud Storage is specified as `IMAGE` variable in `wrapper.sh`. docker image should be downloaded beforehand or connection to Google Cloud Storage should be established.
```
local# ./wrapper.sh bootup
```

3- Start all the nodeos (3 nodeos-producer, 6 nodeos-api).
```
local# ./wrapper.sh start-all
```
At this point, only the first producer on `bhs-infra-1` should produce blocks.  
Log in to `bhs-infra-1`  and check the logs.
```
local# ssh -F ./ssh-config bhs-infra-1
bhs-infra-1# journalctl -u nodeos_producer -f
```

4- Run `bootup.sh` to create account, deploy system contracts, etc. on the blockchain.  
All producers but the first one should produce blocks as well. The first producer name should be changed then the producer shoud be restarted to produce blocks again.
```
bhs-infra-1# cd /root/nodeos-bootstrap
bhs-infra-1# ./bootup.sh
bhs-infra-1# service nodeos_producer restart
```

5- Make sure that there are lines like this in the logs
```
bhs-infra-1# journalctl -u nodeos_producer -f
...
Nov 01 02:09:35 bhs-infra-1 start.sh[11693]: info  2021-11-01T02:09:35.308 nodeos    producer_plugin.cpp:604       on_incoming_block    ] Received block 874d1eb1eb2a7620... #156 @ 2021-11-01T02:09:35.500 signed by produceracc3 [trxs: 0, lib: 108, conf: 0, latency: -191 ms]
Nov 01 02:09:35 bhs-infra-1 start.sh[11693]: info  2021-11-01T02:09:35.902 nodeos    producer_plugin.cpp:2908      produce_block        ] Produced block 20f62acff61d7ca7... #157 @ 2021-11-01T02:09:36.000 signed by produceracc1 [trxs: 0, lib: 120, confirmed: 24]
...
```
The important part is "signed by produceraccX", where X must be between 1-3 to confirm every node producer is actually producing block as expected. Producers produce 12 blocks every 6 seconds in turn. 

## Monitoring

Via
* node-exporter: for the monitoring of the hosts
* systemd-exporter: for the monitoring of the systemd services

## Update

### e.g. Update nodeos version

0- Edit `IMAGE` variable in `wrapper.sh`.

1- Erase & setup new testnet following part [Bootstrap of multinode testnet](#bootstrap-of-multinode-testnet).
