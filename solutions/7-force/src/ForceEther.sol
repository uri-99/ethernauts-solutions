// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceEther {
    constructor() payable {} // Accept Ether on deployment

    function destroyAndSend(address payable target) public {
        selfdestruct(target);
    }

    receive() external payable {}
}
