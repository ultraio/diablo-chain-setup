#!/bin/bash 
# set -x
export PATH="/root/nodeos-bootstrap/bin:$PATH"

set -e
NODE_URL=${1:-http://127.0.0.1:8888}
STRICT_VALIDATION=true

function errorLog() {
    echo "$1"
    if [ $STRICT_VALIDATION = true ] ; then
        exit 1
    fi
}
function infoLog() {
    if [ $STRICT_VALIDATION = true ] ; then
        echo "$1"
    fi
}

# crete wallet
rm -rf ${HOME}/eosio-wallet
cleos wallet create --file ${HOME}/wallet-password
# imported private key for EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos wallet import --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

CONTRACTS_DIR=${2:-/root/nodeos-bootstrap/contracts}
BIOS_DIR=${3:-/root/nodeos-bootstrap/contracts//eosio.bios.1.8.3}
# Setup accounts
cleos -u $NODE_URL create account eosio eosio.pool EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.pool -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.pool"
fi
infoLog "INFO: Found 'eosio.pool' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.eosio EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eosio -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.eosio"
fi
infoLog "INFO: Found 'ultra.eosio' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.kyc EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.kyc -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.kyc"
fi
infoLog "INFO: Found 'ultra.kyc' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.nft.ft EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.nft.ft -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.nft.ft"
fi
infoLog "INFO: Found 'ultra.nft.ft' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.swap EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.swap -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.swap"
fi
infoLog "INFO: Found 'ultra.swap' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.idp EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.idp -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.idp"
fi
infoLog "INFO: Found 'ultra.idp' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.tier EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.tier -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.tier"
fi
infoLog "INFO: Found 'ultra.tier' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.oracle EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.oracle -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.oracle"
fi
infoLog "INFO: Found 'ultra.oracle' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.eba EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eba -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.eba"
fi
infoLog "INFO: Found 'ultra.eba' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.games EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.games -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.games"
fi
infoLog "INFO: Found 'ultra.games' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.tools EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.tools -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.tools"
fi
infoLog "INFO: Found 'ultra.tools' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio uada EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account uada -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: uada"
fi
infoLog "INFO: Found 'uada' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio uadb EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account uadb -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: uadb"
fi
infoLog "INFO: Found 'uadb' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio uadc EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account uadc -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: uadc"
fi
infoLog "INFO: Found 'uadc' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio uadd EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account uadd -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: uadd"
fi
infoLog "INFO: Found 'uadd' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio uade EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account uade -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: uade"
fi
infoLog "INFO: Found 'uade' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio uadf EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account uadf -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: uadf"
fi
infoLog "INFO: Found 'uadf' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio uadg EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account uadg -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: uadg"
fi
infoLog "INFO: Found 'uadg' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.prop1 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop1 -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.prop1"
fi
infoLog "INFO: Found 'ultra.prop1' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.prop2 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop2 -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.prop2"
fi
infoLog "INFO: Found 'ultra.prop2' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.prop3 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop3 -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.prop3"
fi
infoLog "INFO: Found 'ultra.prop3' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.prop4 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop4 -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.prop4"
fi
infoLog "INFO: Found 'ultra.prop4' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra.prop5 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop5 -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra.prop5"
fi
infoLog "INFO: Found 'ultra.prop5' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio ultra EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account ultra -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: ultra"
fi
infoLog "INFO: Found 'ultra' account on the blockchain after creation"
    

cleos -u $NODE_URL create account eosio eosio.wrap EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.wrap -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.wrap"
fi
infoLog "INFO: Found 'eosio.wrap' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio eosio.msig EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.msig -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.msig"
fi
infoLog "INFO: Found 'eosio.msig' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio eosio.token EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.token -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.token"
fi
infoLog "INFO: Found 'eosio.token' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio eosio.stake EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.stake -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.stake"
fi
infoLog "INFO: Found 'eosio.stake' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio eosio.ram EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.ram -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.ram"
fi
infoLog "INFO: Found 'eosio.ram' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio eosio.kyc EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.kyc -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.kyc"
fi
infoLog "INFO: Found 'eosio.kyc' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio eosio.oracle EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.oracle -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.oracle"
fi
infoLog "INFO: Found 'eosio.oracle' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio eosio.nft.ft EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.nft.ft -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.nft.ft"
fi
infoLog "INFO: Found 'eosio.nft.ft' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio eosio.eba EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.eba -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: eosio.eba"
fi
infoLog "INFO: Found 'eosio.eba' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio produceracc1 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account produceracc1 -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: produceracc1"
fi
infoLog "INFO: Found 'produceracc1' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio produceracc2 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account produceracc2 -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: produceracc2"
fi
infoLog "INFO: Found 'produceracc2' account on the blockchain after creation"
    
cleos -u $NODE_URL create account eosio produceracc3 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio
set +e
CHECK=$(cleos -u $NODE_URL get account produceracc3 -j)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account: produceracc3"
fi
infoLog "INFO: Found 'produceracc3' account on the blockchain after creation"
    
cleos -u $NODE_URL set account permission ultra admin '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"owner"},"weight":1}]}' active
cleos -u $NODE_URL set account permission ultra tech '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"owner"},"weight":1}]}' admin
cleos -u $NODE_URL set account permission ultra manage '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"owner"},"weight":1}]}' tech
# Bootup sequence
curl -X POST $NODE_URL/v1/producer/schedule_protocol_feature_activations -d '{"protocol_features_to_activate": ["0ec7e080177b2c02b278d5088611686b49d739925a92d9bfcacd7fc6b74053bd"]}'
sleep 1
set +e
CHECK=$(cleos -u $NODE_URL get code eosio)
set -e

CONTRACT_BEFORE=$CHECK
    
cleos -u $NODE_URL set contract eosio $BIOS_DIR eosio.bios.wasm eosio.bios.abi 
set +e
CHECK=$(cleos -u $NODE_URL get code eosio)
set -e

if [ "$CONTRACT_BEFORE" == "$CHECK" ]; then
    errorLog "ERROR: Did not update contract: eosio -- $CONTRACT_BEFORE == $CHECK"
fi
        
sleep 1
cleos -u $NODE_URL push action eosio activate '["f0af56d2c5a48d60a4a5b5c903edfb7db3a736a94ed589d0b797df33ff9d3e1d"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["2652f5f96006294109b3dd0bbde63693f55324af452b799ee137a81a905eed25"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["8ba52fe7a3956c5cd3a656a3174b931d3bb2abb45578befc59f283ecd816a405"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["ad9e3d8f650687709fd68f4b90b41f7d825a365b02c23a636cef88ac2ac00c43"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["68dcaa34c0517d19666e6b33add67351d8c5f69e999ca1e37931bc410a297428"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["e0fb64b1085cc5538970158d05a009c24e276fb94e1a0bf6a528b48fbc4ff526"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["ef43112c6543b88db2283a2e077278c315ae2c84719a8b25f25cc88565fbea99"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["4a90c00d55454dc5b059055ca213579c6ea856967712a56017487886a4d4cc0f"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["1a99a59d87e06e09ec5b028a9cbb7749b4a5ad8819004365d02dc4379a8b7241"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["4e7bf348da00a945489b2a681749eb56f5de00b900014e137ddae39f48f69d67"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["4fca8bd82bbd181e714e283f83e1b45d95ca5af40fb89ad3977b653c448f78c2"]' -p eosio@owner
cleos -u $NODE_URL push action eosio activate '["299dcb6af692324b899b39f16d5a530a33062804e41f09dc97e9f156b4476707"]' -p eosio@owner
# Setup system
cleos -u $NODE_URL set contract eosio.token $CONTRACTS_DIR/eosio.token eosio.token.wasm eosio.token.abi -p eosio.token@owner
set +e
CHECK=$(cleos -u $NODE_URL get code eosio.token)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: eosio.token"
fi

if [ "$CHECK" != "code hash: 04e92908fa0c3b3219b566275327a15367239003a7d404105086587297960301" ]; then
    errorLog "ERROR: Account did not have a contract: eosio.token@1.23.0 -- onchain eosio.token.wasm:$CHECK -- expected 04e92908fa0c3b3219b566275327a15367239003a7d404105086587297960301"
fi

infoLog "INFO: Validated contract: 'eosio.token' (hash: 04e92908fa0c3b3219b566275327a15367239003a7d404105086587297960301)"
        
cleos -u $NODE_URL push action eosio.token create '["eosio","0.00000000 UOS"]' -p eosio.token@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.pool","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.eosio","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.kyc","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.nft.ft","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.swap","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.idp","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.tier","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.oracle","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.eba","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.games","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.tools","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["uada","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["uadb","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["uadc","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["uadd","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["uade","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["uadf","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["uadg","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.prop1","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.prop2","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.prop3","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.prop4","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra.prop5","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["ultra","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.wrap","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.msig","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.token","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.stake","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.ram","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.kyc","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.oracle","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.nft.ft","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["eosio.eba","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["produceracc1","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["produceracc2","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token open '["produceracc3","8,UOS","eosio"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token issue '["eosio","1000000000.00000000 UOS","INIT"]' -p eosio@owner
cleos -u $NODE_URL push action eosio.token transfer '["eosio","ultra.eosio","1000000000.00000000 UOS","INIT"]' -p eosio@owner
cleos -u $NODE_URL set contract ultra.tools $CONTRACTS_DIR/ultra.tools ultra.tools.wasm ultra.tools.abi -p ultra.tools@owner
set +e
CHECK=$(cleos -u $NODE_URL get code ultra.tools)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: ultra.tools"
fi

if [ "$CHECK" != "code hash: a6477b4b3b28a838703fddb207046181549188074752b1da1971b1bff936ca98" ]; then
    errorLog "ERROR: Account did not have a contract: ultra.tools@1.23.0 -- onchain ultra.tools.wasm:$CHECK -- expected a6477b4b3b28a838703fddb207046181549188074752b1da1971b1bff936ca98"
fi

infoLog "INFO: Validated contract: 'ultra.tools' (hash: a6477b4b3b28a838703fddb207046181549188074752b1da1971b1bff936ca98)"
        
cleos -u $NODE_URL set contract eosio.kyc $CONTRACTS_DIR/eosio.kyc eosio.kyc.wasm eosio.kyc.abi -p eosio.kyc@owner
set +e
CHECK=$(cleos -u $NODE_URL get code eosio.kyc)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: eosio.kyc"
fi

if [ "$CHECK" != "code hash: b1b71f6c23236a5aca9486fa3ef9c2f23be7d8df2690debc24a9b97feb765cd1" ]; then
    errorLog "ERROR: Account did not have a contract: eosio.kyc@1.23.0 -- onchain eosio.kyc.wasm:$CHECK -- expected b1b71f6c23236a5aca9486fa3ef9c2f23be7d8df2690debc24a9b97feb765cd1"
fi

infoLog "INFO: Validated contract: 'eosio.kyc' (hash: b1b71f6c23236a5aca9486fa3ef9c2f23be7d8df2690debc24a9b97feb765cd1)"
        
cleos -u $NODE_URL set contract eosio.msig $CONTRACTS_DIR/eosio.msig eosio.msig.wasm eosio.msig.abi -p eosio.msig@owner
set +e
CHECK=$(cleos -u $NODE_URL get code eosio.msig)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: eosio.msig"
fi

if [ "$CHECK" != "code hash: bc309a1ce419ae1a88718ac60242b7332c7864142ad286eddae7a9440d7cf671" ]; then
    errorLog "ERROR: Account did not have a contract: eosio.msig@1.23.0 -- onchain eosio.msig.wasm:$CHECK -- expected bc309a1ce419ae1a88718ac60242b7332c7864142ad286eddae7a9440d7cf671"
fi

infoLog "INFO: Validated contract: 'eosio.msig' (hash: bc309a1ce419ae1a88718ac60242b7332c7864142ad286eddae7a9440d7cf671)"
        
cleos -u $NODE_URL push action eosio setpriv '["eosio.msig", 1]' -p eosio@owner
cleos -u $NODE_URL set contract eosio.wrap $CONTRACTS_DIR/eosio.wrap eosio.wrap.wasm eosio.wrap.abi 
set +e
CHECK=$(cleos -u $NODE_URL get code eosio.wrap)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: eosio.wrap"
fi

if [ "$CHECK" != "code hash: d9c8f99e57f0b73ba2f64710374e2606c62cbf10e4df226fe44c1954ab8de391" ]; then
    errorLog "ERROR: Account did not have a contract: eosio.wrap@1.23.0 -- onchain eosio.wrap.wasm:$CHECK -- expected d9c8f99e57f0b73ba2f64710374e2606c62cbf10e4df226fe44c1954ab8de391"
fi

infoLog "INFO: Validated contract: 'eosio.wrap' (hash: d9c8f99e57f0b73ba2f64710374e2606c62cbf10e4df226fe44c1954ab8de391)"
        
cleos -u $NODE_URL push action eosio setpriv '["eosio.wrap", 1]' -p eosio@owner
cleos -u $NODE_URL set contract eosio.eba $CONTRACTS_DIR/eosio.eba eosio.eba.wasm eosio.eba.abi 
set +e
CHECK=$(cleos -u $NODE_URL get code eosio.eba)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: eosio.eba"
fi

if [ "$CHECK" != "code hash: a8ca2dc60202bcc448e8427722d20443dba109db5bcb502efe0a397095e62b9d" ]; then
    errorLog "ERROR: Account did not have a contract: eosio.eba@1.23.0 -- onchain eosio.eba.wasm:$CHECK -- expected a8ca2dc60202bcc448e8427722d20443dba109db5bcb502efe0a397095e62b9d"
fi

infoLog "INFO: Validated contract: 'eosio.eba' (hash: a8ca2dc60202bcc448e8427722d20443dba109db5bcb502efe0a397095e62b9d)"
        
cleos -u $NODE_URL push action eosio setpriv '["eosio.eba", 1]' -p eosio@owner
cleos -u $NODE_URL push action eosio.eba regidp '[[{"account":"ultra.idp","key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"}]]' -p ultra.eba
set +e
CHECK=$(cleos -u $NODE_URL get code eosio)
set -e

CONTRACT_BEFORE=$CHECK
    
cleos -u $NODE_URL set contract eosio $CONTRACTS_DIR/eosio.system eosio.system.wasm eosio.system.abi -p eosio@owner
set +e
CHECK=$(cleos -u $NODE_URL get code eosio)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: eosio"
fi

if [ "$CHECK" != "code hash: dfc4a7e030637d40b303bcae2855bebb30028e3b1df57f0cc7d059add44c2052" ]; then
    errorLog "ERROR: Account did not have a contract: eosio@1.23.0 -- onchain eosio.system.wasm:$CHECK -- expected dfc4a7e030637d40b303bcae2855bebb30028e3b1df57f0cc7d059add44c2052"
fi

infoLog "INFO: Validated contract: 'eosio' (hash: dfc4a7e030637d40b303bcae2855bebb30028e3b1df57f0cc7d059add44c2052)"
        
set +e
CHECK=$(cleos -u $NODE_URL get code eosio)
set -e

if [ "$CONTRACT_BEFORE" == "$CHECK" ]; then
    errorLog "ERROR: Did not update contract: eosio -- $CONTRACT_BEFORE == $CHECK"
fi
        
cleos -u $NODE_URL push action eosio init '[0,"8,UOS"]' -f -p eosio@owner
# RAM sponsored tiers init
cleos -u $NODE_URL push action eosio setramsponsr '["ultra.tier"]' -p ultra.eosio
set +e
CHECK=$(cleos -u $NODE_URL get table eosio eosio ramsponsor)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in ramsponsor table"
fi

for row in $(jq -c '.[]' <<< "$ROWS"); do
    SPONSOR=$(jq -r '.account' <<< "$row")
    if [ "$SPONSOR" != "ultra.tier" ]; then
        errorLog "ERROR: RAM sponsor was not set properly -- $SPONSOR != ultra.tier"
    fi
done

cleos -u $NODE_URL push action eosio createtier '["tier1", 2, 5, 1, 0, 0]' -p ultra.eosio
set +e
CHECK=$(cleos -u $NODE_URL get table eosio tier1 freeacttier)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in freeacttier table"
fi

for row in $(jq -c '.[]' <<< "$ROWS"); do
    if [ $(jq -r '.max_free_permission_objects' <<< "$row") -ne 2 ]; then
        errorLog "ERROR: tier1 incorrect max_free_permission_objects"
    fi
    if [ $(jq -r '.max_free_shared_keys' <<< "$row") -ne 5 ]; then
        errorLog "ERROR: tier1 incorrect max_free_shared_keys"
    fi
    if [ $(jq -r '.max_free_permission_levels' <<< "$row") -ne 1 ]; then
        errorLog "ERROR: tier1 incorrect max_free_permission_levels"
    fi
    if [ $(jq -r '.max_free_waits' <<< "$row") -ne 0 ]; then
        errorLog "ERROR: tier1 incorrect max_free_waits"
    fi
    if [ $(jq -r '.max_free_permission_link_objects' <<< "$row") -ne 0 ]; then
        errorLog "ERROR: tier1 incorrect max_free_permission_link_objects"
    fi
done

infoLog "INFO: Validated RAM tier: tier1"

cleos -u $NODE_URL push action eosio setdeftier '["tier1"]' -p ultra.eosio
set +e
CHECK=$(cleos -u $NODE_URL get table eosio eosio defaulttier)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in defaulttier table"
fi

for row in $(jq -c '.[]' <<< "$ROWS"); do
    SPONSOR=$(jq -r '.tier' <<< "$row")
    if [ "$(jq -r '.tier' <<< "$row")" != "tier1" ]; then
        errorLog "ERROR: RAM default tier was not set properly -- $SPONSOR != ultra.tier"
    fi
done

infoLog "INFO: Validated default RAM tier is tier1"

cleos -u $NODE_URL push action eosio setramcurve '["203000.00000000 UOS", 34359738368, 0.54000000000000004]' -p ultra.eosio
set +e
CHECK=$(cleos -u $NODE_URL get table eosio eosio rammarket)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in rammarket table"
fi

RAMMARKET=$(jq '.[0]' <<< "$ROWS")
CORE_RESERVE=$(jq -r '.core_reserve' <<< "$RAMMARKET")
RAM_SUPPLY=$(jq -r '.ram_supply' <<< "$RAMMARKET")
RAM_RESERVED=$(jq -r '.ram_reserved' <<< "$RAMMARKET")
CONNECTOR_WEIGHT=$(jq -r '.connector_weight' <<< "$RAMMARKET")

if [ "$CORE_RESERVE" != "203000.00000000 UOS" ]; then
    errorLog "ERROR: RAM core_reserve was not set properly --- $CORE_RESERVE != 203000.00000000 UOS"
fi
if [ "$RAM_SUPPLY" != "34359738368 RAM" ]; then
    errorLog "ERROR: RAM ram_supply was not set properly --- $RAM_SUPPLY != 34359738368"
fi
if [ "$RAM_RESERVED" != "34359738368 RAM" ]; then
    echo "-------------------------------------------------------------------------------------------"
    echo "WARNING: RAM ram_reserved was not set properly --- $RAM_RESERVED != 34359738368"
    echo "-------------------------------------------------------------------------------------------"
fi
if [ "$CONNECTOR_WEIGHT" != "0.54000000000000004" ]; then
    errorLog "ERROR: RAM connector_weight was not set properly --- $CONNECTOR_WEIGHT != 0.54000000000000004"
fi

infoLog "INFO: Validated RAM curve"

cleos -u $NODE_URL push action eosio setramtrade '[true]' -p ultra.eosio
set +e
CHECK=$(cleos -u $NODE_URL get table eosio eosio rammarket)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
RAMMARKET=$(jq '.[0]' <<< "$ROWS")
IS_TRADE_ENABLED=$(jq -r '.is_trade_enabled' <<< "$RAMMARKET")

if [ "$IS_TRADE_ENABLED" != "1" ]; then
    errorLog "ERROR: RAM is_trade_enabled was not set properly --- $IS_TRADE_ENABLED != true"
fi

infoLog "INFO: Validated RAM trading"

# Init Oracle
cleos -u $NODE_URL set contract eosio.oracle $CONTRACTS_DIR/eosio.oracle eosio.oracle.wasm eosio.oracle.abi -p eosio.oracle@owner
set +e
CHECK=$(cleos -u $NODE_URL get code eosio.oracle)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: eosio.oracle"
fi

if [ "$CHECK" != "code hash: fbed5580fa482ac7dcda15dee89d3718317beb867304cf6f07f5fcc196fe7b58" ]; then
    errorLog "ERROR: Account did not have a contract: eosio.oracle@1.23.0 -- onchain eosio.oracle.wasm:$CHECK -- expected fbed5580fa482ac7dcda15dee89d3718317beb867304cf6f07f5fcc196fe7b58"
fi

infoLog "INFO: Validated contract: 'eosio.oracle' (hash: fbed5580fa482ac7dcda15dee89d3718317beb867304cf6f07f5fcc196fe7b58)"
        
cleos -u $NODE_URL push action eosio.oracle init '[1, 60, [240, 360, 240, 365], ["1.0000 MINUTES","60.0000 MINUTES","24.0000 HOURS","7.0000 DAYS","14.0000 DAYS"], 1]' -p ultra.oracle@active
set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle 0 finalrates)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in oracle finalrates table"
fi

ROW=$(jq -c '.[0]' <<< "$ROWS");
RATES=$(jq -c '.rates' <<< "$ROW");
RATES_LENGTH=$(jq length <<< $RATES);
if [ "$RATES_LENGTH" != "240" ]; then
    errorLog "ERROR: Invalid final rates table size: 0 -- $RATES_LENGTH != 240"
fi

set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle 1 finalrates)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in oracle finalrates table"
fi

ROW=$(jq -c '.[0]' <<< "$ROWS");
RATES=$(jq -c '.rates' <<< "$ROW");
RATES_LENGTH=$(jq length <<< $RATES);
if [ "$RATES_LENGTH" != "360" ]; then
    errorLog "ERROR: Invalid final rates table size: 1 -- $RATES_LENGTH != 360"
fi

set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle 2 finalrates)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in oracle finalrates table"
fi

ROW=$(jq -c '.[0]' <<< "$ROWS");
RATES=$(jq -c '.rates' <<< "$ROW");
RATES_LENGTH=$(jq length <<< $RATES);
if [ "$RATES_LENGTH" != "240" ]; then
    errorLog "ERROR: Invalid final rates table size: 2 -- $RATES_LENGTH != 240"
fi

set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle 3 finalrates)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in oracle finalrates table"
fi

ROW=$(jq -c '.[0]' <<< "$ROWS");
RATES=$(jq -c '.rates' <<< "$ROW");
RATES_LENGTH=$(jq length <<< $RATES);
if [ "$RATES_LENGTH" != "365" ]; then
    errorLog "ERROR: Invalid final rates table size: 3 -- $RATES_LENGTH != 365"
fi

infoLog "INFO: Validated Oracle final table sizes"
set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle "MINUTES" finalaverage)
set -e

PARSED_AMOUNT=$(echo "1.0000" | tr -d .)
ROWS=$(jq -c '.rows' <<< "$CHECK");

FA_SETTINGS=""
for param in $(jq -c -r '.[].param' <<< $ROWS); do
    if [ "$param" == "$PARSED_AMOUNT" ]; then
        FA_SETTINGS=$param
    fi
done

if [ "$FA_SETTINGS" == "" ]; then
    errorLog "ERROR: Oracle: could not find final average settings for exchange: 1.0000 MINUTES"
fi

set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle "MINUTES" finalaverage)
set -e

PARSED_AMOUNT=$(echo "60.0000" | tr -d .)
ROWS=$(jq -c '.rows' <<< "$CHECK");

FA_SETTINGS=""
for param in $(jq -c -r '.[].param' <<< $ROWS); do
    if [ "$param" == "$PARSED_AMOUNT" ]; then
        FA_SETTINGS=$param
    fi
done

if [ "$FA_SETTINGS" == "" ]; then
    errorLog "ERROR: Oracle: could not find final average settings for exchange: 60.0000 MINUTES"
fi

set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle "HOURS" finalaverage)
set -e

PARSED_AMOUNT=$(echo "24.0000" | tr -d .)
ROWS=$(jq -c '.rows' <<< "$CHECK");

FA_SETTINGS=""
for param in $(jq -c -r '.[].param' <<< $ROWS); do
    if [ "$param" == "$PARSED_AMOUNT" ]; then
        FA_SETTINGS=$param
    fi
done

if [ "$FA_SETTINGS" == "" ]; then
    errorLog "ERROR: Oracle: could not find final average settings for exchange: 24.0000 HOURS"
fi

set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle "DAYS" finalaverage)
set -e

