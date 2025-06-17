source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

cast send \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    0x781d84F1d1F52724f4E9b122f1E9C0B291F3CC74 \
    "setDetectionBot(address)()" 0xeF9B88a3bfB866649F91d404b44c006739786043
