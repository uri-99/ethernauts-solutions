source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

cast send \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    0xaABC \
    "exploit()()"