PARSED_AMOUNT=$(echo "7.0000" | tr -d .)
ROWS=$(jq -c '.rows' <<< "$CHECK");

FA_SETTINGS=""
for param in $(jq -c -r '.[].param' <<< $ROWS); do
    if [ "$param" == "$PARSED_AMOUNT" ]; then
        FA_SETTINGS=$param
    fi
done

if [ "$FA_SETTINGS" == "" ]; then
    errorLog "ERROR: Oracle: could not find final average settings for exchange: 7.0000 DAYS"
fi

set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle "DAYS" finalaverage)
set -e

PARSED_AMOUNT=$(echo "14.0000" | tr -d .)
ROWS=$(jq -c '.rows' <<< "$CHECK");

FA_SETTINGS=""
for param in $(jq -c -r '.[].param' <<< $ROWS); do
    if [ "$param" == "$PARSED_AMOUNT" ]; then
        FA_SETTINGS=$param
    fi
done

if [ "$FA_SETTINGS" == "" ]; then
    errorLog "ERROR: Oracle: could not find final average settings for exchange: 14.0000 DAYS"
fi

infoLog "INFO: Validated Oracle final average settings"
cleos -u $NODE_URL push action eosio.oracle regexchange '["ubitmax"]' -p ultra.oracle@active
set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle eosio.oracle feeddata)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");

