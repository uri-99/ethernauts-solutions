source ~/ethernauts/.env
echo "RPC_URL: $RPC_URL"
# echo ""

DEX=0x0f177F498eE967f45134B3591723D6804D3dA04e
TOKEN1=0x19E7a376eC995D550425aa9f76d823275E085C03
TOKEN2=0x60CC599eeF289EB8db974302Daf6f9F95e8D430e

TOKEN1_BALANCE=0
TOKEN2_BALANCE=0

TOKEN1_BALANCE_dex=0
TOKEN2_BALANCE_dex=0

FROM=0x19E7a376eC995D550425aa9f76d823275E085C03
TO=0x60CC599eeF289EB8db974302Daf6f9F95e8D430e

HIGHEST_BALANCE=0

echo "My balance of Token 1:"
TOKEN1_BALANCE=$(cast call \
    --rpc-url $RPC_URL \
    $TOKEN1 \
    "balanceOf(address)(uint256)" $PRIMARY_ADDRESS
)
echo $TOKEN1_BALANCE

echo "My balance of Token 2:"
TOKEN2_BALANCE=$(cast call \
    --rpc-url $RPC_URL \
    $TOKEN2 \
    "balanceOf(address)(uint256)" $PRIMARY_ADDRESS
)
echo $TOKEN2_BALANCE

echo "Balance of Token 1 in DEX:"
TOKEN1_BALANCE_dex=$(cast call \
    --rpc-url $RPC_URL \
    $TOKEN1 \
    "balanceOf(address)(uint256)" $DEX
)
echo $TOKEN1_BALANCE_dex

echo "Balance of Token 2 in DEX:"
TOKEN2_BALANCE_dex=$(cast call \
    --rpc-url $RPC_URL \
    $TOKEN2 \
    "balanceOf(address)(uint256)" $DEX
)
echo $TOKEN2_BALANCE_dex

# (amount * IERC20(to).balanceOf(Dex)) / IERC20(from).balanceOf(Dex)
getSwapPrice() {
    local from=$1
    local to=$2
    local amount=$3
    
    # Get balances based on which token is from/to
    local from_balance
    local to_balance
    
    if [ "$from" = "$TOKEN1" ]; then
        from_balance=$TOKEN1_BALANCE_dex
        to_balance=$TOKEN2_BALANCE_dex
    else
        from_balance=$TOKEN2_BALANCE_dex
        to_balance=$TOKEN1_BALANCE_dex
    fi
    
    echo "scale=0; ($amount * $to_balance) / $from_balance" | bc
}

# Calculate how many tokens we need to give to receive desired amount
# Using inverse of getSwapPrice formula: (desired_amount * from_balance) / to_balance
getRequiredInput() {
    local from=$1
    local to=$2
    local desired_amount=$3
    
    # Get balances based on which token is from/to
    local from_balance
    local to_balance
    
    if [ "$from" = "$TOKEN1" ]; then
        from_balance=$TOKEN1_BALANCE_dex
        to_balance=$TOKEN2_BALANCE_dex
    else
        from_balance=$TOKEN2_BALANCE_dex
        to_balance=$TOKEN1_BALANCE_dex
    fi
    
    echo "scale=0; (($desired_amount * $from_balance) / $to_balance)" | bc
}

while true; do
    echo "My balance of Token 1:"
    TOKEN1_BALANCE=$(cast call \
        --rpc-url $RPC_URL \
        $TOKEN1 \
        "balanceOf(address)(uint256)" $PRIMARY_ADDRESS
    )
    echo $TOKEN1_BALANCE

    echo "My balance of Token 2:"
    TOKEN2_BALANCE=$(cast call \
        --rpc-url $RPC_URL \
        $TOKEN2 \
        "balanceOf(address)(uint256)" $PRIMARY_ADDRESS
    )
    echo $TOKEN2_BALANCE

    echo "Balance of Token 1 in DEX:"
    TOKEN1_BALANCE_dex=$(cast call \
        --rpc-url $RPC_URL \
        $TOKEN1 \
        "balanceOf(address)(uint256)" $DEX
    )
    echo $TOKEN1_BALANCE_dex

    echo "Balance of Token 2 in DEX:"
    TOKEN2_BALANCE_dex=$(cast call \
        --rpc-url $RPC_URL \
        $TOKEN2 \
        "balanceOf(address)(uint256)" $DEX
    )
    echo $TOKEN2_BALANCE_dex

    if [ $TOKEN1_BALANCE -gt $TOKEN2_BALANCE ]; then
        FROM=$TOKEN1
        TO=$TOKEN2
        # Calculate how many tokens we would get for our entire balance
        EXPECTED_OUTPUT=$(getSwapPrice $FROM $TO $TOKEN1_BALANCE)
        # If DEX has enough balance to give us what we expect, swap all our tokens
        if [ $TOKEN2_BALANCE_dex -ge $EXPECTED_OUTPUT ]; then
            HIGHEST_BALANCE=$TOKEN1_BALANCE
        else
            # Otherwise, calculate how many tokens we need to swap to get all DEX's tokens
            HIGHEST_BALANCE=$(getRequiredInput $FROM $TO $TOKEN2_BALANCE_dex)
        fi
    else
        FROM=$TOKEN2
        TO=$TOKEN1
        # Calculate how many tokens we would get for our entire balance
        EXPECTED_OUTPUT=$(getSwapPrice $FROM $TO $TOKEN2_BALANCE)
        # If DEX has enough balance to give us what we expect, swap all our tokens
        if [ $TOKEN1_BALANCE_dex -ge $EXPECTED_OUTPUT ]; then
            HIGHEST_BALANCE=$TOKEN2_BALANCE
        else
            # Otherwise, calculate how many tokens we need to swap to get all DEX's tokens
            HIGHEST_BALANCE=$(getRequiredInput $FROM $TO $TOKEN1_BALANCE_dex)
        fi
    fi

    echo "🔄 Swapping $HIGHEST_BALANCE tokens from $(if [ "$FROM" = "$TOKEN1" ]; then echo "Token1"; else echo "Token2"; fi) to $(if [ "$TO" = "$TOKEN1" ]; then echo "Token1"; else echo "Token2"; fi)"
    cast send \
        --rpc-url $RPC_URL \
        --private-key $PRIVATE_KEY \
        $DEX \
        "swap(address, address, uint256)" $FROM $TO $HIGHEST_BALANCE

    sleep 5
done
