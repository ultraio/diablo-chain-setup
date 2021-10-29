# Multinode testnet-benchmark on OVH dedicated servers (June 2020)

Atlassian page of the project --> [Benchmarking Testnet](https://ultraio.atlassian.net/wiki/spaces/BKB/pages/505774081/Benchmarking+Testnet)

## Architecture

| HOSTNAME    | LOCATION            | PUBLIC DNS                | CNAME                | WIREGUARD IP |
| ----------- | ------------------- | ------------------------- | -------------------- | ------------ |
| bhs-infra-1 | Bauharnois (Canada) | ns545536.ip-51-222-41.net |                      | 192.168.1.1  |
| bhs-infra-2 | Bauharnois (Canada) | ns574701.ip-51-161-86.net | bhs-infra-2.ultra.io | 192.168.1.2  |
| rbx-infra-1 | Roubaix (France)    | ns3171380.ip-51-178-68.eu |                      | 192.168.1.3  |
| rbx-infra-2 | Roubaix (France)    | ns3172223.ip-51-210-33.eu | rbx-infra-2.ultra.io | 192.168.1.4  |
| vin-infra-1 | Vint Hill (USA)     | ns1001000.ip-51-81-57.us  |                      | 192.168.1.5  |
| vin-infra-2 | Vint Hill (USA)     | ns1000009.ip-51-81-107.us | vin-infra-2.ultra.io | 192.168.1.6  |

- Servers are named with the following pattern: \<location in three letters\>-\<ovh server type\>
- Every server is communicating with each other through Wireguard (= VPN tunnel)
- Every server *-infra-1 hosts a nodeos producer listening on Wireguard private IP
- Every server *-infra-2 hosts two nodeos api listening on Wireguard private IP + haproxy listening on public IP that load balance the traffic to the both nodeos api (with HTTP healthcheck)
- Haproxy is listening on HTTPS (tcp/443) and can be contacted via https//\<cname column above\>


## Code structure

```
.
├── README.md
├── ansible-inventory
├── ansible-task-api.yaml
├── ansible-tasks-main.yaml
├── ansible-vars.yaml
├── ansible-vault-password.txt
├── files
│   ├── benchmark-testnet.pub
│   ├── bootup.sh
│   ├── config.ini.api.j2
│   ├── config.ini.producer.j2
│   ├── dns_cloudflare.ini.vault
│   ├── genesis.json
│   ├── haproxy
│   │   ├── certbot-haproxy.sh.j2
│   │   ├── dhparam
│   │   └── haproxy.cfg.j2
│   ├── iptables.sh.j2
│   ├── jail.local
│   ├── node_exporter.service
│   ├── nodeos_api.service.j2
│   ├── nodeos_producer.service
│   ├── sshd_config
│   ├── start.sh
│   ├── tmp
│   ├── systemd_exporter.service
│   └── ultra.conf.j2
├── ssh-config
└── wrapper.sh
```

Files:

- `ansible-inventory` list of servers by role per environment
- `ansible-task*.yaml` ansible tasks
- `ansible-vars.yaml` ports that different nodeos instances will use, config variables for wireguard
- `ansible-vault-password.txt` the file to create by hand that contains ansible-vault password
- `files/bootup.sh` the script that initialises the different settings in the blockchain (e.g. ultra coin value)
- `files/config.ini.(api|producer).j2` template for the nodeos api/producer
- `files/dns_cloudflare.init.vault` vaulted INI Clouflare credentials for certbot DNS challenge
- `files/genesis.json` the config file used on the first startup of a nodeos instance to create the local db
- `files/haproxy/*` config of haproxy
- `files/iptables.sh.j2` iptables rules
- `files/jail.local` fail2ban config file
- `files/node_exporter.service`: systemd service configuration of node-exporter
- `files/nodeos_(api|producer).service`: systemd service configuration of nodeos api & producer
- `files/start.sh` the command executed by the nodeos containers at startup.
- `files/tmp` directory not pushed into git repo where eosio bins, contracts & libs will be put before copying them to remote servers
- `files/ultra.conf.j2` wireguard configuration
- `ssh-config` the ssh config file to pass with ssh via `-F`option
- `wrapper.sh` the wrapper to launch tasks

## Pre-requisites to use this project

1- clone the project
```
git@github.com:ultraio/testnet-benchmark.git
```

2- [Install ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

3- At the root of project, create file `ansible-vault-password.txt` with ansible-vault password (in devops KeePass)

4- Create private key file `~/.ssh/benchmark-testnet.rsa` with ssh private key to connect to root@\<server\> via ssh (in devops KeePass). Otherwise update `ssh-config` in root of the project accordingly (Note: `devops.rsa` will work as well). Don't forget to update `~/ssh/benchmark-testnet.rsa` with correct permissions: `chmod 400 ~/.ssh/benchmark-testnet.rsa`

5- Test SSH connection
```
#1st test
local# ssh -F ./ssh-config bhs-infra-1

#2nd test
local# MODULE=ping ./wrapper.sh ansible all_eos
```

## Let's encrypt certificate

Let's encrypt certificate are generated using certbot with a DNS challenge verification.

## Bootstrap of multinode testnet

0- If not starting from a fresh install. The older install must be removed like the following:
```
local# ./wrapper.sh stop-and-erase
```

1- Create filetree, deploy config & files, create containers
```
local# ./wrapper.sh bootup
```

2- Start 1st producer, then check the logs. It should produce blocks.
```
local# ssh -F ./ssh-config bhs-infra-1
bhs-infra-1# service nodeos_producer start
bhs-infra-1# journalctl -u nodeos_producer -f
```

3- Run bootup.sh to create account, value of ultra coins, etc. on the blockchain
```
bhs-infra-1# cd /root/nodeos-bootstrap
bhs-infra-1# ./bootup.sh -p 3
```

4- Start all the nodeos (the other 2 nodeos-producer, 6 nodeos-api, and 3 haproxy)
```
local# ./wrapper.sh start-all
```

5- At this point, all producers but the first one should produce. Its producer name must be changed then restarted to produce again.
```
local# ./wrapper.sh update -l 'bhs-infra-1' -t producer
bhs-infra-1# service nodeos_producer restart
```

6- Make sure that there are lines like this in the logs
```
bhs-infra-1# journalctl -u nodeos_producer -f
Jun 12 09:07:46 bhs-infra-1 start.sh[19276]: info  2020-06-12T09:07:46.410 nodeos    producer_plugin.cpp:398       on_incoming_block    ] Received block e8ee3a3939b228f8... #222 @ 2020-06-12T09:07:46.500 signed by produceracc3 [trxs: 0, lib: 83, conf: 0, latency: -89 ms]
```
The important part is "signed by produceraccX", X must be between 1-3 to confirm every node producer is actually producing block as expected.

## Monitoring

Via
* node-exporter: for the monitoring of the hosts
* systemd-exporter: for the monitoring of the systemd services

### Deployment & scraping

Service & Endpoints must be deployed in production k8s (via `monitoring` project).

## Update

### e.g. update nodeos version

0- Edit IMAGE variable in wrapper.sh

1- Erase & setup new testnet following part "Bootstrap of multinode testnet"