FEED_DATA=""
for row in $(jq -c '.[]' <<< "$ROWS"); do
    if [ "$(jq -r '.source' <<< "$row")" == "ubitmax" ]; then
        FEED_DATA=$row
        
        EXCHANGE_WEIGHT=$(jq -r '.weight' <<< "$row")
        if [ "$EXCHANGE_WEIGHT" != "0" ]; then
            errorLog "ERROR: Oracle: invalid weight for exchange: ubitmax --- $EXCHANGE_WEIGHT != 0"
        fi
        
        SOURCE_TYPE=$(jq -r '.source_type' <<< "$row")
        if [ "$SOURCE_TYPE" != "0" ]; then
            errorLog "ERROR: Oracle: invalid source type for exchange: ubitmax --- $SOURCE_TYPE != 0"
        fi
    fi
done

if [ "$FEED_DATA" == "" ]; then
    errorLog "ERROR: Oracle: could not find feed data for exchange: ubitmax"
fi

infoLog "INFO: Validated Oracle exchange: ubitmax"

cleos -u $NODE_URL push action eosio.oracle regexchange '["ubitfinex"]' -p ultra.oracle@active
set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle eosio.oracle feeddata)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");

FEED_DATA=""
for row in $(jq -c '.[]' <<< "$ROWS"); do
    if [ "$(jq -r '.source' <<< "$row")" == "ubitfinex" ]; then
        FEED_DATA=$row
        
        EXCHANGE_WEIGHT=$(jq -r '.weight' <<< "$row")
        if [ "$EXCHANGE_WEIGHT" != "0" ]; then
            errorLog "ERROR: Oracle: invalid weight for exchange: ubitfinex --- $EXCHANGE_WEIGHT != 0"
        fi
        
        SOURCE_TYPE=$(jq -r '.source_type' <<< "$row")
        if [ "$SOURCE_TYPE" != "0" ]; then
            errorLog "ERROR: Oracle: invalid source type for exchange: ubitfinex --- $SOURCE_TYPE != 0"
        fi
    fi
done

if [ "$FEED_DATA" == "" ]; then
    errorLog "ERROR: Oracle: could not find feed data for exchange: ubitfinex"
fi

infoLog "INFO: Validated Oracle exchange: ubitfinex"

