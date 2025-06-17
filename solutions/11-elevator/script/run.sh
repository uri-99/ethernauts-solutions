source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

cast send \
    --rpc-url $RPC_URL \
    0xC1CCFb0763c4208F795BBaA2fD040F687581352b \
    --private-key $PRIVATE_KEY \
    "goTo()()"
