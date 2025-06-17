source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

# cast send \
#   --rpc-url $RPC_URL \
#   --private-key $PRIVATE_KEY \
#   --create \
#   0x6008600A5F3960085FF3602A5F5260205FF3

# cast send \
#   --rpc-url $RPC_URL \
#   --private-key $PRIVATE_KEY \
#   0x8f92E0729e4Df579D74B964823C64BB6B50D7584 \
#   "setSolver(address)" \
#   0xDC46596F2D8039F5323b6700cbB5E3bF16e23b88

cast call \
  --rpc-url $RPC_URL \
  0xDC46596F2D8039F5323b6700cbB5E3bF16e23b88 \
  "whatIsTheMeaningOfLife()(uint256)"