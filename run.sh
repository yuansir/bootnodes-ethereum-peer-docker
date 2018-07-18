#!/bin/bash
set -e

RPC_ARG='--rpc --rpcaddr=0.0.0.0 --rpcport '$RPC_PORT' --rpcapi=personal,db,eth,net,web3,txpool,miner,admin --rpccorsdomain "*"'


if [ ! -d $DATA_DIR/$NODE_NAME/keystore ]; then
    echo "$DATA_DIR/$NODE_NAME/keystore not found, runing 'geth init'..."
    /app/geth --datadir $DATA_DIR/$NODE_NAME/ init genesis.json
    echo "...done"
fi

echo "Running..."
/app/geth --datadir $DATA_DIR/$NODE_NAME/ \
    --syncmode 'full' \
    --networkid $NETWORKID \
    $RPC_ARG \
    --port $PORT \
    --bootnodes=$BOOTNODES_URL