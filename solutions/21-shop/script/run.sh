source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

cast send \
    --rpc-url $RPC_URL \
    0x71c3AF5bCFF663e6F6Eb1BAE6D64700489f7C111 \
    --private-key $PRIVATE_KEY \
    "buy()()"
