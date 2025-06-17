source ../../.env

cast send --rpc-url $RPC_URL 0x05F23E46Dd45E8a21C00c59Dc86AA3d824b02E3B --private-key $PRIVATE_KEY "claimOwnership()()"
