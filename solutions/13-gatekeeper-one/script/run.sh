source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

cast send \
    --rpc-url $RPC_URL \
    0x63Fb6aC5782060A9775971ca2C0E83Ba231EdD18 \
    --private-key $PRIVATE_KEY \
    "enter(address)" 0x1c195EC8B5a56e8bB79d34F709FBaCf5C57c5804
