
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IElevator {
    function goTo(uint256) external;
}

contract Building {
    bool public in_last_floor = false;
    IElevator public elevator;

    constructor(address _elevator) {
        elevator = IElevator(_elevator);
    }

    function isLastFloor(uint256) external returns (bool) {
        if (!in_last_floor) {
            in_last_floor = true;
            return false;
        }
        return true;
    }

    function goTo() external {
        elevator.goTo(10);
    }
}

