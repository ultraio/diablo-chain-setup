#!/bin/bash
set -x

EOS_PRI_KEY=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
EOS_PUB_KEY=EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

USER_PRI_KEY=5KHkuRdH1dXh1kYNkfsEFtzLZu8uNvoqMKGAxv3KZkJAxSr6ikr
USER_PUB_KEY=EOS7i1PgEe399sjbhhS6umNFU6okzit96chj8NtpBRzy6XpDYXUH9

EOS_ACCOUNTS=("eosio.bpay" "eosio.msig" "eosio.wrap" "eosio.ram" "eosio.ramfee" "eosio.saving" "eosio.stake" "eosio.token")
SCRIPT_DIRECTORY="$(dirname "$(readlink -fm "$0")")"
CONTRACT_DIRECTORY="${SCRIPT_DIRECTORY}/contracts"

ultra_id=1

CLEOS="${SCRIPT_DIRECTORY}/bin/cleos"

NUMBER_OF_PRODUCERS=0
PRODUCER_ACCOUNTS=()
MAX_PRODUCERS=20
DELAY_AFTER_START_NODEOS=10

RUN_IN_CONTAINER=false
RUN_TEST=false

function usage() {
   printf "Usage: $0 OPTION...
  -p NUMBER     Specific number of nodeos default to 1 max to 21. If more than 1, first node will be genesis node and other will act as producers.
  -d TIME       Specific delay time after start a nodeos.
  -c            running in a container
  -t
   \\n" "$0" 1>&2
   exit 1
}


if [ $# -ne 0 ]; then
  while getopts "p:d:ct" opt; do
    case "${opt}" in
      p )
        NUMBER_OF_PRODUCERS=$OPTARG
        if [[ $OPTARG -gt $MAX_PRODUCERS ]]; then
          NUMBER_OF_PRODUCERS=$MAX_PRODUCERS
        fi
      ;;
      d )
        DELAY_AFTER_START_NODEOS=$OPTARG
      ;;
      h )
        usage
      ;;
      c )
        RUN_IN_CONTAINER=true
      ;;
      t )
        RUN_TEST=true
      ;;
      ? )
        echo "Invalid Option!" 1>&2
        usage
      ;;
      : )
        echo "Invalid Option: -${OPTARG} requires an argument." 1>&2
        usage
      ;;
      * )
        usage
      ;;
    esac
  done
fi

# create wallet and import keys, or unlock existing ones
function prepare_wallet(){
  if [[ $RUN_IN_CONTAINER = false ]]; then
    rm -rf ${HOME}/eosio-wallet
    sleep 3
  fi

  # start keosd (http-max-response-time-ms necessary so that cleos command don't time out)
  # keosd --http-max-response-time-ms=30000 & 
  # sleep 10 # to make sure keosd is started correctly before continue

  # create a 'test' wallet with its password written to ${HOME}/WalletPWD
  ${CLEOS} wallet create -n test --file ${HOME}/WalletPWD

  # import key pairs
  ${CLEOS} wallet import -n test --private-key=${EOS_PRI_KEY}
  ${CLEOS} wallet import -n test --private-key=${USER_PRI_KEY}
}

function prepare_nodeos_config(){
  # target_file=${SCRIPT_DIRECTORY}/kafka_config.ini

  # if [[ $RUN_IN_CONTAINER = false ]]; then
    # init_file=${SCRIPT_DIRECTORY}/kafka_config.ini
    # target_file=${SCRIPT_DIRECTORY}/kafka_plugin/kafka_config.init
    # cp ${init_file} ${target_file}
  # fi

  # echo "" >> ${target_file}
  # echo "producer-name=eosio" >> $target_file
  if [[ $NUMBER_OF_PRODUCERS -gt 0 ]]; then
    for ((pi = 1; pi <= $NUMBER_OF_PRODUCERS; ++pi))
    do
      # p_name=$(cat /dev/urandom | tr -dc 'a-z1-5' | fold -w 12 | head -n 1)
      PRODUCER_ACCOUNTS+=("produceracc${pi}")
      # echo "producer-name=${p_name}" >> ${target_file}
    done
  fi
}

