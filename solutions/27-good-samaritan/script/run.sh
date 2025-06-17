source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"


# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0x623530dB91E77c27A6a83D46cE60448ff5281c1D \
#     "requestDonation(address)()" 0x3e053a868B22B3DD54571248e140D88b20Cfea85

# cast call \
#     --rpc-url $RPC_URL \
#     0x3e053a868B22B3DD54571248e140D88b20Cfea85 \
#     "coin()(address)" 
# -> 0x96405A55c40a1FCa3a74BE77e1C4F3e6717082b7

# cast call \
#     --rpc-url $RPC_URL \
#     0x3e053a868B22B3DD54571248e140D88b20Cfea85 \
#     "wallet()(address)" 
# -> 0x5268ccA3577651567B56DE3a33ABCB6f801BA3C9

cast call \
    --rpc-url $RPC_URL \
    0x96405A55c40a1FCa3a74BE77e1C4F3e6717082b7 \
    "balances(address)(uint256)" 0x5268ccA3577651567B56DE3a33ABCB6f801BA3C9




