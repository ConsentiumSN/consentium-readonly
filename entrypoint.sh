#!/bin/sh

mkdir blockchain

exec ./keosd &

exec ./nodeos --genesis-json "./my-genesis.json" --plugin eosio::producer_plugin --plugin eosio::producer_api_plugin --plugin eosio::chain_plugin --plugin eosio::chain_api_plugin --plugin eosio::http_plugin --plugin eosio::history_api_plugin --plugin eosio::history_plugin --data-dir "./blockchain/data" --blocks-dir "./blockchain/blocks" --config-dir "./blockchain/config" --http-server-address 0.0.0.0:8888 --p2p-listen-endpoint 0.0.0.0:9010 --access-control-allow-origin=* --contracts-console --http-validate-host=false --verbose-http-errors --enable-stale-production --p2p-peer-address "$PEERIP1" --p2p-peer-address "$PEERIP2" --p2p-peer-address "$PEERIP3" --plugin eosio::state_history_plugin --disable-replay-opts --state-history-endpoint=0.0.0.0:8080

# exec ./nodeos -e -p eosio --plugin eosio::producer_plugin --plugin eosio::producer_api_plugin --plugin eosio::chain_api_plugin --plugin eosio::http_plugin --plugin eosio::history_plugin --plugin eosio::history_api_plugin --plugin eosio::state_history_plugin --access-control-allow-origin='*' --contracts-console --http-validate-host=false --verbose-http-errors --data-dir=data-dir --access-control-allow-headers="*" --access-control-allow-credentials --http-server-address=0.0.0.0:8888 --disable-replay-opts --state-history-endpoint=0.0.0.0:8080