# for testing firt parameter for producer index (0 is reserved for eosio) 2nd and 3rd for public and private key
# export environment_parameter=production;
# export message_format=json;
function start_nodeos(){
  # get corresponding env vars

  ku=
  mf=
  ep=

  if [ -n "$kafka_uri" ]; then
    ku="--kafka-uri $kafka_uri"
  fi
  printf "\n kafka-uri: $ku \n"

  if [ -n "$message_format" ];then
       mf="--message-format $message_format"
  fi
  printf "\n message-format: $mf \n"

  if [ -n "$environment_parameter" ]; then
    ep="--environment-parameter $environment_parameter"
  fi
  printf "\n environment-parameter: $ep \n"

  ssl0=
 
  ssl1=
 
  ssl2=
 
  ssl3=

  printf "\n ssl-enabled: $ssl_enabled \n"

  if [ "$ssl_enabled" = "true" ]; then
    ssl0="--ssl-enabled"

    if [ -n "$ssl_key_location" ]; then
         ssl1="--ssl-key-location $ssl_key_location"
    fi
    printf "\n ssl-key-location: $ssl_key_location \n"

    if [ -n "$ssl_certificate_location" ]; then
         ssl2="--ssl-certificate-location $ssl_certificate_location"
    fi
    printf "\n ssl-certificate-location: $ssl_certificate_location \n"

    if [ -n "$ssl_ca_location" ]; then
         ssl3="--ssl-ca-location $ssl_ca_location"
    fi
    printf "\n ssl-ca-location: $ssl_ca_location \n"
  fi

  cors=
  if [ "$cors_enabled" = "true" ]; then
    cors='--access-control-allow-origin=* --access-control-allow-headers=* --access-control-allow-credentials'
  fi
  printf "\n $cors \n"
  
  if [[ $RUN_IN_CONTAINER = true ]]; then
    nodeos -e -p eosio $ku $mf $ep $ssl0 $ssl1 $ssl2 $ssl3 $cors \
    --genesis-json ${SCRIPT_DIRECTORY}/genesis.json \
    --config-dir ${SCRIPT_DIRECTORY}/config \
    -c ${SCRIPT_DIRECTORY}/kafka_config.ini \
    --data-dir ${SCRIPT_DIRECTORY}/kafka_plugin/data \
    --delete-all-blocks &
  else
    gnome-terminal --tab -x bash -c \
    "nodeos --signature-provider=${EOS_PUB_KEY}=KEY:${EOS_PRI_KEY} \
    $ku $mf $ep $ssl0 $ssl1 $ssl2 $ssl3 $cors \
    --genesis-json ${SCRIPT_DIRECTORY}/genesis.json \
    --config-dir ${SCRIPT_DIRECTORY}/config \
    -c ${SCRIPT_DIRECTORY}/kafka_plugin/kafka_config.init \
    --data-dir ${SCRIPT_DIRECTORY}/kafka_plugin/data \
    --delete-all-blocks"
  fi

}

