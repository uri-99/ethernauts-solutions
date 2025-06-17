// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract NonPayable {

    function send(address to) external payable {
        (bool success, ) = to.call{value: msg.value}("");
        require(success, "Failed to send ETH");
    }

    receive() external payable {
        revert("No ETH allowed");
    }
}