cleos -u $NODE_URL push action eosio.oracle regexchange '["ukucoin"]' -p ultra.oracle@active
set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle eosio.oracle feeddata)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");

FEED_DATA=""
for row in $(jq -c '.[]' <<< "$ROWS"); do
    if [ "$(jq -r '.source' <<< "$row")" == "ukucoin" ]; then
        FEED_DATA=$row
        
        EXCHANGE_WEIGHT=$(jq -r '.weight' <<< "$row")
        if [ "$EXCHANGE_WEIGHT" != "0" ]; then
            errorLog "ERROR: Oracle: invalid weight for exchange: ukucoin --- $EXCHANGE_WEIGHT != 0"
        fi
        
        SOURCE_TYPE=$(jq -r '.source_type' <<< "$row")
        if [ "$SOURCE_TYPE" != "0" ]; then
            errorLog "ERROR: Oracle: invalid source type for exchange: ukucoin --- $SOURCE_TYPE != 0"
        fi
    fi
done

if [ "$FEED_DATA" == "" ]; then
    errorLog "ERROR: Oracle: could not find feed data for exchange: ukucoin"
fi

infoLog "INFO: Validated Oracle exchange: ukucoin"

cleos -u $NODE_URL push action eosio.oracle regexchange '["ugateio"]' -p ultra.oracle@active
set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle eosio.oracle feeddata)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");

FEED_DATA=""
for row in $(jq -c '.[]' <<< "$ROWS"); do
    if [ "$(jq -r '.source' <<< "$row")" == "ugateio" ]; then
        FEED_DATA=$row
        
        EXCHANGE_WEIGHT=$(jq -r '.weight' <<< "$row")
        if [ "$EXCHANGE_WEIGHT" != "0" ]; then
            errorLog "ERROR: Oracle: invalid weight for exchange: ugateio --- $EXCHANGE_WEIGHT != 0"
        fi
        
        SOURCE_TYPE=$(jq -r '.source_type' <<< "$row")
        if [ "$SOURCE_TYPE" != "0" ]; then
            errorLog "ERROR: Oracle: invalid source type for exchange: ugateio --- $SOURCE_TYPE != 0"
        fi
    fi
done

if [ "$FEED_DATA" == "" ]; then
    errorLog "ERROR: Oracle: could not find feed data for exchange: ugateio"
fi

infoLog "INFO: Validated Oracle exchange: ugateio"

set +e
CHECK=$(cleos -u $NODE_URL get table eosio.oracle eosio.oracle oraclestate)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in oraclestate table"
fi

ORACLESTATE=$(jq '.[0]' <<< "$ROWS")
ORACLE_INTERVAL=$(jq -r '.interval' <<< "$ORACLESTATE")
CACHE_WINDOW=$(jq -r '.cache_window' <<< "$ORACLESTATE")
REGISTERED_SOURCES=$(jq -r '.registered_sources' <<< "$ORACLESTATE")
ULTRA_WEIGHT=$(jq -r '.ultra_comprehensive_rate_weight' <<< "$ORACLESTATE")

if [ "$ORACLE_INTERVAL" != "1" ]; then
    errorLog "ERROR: Oracle interval was not set properly --- $ORACLE_INTERVAL != 1"
fi
if [ "$CACHE_WINDOW" != "60" ]; then
    errorLog "ERROR: Oracle cache_window was not set properly --- $CACHE_WINDOW != 60"
fi
if [ "$ULTRA_WEIGHT" != "4" ]; then
    errorLog "ERROR: Oracle ultra_comprehensive_rate_weight was not set properly --- $ULTRA_WEIGHT != 4"
fi
if [ "$REGISTERED_SOURCES" != "4" ]; then
    errorLog "ERROR: Oracle registered sources length was not calculated properly --- $REGISTERED_SOURCES != 4"
fi

infoLog "INFO: Validated Oracle settings"

# Setup Token Swap
cleos -u $NODE_URL set code ultra.swap $CONTRACTS_DIR/ultra.swap/ultra.swap.wasm -p ultra.swap@owner
set +e
CHECK=$(cleos -u $NODE_URL get code ultra.swap)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: ultra.swap"
fi

if [ "$CHECK" != "code hash: acfbefc5d811f6dff0522ebf2eafe3d9f0966c45451e4befdc0672d3e65584c6" ]; then
    errorLog "ERROR: Account did not have a contract: ultra.swap@1.23.0 -- onchain ultra.swap.wasm:$CHECK -- expected acfbefc5d811f6dff0522ebf2eafe3d9f0966c45451e4befdc0672d3e65584c6"
fi

infoLog "INFO: Validated contract: 'ultra.swap' (hash: acfbefc5d811f6dff0522ebf2eafe3d9f0966c45451e4befdc0672d3e65584c6)"
        
# Setup Non-EBA config
cleos -u $NODE_URL push action eosio newactconfig '["2.00000000 USD", "eosio.oracle", ["7.0000 DAYS","24.0000 HOURS","60.0000 MINUTES"]]' -p ultra.eosio@active
set +e
CHECK=$(cleos -u $NODE_URL get table eosio eosio nonebaconfig)
set -e

ROWS=$(jq -c '.rows' <<< "$CHECK");
if [ $(jq length <<< $ROWS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in nonebaconfig table"
fi

NON_EBA_CONFIG=$(jq '.[0]' <<< "$ROWS")
NON_EBA_CONFIG_COST=$(jq -r '.cost' <<< "$NON_EBA_CONFIG")
NON_EBA_CONFIG_ORACLE=$(jq -r '.oracle' <<< "$NON_EBA_CONFIG")
NON_EBA_CONFIG_MA=$(jq -r '.ma_settings' <<< "$NON_EBA_CONFIG")
NON_EBA_CONFIG_MA_LENGTH=$(jq length <<< $NON_EBA_CONFIG_MA);

if [ "$NON_EBA_CONFIG_COST" != "2.00000000 USD" ]; then
    errorLog "ERROR: Non-EBA config cost was not set properly --- $NON_EBA_CONFIG_COST != 2.00000000 USD"
fi
if [ "$NON_EBA_CONFIG_ORACLE" != "eosio.oracle" ]; then
    errorLog "ERROR: Non-EBA config oracle account was not set properly --- $NON_EBA_CONFIG_ORACLE != eosio.oracle"
fi
if [ "$NON_EBA_CONFIG_MA_LENGTH" != "3" ]; then
    errorLog "ERROR: Non-EBA config moving average settings was not set properly --- $NON_EBA_CONFIG_MA_LENGTH != 3"
fi

infoLog "INFO: Validated Non-EBA config"

# Setup NFT
cleos -u $NODE_URL set contract eosio.nft.ft $CONTRACTS_DIR/eosio.nft.ft eosio.nft.ft.wasm eosio.nft.ft.abi -p eosio.nft.ft@owner
set +e
CHECK=$(cleos -u $NODE_URL get code eosio.nft.ft)
set -e

if [ -z "$CHECK" ]; then
    errorLog "ERROR: Did not find account for contract: eosio.nft.ft"
fi

if [ "$CHECK" != "code hash: 4594bfe388c2aebf05cdede4056c995d7b316c90c89a95f6626f99435a4d55b7" ]; then
    errorLog "ERROR: Account did not have a contract: eosio.nft.ft@1.23.0 -- onchain eosio.nft.ft.wasm:$CHECK -- expected 4594bfe388c2aebf05cdede4056c995d7b316c90c89a95f6626f99435a4d55b7"
fi

infoLog "INFO: Validated contract: 'eosio.nft.ft' (hash: b9cac0c90ef3002db09fe3b07dbbdb9138c652badf7f834248ac945005976cc0)"
        
cleos -u $NODE_URL push action eosio setpriv '["eosio.nft.ft", 1]' -p eosio@owner

CONFIGS=$(cleos get table eosio eosio global)
CONFIGS=$(jq -c '.rows' <<< "$CONFIGS");
if [ $(jq length <<< $CONFIGS) -ne 1 ]; then
    errorLog "ERROR: Invalid amount of rows in global config table"
fi
CONFIGS=$(jq -c '.[0]' <<< "$CONFIGS")
jq '.max_inline_action_size = 524287' <<< "$CONFIGS"
jq '.max_inline_action_depth = 10' <<< "$CONFIGS"
jq '.max_authority_depth = 10 | tostring' <<< "$CONFIGS"
eval "cleos -u $NODE_URL push action eosio setparams '[$CONFIGS]' -p eosio"
    
# Setup account structure
cleos -u $NODE_URL set account permission eosio.pool active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.pool@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.pool -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.pool@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.pool@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.pool@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.pool@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.pool@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.pool@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.pool owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.pool@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.pool -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.pool@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.pool@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.pool@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.pool@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.pool@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.pool@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.eosio active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.eosio@owner
cleos -u $NODE_URL set account permission ultra.eosio newaccount '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[{"permission":{"actor":"ultra","permission":"manage"},"weight":1}]}' active -p ultra.eosio@active
cleos -u $NODE_URL set action permission ultra.eosio eosio newaccount newaccount -p ultra.eosio@owner
cleos -u $NODE_URL set action permission ultra.eosio eosio.token open newaccount -p ultra.eosio@owner
cleos -u $NODE_URL set action permission ultra.eosio eosio newebact newaccount -p ultra.eosio@owner
cleos -u $NODE_URL set action permission ultra.eosio eosio.eba initeba newaccount -p ultra.eosio@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eosio -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "newaccount" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.eosio@newaccount -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.eosio@newaccount -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.eosio@newaccount -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
            ultramanage1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "manage" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultramanage1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.eosio@newaccount -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.eosio@newaccount - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultramanage1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.eosio@newaccount -- account:ultra@manage -- weight:1"
            fi
            ultramanage1=0
            
        
        infoLog "INFO: Validated 'ultra.eosio@newaccount' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.eosio manage '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"manage"},"weight":1}]}' active -p ultra.eosio@active
cleos -u $NODE_URL set action permission ultra.eosio eosio giftram manage -p ultra.eosio@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eosio -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "manage" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.eosio@manage -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.eosio@manage -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultramanage1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "manage" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultramanage1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.eosio@manage -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.eosio@manage - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultramanage1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.eosio@manage -- account:ultra@manage -- weight:1"
            fi
            ultramanage1=0
            
        
        infoLog "INFO: Validated 'ultra.eosio@manage' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.eosio setprods '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"manage"},"weight":1}]}' active -p ultra.eosio@active
cleos -u $NODE_URL set action permission ultra.eosio eosio setprods setprods -p ultra.eosio@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eosio -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "setprods" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.eosio@setprods -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.eosio@setprods -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultramanage1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "manage" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultramanage1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.eosio@setprods -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.eosio@setprods - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultramanage1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.eosio@setprods -- account:ultra@manage -- weight:1"
            fi
            ultramanage1=0
            
        
        infoLog "INFO: Validated 'ultra.eosio@setprods' permission structure"
    fi
    
done
    
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eosio -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.eosio@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.eosio@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.eosio@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.eosio@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.eosio@active -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.eosio@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.eosio owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.eosio@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eosio -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.eosio@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.eosio@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.eosio@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.eosio@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.eosio@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.eosio@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.kyc active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"admin"},"weight":1}]}'  -p ultra.kyc@owner
cleos -u $NODE_URL set account permission ultra.kyc manage '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"manage"},"weight":1}]}' active -p ultra.kyc@active
cleos -u $NODE_URL set action permission ultra.kyc eosio.kyc registerkyc manage -p ultra.kyc@owner
cleos -u $NODE_URL set action permission ultra.kyc eosio.kyc removekyc manage -p ultra.kyc@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.kyc -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "manage" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.kyc@manage -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.kyc@manage -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultramanage1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "manage" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultramanage1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.kyc@manage -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.kyc@manage - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultramanage1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.kyc@manage -- account:ultra@manage -- weight:1"
            fi
            ultramanage1=0
            
        
        infoLog "INFO: Validated 'ultra.kyc@manage' permission structure"
    fi
    