function create_system_accounts(){
  for i in "${EOS_ACCOUNTS[@]}"; do
    ${CLEOS} create account eosio $i ${EOS_PUB_KEY}
  done

  # create ultra root account
  ${CLEOS} create account eosio ultra ${EOS_PUB_KEY}
  ${CLEOS} create account eosio ultra.eosio ${EOS_PUB_KEY}

  # prepare preactivate features
  curl -X POST http://127.0.0.1:8888/v1/producer/schedule_protocol_feature_activations -d '{"protocol_features_to_activate": ["0ec7e080177b2c02b278d5088611686b49d739925a92d9bfcacd7fc6b74053bd"]}' | jq .

  sleep 3

  # if [[ $RUN_IN_CONTAINER = true ]]; then
  #   ${CLEOS} set contract eosio ./build/contracts/eosio.bios eosio.bios.wasm eosio.bios.abi -p eosio

  # else
    ${CLEOS} set contract eosio ${CONTRACT_DIRECTORY}/eosio.bios.1.8.3 eosio.bios.wasm eosio.bios.abi -p eosio
  # fi

  ${CLEOS} push action eosio activate '["f0af56d2c5a48d60a4a5b5c903edfb7db3a736a94ed589d0b797df33ff9d3e1d"]' -p eosio # GET_SENDER
  ${CLEOS} push action eosio activate '["2652f5f96006294109b3dd0bbde63693f55324af452b799ee137a81a905eed25"]' -p eosio # FORWARD_SETCODE
  ${CLEOS} push action eosio activate '["8ba52fe7a3956c5cd3a656a3174b931d3bb2abb45578befc59f283ecd816a405"]' -p eosio # ONLY_BILL_FIRST_AUTHORIZER
  ${CLEOS} push action eosio activate '["ad9e3d8f650687709fd68f4b90b41f7d825a365b02c23a636cef88ac2ac00c43"]' -p eosio # RESTRICT_ACTION_TO_SELF
  ${CLEOS} push action eosio activate '["68dcaa34c0517d19666e6b33add67351d8c5f69e999ca1e37931bc410a297428"]' -p eosio # DISALLOW_EMPTY_PRODUCER_SCHEDULE
  ${CLEOS} push action eosio activate '["e0fb64b1085cc5538970158d05a009c24e276fb94e1a0bf6a528b48fbc4ff526"]' -p eosio # FIX_LINKAUTH_RESTRICTION
  ${CLEOS} push action eosio activate '["ef43112c6543b88db2283a2e077278c315ae2c84719a8b25f25cc88565fbea99"]' -p eosio # REPLACE_DEFERRED
  ${CLEOS} push action eosio activate '["4a90c00d55454dc5b059055ca213579c6ea856967712a56017487886a4d4cc0f"]' -p eosio # NO_DUPLICATE_DEFERRED_ID
  ${CLEOS} push action eosio activate '["1a99a59d87e06e09ec5b028a9cbb7749b4a5ad8819004365d02dc4379a8b7241"]' -p eosio # ONLY_LINK_TO_EXISTING_PERMISSION
  ${CLEOS} push action eosio activate '["4e7bf348da00a945489b2a681749eb56f5de00b900014e137ddae39f48f69d67"]' -p eosio # RAM_RESTRICTIONS

  # the following two features digest are different from the description digest given in protocol feature manager
  ${CLEOS} push action eosio activate '["4fca8bd82bbd181e714e283f83e1b45d95ca5af40fb89ad3977b653c448f78c2"]' -p eosio # WEBAUTHN_KEY
  ${CLEOS} push action eosio activate '["299dcb6af692324b899b39f16d5a530a33062804e41f09dc97e9f156b4476707"]' -p eosio # WTMSIG_BLOCK_SIGNATURES
 
  # wait for the above feature to be ready, new system contracts depending on WTMSIG_BLOCK_SIGNATURES.
  sleep 3

  ## TODO: Investigate if there's anything need to be done with this contract on the mainnet
  # ${CLEOS} set contract eosio ./build/contracts/eosio.bios eosio.bios.wasm eosio.bios.abi -p eosio
  # sleep 1
}

#create and issue 1 billion system token
function setup_system_token(){
  ${CLEOS} set contract eosio.token ${CONTRACT_DIRECTORY}/eosio.token eosio.token.wasm eosio.token.abi

  # ${CLEOS} push action eosio.token init '[]' -p ultra

  # fix-1 set up permison so that eosio.token@code can send inline with auth from its own active permission
  ${CLEOS} set account permission eosio.token active --add-code eosio.token owner -p eosio.token@owner

  ${CLEOS} push action eosio.token create '["ultra","1000000000.00000000 UOS", ""]' -p eosio.token

  ${CLEOS} push action eosio.token open '["eosio", "8,UOS", "eosio"]' -p eosio
  ${CLEOS} push action eosio.token open '["ultra", "8,UOS", "ultra"]' -p ultra

  ${CLEOS} push action eosio.token issue '["ultra","1000000000.00000000 UOS", ""]' -p ultra

  # fix-2 set up pemission so that eosio.token can bill ram from issuer when it doesn't have signature from the issuer for a transaction such as transfer
  ${CLEOS} set account permission ultra active --add-code eosio.token owner -p ultra@owner

  # transfer some UOS to ultra
  ${CLEOS} push action eosio.token transfer '["ultra", "eosio", "100000000.00000000 UOS", ""]' -p ultra
}

