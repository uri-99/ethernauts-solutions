source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

cast send \
    --rpc-url $RPC_URL \
    0xEDE06B17756b5EF0C79eE967E2b0A0Bc4361bfD4 \
    --private-key $PRIVATE_KEY \
    "setWithdrawPartner(address)" 0xThisContract

# then submit instance
