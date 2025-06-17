// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ReEntrancy} from "../src/ReEntrancy.sol";

contract Deploy is Script {
    ReEntrancy public reEntrancy;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        reEntrancy = new ReEntrancy(0x797F793167FF42205bA4e506AB1582A43295476a);

        vm.stopBroadcast();
    }
}