function setup_system_contract(){
  # sets eosio.msig as privileged account
  ${CLEOS} set contract eosio.msig ${CONTRACT_DIRECTORY}/eosio.msig eosio.msig.wasm eosio.msig.abi
  ${CLEOS} push action eosio setpriv '["eosio.msig", 1]' -p eosio

  # sets eosio.wrap as privileged account
  ${CLEOS} set contract eosio.wrap ${CONTRACT_DIRECTORY}/eosio.wrap eosio.wrap.wasm eosio.wrap.abi
  ${CLEOS} push action eosio setpriv '["eosio.wrap", 1]' -p eosio


  ${CLEOS} set contract eosio ${CONTRACT_DIRECTORY}/eosio.system eosio.system.wasm eosio.system.abi  

  ${CLEOS} push action eosio init '[0,"8,UOS"]' -p eosio

  #ultra reserve ram 1 GB
  ${CLEOS} push action eosio resvrambytes '["1073741824"]' -p ultra.eosio
}

function setup_producers
{
  if [[ $NUMBER_OF_PRODUCERS -gt 0 ]]; then

    prods_strings=()
    # create producer account and register producer
    for ai in "${PRODUCER_ACCOUNTS[@]}"
    do
      # create new account for producer
      ${CLEOS} system newaccount ultra.eosio ${ai} ${EOS_PUB_KEY} --transfer --gift-ram-kbytes 8192 -p ultra.eosio --ultra-id ${ultra_id}
      ultra_id=$(( ultra_id + 1 ))
      ${CLEOS} push action eosio.token open '["'${ai}'", "8,UOS", "'${ai}'"]' -p ${ai}
      # register new producer
      ${CLEOS} system regproducer ${ai} ${EOS_PUB_KEY} https:://${ai}.com/${EOS_PUB_KEY} -p ${ai}
      prods_strings+=("\"${ai}\"")
    done
    prods="$(IFS=","; echo "${prods_strings[*]}")" # prods='"produceraccproduceracc1","produceraccproduceracc2","produceraccproduceracc3"'
    ${CLEOS} push action eosio setprods '[['"${prods}"']]' -p ultra.eosio

    resign_eosio_accounts
  fi
}

function resign_eosio_accounts() {
  for i in "${EOS_ACCOUNTS[@]}"; do
    first="{\"account\": \"$i\", \"permission\": \"owner\", \"parent\": \"\", \"auth\": {\"threshold\": 1, \"keys\": [], \"waits\": [], \"accounts\": [{\"weight\": 1, \"permission\": {\"actor\": \"eosio\", \"permission\": \"active\"}}]}}"
    second="{\"account\": \"$i\", \"permission\": \"active\", \"parent\": \"owner\", \"auth\": {\"threshold\": 1, \"keys\": [], \"waits\": [], \"accounts\": [{\"weight\": 1, \"permission\": {\"actor\": \"eosio\", \"permission\": \"active\"}}]}}"
    ${CLEOS} push action eosio updateauth "$first" -p $i@owner
    ${CLEOS} push action eosio updateauth "$second" -p $i@owner
  done

  # ${CLEOS} set account permission eosio.token active --add-code eosio.token owner -p eosio.token

  ${CLEOS} push action eosio updateauth '{"account": "eosio", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.prods", "permission": "active"}}]}}' -p eosio@owner
  ${CLEOS} push action eosio updateauth '{"account": "eosio", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.prods", "permission": "active"}}]}}' -p eosio@owner

  # activate chain start new producer schedule
  ${CLEOS} push action eosio activatechn '[]' -p ultra.eosio

  # let switch to new producer first
  sleep 3
}

