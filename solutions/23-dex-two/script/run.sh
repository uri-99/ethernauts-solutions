source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

cast send \
    --rpc-url $RPC_URL \
    0x25a1642E6d72bbAA457907B2E79123A4b5ABd4cE \
    --private-key $PRIVATE_KEY \
    "executeSwap(address, address)()" 0x87BD4338bFc68B88793A09b9f8137C1f3Ff73583 0x19930Af9c6632Bb44D447707770929E636ca85e6