done
    
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.kyc -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.kyc@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.kyc@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraadmin1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "admin" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraadmin1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.kyc@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.kyc@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraadmin1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.kyc@active -- account:ultra@admin -- weight:1"
            fi
            ultraadmin1=0
            
        
        infoLog "INFO: Validated 'ultra.kyc@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.kyc owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.kyc@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.kyc -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.kyc@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.kyc@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.kyc@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.kyc@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.kyc@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.kyc@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.nft.ft active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"admin"},"weight":1}]}'  -p ultra.nft.ft@owner
cleos -u $NODE_URL set account permission ultra.nft.ft backend '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}' active -p ultra.nft.ft@active
cleos -u $NODE_URL set action permission ultra.nft.ft eosio.nft.ft create backend -p ultra.nft.ft@owner
cleos -u $NODE_URL set action permission ultra.nft.ft eosio.nft.ft update backend -p ultra.nft.ft@owner
cleos -u $NODE_URL set action permission ultra.nft.ft eosio.nft.ft issue backend -p ultra.nft.ft@owner
cleos -u $NODE_URL set action permission ultra.nft.ft eosio.nft.ft recall backend -p ultra.nft.ft@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.nft.ft -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "backend" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.nft.ft@backend -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.nft.ft@backend -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.nft.ft@backend -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.nft.ft@backend -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.nft.ft@backend - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'ultra.nft.ft@backend' permission structure"
    fi
    