function setup_ultra_accounts() {
  ultranft_id=$ultra_id
  ultra_id=$(( ultra_id + 1 ))

  ultrashop_id=$ultra_id
  ultra_id=$(( ultra_id + 1 ))

  ultramlrp_id=$ultra_id
  ultra_id=$(( ultra_id + 1 ))

  ultrapromoter_id=$ultra_id
  ultra_id=$(( ultra_id + 1 ))

  # create ultra.shop account and deploy shop contract
  ${CLEOS} system newaccount ultra ultra.shop  ${EOS_PUB_KEY} --transfer --gift-ram-kbytes 5000  -p ultra --ultra-id ${ultranft_id}
  ${CLEOS} set contract ultra.shop ${CONTRACT_DIRECTORY}/ultra.shop ultra.shop.wasm ultra.shop.abi
  ${CLEOS} set account permission ultra.shop active --add-code ultra.shop owner -p ultra.shop
  
  # create ultra.nft account and deploy nft contract
  ${CLEOS} system newaccount ultra ultra.nft  ${EOS_PUB_KEY} --transfer --gift-ram-kbytes 2500  -p ultra --ultra-id ${ultrashop_id}
  ${CLEOS} set contract ultra.nft ${CONTRACT_DIRECTORY}/ultra.nft ultra.nft.wasm ultra.nft.abi
  ${CLEOS} set account permission ultra.nft active --add-code ultra.shop owner -p ultra.nft
  ${CLEOS} set account permission ultra.nft active --add-code -p ultra.nft

  # create ultra.mlrp account and deploy mlrp contract
  ${CLEOS} system newaccount ultra ultra.mlrp  ${EOS_PUB_KEY} --transfer --gift-ram-kbytes 2000  -p ultra --ultra-id ${ultramlrp_id}
  ${CLEOS} set contract ultra.mlrp ${CONTRACT_DIRECTORY}/ultra.mlrp ultra.mlrp.wasm ultra.mlrp.abi
  ${CLEOS} push action ultra.mlrp init '[[4,2,1], 365]' -p ultra

  # create ultra.promo account and deploy promo contract
  ${CLEOS} system newaccount ultra ultra.promo  ${EOS_PUB_KEY} --transfer --gift-ram-kbytes 2000  -p ultra --ultra-id ${ultrapromoter_id}
  ${CLEOS} set contract ultra.promo ${CONTRACT_DIRECTORY}/ultra.promoter ultra.promoter.wasm ultra.promoter.abi

  #create ultra.relay account so that users don't need to setup their account permissions anymore
  ${CLEOS} system newaccount ultra ultra.relay  ${EOS_PUB_KEY} --transfer --gift-ram-kbytes 2500  -p ultra
  ${CLEOS} set account permission ultra.relay uni --add-code ultra.shop active -p ultra.relay
  ${CLEOS} set account permission ultra.relay uni --add-code ultra.nft active -p ultra.relay
}

