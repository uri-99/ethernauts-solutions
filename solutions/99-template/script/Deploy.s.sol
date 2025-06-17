// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Exploiter} from "../src/Exploiter.sol";

contract Deploy is Script {
    Exploiter public exploiter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        exploiter = new Exploiter();

        vm.stopBroadcast();
    }
}
