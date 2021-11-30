#!/bin/bash

PRODUCER_BIN_VERSION='2.0.9-1.15.0-bp'
API_BIN_VERSION='2.0.9-1.15.0'
CONTRACTS_VERSION='1.22.0'

export ANSIBLE_SSH_ARGS=${ANSIBLE_SSH_ARGS:-"-F $(dirname $0)/ssh-config -o ControlMaster=auto -o ControlPersist=18000 -o PreferredAuthentications=publickey"}
export ANSIBLE_SSH_PIPELINING=true
ANSIBLE_COMMON_OPTIONS=${ANSIBLE_COMMON_OPTIONS:-"-u root -e @$(dirname $0)/ansible-vars.yaml -e PRODUCER_BIN_VERSION=${PRODUCER_BIN_VERSION} -e API_BIN_VERSION=${API_BIN_VERSION} -e CONTRACTS_VERSION=${CONTRACTS_VERSION} -i ansible-inventory"}

case $1 in
  bootup)
    shift
    ansible-playbook ansible-tasks-main.yaml ${ANSIBLE_COMMON_OPTIONS} --extra-vars="first_producer_name=eosio" $@
    ;;
  stop-and-erase)
    shift
    ansible all_eos ${ANSIBLE_COMMON_OPTIONS} -m shell -a '/bin/bash -xc "service nodeos_producer stop; service nodeos_api-1 stop; service nodeos_api-2 stop; rm -rf /opt/eosio/{producer,api-1,api-2}/workdir/*; rm -rf /root/nodeos-bootstrap/{bin,contracts}/*; true"' $@
    ;;
  start-all)
    shift
    ansible producer ${ANSIBLE_COMMON_OPTIONS} -m shell -a '/bin/bash -xc "service nodeos_producer start"; true'
    ansible api ${ANSIBLE_COMMON_OPTIONS} -m shell -a '/bin/bash -xc "service nodeos_api-1 start"; true'
    ;;
  ansible)
    shift
    ansible ${ANSIBLE_COMMON_OPTIONS} ${ANSIBLE_ENV_OPTIONS} $@ -m ${MODULE} -a "${ARGS}"
    ;;
  purge)
    ansible ${ANSIBLE_COMMON_OPTIONS} ${ANSIBLE_ENV_OPTIONS} all_eos -m shell -a 'journalctl --vacuum-size=1G'
    ;;
  *)
    echo "ERROR: missing argument(s)" >&2
    exit 1
    ;;
esac