function setup_test_accounts() {
  prodownera_id=$ultra_id
  ultra_id=$(( ultra_id + 1 ))

  prodownerb_id=$ultra_id
  ultra_id=$(( ultra_id + 1 ))

  usera_id=$ultra_id
  ultra_id=$(( ultra_id + 1 ))

  userb_id=$ultra_id
  ultra_id=$(( ultra_id + 1 ))

  bitfinex_id=$ultra_id
  ultra_id=$(( ultra_id + 1 ))

  # create product owner and user accounts and add ultra.relay@uni permission to their active authority
  ${CLEOS} system newaccount ultra prodownera ${USER_PUB_KEY} --transfer --gift-ram-kbytes 160  -p ultra --ultra-id ${prodownera_id}
  ${CLEOS} set account permission prodownera active '{"threshold": 1,"keys": [{"key": '\"${USER_PUB_KEY}\"',"weight": 1}], "accounts": [{"permission":{"actor":"ultra.relay","permission":"uni"},"weight":1}], "waits": []}' -p prodownera

  ${CLEOS} system newaccount ultra prodownerb ${USER_PUB_KEY} --transfer --gift-ram-kbytes 160  -p ultra --ultra-id ${prodownerb_id}
  ${CLEOS} set account permission prodownerb active '{"threshold": 1,"keys": [{"key": '\"${USER_PUB_KEY}\"',"weight": 1}], "accounts": [{"permission":{"actor":"ultra.relay","permission":"uni"},"weight":1}], "waits": []}' -p prodownerb

  ${CLEOS} system newaccount ultra usera      ${USER_PUB_KEY} --transfer --gift-ram-kbytes 160  -p ultra --ultra-id ${usera_id}
  ${CLEOS} set account permission usera active '{"threshold": 1,"keys": [{"key": '\"${USER_PUB_KEY}\"',"weight": 1}], "accounts": [{"permission":{"actor":"ultra.relay","permission":"uni"},"weight":1}], "waits": []}' -p usera

  ${CLEOS} system newaccount ultra userb      ${USER_PUB_KEY} --transfer --gift-ram-kbytes 160  -p ultra --ultra-id ${userb_id}
  ${CLEOS} set account permission userb active '{"threshold": 1,"keys": [{"key": '\"${USER_PUB_KEY}\"',"weight": 1}], "accounts": [{"permission":{"actor":"ultra.relay","permission":"uni"},"weight":1}], "waits": []}' -p userb

  ${CLEOS} system newaccount ultra bitfinex   ${USER_PUB_KEY} --transfer --gift-ram-kbytes 160  -p ultra --ultra-id ${bitfinex_id}
  ${CLEOS} set account permission bitfinex active '{"threshold": 1,"keys": [{"key": '\"${USER_PUB_KEY}\"',"weight": 1}], "accounts": [{"permission":{"actor":"ultra.relay","permission":"uni"},"weight":1}], "waits": []}' -p bitfinex

  # transfer some funding to usera and userb
  ${CLEOS} push action eosio.token transfer '["ultra", "usera", "10000.00000000 UOS", "usera"]' -p ultra
  ${CLEOS} push action eosio.token transfer '["ultra", "userb", "10000.00000000 UOS", "userb"]' -p ultra
  ${CLEOS} push action eosio.token transfer '["ultra","bitfinex","10000.00000000 UOS", "bitfinex"]' -p ultra
}

function register_asset() {
  ${CLEOS} push action ultra.nft regowner '["prodownerb"]' -p ultra.nft
  ${CLEOS} push action ultra.nft regowner '["prodownera"]' -p ultra.nft

  ${CLEOS} push action ultra.nft regastc '["prodownera", 2, 1, null, false, 101, null, null, null, null, [255,255,255], 1111, [["US", "10.0000 USD"],["EU", "11.0000 USD"],["CN", "5.0000 USD"]], false, [["prodownera", 100]], null, null, [], null]' -p prodownera
  # ${CLEOS} push action ultra.nft regastc '["prodownera", 2, 1, null, false, 101, null, null, null, null, [255,255,255], 1111, [["US", "10.0000 USD"],[2, "9.0000 EUR"],[3, "60.0000 CNY"]], false, [["prodownera", 100]], null, null, [], null]' -p prodownera
  # ${CLEOS} push action ultra.nft updateastc '[0, "prodownera", 2, 1, null, false, 101, null, null, null, null, [255,255,255], 1112, , [["US", "10.0000 USD"],[2, "9.0000 EUR"],[3, "60.0000 CNY"]], true, [["prodownerb", 20]], null, null, [], null]' -p prodownera
  # ${CLEOS} push action ultra.nft activateastc '[0]' -p prodownera
}

function register_mlrp_users() {
  # ProdOwnerA is referred by ProdOwnerB
  ${CLEOS} push action ultra.mlrp regreferee '["prodownerb","prodownera",0]' -p prodownera  
  # UserB is referred by ProdOwnerA
  ${CLEOS} push action ultra.mlrp regreferee '["prodownera","userb",0]' -p userb
  # UserA is referred by UserB
  ${CLEOS} push action ultra.mlrp regreferee '["userb","usera", 0]' -p usera
}