done
    
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.nft.ft -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.nft.ft@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.nft.ft@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraadmin1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "admin" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraadmin1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.nft.ft@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.nft.ft@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraadmin1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.nft.ft@active -- account:ultra@admin -- weight:1"
            fi
            ultraadmin1=0
            
        
        infoLog "INFO: Validated 'ultra.nft.ft@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.nft.ft owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.nft.ft@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.nft.ft -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.nft.ft@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.nft.ft@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.nft.ft@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.nft.ft@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.nft.ft@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.nft.ft@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.swap active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1},{"permission":{"actor":"ultra.swap","permission":"eosio.code"},"weight":1}]}'  -p ultra.swap@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.swap -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.swap@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.swap@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            

            ultra_swapeosio_code1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "ultra.swap" ]; then
                    if [ "$PERMISSION" == "eosio.code" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultra_swapeosio_code1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.swap@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.swap@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.swap@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            

            if [ $ultra_swapeosio_code1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.swap@active -- account:ultra.swap@eosio.code -- weight:1"
            fi
            ultra_swapeosio_code1=0
            
        
        infoLog "INFO: Validated 'ultra.swap@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.swap owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p ultra.swap@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.swap -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.swap@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.swap@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.swap@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.swap@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.swap@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'ultra.swap@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.idp active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p ultra.idp@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.idp -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.idp@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.idp@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.idp@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.idp@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.idp@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'ultra.idp@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.idp owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.idp@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.idp -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.idp@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.idp@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.idp@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.idp@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.idp@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.idp@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.tier active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"admin"},"weight":1}]}'  -p ultra.tier@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.tier -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.tier@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.tier@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraadmin1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "admin" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraadmin1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.tier@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.tier@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraadmin1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.tier@active -- account:ultra@admin -- weight:1"
            fi
            ultraadmin1=0
            
        
        infoLog "INFO: Validated 'ultra.tier@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.tier owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.tier@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.tier -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.tier@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.tier@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.tier@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.tier@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.tier@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.tier@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.oracle active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"admin"},"weight":1}]}'  -p ultra.oracle@owner
cleos -u $NODE_URL set account permission ultra.oracle pushrate '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}' active -p ultra.oracle@active
cleos -u $NODE_URL set action permission ultra.oracle eosio.oracle pushrate pushrate -p ultra.oracle@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.oracle -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "pushrate" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.oracle@pushrate -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.oracle@pushrate -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.oracle@pushrate -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.oracle@pushrate -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.oracle@pushrate - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'ultra.oracle@pushrate' permission structure"
    fi
    
done
    
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.oracle -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.oracle@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.oracle@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraadmin1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "admin" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraadmin1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.oracle@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.oracle@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraadmin1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.oracle@active -- account:ultra@admin -- weight:1"
            fi
            ultraadmin1=0
            
        
        infoLog "INFO: Validated 'ultra.oracle@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.oracle owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.oracle@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.oracle -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.oracle@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.oracle@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.oracle@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.oracle@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.oracle@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.oracle@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.eba active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"admin"},"weight":1}]}'  -p ultra.eba@owner
cleos -u $NODE_URL set account permission ultra.eba updateauth '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}' active -p ultra.eba@active
cleos -u $NODE_URL set action permission ultra.eba eosio.eba updateactauth updateauth -p ultra.eba@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eba -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "updateauth" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.eba@updateauth -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.eba@updateauth -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.eba@updateauth -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.eba@updateauth -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.eba@updateauth - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'ultra.eba@updateauth' permission structure"
    fi
    
done
    
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eba -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.eba@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.eba@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraadmin1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "admin" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraadmin1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.eba@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.eba@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraadmin1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.eba@active -- account:ultra@admin -- weight:1"
            fi
            ultraadmin1=0
            
        
        infoLog "INFO: Validated 'ultra.eba@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.eba owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.eba@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.eba -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.eba@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.eba@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.eba@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.eba@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.eba@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.eba@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.games active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1}]}'  -p ultra.games@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.games -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.games@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.games@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.games@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
            uadbactive1=0
            

            uadcactive1=0
            

            uaddactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.games@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.games@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.games@active -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.games@active -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.games@active -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            
        
        infoLog "INFO: Validated 'ultra.games@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.games owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.games@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.games -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.games@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.games@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.games@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.games@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.games@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.games@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.tools active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"manage"},"weight":1}]}'  -p ultra.tools@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.tools -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.tools@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.tools@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultramanage1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "manage" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultramanage1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.tools@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.tools@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultramanage1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.tools@active -- account:ultra@manage -- weight:1"
            fi
            ultramanage1=0
            
        
        infoLog "INFO: Validated 'ultra.tools@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.tools owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.tools@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.tools -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.tools@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.tools@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.tools@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.tools@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.tools@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.tools@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uada active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[]}'  -p uada@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uada -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: uada@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uada@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uada@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uada@active -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uada@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uada@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'uada@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uada owner '{"threshold":4,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":3},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1},{"permission":{"actor":"uade","permission":"active"},"weight":1},{"permission":{"actor":"uadf","permission":"active"},"weight":1},{"permission":{"actor":"uadg","permission":"active"},"weight":1}]}'  -p uada@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uada -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "4" ]; then
            errorLog "ERROR: Permission threshold did not match: uada@owner -- 4 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "3" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uada@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3 = 0 ]; then
                errorLog "ERROR: Account does not have key: uada@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:3"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uada@owner -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
            uadbactive1=0
            

            uadcactive1=0
            

            uaddactive1=0
            

            uadeactive1=0
            

            uadfactive1=0
            

            uadgactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uada@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uada@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uada@owner -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uada@owner -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uada@owner -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            

            if [ $uadeactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uada@owner -- account:uade@active -- weight:1"
            fi
            uadeactive1=0
            

            if [ $uadfactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uada@owner -- account:uadf@active -- weight:1"
            fi
            uadfactive1=0
            

            if [ $uadgactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uada@owner -- account:uadg@active -- weight:1"
            fi
            uadgactive1=0
            
        
        infoLog "INFO: Validated 'uada@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadb active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[]}'  -p uadb@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadb -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: uadb@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadb@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadb@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadb@active -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadb@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadb@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'uadb@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadb owner '{"threshold":4,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":3},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1},{"permission":{"actor":"uade","permission":"active"},"weight":1},{"permission":{"actor":"uadf","permission":"active"},"weight":1},{"permission":{"actor":"uadg","permission":"active"},"weight":1}]}'  -p uadb@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadb -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "4" ]; then
            errorLog "ERROR: Permission threshold did not match: uadb@owner -- 4 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "3" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadb@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadb@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:3"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadb@owner -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
            uadaactive1=0
            

            uadcactive1=0
            

            uaddactive1=0
            

            uadeactive1=0
            

            uadfactive1=0
            

            uadgactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadb@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadb@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadb@owner -- account:uada@active -- weight:1"
            fi
            uadaactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadb@owner -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadb@owner -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            

            if [ $uadeactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadb@owner -- account:uade@active -- weight:1"
            fi
            uadeactive1=0
            

            if [ $uadfactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadb@owner -- account:uadf@active -- weight:1"
            fi
            uadfactive1=0
            

            if [ $uadgactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadb@owner -- account:uadg@active -- weight:1"
            fi
            uadgactive1=0
            
        
        infoLog "INFO: Validated 'uadb@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadc active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[]}'  -p uadc@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadc -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: uadc@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadc@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadc@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadc@active -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadc@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadc@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'uadc@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadc owner '{"threshold":4,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":3},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":1},{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1},{"permission":{"actor":"uade","permission":"active"},"weight":1},{"permission":{"actor":"uadf","permission":"active"},"weight":1},{"permission":{"actor":"uadg","permission":"active"},"weight":1}]}'  -p uadc@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadc -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "4" ]; then
            errorLog "ERROR: Permission threshold did not match: uadc@owner -- 4 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "3" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadc@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadc@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:3"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadc@owner -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
            uadaactive1=0
            

            uadbactive1=0
            

            uaddactive1=0
            

            uadeactive1=0
            

            uadfactive1=0
            

            uadgactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadc@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadc@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadc@owner -- account:uada@active -- weight:1"
            fi
            uadaactive1=0
            

            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadc@owner -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadc@owner -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            

            if [ $uadeactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadc@owner -- account:uade@active -- weight:1"
            fi
            uadeactive1=0
            

            if [ $uadfactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadc@owner -- account:uadf@active -- weight:1"
            fi
            uadfactive1=0
            

            if [ $uadgactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadc@owner -- account:uadg@active -- weight:1"
            fi
            uadgactive1=0
            
        
        infoLog "INFO: Validated 'uadc@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadd active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[]}'  -p uadd@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadd -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: uadd@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadd@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadd@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadd@active -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadd@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadd@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'uadd@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadd owner '{"threshold":4,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":3},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":1},{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uade","permission":"active"},"weight":1},{"permission":{"actor":"uadf","permission":"active"},"weight":1},{"permission":{"actor":"uadg","permission":"active"},"weight":1}]}'  -p uadd@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadd -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "4" ]; then
            errorLog "ERROR: Permission threshold did not match: uadd@owner -- 4 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "3" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadd@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadd@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:3"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadd@owner -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
            uadaactive1=0
            

            uadbactive1=0
            

            uadcactive1=0
            

            uadeactive1=0
            

            uadfactive1=0
            

            uadgactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadd@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadd@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadd@owner -- account:uada@active -- weight:1"
            fi
            uadaactive1=0
            

            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadd@owner -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadd@owner -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uadeactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadd@owner -- account:uade@active -- weight:1"
            fi
            uadeactive1=0
            

            if [ $uadfactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadd@owner -- account:uadf@active -- weight:1"
            fi
            uadfactive1=0
            

            if [ $uadgactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadd@owner -- account:uadg@active -- weight:1"
            fi
            uadgactive1=0
            
        
        infoLog "INFO: Validated 'uadd@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uade active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[]}'  -p uade@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uade -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: uade@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uade@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uade@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uade@active -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uade@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uade@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'uade@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uade owner '{"threshold":4,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":3},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":1},{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1},{"permission":{"actor":"uadf","permission":"active"},"weight":1},{"permission":{"actor":"uadg","permission":"active"},"weight":1}]}'  -p uade@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uade -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "4" ]; then
            errorLog "ERROR: Permission threshold did not match: uade@owner -- 4 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "3" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uade@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3 = 0 ]; then
                errorLog "ERROR: Account does not have key: uade@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:3"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uade@owner -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
            uadaactive1=0
            

            uadbactive1=0
            

            uadcactive1=0
            

            uaddactive1=0
            

            uadfactive1=0
            

            uadgactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uade@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uade@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uade@owner -- account:uada@active -- weight:1"
            fi
            uadaactive1=0
            

            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uade@owner -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uade@owner -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uade@owner -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            

            if [ $uadfactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uade@owner -- account:uadf@active -- weight:1"
            fi
            uadfactive1=0
            

            if [ $uadgactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uade@owner -- account:uadg@active -- weight:1"
            fi
            uadgactive1=0
            
        
        infoLog "INFO: Validated 'uade@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadf active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[]}'  -p uadf@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadf -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: uadf@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadf@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadf@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadf@active -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadf@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadf@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'uadf@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadf owner '{"threshold":4,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":3},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":1},{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1},{"permission":{"actor":"uade","permission":"active"},"weight":1},{"permission":{"actor":"uadg","permission":"active"},"weight":1}]}'  -p uadf@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadf -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "4" ]; then
            errorLog "ERROR: Permission threshold did not match: uadf@owner -- 4 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "3" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadf@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadf@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:3"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadf@owner -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
            uadaactive1=0
            

            uadbactive1=0
            

            uadcactive1=0
            

            uaddactive1=0
            

            uadeactive1=0
            

            uadgactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadf@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadf@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadf@owner -- account:uada@active -- weight:1"
            fi
            uadaactive1=0
            

            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadf@owner -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadf@owner -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadf@owner -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            

            if [ $uadeactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadf@owner -- account:uade@active -- weight:1"
            fi
            uadeactive1=0
            

            if [ $uadgactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadf@owner -- account:uadg@active -- weight:1"
            fi
            uadgactive1=0
            
        
        infoLog "INFO: Validated 'uadf@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadg active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[]}'  -p uadg@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadg -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: uadg@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadg@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadg@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadg@active -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadg@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadg@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'uadg@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission uadg owner '{"threshold":4,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":3},{"key":"EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX","weight":1}],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":1},{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1},{"permission":{"actor":"uade","permission":"active"},"weight":1},{"permission":{"actor":"uadf","permission":"active"},"weight":1}]}'  -p uadg@owner
set +e
CHECK=$(cleos -u $NODE_URL get account uadg -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "4" ]; then
            errorLog "ERROR: Permission threshold did not match: uadg@owner -- 4 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "3" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=1
                    fi
                fi
                

                if [ "$KEY" == "EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: uadg@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadg@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:3"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV3=0
            

            if [ $EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1 = 0 ]; then
                errorLog "ERROR: Account does not have key: uadg@owner -- key:EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX -- weight:1"
            fi
            EOS8dajNwmCPVfr2cNzyWZDwucn5CCPV7nRCYoBB2XAcgCEBWRctX1=0
            

        
            uadaactive1=0
            

            uadbactive1=0
            

            uadcactive1=0
            

            uaddactive1=0
            

            uadeactive1=0
            

            uadfactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: uadg@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: uadg@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadg@owner -- account:uada@active -- weight:1"
            fi
            uadaactive1=0
            

            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadg@owner -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadg@owner -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadg@owner -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            

            if [ $uadeactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadg@owner -- account:uade@active -- weight:1"
            fi
            uadeactive1=0
            

            if [ $uadfactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: uadg@owner -- account:uadf@active -- weight:1"
            fi
            uadfactive1=0
            
        
        infoLog "INFO: Validated 'uadg@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop1 active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p ultra.prop1@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop1 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop1@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop1@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.prop1@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop1@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop1@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'ultra.prop1@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop1 owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.prop1@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop1 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop1@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop1@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop1@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop1@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.prop1@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.prop1@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop2 active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p ultra.prop2@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop2 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop2@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop2@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.prop2@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop2@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop2@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'ultra.prop2@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop2 owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.prop2@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop2 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop2@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop2@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop2@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop2@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.prop2@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.prop2@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop3 active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p ultra.prop3@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop3 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop3@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop3@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.prop3@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop3@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop3@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'ultra.prop3@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop3 owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.prop3@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop3 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop3@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop3@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop3@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop3@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.prop3@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.prop3@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop4 active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p ultra.prop4@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop4 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop4@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop4@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.prop4@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop4@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop4@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'ultra.prop4@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop4 owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.prop4@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop4 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop4@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop4@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop4@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop4@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.prop4@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.prop4@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop5 active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p ultra.prop5@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop5 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop5@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop5@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: ultra.prop5@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop5@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop5@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'ultra.prop5@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra.prop5 owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"ultra","permission":"active"},"weight":1}]}'  -p ultra.prop5@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra.prop5 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra.prop5@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra.prop5@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            ultraactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "ultra" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultraactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra.prop5@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra.prop5@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $ultraactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra.prop5@owner -- account:ultra@active -- weight:1"
            fi
            ultraactive1=0
            
        
        infoLog "INFO: Validated 'ultra.prop5@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra active '{"threshold":4,"keys":[],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":1},{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1},{"permission":{"actor":"uade","permission":"active"},"weight":1},{"permission":{"actor":"uadf","permission":"active"},"weight":1},{"permission":{"actor":"uadg","permission":"active"},"weight":1}]}'  -p ultra@owner
cleos -u $NODE_URL set account permission ultra admin '{"threshold":3,"keys":[],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":1},{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1},{"permission":{"actor":"uade","permission":"active"},"weight":1},{"permission":{"actor":"uadf","permission":"active"},"weight":1},{"permission":{"actor":"uadg","permission":"active"},"weight":1}]}' active -p ultra@owner
cleos -u $NODE_URL set account permission ultra tech '{"threshold":2,"keys":[],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":1},{"permission":{"actor":"uadb","permission":"active"},"weight":1},{"permission":{"actor":"uadc","permission":"active"},"weight":1},{"permission":{"actor":"uadd","permission":"active"},"weight":1},{"permission":{"actor":"uade","permission":"active"},"weight":1},{"permission":{"actor":"uadf","permission":"active"},"weight":1},{"permission":{"actor":"uadg","permission":"active"},"weight":1}]}' admin -p ultra@owner
cleos -u $NODE_URL set account permission ultra manage '{"threshold":3,"keys":[],"accounts":[{"permission":{"actor":"uada","permission":"active"},"weight":2},{"permission":{"actor":"uadb","permission":"active"},"weight":2},{"permission":{"actor":"uadc","permission":"active"},"weight":2},{"permission":{"actor":"uadd","permission":"active"},"weight":2},{"permission":{"actor":"uade","permission":"active"},"weight":2},{"permission":{"actor":"uadf","permission":"active"},"weight":2},{"permission":{"actor":"uadg","permission":"active"},"weight":2},{"permission":{"actor":"ultra.prop1","permission":"active"},"weight":1},{"permission":{"actor":"ultra.prop2","permission":"active"},"weight":1},{"permission":{"actor":"ultra.prop3","permission":"active"},"weight":1},{"permission":{"actor":"ultra.prop4","permission":"active"},"weight":1},{"permission":{"actor":"ultra.prop5","permission":"active"},"weight":1}]}' tech -p ultra@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "manage" ]; then            
        if [ "$THRESHOLD" != "3" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra@manage -- 3 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra@manage -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            uadaactive2=0
            

            uadbactive2=0
            

            uadcactive2=0
            

            uaddactive2=0
            

            uadeactive2=0
            

            uadfactive2=0
            

            uadgactive2=0
            

            ultra_prop1active1=0
            

            ultra_prop2active1=0
            

            ultra_prop3active1=0
            

            ultra_prop4active1=0
            

            ultra_prop5active1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "2" ]; then
                            FOUND=1
                            uadaactive2=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "2" ]; then
                            FOUND=1
                            uadbactive2=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "2" ]; then
                            FOUND=1
                            uadcactive2=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "2" ]; then
                            FOUND=1
                            uaddactive2=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "2" ]; then
                            FOUND=1
                            uadeactive2=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "2" ]; then
                            FOUND=1
                            uadfactive2=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "2" ]; then
                            FOUND=1
                            uadgactive2=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "ultra.prop1" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultra_prop1active1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "ultra.prop2" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultra_prop2active1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "ultra.prop3" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultra_prop3active1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "ultra.prop4" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultra_prop4active1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "ultra.prop5" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            ultra_prop5active1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra@manage -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra@manage - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive2 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:uada@active -- weight:2"
            fi
            uadaactive2=0
            

            if [ $uadbactive2 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:uadb@active -- weight:2"
            fi
            uadbactive2=0
            

            if [ $uadcactive2 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:uadc@active -- weight:2"
            fi
            uadcactive2=0
            

            if [ $uaddactive2 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:uadd@active -- weight:2"
            fi
            uaddactive2=0
            

            if [ $uadeactive2 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:uade@active -- weight:2"
            fi
            uadeactive2=0
            

            if [ $uadfactive2 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:uadf@active -- weight:2"
            fi
            uadfactive2=0
            

            if [ $uadgactive2 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:uadg@active -- weight:2"
            fi
            uadgactive2=0
            

            if [ $ultra_prop1active1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:ultra.prop1@active -- weight:1"
            fi
            ultra_prop1active1=0
            

            if [ $ultra_prop2active1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:ultra.prop2@active -- weight:1"
            fi
            ultra_prop2active1=0
            

            if [ $ultra_prop3active1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:ultra.prop3@active -- weight:1"
            fi
            ultra_prop3active1=0
            

            if [ $ultra_prop4active1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:ultra.prop4@active -- weight:1"
            fi
            ultra_prop4active1=0
            

            if [ $ultra_prop5active1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@manage -- account:ultra.prop5@active -- weight:1"
            fi
            ultra_prop5active1=0
            
        
        infoLog "INFO: Validated 'ultra@manage' permission structure"
    fi
    
done
    
set +e
CHECK=$(cleos -u $NODE_URL get account ultra -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "tech" ]; then            
        if [ "$THRESHOLD" != "2" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra@tech -- 2 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra@tech -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            uadaactive1=0
            

            uadbactive1=0
            

            uadcactive1=0
            

            uaddactive1=0
            

            uadeactive1=0
            

            uadfactive1=0
            

            uadgactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra@tech -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra@tech - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@tech -- account:uada@active -- weight:1"
            fi
            uadaactive1=0
            

            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@tech -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@tech -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@tech -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            

            if [ $uadeactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@tech -- account:uade@active -- weight:1"
            fi
            uadeactive1=0
            

            if [ $uadfactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@tech -- account:uadf@active -- weight:1"
            fi
            uadfactive1=0
            

            if [ $uadgactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@tech -- account:uadg@active -- weight:1"
            fi
            uadgactive1=0
            
        
        infoLog "INFO: Validated 'ultra@tech' permission structure"
    fi
    
done
    
set +e
CHECK=$(cleos -u $NODE_URL get account ultra -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "admin" ]; then            
        if [ "$THRESHOLD" != "3" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra@admin -- 3 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra@admin -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            uadaactive1=0
            

            uadbactive1=0
            

            uadcactive1=0
            

            uaddactive1=0
            

            uadeactive1=0
            

            uadfactive1=0
            

            uadgactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra@admin -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra@admin - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@admin -- account:uada@active -- weight:1"
            fi
            uadaactive1=0
            

            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@admin -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@admin -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@admin -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            

            if [ $uadeactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@admin -- account:uade@active -- weight:1"
            fi
            uadeactive1=0
            

            if [ $uadfactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@admin -- account:uadf@active -- weight:1"
            fi
            uadfactive1=0
            

            if [ $uadgactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@admin -- account:uadg@active -- weight:1"
            fi
            uadgactive1=0
            
        
        infoLog "INFO: Validated 'ultra@admin' permission structure"
    fi
    
done
    
set +e
CHECK=$(cleos -u $NODE_URL get account ultra -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "4" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra@active -- 4 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            uadaactive1=0
            

            uadbactive1=0
            

            uadcactive1=0
            

            uaddactive1=0
            

            uadeactive1=0
            

            uadfactive1=0
            

            uadgactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfactive1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@active -- account:uada@active -- weight:1"
            fi
            uadaactive1=0
            

            if [ $uadbactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@active -- account:uadb@active -- weight:1"
            fi
            uadbactive1=0
            

            if [ $uadcactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@active -- account:uadc@active -- weight:1"
            fi
            uadcactive1=0
            

            if [ $uaddactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@active -- account:uadd@active -- weight:1"
            fi
            uaddactive1=0
            

            if [ $uadeactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@active -- account:uade@active -- weight:1"
            fi
            uadeactive1=0
            

            if [ $uadfactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@active -- account:uadf@active -- weight:1"
            fi
            uadfactive1=0
            

            if [ $uadgactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@active -- account:uadg@active -- weight:1"
            fi
            uadgactive1=0
            
        
        infoLog "INFO: Validated 'ultra@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission ultra owner '{"threshold":4,"keys":[],"accounts":[{"permission":{"actor":"uada","permission":"owner"},"weight":1},{"permission":{"actor":"uadb","permission":"owner"},"weight":1},{"permission":{"actor":"uadc","permission":"owner"},"weight":1},{"permission":{"actor":"uadd","permission":"owner"},"weight":1},{"permission":{"actor":"uade","permission":"owner"},"weight":1},{"permission":{"actor":"uadf","permission":"owner"},"weight":1},{"permission":{"actor":"uadg","permission":"owner"},"weight":1}]}'  -p ultra@owner
set +e
CHECK=$(cleos -u $NODE_URL get account ultra -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "4" ]; then
            errorLog "ERROR: Permission threshold did not match: ultra@owner -- 4 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: ultra@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            uadaowner1=0
            

            uadbowner1=0
            

            uadcowner1=0
            

            uaddowner1=0
            

            uadeowner1=0
            

            uadfowner1=0
            

            uadgowner1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "uada" ]; then
                    if [ "$PERMISSION" == "owner" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadaowner1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadb" ]; then
                    if [ "$PERMISSION" == "owner" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadbowner1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadc" ]; then
                    if [ "$PERMISSION" == "owner" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadcowner1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadd" ]; then
                    if [ "$PERMISSION" == "owner" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uaddowner1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uade" ]; then
                    if [ "$PERMISSION" == "owner" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadeowner1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadf" ]; then
                    if [ "$PERMISSION" == "owner" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadfowner1=1
                        fi
                    fi
                fi
                

                if [ "$ACTOR" == "uadg" ]; then
                    if [ "$PERMISSION" == "owner" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            uadgowner1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: ultra@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: ultra@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $uadaowner1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@owner -- account:uada@owner -- weight:1"
            fi
            uadaowner1=0
            

            if [ $uadbowner1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@owner -- account:uadb@owner -- weight:1"
            fi
            uadbowner1=0
            

            if [ $uadcowner1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@owner -- account:uadc@owner -- weight:1"
            fi
            uadcowner1=0
            

            if [ $uaddowner1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@owner -- account:uadd@owner -- weight:1"
            fi
            uaddowner1=0
            

            if [ $uadeowner1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@owner -- account:uade@owner -- weight:1"
            fi
            uadeowner1=0
            

            if [ $uadfowner1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@owner -- account:uadf@owner -- weight:1"
            fi
            uadfowner1=0
            

            if [ $uadgowner1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: ultra@owner -- account:uadg@owner -- weight:1"
            fi
            uadgowner1=0
            
        
        infoLog "INFO: Validated 'ultra@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio.prods","permission":"active"},"weight":1}]}'  -p eosio@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosio_prodsactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio.prods" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosio_prodsactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosio_prodsactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio@active -- account:eosio.prods@active -- weight:1"
            fi
            eosio_prodsactive1=0
            
        
        infoLog "INFO: Validated 'eosio@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio.prods","permission":"active"},"weight":1}]}'  -p eosio@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosio_prodsactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio.prods" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosio_prodsactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosio_prodsactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio@owner -- account:eosio.prods@active -- weight:1"
            fi
            eosio_prodsactive1=0
            
        
        infoLog "INFO: Validated 'eosio@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.wrap active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.wrap@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.wrap -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.wrap@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.wrap@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.wrap@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.wrap@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.wrap@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.wrap@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.wrap owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.wrap@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.wrap -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.wrap@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.wrap@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.wrap@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.wrap@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.wrap@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.wrap@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.msig active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.msig@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.msig -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.msig@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.msig@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.msig@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.msig@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.msig@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.msig@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.msig owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.msig@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.msig -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.msig@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.msig@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.msig@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.msig@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.msig@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.msig@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.token active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.token@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.token -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.token@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.token@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.token@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.token@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.token@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.token@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.token owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.token@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.token -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.token@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.token@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.token@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.token@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.token@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.token@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.stake active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.stake@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.stake -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.stake@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.stake@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.stake@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.stake@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.stake@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.stake@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.stake owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.stake@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.stake -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.stake@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.stake@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.stake@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.stake@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.stake@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.stake@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.ram active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.ram@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.ram -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.ram@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.ram@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.ram@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.ram@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.ram@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.ram@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.ram owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.ram@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.ram -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.ram@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.ram@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.ram@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.ram@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.ram@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.ram@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.kyc active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.kyc@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.kyc -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.kyc@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.kyc@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.kyc@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.kyc@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.kyc@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.kyc@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.kyc owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.kyc@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.kyc -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.kyc@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.kyc@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.kyc@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.kyc@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.kyc@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.kyc@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.oracle active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.oracle@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.oracle -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.oracle@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.oracle@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.oracle@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.oracle@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.oracle@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.oracle@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.oracle owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.oracle@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.oracle -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.oracle@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.oracle@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.oracle@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.oracle@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.oracle@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.oracle@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.nft.ft active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.nft.ft@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.nft.ft -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.nft.ft@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.nft.ft@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.nft.ft@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.nft.ft@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.nft.ft@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.nft.ft@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.nft.ft owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.nft.ft@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.nft.ft -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.nft.ft@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.nft.ft@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.nft.ft@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.nft.ft@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.nft.ft@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.nft.ft@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.eba active '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.eba@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.eba -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.eba@active -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.eba@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.eba@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.eba@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.eba@active -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.eba@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission eosio.eba owner '{"threshold":1,"keys":[],"accounts":[{"permission":{"actor":"eosio","permission":"active"},"weight":1}]}'  -p eosio.eba@owner
set +e
CHECK=$(cleos -u $NODE_URL get account eosio.eba -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: eosio.eba@owner -- 1 != $THRESHOLD"
        fi

        
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: eosio.eba@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        

        
            eosioactive1=0
            
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
                if [ "$ACTOR" == "eosio" ]; then
                    if [ "$PERMISSION" == "active" ]; then
                        if [ "$WEIGHT" == "1" ]; then
                            FOUND=1
                            eosioactive1=1
                        fi
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: eosio.eba@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: eosio.eba@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
            if [ $eosioactive1 = 0 ]; then
                errorLog "ERROR: Account does not have account inside permission: eosio.eba@owner -- account:eosio@active -- weight:1"
            fi
            eosioactive1=0
            
        
        infoLog "INFO: Validated 'eosio.eba@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission produceracc1 active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p produceracc1@owner
set +e
CHECK=$(cleos -u $NODE_URL get account produceracc1 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: produceracc1@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: produceracc1@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: produceracc1@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: produceracc1@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: produceracc1@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'produceracc1@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission produceracc1 owner '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p produceracc1@owner
set +e
CHECK=$(cleos -u $NODE_URL get account produceracc1 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: produceracc1@owner -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: produceracc1@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: produceracc1@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: produceracc1@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: produceracc1@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'produceracc1@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission produceracc2 active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p produceracc2@owner
set +e
CHECK=$(cleos -u $NODE_URL get account produceracc2 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: produceracc2@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: produceracc2@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: produceracc2@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: produceracc2@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: produceracc2@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'produceracc2@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission produceracc2 owner '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p produceracc2@owner
set +e
CHECK=$(cleos -u $NODE_URL get account produceracc2 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: produceracc2@owner -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: produceracc2@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: produceracc2@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: produceracc2@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: produceracc2@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'produceracc2@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission produceracc3 active '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p produceracc3@owner
set +e
CHECK=$(cleos -u $NODE_URL get account produceracc3 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "active" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: produceracc3@active -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: produceracc3@active -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: produceracc3@active -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: produceracc3@active -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: produceracc3@active - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'produceracc3@active' permission structure"
    fi
    
done
    
cleos -u $NODE_URL set account permission produceracc3 owner '{"threshold":1,"keys":[{"key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV","weight":1}],"accounts":[]}'  -p produceracc3@owner
set +e
CHECK=$(cleos -u $NODE_URL get account produceracc3 -j)
set -e

PERMISSIONS=$(jq -c '.permissions' <<< "$CHECK");
for row in $(jq -c '.[]' <<< "$PERMISSIONS"); do

    
    PERM=$(jq -r '.perm_name' <<< "$row")
    THRESHOLD=$(jq -r '.required_auth.threshold' <<< "$row")
    KEYS=$(jq -c '.required_auth.keys' <<< "$row")
    ACCOUNTS=$(jq -c '.required_auth.accounts' <<< "$row")
     
    if [ "$PERM" == "owner" ]; then            
        if [ "$THRESHOLD" != "1" ]; then
            errorLog "ERROR: Permission threshold did not match: produceracc3@owner -- 1 != $THRESHOLD"
        fi

        
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            
        
        for key in $(jq -c '.[]' <<< "$KEYS"); do
            
            KEY=$(jq -r '.key' <<< "$key")
            WEIGHT=$(jq -r '.weight' <<< "$key")
            
            FOUND=0
            
                if [ "$KEY" == "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV" ]; then
                    if [ "$WEIGHT" == "1" ]; then
                        FOUND=1
                        EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=1
                    fi
                fi
                
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected key inside permission: produceracc3@owner -- key:$KEY -- weight:$WEIGHT"
            fi
            
        done

        
            if [ $EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1 = 0 ]; then
                errorLog "ERROR: Account does not have key: produceracc3@owner -- key:EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -- weight:1"
            fi
            EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV1=0
            

        
        
        for account in $(jq -c '.[]' <<< "$ACCOUNTS"); do
            
            ACTOR=$(jq -r '.permission.actor' <<< "$account")
            PERMISSION=$(jq -r '.permission.permission' <<< "$account")
            WEIGHT=$(jq -r '.weight' <<< "$account")
            
            FOUND=0
            
            
            if [ $FOUND = 0 ]; then
                errorLog "ERROR: Account has unexpected account inside permission: produceracc3@owner -- account:$ACTOR@$PERMISSION -- weight:$WEIGHT"
            else
                infoLog "INFO: Account validated: produceracc3@owner - $ACTOR@$PERMISSION"
            fi
            
        done

        
        
        infoLog "INFO: Validated 'produceracc3@owner' permission structure"
    fi
    
done
    
cleos -u $NODE_URL push action eosio regproducer '["produceracc1", "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "", 0]' -p produceracc1@active
cleos -u $NODE_URL push action eosio regproducer '["produceracc2", "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "", 0]' -p produceracc2@active
cleos -u $NODE_URL push action eosio regproducer '["produceracc3", "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "", 0]' -p produceracc3@active
cleos push action eosio setprods '[["produceracc1","produceracc2","produceracc3"]]' -p ultra.eosio
cleos -u $NODE_URL push action eosio activatechn '[]' -p ultra.eosio
# ./test_bootup.sh -u $NODE_URL

# update config.ini
sed -i '/producer-name/c\producer-name = produceracc1' /opt/eosio/producer/settings/config.ini

