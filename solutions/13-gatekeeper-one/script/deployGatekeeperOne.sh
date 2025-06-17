source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

forge script ./DeployGatekeeperOne.s.sol \
    --rpc-url $RPC_URL \
    --broadcast \
    --verify \
    --private-key $PRIVATE_KEY \
    --etherscan-api-key $ETHERSCAN_API_KEY \
    --sig "run()" \
    --slow