function register_promoter() {
  # Percentage Reward
  ${CLEOS} push action ultra.promo addreward '[0, 10, "100", null, null, null]' -p prodownera

  ${CLEOS} push action eosio.token create '["prodownera","10000.0000 UBISFT"]' -p prodownera
  ${CLEOS} push action eosio.token issue '["prodownera","10000.0000 UBISFT","Issued New Tokens"]' -p prodownera
  # only token issuer needs to do this, so we probably should add this to ultra.relay; also depending on the ram billing strategy
  ${CLEOS} set account permission prodownera active --add-code eosio.token owner -p prodownera
  # Fungible Token Reward
  ${CLEOS} push action ultra.promo addreward '[0, 20, null, "0.0100 UBISFT", null, null]' -p prodownera

  # Item Reward
  ${CLEOS} push action ultra.promo addreward '[0, 50, null, null, 0, 1]' -p prodownera
}

function register_taxes {
  ${CLEOS} push action eosio settax '["US", 15]' -p ultra # USD
  ${CLEOS} push action eosio settax '["EU", 10]' -p ultra # EUR
  ${CLEOS} push action eosio settax '["CN", 5]' -p ultra # CNY
}

function setup_user_locations() {
  ${CLEOS} push action eosio setusrloc '["usera", "US"]' -p ultra #US
  ${CLEOS} push action eosio setusrloc '["userb", "EU"]' -p ultra #EUR
  ${CLEOS} push action eosio setusrloc '["prodownera", "US"]' -p ultra
}

function run_testing_cases {
  # invalid test since this flow isn't valid anymore
  # printf "\n ~~ 1 -> TRUE ~~ \n"
  # # BITFINEX FIAT PAYMENT - USD
  # ${CLEOS} push action eosio.token transfer '["bitfinex","ultra.shop","10.00000000 UOS","{\"trx\":\"0001\",\"ast\":0,\"qnt\":1,\"frm\":\"usera\",\"to\":\"usera\",\"fiat\":\"9.5000 USD\",\"gtw\":\"0.5000 USD\",\"promo\":\"userb\",\"memo\":\"Hello World\"}"]' -p bitfinex

  # WRONG PAYMENT VALUE FOR UOS AND INCORRECT ACTION FOR DIRECT BUY
  printf "\n ~~ 2 -> FALSE ~~ \n"
  ${CLEOS} push action ultra.shop buy '["userb","userb",0,1,"0.0100 UOS","0.0000 USD","0.0000 USD","userb","Buy It"]' -p userb

  # WRONG PAYMENT TYPE
  printf "\n ~~ 3 -> FALSE ~~ \n"
  ${CLEOS} push action ultra.shop buy '["userb","userb",0,1,"0.0100 EUR","0.0000 USD","0.0000 USD","usera","Buy It"]' -p userb

  # RIGHT PAYMENT TYPE BUT RANDOM FIAT
  printf "\n ~~ 3 -> FALSE ~~ \n"
  ${CLEOS} push action ultra.shop buy '["userb","userb",0,1,"10.00000000 UOS","0.0000 USD","0.0000 USD","usera","Buy It"]' -p userb

  printf "\n ~~ 4 -> TRUE ~~ \n"
  # DIRECT PAYMENT - LOCATION IS EUROPE - #2 FOR CONVERSIONS
  ${CLEOS} push action ultra.shop buy '["userb","usera",0,1,"10.00000000 UOS","0.0000 USD","0.0000 USD","usera","Buy It"]' -p userb

  printf "\n ~~ 5 -> FALSE ~~ \n"
  # ATTEMPT SPOOFING WITH FIAT
  ${CLEOS} push action ultra.shop buy '["usera","usera",0,1,"0.0001 UOS","9.5000 USD","0.5000 USD","userb","Buy It"]' -p usera

  printf "\n ~~ 6 -> FALSE ~~ \n"
  # Attempt to Buy a non-existant asset.
  ${CLEOS} push action ultra.shop buy '["usera","usera",5,1,"10.00000000 UOS","0.0000 USD","0.0000 USD","userb","Buy It"]' -p usera

  printf "\n ~~ 6 -> TRUE ~~ \n"
  # Buy More than 1 Copy
  ${CLEOS} push action ultra.shop buy '["usera","usera",0,3,"30.00000000 UOS","0.0000 USD","0.0000 USD","userb","Buy It"]' -p usera

  # printf "\n ~~ 6 -> TRUE ~~ \n"
  # Claim All Rewards for UserB
  #${CLEOS} push action ultra.shop claimall '[userb]' -p userb

  # printf "\n ~~ 7 -> TRUE ~~ \n"
  # Claim All Rewards for UserA
  #${CLEOS} push action ultra.shop claimall '[usera]' -p usera

  # printf "\n ~~ 8 -> FALSE ~~ \n"
  # Set User Location and Attempt to Purchase from an Unknown Region
  # ${CLEOS} push action eosio setusrloc '["usera", "HEAVEN"]' -p ultra #US
  # ${CLEOS} push action ultra.shop buy '["usera","usera",0,1,"20.00000000 UOS","0.0000 USD","0.0000 USD","userb","Buy It"]' -p usera

  printf "\n ~~ 9 -> True ~~ \n"
  # Reset Location to US, Buy
  # ${CLEOS} push action eosio setusrloc '["usera", "US"]' -p ultra  -f #US
  ${CLEOS} push action ultra.shop buy '["usera","usera",0,1,"10.00000000 UOS","0.0000 USD","0.0000 USD","userb","Buy It"]' -p usera


  # for sending kafka messages
  trap "exit" INT
  while :
    do
      ${CLEOS} push action ultra.shop buy '["userb","usera",0,1,"10.00000000 UOS","0.0000 USD","0.0000 USD","usera","Buy It"]' -p userb -f
      sleep 5
  done
}

