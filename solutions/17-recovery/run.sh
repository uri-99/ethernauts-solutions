source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

cast send \
    --rpc-url $RPC_URL \
    0x0e70C1Fa1e91f54666F1AC3A4f0c3511b8206B5D \
    --private-key $PRIVATE_KEY \
    "destroy(address)()" $PRIMARY_ADDRESS

