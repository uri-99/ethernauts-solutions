// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {NonPayable} from "../src/NonPayable.sol";

contract Deploy is Script {
    NonPayable public nonPayable;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        nonPayable = new NonPayable();

        vm.stopBroadcast();
    }
}