function test {
  ### start preparing test prerequisite ###

  setup_test_accounts

  register_asset

  # register_mlrp_users

  # register_promoter

  # register_taxes

  setup_user_locations


  ### finish preparing test prerequisite ###

  run_testing_cases
}

function push_fake_conversion_rates(){
  ${CLEOS} push action eosio setconvper '[900]' -p ultra

  rad=0

  trap "exit" INT
  while :
    do
      USD_rate=`echo "scale=4; x = 1.0000 + 0.1000 * s($rad); if(x<1) print 0; x" | bc -l`
      echo $USD_rate
      EUR_rate=`echo "scale=4; 2.0000 + 0.1500 * s($rad)" | bc -l`
      CNY_rate=`echo "scale=4; print 0; 0.2000 + 0.0100 * s($rad)" | bc -l`
      timestamp_in_seconds=`echo | date +%s`
      ${CLEOS} push action eosio setconvrate '[['\"$USD_rate' USD'\"', '\"$EUR_rate' EUR'\"', '\"${CNY_rate}' CNY'\"'], '"${timestamp_in_seconds}"']' -p ultra
      
      # echo $x
      rad=`echo "scale=4; $rad + 0.6282" | bc -l`
      # echo $rad
      sleep 1
  done
}

function setup_UOS_blockchain(){
  # pkill nodeos
  pkill keosd

  prepare_wallet

  prepare_nodeos_config

  # start up genesis node
  # start_nodeos

  # to avoid error when ${CLEOS} command are executed before nodeos finished to start
  # sleep ${DELAY_AFTER_START_NODEOS}

  create_system_accounts

  setup_system_token

  setup_system_contract

  # setup_ultra_accounts

  # setup producer account and nodes if configured
  setup_producers

  # can comment it out when we don't need it anymore
  # push_fake_conversion_rates &
  # sleep 3

  # disable test for deployment, dev,test, demo, product
  if [[ $RUN_TEST = true ]]; then
    test
  fi
}

setup_UOS_blockchain

# update config.ini
if [[ $NUMBER_OF_PRODUCERS -gt 0 ]]; then
  sed -i '/producer-name/c\producer-name = produceracc1' /opt/eosio/producer/settings/config.ini
fi
