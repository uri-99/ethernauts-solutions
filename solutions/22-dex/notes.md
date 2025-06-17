puedo cambiar los     address public token1; ?
puedo interactuar con estos tokens por afuera del contrato?

getSwapPrice?

token1  
addr        : 0x19E7a376eC995D550425aa9f76d823275E085C03
myFunds     : 10
dexFunds    : 100
totalSupply : 110

token2
addr        : 0x60CC599eeF289EB8db974302Daf6f9F95e8D430e
myFunds     : 10
dexFunds    : 100
totalSupply : 110

function getSwapPrice(address from, address to, uint256 amount) public view returns (uint256) {
    return ((amount * IERC20(to).balanceOf(address(this))) / IERC20(from).balanceOf(address(this)));
}

swap from Token1 to Token2
price:
in: amount to swap
out: 
(amountToSwap * balanceOfToken2(Dex)) / (balanceOfToken1(dex))

in 10:
out: (10*100) / (100) = 1000 / 100 = 10

now:
    token1  token2
me  0       20
dex 110     90

now
swap from Token2 to Token1
in:     10
out:    (10 * 110) / 90 = 1100 / 90 = 12
20 * 110 / 90

math looks good? not so sure.

in 20:
out: (20*90) / 

