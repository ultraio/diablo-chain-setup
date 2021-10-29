#!/bin/bash

IMAGE='eu.gcr.io/acoustic-arch-243714/nodeos:2.0.9-1.23.0'

export ANSIBLE_SSH_ARGS=${ANSIBLE_SSH_ARGS:-"-F $(dirname $0)/ssh-config -o ControlMaster=auto -o ControlPersist=18000 -o PreferredAuthentications=publickey"}
export ANSIBLE_SSH_PIPELINING=true
ANSIBLE_COMMON_OPTIONS=${ANSIBLE_COMMON_OPTIONS:-"-u root -e @$(dirname $0)/ansible-vars.yaml -e IMAGE=${IMAGE} -i ansible-inventory"}

case $1 in
  bootup)
    shift
    ansible-playbook ansible-tasks-main.yaml ${ANSIBLE_COMMON_OPTIONS} --extra-vars="first_producer_name=eosio" $@
    ;;
  update)
    shift
    ansible-playbook ansible-tasks-main.yaml ${ANSIBLE_COMMON_OPTIONS} --extra-vars="first_producer_name=produceracc1" $@
    ;;
  stop-and-erase)
    shift
    ansible all_eos ${ANSIBLE_COMMON_OPTIONS} -m shell -a '/bin/bash -xc "service nodeos_producer stop; service nodeos_api-1 stop; service nodeos_api-2 stop; rm -rf /opt/eosio/{producer,api-1,api-2}/workdir/*; rm -rf /root/nodeos-bootstrap/{bin,contracts}/*; true"' $@
    ;;
  start-all)
    shift
    ansible producer ${ANSIBLE_COMMON_OPTIONS} -m shell -a '/bin/bash -xc "service nodeos_producer start "; true'
    ansible api ${ANSIBLE_COMMON_OPTIONS} -m shell -a '/bin/bash -xc "service nodeos_api-1 start; service nodeos_api-2 start"; true'
#    ansible haproxy ${ANSIBLE_COMMON_OPTIONS} -m shell -a '/bin/bash -xc "service haproxy start"; true'
    ;;
  ansible)
    shift
    ansible ${ANSIBLE_COMMON_OPTIONS} ${ANSIBLE_ENV_OPTIONS} $@ -m ${MODULE} -a "${ARGS}"
    ;;
#  reload-haproxy)
#    ansible ${ANSIBLE_COMMON_OPTIONS} ${ANSIBLE_ENV_OPTIONS} haproxy -m shell -a 'service haproxy reload'
#    ;;
#  check)
#    printf "\n\n** HAPROXY CERTIFICATE **\n"
#    echo | openssl s_client -servername ${URL} -connect ${URL}:443 2>/dev/null | openssl x509 -noout -dates
#    ansible ${ANSIBLE_COMMON_OPTIONS} ${ANSIBLE_ENV_OPTIONS} all_eos -m shell -a 'printf "\n\n** MEMORY **\n"; free -h; printf "\n\n** UPTIME/LOAD AVERAGE **\n"; uptime; printf "\n\n** STORAGE **\n"; df -h; printf "\n\n** DOCKER **\n"; docker ps -a'
#    ;;
  purge)
#    shift
#    ansible ${ANSIBLE_COMMON_OPTIONS} ${ANSIBLE_ENV_OPTIONS} all_eos -m shell -a 'docker system prune --all --force --volumes'
#    ansible ${ANSIBLE_COMMON_OPTIONS} ${ANSIBLE_ENV_OPTIONS} kafka -m shell -a 'ls -r /opt/docker/nodeos-kafka/workdir/data/snapshots/snapshot-*.bin | tail -n +5 | xargs rm -f'
    ansible ${ANSIBLE_COMMON_OPTIONS} ${ANSIBLE_ENV_OPTIONS} all_eos -m shell -a 'journalctl --vacuum-size=1G'
#    ansible ${ANSIBLE_COMMON_OPTIONS} ${ANSIBLE_ENV_OPTIONS} all_eos -m shell -a 'truncate -s 0 /var/lib/docker/containers/*/*-json.log'
    ;;
  *)
    echo "ERROR: missing argument(s)" >&2
    exit 1
    ;;
esac
